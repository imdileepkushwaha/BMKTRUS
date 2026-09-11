using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class user_IncomePayoutReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    decimal helpingTotal = 0;
    decimal directTotal = 0;
    decimal incomeTotal = 0;
    decimal paidTotal = 0;
    decimal pendingTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
                loaduser();
            else
                Response.Redirect("logout.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }

    void loaduser()
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (txtfromdate.Text != "")
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        else
            objaccount.FromDate = DateTime.MinValue;

        if (txttodate.Text != "")
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        else
            objaccount.ToDate = DateTime.MinValue;

        objaccount.UserId = Session["userid"].ToString();
        objaccount.WithdrawlRequestStatus = ddstatus.SelectedValue;

        DataTable dt = objaccount.getIncomePayoutReport(objaccount);
        helpingTotal = SumCol(dt, "HelpingIncome");
        directTotal = SumCol(dt, "DirectIncome");
        incomeTotal = SumCol(dt, "TotalIncome");
        paidTotal = SumCol(dt, "PaidAmount");
        pendingTotal = SumCol(dt, "PendingAmount");
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    static decimal SumCol(DataTable dt, string col)
    {
        if (dt == null || dt.Rows.Count == 0 || !dt.Columns.Contains(col))
            return 0;
        decimal total = 0;
        foreach (DataRow row in dt.Rows)
        {
            if (row[col] != DBNull.Value)
                total += Convert.ToDecimal(row[col]);
        }
        return total;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = e.Row.FindControl("lblstatus") as Label;
            if (lblstatus != null)
                lblstatus.CssClass = lblstatus.Text == "Pending" ? "label label-warning" : "label label-success";
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            SetLbl(e.Row, "lblFooterHelping", helpingTotal);
            SetLbl(e.Row, "lblFooterDirect", directTotal);
            SetLbl(e.Row, "lblFooterTotal", incomeTotal);
            SetLbl(e.Row, "lblFooterPaid", paidTotal);
            SetLbl(e.Row, "lblFooterPending", pendingTotal);
            e.Row.Font.Bold = true;
        }
    }

    static void SetLbl(GridViewRow row, string id, decimal value)
    {
        Label lbl = row.FindControl(id) as Label;
        if (lbl != null)
            lbl.Text = value.ToString("0.00");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
