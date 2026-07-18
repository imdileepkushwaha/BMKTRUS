using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.IO;




public partial class FranchiseeStockDetail : System.Web.UI.Page
{

    decimal total = 0;
    decimal totaldp = 0;
    private Decimal TotalBV = 0;
    clsAccount objaccount = new clsAccount();
    clsProduct objP = new clsProduct();
    clsvendor objV = new clsvendor();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadFranchisee();
                loadProduct();
                loaduser();
                //txtuserid.Text = Session["userid"].ToString();
                //txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loadFranchisee()
    {
        DDLstFranchisee.Items.Clear();
        DataTable dt = new DataTable();
        dt = objV.getFranchiseeList();
        DDLstFranchisee.DataSource = dt;
        DDLstFranchisee.DataTextField = "Username";
        DDLstFranchisee.DataValueField = "userid";
        DDLstFranchisee.DataBind();
        ListItem li = new ListItem("Select Franchisee", "0");
        DDLstFranchisee.Items.Insert(0, li);
    }

    void loadProduct()
    {
        if (DDLstFranchisee.SelectedIndex > 0)
        {
            DDLstProduct.Items.Clear();
            DataTable dt = new DataTable();
            dt = objP.getProductForPurchaseFranchiseeWise(DDLstFranchisee.SelectedValue);
            DDLstProduct.DataSource = dt;
            DDLstProduct.DataTextField = "Productname";
            DDLstProduct.DataValueField = "Productid";
            DDLstProduct.DataBind();
            ListItem li = new ListItem("Select Product", "0");
            DDLstProduct.Items.Insert(0, li);
        }
        else
        {
            DDLstProduct.Items.Clear();
            DataTable dt = new DataTable();
            dt = objP.getProductForPurchase();
            DDLstProduct.DataSource = dt;
            DDLstProduct.DataTextField = "Productname";
            DDLstProduct.DataValueField = "Productid";
            DDLstProduct.DataBind();
            ListItem li = new ListItem("Select Product", "0");
            DDLstProduct.Items.Insert(0, li);
            
        }
    }

    protected void getproduct(object sender, EventArgs e)
    {
        loadProduct();
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
        objV.ProductId = string.Empty;
        if (DDLstProduct.SelectedIndex > 0)
        {
            objV.ProductId = DDLstProduct.SelectedValue;
        }
        if (DDLstFranchisee.SelectedIndex > 0)
        {
            objV.VendorId = DDLstFranchisee.SelectedValue;
        }
        
        DataTable dt = new DataTable();
        dt = objV.getFranchiseeStock(objV);
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
           // total += Convert.ToDecimal(DataBinder.Eval(e.Row.Cells, "lbluseridContactNo"));

            var ttlbv = e.Row.FindControl("lblbvleft") as Label;
            var ttldp = e.Row.FindControl("lbldpleft") as Label;

            if (ttlbv != null)
            {
                total += decimal.Parse(ttlbv.Text);

            }

            if (ttldp != null)
            {
                totaldp += decimal.Parse(ttldp.Text);

            }

          
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {

            e.Row.Cells[5].Text = String.Format("{0:N0}", total);
            e.Row.Cells[6].Text = String.Format("{0:N0}", totaldp);
        }

    }
}