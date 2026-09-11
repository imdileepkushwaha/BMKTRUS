using BusinessLogicTier;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JoiningClosingReportMonthly : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsClosing objCL = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loaduser();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

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
                MobileList.Add(LabMobile.Text);
                TList.Add(TxtTransaction.Text);
                chkcount = chkcount + 1;
            }

        }

        if (chkcount == 0)
        {
            Message.Show("Please select any row");
            return;
        }
        else
        {
            int c = objCL.TransferPayoutmonthly(IdList, UserList, AmountList, MobileList, TList);
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

    }
    void loaduser()
    {
      
        DataTable dt = new DataTable();
        dt = objCL.getMonthJoiningClosingDate();
        DDlstFromdate.DataSource = dt;
        DDlstFromdate.DataTextField = "ClosingDate";
        DDlstFromdate.DataValueField = "ClosingDate";
        DDlstFromdate.DataBind();
        ListItem li = new ListItem("Select Date", "0");
        DDlstFromdate.Items.Insert(0, li);
    }
  
    void loaddata()
    {
        string Fromdate = "";
        string Todatedate = "";
        string UserId = "";
        if (DDlstFromdate.SelectedIndex != 0)
        {
            string[] str = DDlstFromdate.SelectedValue.Split('=');
           Fromdate = str[0].ToString();
           Todatedate = str[1].ToString();
        }
        DataTable Dt = objCL.getMonthleyJoiningClosingReportDue(Fromdate, Todatedate, TxtUserId.Text, ddstatus.SelectedValue);
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
    protected void chckchanged(object sender, EventArgs e)
    {

        CheckBox chckheader = (CheckBox)GridView1.HeaderRow.FindControl("CheckBox1");

        foreach (GridViewRow row in GridView1.Rows)
        {

            CheckBox chckrw = (CheckBox)row.FindControl("chk");
            if (chckrw == null || !chckrw.Enabled)
                continue;
            chckrw.Checked = chckheader.Checked;

        }

    }  
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaddata();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }   
    protected void ExportToExcel(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=PayoutReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
           

            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

       
    protected void BtnMessage_Click(object sender, EventArgs e)
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
            Label lbluserid = (Label)GridView1.Rows[i].FindControl("lblusername");
            Label LabMobile = (Label)GridView1.Rows[i].FindControl("LabMobile");
            TextBox TxtTransaction = (TextBox)GridView1.Rows[i].FindControl("TxtTransaction");
            

            if (chk.Checked == true)
            {
                IdList.Add(lblId.Text);
                UserList.Add(lbluserid.Text);
                AmountList.Add(lblPaybleAmount.Text);
                MobileList.Add(LabMobile.Text);
                TList.Add(TxtTransaction.Text);
                chkcount = chkcount + 1;
            }

        }

        if (chkcount == 0)
        {
            Message.Show("Please select any row");
            return;
        }
        else
        {
            int c = objCL.TransferPayoutMessgesend(IdList, UserList, AmountList, MobileList, TList);
            if (c == 1)
            {
                loaddata();
                Message.Show("Message send Successfully");
            }
            else
            {
                Message.Show("Some Error Occurred");
            }
        }

    }
    
}