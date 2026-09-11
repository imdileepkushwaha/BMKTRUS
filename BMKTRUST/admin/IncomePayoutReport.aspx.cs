using BusinessLogicTier;
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_IncomePayoutReport : System.Web.UI.Page
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
            if (Session["useradmin"] == null)
                Response.Redirect("logout.aspx");
            else
                loaduser();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        loaduser();
    }

    void loaduser()
    {
        if (txtfromdate.Text != "")
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        else
            objaccount.FromDate = DateTime.MinValue;

        if (txttodate.Text != "")
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        else
            objaccount.ToDate = DateTime.MinValue;

        objaccount.UserId = (txtuserid.Text ?? "").Trim();
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
            Label lbltransactionid = e.Row.FindControl("lbltransactionid") as Label;
            TextBox txttransactionid = e.Row.FindControl("txttransactionid") as TextBox;
            LinkButton btnApprove = e.Row.FindControl("btnApprove") as LinkButton;
            bool pending = lblstatus != null && lblstatus.Text == "Pending";
            if (lblstatus != null)
                lblstatus.CssClass = pending ? "label label-warning" : "label label-success";
            if (btnApprove != null)
                btnApprove.Visible = pending;
            if (txttransactionid != null)
                txttransactionid.Visible = pending;
            if (lbltransactionid != null)
                lbltransactionid.Visible = !pending;
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

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)(sender as Control).Parent.Parent;
        string result = ApproveRow(gvRow, null);
        Alert(ApproveMessage(result, 1));
        loaduser();
    }

    protected void btnApproveAll_Click(object sender, EventArgs e)
    {
        string headerTxn = (txtAllTxnId.Text ?? "").Trim();
        if (headerTxn == "")
        {
            Alert("Please enter Transaction ID for Approve All.");
            return;
        }

        int ok = 0;
        int skip = 0;
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowType != DataControlRowType.DataRow)
                continue;
            Label lblstatus = row.FindControl("lblstatus") as Label;
            if (lblstatus == null || lblstatus.Text != "Pending")
                continue;
            string result = ApproveRow(row, headerTxn);
            if (result == "t")
                ok++;
            else
                skip++;
        }

        lblMsg.Text = ok + " payout(s) approved." + (skip > 0 ? " " + skip + " skipped." : "");
        Alert(ok + " payout(s) approved.");
        loaduser();
    }

    string ApproveRow(GridViewRow gvRow, string fallbackTxnId)
    {
        Label lbluserid = gvRow.FindControl("lbluserid") as Label;
        Label lblPayoutDateKey = gvRow.FindControl("lblPayoutDateKey") as Label;
        TextBox txttransactionid = gvRow.FindControl("txttransactionid") as TextBox;

        string txn = "";
        if (txttransactionid != null)
            txn = (txttransactionid.Text ?? "").Trim();
        if (txn == "" && !string.IsNullOrEmpty(fallbackTxnId))
            txn = fallbackTxnId;
        if (txn == "")
            return "notxn";

        DateTime payoutDate;
        if (lbluserid == null || lblPayoutDateKey == null
            || !DateTime.TryParseExact(lblPayoutDateKey.Text, "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out payoutDate))
            return "f";

        clsAccount acc = new clsAccount();
        acc.UserId = lbluserid.Text;
        acc.ClosingDate = payoutDate;
        acc.OnlineTransactionId = txn;
        acc.MentionBy = Session["useradmin"] != null ? Session["useradmin"].ToString() : "admin";
        return acc.ApproveIncomePayout(acc);
    }

    static string ApproveMessage(string result, int count)
    {
        if (result == "t")
            return count > 1 ? count + " payout(s) approved." : "Payout approved. Amount debited from wallet.";
        if (result == "paid")
            return "This payout is already approved.";
        if (result == "notxn")
            return "Please enter Transaction ID.";
        return "Payout could not be approved. Please try again.";
    }

    void Alert(string msg)
    {
        string popupScript = "alert('" + (msg ?? "").Replace("'", "\\'") + "');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
