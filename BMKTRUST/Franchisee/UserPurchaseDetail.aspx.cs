using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data;

public partial class UserPurchaseDetail : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsProduct objP = new clsProduct();
    clsvendor objV = new clsvendor();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            if (Session["fuserid"] != null)
            {

                TxtFranchiseeId.Text = Session["fuserid"].ToString();
                TxtFranchiseeId.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
   
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {
        objV.VendorId = string.Empty;
        if (txtfromdate.Text != "")
        {
            objV.Fromdate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objV.Fromdate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objV.Todate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objV.Todate = DateTime.MinValue;
        }
       
        objV.VendorId = TxtFranchiseeId.Text;
        objV.WithdrawlRequestStatus = ddstatus.SelectedValue.ToString();
        DataTable dt = new DataTable();
        dt = objV.getuserFranchiseePurchase(objV);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string customerId = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
            GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
            DataTable dt1 = new DataTable();
            dt1 = objV.getUserFranchiseePurchaseProductChild(customerId);
            gvOrders.DataSource = dt1;
            gvOrders.DataBind();
        }
    }
}