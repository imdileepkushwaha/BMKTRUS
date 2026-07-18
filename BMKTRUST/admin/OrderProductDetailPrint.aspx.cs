using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;
using DataTier;
public partial class OrderProductDetailPrint : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsUser objuser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {

                loadgethelp();
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loadgethelp();
    }
    void loadgethelp()
    {
       
        
        objaccount.WithdrawlRequestStatus = ddstatus.SelectedValue.ToString();
        DataTable dt = new DataTable();
        objaccount.UserId = txtuserid.Text;
        dt = getWithdrawlRequestPending(objaccount);
        dlCustomers.DataSource = dt;
        dlCustomers.DataBind();

    }
    Data ObjData = new Data();

    public DataTable getWithdrawlRequestPending(clsAccount objaccount)
    {

        string str_query = "SELECT P.ID,U.userid,U.username,U.ShippingAddress,U.ShippingArea,U.ShippingPincode,U.ShippingCity,U.MobileSecond,U.fathername ,U.Surname,P.Status,S.StateId,U.Mobile,u.MobileSecond, PM.ProductName,P.Status,P.Entrydate,P.approvedate,P.TransactionID,S.StateName,C.CityName FROM OrderProduct P JOIN productmaster PM ON P.ProductID=PM.ProductId join  UserDetail U ON P.Userid=U.UserId LEFT JOIN citymaster C ON C.CityId=U.ShippingCity LEFT JOIN statemaster S ON C.StateId=S.StateId   where 1=1 AND p.Status='Pending'  ";


        if (objaccount.FromDate != DateTime.MinValue && objaccount.ToDate != DateTime.MinValue)
        {
            str_query += "  and P.entrydate  >= '" + objaccount.FromDate + "'   and P.entrydate   <= '" + objaccount.ToDate + "' ";
        }



        if (objaccount.WithdrawlRequestStatus != "0")
        {
            str_query += "  and P.status = '" + objaccount.WithdrawlRequestStatus + "' ";
        }

        if (objaccount.UserId != "")
        {
            str_query += "  and P.UserId = '" + objaccount.UserId + "' ";
        }


        str_query += " order by P.entrydate  desc";



        DataTable dt = null;
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTable(str_query);
        }
        catch (Exception ex)
        {
            dt = null;
        }
        ObjData.EndConnection();
        return dt;
    }
 
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
       
    }
 

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "photolarge")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label LblImage = (Label)GridView1.Rows[index].FindControl("LblImage");
            ImageLarge.ImageUrl = LblImage.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal1();", true);
        }
    }
}