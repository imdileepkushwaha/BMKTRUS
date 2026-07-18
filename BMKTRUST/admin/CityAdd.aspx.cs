using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CityAdd : System.Web.UI.Page
{
    clsState objState = new clsState();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadcity();
                SetAddMode();
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
        DataTable dt = objState.getCountry();
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ddcountry.Items.Insert(0, new ListItem("Select Country", "0"));
    }
    void loadstate()
    {
        ddstate.Items.Clear();
        objState.CountryId = ddcountry.SelectedValue.ToString();
        DataTable dt = objState.getState(objState);
        ddstate.DataSource = dt;
        ddstate.DataTextField = "StateName";
        ddstate.DataValueField = "StateID";
        ddstate.DataBind();
        ddstate.Items.Insert(0, new ListItem("Select State", "0"));
    }
    void loadcity()
    {
        GridView1.DataSource = objState.getCityAll();
        GridView1.DataBind();
    }
    void SetAddMode()
    {
        lblcityid.Text = "";
        litFormTitle.Text = "Add City";
        btnSubmit.Text = "Submit";
        btnSubmit.OnClientClick = "return validate();";
        ddcountry.Enabled = true;
        ddstate.Enabled = true;
    }
    void SetEditMode()
    {
        litFormTitle.Text = "Edit City Details";
        btnSubmit.Text = "Update";
        btnSubmit.OnClientClick = "return validateEdit();";
        ddcountry.Enabled = false;
        ddstate.Enabled = false;
    }
    void ClearForm()
    {
        txtcityname.Text = "";
        ddcountry.SelectedValue = "0";
        ddstate.Items.Clear();
        ddstate.Items.Insert(0, new ListItem("Select State", "0"));
        SetAddMode();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblcityid.Text))
        {
            objState.CityName = txtcityname.Text;
            objState.CityId = lblcityid.Text;
            string res = objState.Update_City(objState);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Edited Successfully');", true);
                ClearForm();
                loadcity();
            }
            return;
        }

        objState.StateId = ddstate.SelectedValue.ToString();
        objState.CityName = txtcityname.Text;
        objState.MentionBy = Session["useradmin"].ToString();
        string addRes = objState.Insert_City(objState);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Added Successfully');", true);
            ClearForm();
            loadcity();
        }
        else if (addRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Already Exists');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Unknow error occurred');", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblcityname = (Label)GridView1.Rows[index].FindControl("lblcityname");
            Label lblCountryname = (Label)GridView1.Rows[index].FindControl("lblCountryname");
            Label lblstatename = (Label)GridView1.Rows[index].FindControl("lblstatename");

            lblcityid.Text = lblid.Text;
            txtcityname.Text = lblcityname.Text;

            ListItem countryItem = ddcountry.Items.FindByText(lblCountryname.Text);
            if (countryItem != null)
            {
                ddcountry.SelectedValue = countryItem.Value;
                loadstate();
                ListItem stateItem = ddstate.Items.FindByText(lblstatename.Text);
                if (stateItem != null)
                    ddstate.SelectedValue = stateItem.Value;
            }
            SetEditMode();
        }
    }
    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
}
