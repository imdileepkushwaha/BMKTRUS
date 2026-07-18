using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class FranchiseeReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsfranchisee objUser = new clsfranchisee();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadcountryedit();

                loaduser();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loadcountry()
    {
        ddcountry.Items.Clear();
        DataTable dt = new DataTable();
        dt = objState.getCountry();
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ListItem li = new ListItem("Select Country", "0");
        ddcountry.Items.Insert(0, li);
    }
    void loadstate()
    {
        ddstate.Items.Clear();
        DataTable dt = new DataTable();
        objState.CountryId = ddcountry.SelectedValue.ToString();
        dt = objState.getState(objState);

        ddstate.DataSource = dt;
        ddstate.DataTextField = "StateName";
        ddstate.DataValueField = "StateID";
        ddstate.DataBind();
        ListItem li = new ListItem("Select State", "0");
        ddstate.Items.Insert(0, li);
    }
    void loadcity()
    {
        ddcity.Items.Clear();
        DataTable dt = new DataTable();
        objState.StateId = ddstate.SelectedValue.ToString();
        dt = objState.getCity(objState);

        ddcity.DataSource = dt;
        ddcity.DataTextField = "CityName";
        ddcity.DataValueField = "CityID";
        ddcity.DataBind();
        ListItem li = new ListItem("Select City", "0");
        ddcity.Items.Insert(0, li);
    }
    void loadTehsil()
    {
        ddlsttehsil.Items.Clear();
        DataTable dt = new DataTable();
        objState.CityId = ddcity.SelectedValue.ToString();
        dt = objState.getTehsil(objState);

        ddlsttehsil.DataSource = dt;
        ddlsttehsil.DataTextField = "tehsilName";
        ddlsttehsil.DataValueField = "tehsilID";
        ddlsttehsil.DataBind();
        ListItem li = new ListItem("Select Tehsil", "0");
        ddlsttehsil.Items.Insert(0, li);
    }
    protected void ddcity_SelectedIndexChanged(object sender, EventArgs e)
    {
      
        loadTehsil();
    }
    void loadcountryedit()
    {
        ddcountryedit.Items.Clear();
        DataTable dt = new DataTable();
        dt = objState.getCountry();
        ddcountryedit.DataSource = dt;
        ddcountryedit.DataTextField = "CountryName";
        ddcountryedit.DataValueField = "CountryID";
        ddcountryedit.DataBind();
        ListItem li = new ListItem("Select Country", "0");
        ddcountryedit.Items.Insert(0, li);
    }
    void loadstateedit()
    {
        ddstateedit.Items.Clear();
        DataTable dt = new DataTable();
        objState.CountryId = ddcountryedit.SelectedValue.ToString();
        dt = objState.getState(objState);

        ddstateedit.DataSource = dt;
        ddstateedit.DataTextField = "StateName";
        ddstateedit.DataValueField = "StateID";
        ddstateedit.DataBind();
        ListItem li = new ListItem("Select State", "0");
        ddstateedit.Items.Insert(0, li);
    }
    void loadcityedit()
    {
        ddcityedit.Items.Clear();
        DataTable dt = new DataTable();
        objState.StateId = ddstateedit.SelectedValue.ToString();
        dt = objState.getCity(objState);

        ddcityedit.DataSource = dt;
        ddcityedit.DataTextField = "CityName";
        ddcityedit.DataValueField = "CityID";
        ddcityedit.DataBind();
        ListItem li = new ListItem("Select City", "0");
        ddcityedit.Items.Insert(0, li);
    }
   
    void loadareaedit()
    {
        ddltehsiledit.Items.Clear();
        DataTable dt = new DataTable();
        objState.CityId = ddcityedit.SelectedValue.ToString();
        dt = objState.getTehsil(objState);

        ddltehsiledit.DataSource = dt;
        ddltehsiledit.DataTextField = "tehsilName";
        ddltehsiledit.DataValueField = "tehsilID";
        ddltehsiledit.DataBind();
        ListItem li = new ListItem("Select Tehsil", "0");
        ddltehsiledit.Items.Insert(0, li);
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lbluser = (Label)GridView1.Rows[index].FindControl("lbluserid");
            objUser.UserId = lbluser.Text;
            DataTable dt = new DataTable();
            dt = objUser.getUserDetail(objUser);
            if (dt.Rows.Count > 0)
            {
                ViewState["UID"] = objUser.UserId;
                txtnameedit.Text = dt.Rows[0]["username"].ToString();
                txtmobileedit.Text = dt.Rows[0]["mobile"].ToString();
                txtemailedit.Text = dt.Rows[0]["email"].ToString();
                ddgenderedit.SelectedValue = dt.Rows[0]["gender"].ToString();
                txtaddressedit.Text = dt.Rows[0]["address"].ToString();
                ddcountryedit.SelectedValue = dt.Rows[0]["countryid"].ToString();
                loadstateedit();
                ddstateedit.SelectedValue = dt.Rows[0]["stateid"].ToString();
                loadcityedit();
                ddcityedit.SelectedValue = dt.Rows[0]["cityid"].ToString();
                loadareaedit();
                ddltehsiledit.SelectedValue = dt.Rows[0]["tehsilID"].ToString();
                loadmarket();
                ddlmarketedit.SelectedValue = dt.Rows[0]["marketid"].ToString();
                ddareaedit.Text = dt.Rows[0]["areaname"].ToString();
                txtpincodeedit.Text = dt.Rows[0]["pincode"].ToString();
                txtdateofbirthedit.Text = Convert.ToDateTime(dt.Rows[0]["dateofbirth"].ToString()).ToString("dd/MM/yyyy");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }

        if (e.CommandName == "changeStatus")
        {
            try
            {
                objUser.UserId = e.CommandArgument.ToString();

                if (objUser.changeFranchiseeStatus(objUser) > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Status Changed Successfully...!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Please try again...!')", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Please try again...!')", true);
            }
            finally
            {
                loaduser();
            }
        }

        if (e.CommandName == "epin")
        {
            try
            {
                objUser.UserId = e.CommandArgument.ToString();

                if (objUser.changeFranchiseeEpinStatus(objUser) > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Status Changed Successfully...!')", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Please try again...!')", true);
                }
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, GetType(), "javascript", "alert('Please try again...!')", true);
            }
            finally
            {
                loaduser();
            }
        }

    }
    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
    protected void ddstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadcity();
    }   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }

    protected void ddltehsiledit_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadmarket();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
    }


    void loadmarket()
    {
        ddlmarketedit.Items.Clear();
        DataTable dt = new DataTable();
        objState.TehsilId = ddltehsiledit.SelectedValue.ToString();
        dt = objState.getMarket(objState);

        ddlmarketedit.DataSource = dt;
        ddlmarketedit.DataTextField = "Marketname";
        ddlmarketedit.DataValueField = "MarketId";
        ddlmarketedit.DataBind();
        ListItem li = new ListItem("Select market", "0");
        ddlmarketedit.Items.Insert(0, li);
    }

    void loaduser()
    {
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
        objUser.CityId = ddcity.SelectedValue.ToString();
        objUser.AreaName = "";
        objUser.TehsilId = ddlsttehsil.SelectedValue.ToString();
        if (txtfromdate.Text != "")
        {
            objUser.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objUser.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objUser.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objUser.ToDate = DateTime.MinValue;
        }
        objUser.UserId = "";
        DataTable dt = new DataTable();
        dt = objUser.getUserReportnew(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void ddcountryedit_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstateedit();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
    }
    protected void ddstateedit_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadcityedit();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
    }
    protected void ddcityedit_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadareaedit();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objUser.UserId = ViewState["UID"].ToString();
        objUser.UserName = txtnameedit.Text;
        objUser.Mobile = txtmobileedit.Text;
        objUser.Email = txtemailedit.Text;
        objUser.Gender = ddgenderedit.SelectedValue.ToString();
        objUser.Address = txtaddressedit.Text;
        objUser.CityId = ddcityedit.SelectedValue.ToString();
        objUser.CountryId = ddcountryedit.SelectedValue.ToString();
        objUser.StateId = ddstateedit.SelectedValue.ToString();
        objUser.AreaName = ddareaedit.Text;
        objUser.Pincode = txtpincodeedit.Text;
        objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirthedit.Text);
        objUser.TehsilId = ddltehsiledit.SelectedValue;
        objUser.MarketId = ddlmarketedit.SelectedValue;
        string res = objUser.Update_UserProfile(objUser);
        if (res == "t")
        {
            loaduser();
            string popupScript = "alert('User Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
        }
        else
        {
            string popupScript = "alert('unknown error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}