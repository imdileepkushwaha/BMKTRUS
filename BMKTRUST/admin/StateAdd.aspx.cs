using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StateAdd : System.Web.UI.Page
{
    clsState objState = new clsState();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadstate();
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
        GridView1.DataSource = objState.getStateAll();
        GridView1.DataBind();
    }
    void SetAddMode()
    {
        lblstateid.Text = "";
        litFormTitle.Text = "Add State";
        btnSubmit.Text = "Submit";
        btnSubmit.OnClientClick = "return validate();";
        ddcountry.Enabled = true;
    }
    void ClearForm()
    {
        txtstatename.Text = "";
        ddcountry.SelectedValue = "0";
        SetAddMode();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblstateid.Text))
        {
            objState.StateName = txtstatename.Text;
            objState.StateId = lblstateid.Text;
            string res = objState.Update_State(objState);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Edited Successfully');", true);
                ClearForm();
                loadstate();
            }
            return;
        }

        objState.CountryId = ddcountry.SelectedValue.ToString();
        objState.StateName = txtstatename.Text;
        objState.MentionBy = Session["useradmin"].ToString();
        string addRes = objState.Insert_State(objState);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Added Successfully');", true);
            ClearForm();
            loadstate();
        }
        else if (addRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Already Exists');", true);
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
            Label lblstatename = (Label)GridView1.Rows[index].FindControl("lblstatename");
            Label lblCountryname = (Label)GridView1.Rows[index].FindControl("lblCountryname");
            lblstateid.Text = lblid.Text;
            txtstatename.Text = lblstatename.Text;
            ListItem countryItem = ddcountry.Items.FindByText(lblCountryname.Text);
            if (countryItem != null)
                ddcountry.SelectedValue = countryItem.Value;
            litFormTitle.Text = "Edit State Details";
            btnSubmit.Text = "Update";
            btnSubmit.OnClientClick = "return validateEdit();";
            ddcountry.Enabled = false;
        }
    }
}
