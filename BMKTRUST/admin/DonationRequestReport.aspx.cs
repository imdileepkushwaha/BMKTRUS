using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DonationRequestReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }
        if (!IsPostBack)
            loadlist();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loadlist();
    }

    void loadlist()
    {
        if (!string.IsNullOrWhiteSpace(txtfromdate.Text) && !string.IsNullOrWhiteSpace(txttodate.Text))
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
            objaccount.ToDate = DateTime.MinValue;
        }
        objaccount.UserId = (txtuserid.Text ?? "").Trim();
        objaccount.WithdrawlRequestStatus = ddstatus.SelectedValue;
        DataTable dt = objaccount.getDonationRequestAdmin(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;

        Label lblstatus = e.Row.FindControl("lblstatus") as Label;
        Label lblRejectReason = e.Row.FindControl("lblRejectReason") as Label;
        TextBox txtRejectReason = e.Row.FindControl("txtRejectReason") as TextBox;
        LinkButton btnApprove = e.Row.FindControl("btnApprove") as LinkButton;
        LinkButton btnReject = e.Row.FindControl("btnReject") as LinkButton;
        Literal litSep = e.Row.FindControl("litSep") as Literal;

        string status = lblstatus == null ? "" : lblstatus.Text;
        bool pending = status == "Pending";

        if (lblstatus != null)
        {
            if (status == "Pending") lblstatus.CssClass = "label label-warning";
            else if (status == "Approved") lblstatus.CssClass = "label label-success";
            else if (status == "Rejected") lblstatus.CssClass = "label label-danger";
        }

        if (txtRejectReason != null) txtRejectReason.Visible = pending;
        if (lblRejectReason != null) lblRejectReason.Visible = !pending;
        if (btnApprove != null) btnApprove.Visible = pending;
        if (btnReject != null) btnReject.Visible = pending;
        if (litSep != null) litSep.Visible = pending;
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((Control)sender).Parent.Parent;
        Label lblId = gvRow.FindControl("lblId") as Label;
        if (lblId == null) return;

        string rs = objaccount.Approve_DonationRequest(lblId.Text, Session["useradmin"].ToString());
        Alert(rs == "t" ? "Donation approved successfully." : "Unable to approve. Request may already be processed.");
        loadlist();
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((Control)sender).Parent.Parent;
        Label lblId = gvRow.FindControl("lblId") as Label;
        TextBox txtRejectReason = gvRow.FindControl("txtRejectReason") as TextBox;
        if (lblId == null) return;

        string reason = txtRejectReason == null ? "" : txtRejectReason.Text.Trim();
        string rs = objaccount.Reject_DonationRequest(lblId.Text, Session["useradmin"].ToString(), reason);
        if (rs == "reason")
            Alert("Reject reason enter karein.");
        else if (rs == "t")
            Alert("Donation rejected.");
        else
            Alert("Unable to reject. Request may already be processed.");
        loadlist();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "photolarge") return;
        int index;
        if (!int.TryParse(Convert.ToString(e.CommandArgument), out index)) return;
        Label LblImage = GridView1.Rows[index].FindControl("LblImage") as Label;
        if (LblImage != null)
            ImageLarge.ImageUrl = LblImage.Text;
        ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "showModal1();", true);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    void Alert(string message)
    {
        string popupScript = "alert('" + (message ?? "").Replace("'", "\\'") + "');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
    }
}
