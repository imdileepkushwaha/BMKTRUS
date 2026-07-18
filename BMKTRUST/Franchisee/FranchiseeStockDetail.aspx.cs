using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data;

public partial class FranchiseeStockDetail : System.Web.UI.Page
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
               
                loadProduct();
                loaduser();
                txtuserid.Text = Session["fuserid"].ToString();
                txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
   

    void loadProduct()
    {
        DDLstProduct.Items.Clear();
        DataTable dt = new DataTable();
        dt = objP.getProductForPurchaseFranchiseeWise(txtuserid.Text);
        DDLstProduct.DataSource = dt;
        DDLstProduct.DataTextField = "Productname";
        DDLstProduct.DataValueField = "Productid";
        DDLstProduct.DataBind();
        ListItem li = new ListItem("Select Product", "0");
        DDLstProduct.Items.Insert(0, li);
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
       
            objV.VendorId = txtuserid.Text;
      
        
        DataTable dt = new DataTable();
        dt = objV.getFranchiseeStock(objV);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    
    
}