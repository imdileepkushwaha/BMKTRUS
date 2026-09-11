using BusinessLogicTier;
using System;
using System.Collections;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_PaidGrowthClosingMonthly : System.Web.UI.Page
{
    clsClosing objCL = new clsClosing();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            DateTime first = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            TxtFromdate.Attributes.Add("readonly", "readonly");
            TxtTodate.Attributes.Add("readonly", "readonly");
            TxtFromdate.Text = first.ToString("dd/MMM/yyyy");
            TxtTodate.Text = first.AddMonths(1).AddDays(-1).ToString("dd/MMM/yyyy");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        Label lblstatus = (Label)e.Row.FindControl("lblstatus");
        CheckBox chk = (CheckBox)e.Row.FindControl("chk");
        TextBox txtTxn = (TextBox)e.Row.FindControl("TxtTransaction");
        Label lblTransaction = (Label)e.Row.FindControl("lblTransaction");
        bool isPaid = lblstatus != null && string.Equals(lblstatus.Text, "PAID", StringComparison.OrdinalIgnoreCase);
        if (isPaid)
        {
            if (chk != null)
            {
                chk.Checked = false;
                chk.Enabled = false;
            }
            if (lblstatus != null)
                lblstatus.CssClass = "wp-badge wp-badge-paid";
            e.Row.CssClass = (e.Row.CssClass + " wp-row-paid").Trim();
            if (txtTxn != null)
                txtTxn.Visible = false;
            if (lblTransaction != null)
                lblTransaction.Visible = true;
        }
        else
        {
            if (lblstatus != null)
                lblstatus.CssClass = "wp-badge wp-badge-unpaid";
            e.Row.CssClass = (e.Row.CssClass + " wp-row-unpaid").Trim();
        }
    }

    void loaddata()
    {
        DateTime fromDate, toDate;
        if (!DateTime.TryParse(TxtFromdate.Text, out fromDate) || !DateTime.TryParse(TxtTodate.Text, out toDate))
        {
            Message.Show("Invalid From Date / To Date.");
            return;
        }
        if (fromDate > toDate)
        {
            Message.Show("From Date To Date se badi nahi ho sakti.");
            return;
        }

        objCL.EnsureGrowthMonthlyPayout(fromDate, toDate);
        DataTable Dt = objCL.getGrowthMonthlyPayoutReport(
            fromDate.ToString("yyyy-MM-dd"),
            toDate.ToString("yyyy-MM-dd"),
            (TxtUserId.Text ?? "").Trim(),
            ddstatus.SelectedValue);
        GridView1.DataSource = Dt;
        GridView1.DataBind();

        bool hasUnpaid = false;
        if (Dt != null)
        {
            foreach (DataRow row in Dt.Rows)
            {
                if (row["Status"] != DBNull.Value && Convert.ToInt32(row["Status"]) == 0)
                {
                    hasUnpaid = true;
                    break;
                }
            }
        }
        btnpay.Visible = hasUnpaid;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void chckchanged(object sender, EventArgs e)
    {
        if (GridView1.HeaderRow == null)
            return;
        CheckBox chckheader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox1");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chckrw = (CheckBox)row.FindControl("chk");
            if (chckrw == null || !chckrw.Enabled)
                continue;
            chckrw.Checked = chckheader != null && chckheader.Checked;
        }
    }

    protected void btnpay_Click(object sender, EventArgs e)
    {
        int chkcount = 0;
        ArrayList IdList = new ArrayList();
        ArrayList UserList = new ArrayList();
        ArrayList AmountList = new ArrayList();
        ArrayList MobileList = new ArrayList();
        ArrayList TList = new ArrayList();

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)GridView1.Rows[i].FindControl("chk");
            Label lblPaybleAmount = (Label)GridView1.Rows[i].FindControl("lblPaybleAmount");
            Label lblId = (Label)GridView1.Rows[i].FindControl("lblId");
            Label lbluserid = (Label)GridView1.Rows[i].FindControl("lbluserid");
            Label LabMobile = (Label)GridView1.Rows[i].FindControl("LabMobile");
            TextBox TxtTransaction = (TextBox)GridView1.Rows[i].FindControl("TxtTransaction");

            if (chk != null && chk.Checked && chk.Enabled)
            {
                if (TxtTransaction == null || (TxtTransaction.Text ?? "").Trim() == "")
                {
                    Message.Show("Please enter Transaction ID for selected rows.");
                    return;
                }
                IdList.Add(lblId.Text);
                UserList.Add(lbluserid.Text);
                AmountList.Add(lblPaybleAmount.Text);
                MobileList.Add(LabMobile != null ? LabMobile.Text : "");
                TList.Add(TxtTransaction.Text);
                chkcount = chkcount + 1;
            }
        }

        if (chkcount == 0)
        {
            Message.Show("Please select any row");
            return;
        }

        int c = objCL.TransferGrowthMonthlyPayout(IdList, UserList, AmountList, MobileList, TList);
        if (c == 1)
        {
            loaddata();
            Message.Show("Payout paid. Amount debited from wallet.");
        }
        else
        {
            Message.Show("Some Error Occurred");
        }
    }

    protected void ExportToExcel(object sender, EventArgs e)
    {
        if (GridView1.HeaderRow == null)
        {
            Message.Show("Pehle Search karke data load karein.");
            return;
        }

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=GrowthMonthlyPayout.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                    cell.CssClass = "textmode";
            }
            GridView1.RenderControl(hw);
            Response.Write(@"<style> .textmode { } </style>");
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}
