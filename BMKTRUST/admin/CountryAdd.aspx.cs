using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CountryAdd : System.Web.UI.Page
{
    clsState objState = new clsState();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loaddata();
                SetAddMode();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loaddata()
    {
        DataTable dt = objState.getCountry();
        GridView1.DataSource = dt;
        GridView1.DataBind();
        int count = dt != null ? dt.Rows.Count : 0;
        litCount.Text = count + (count == 1 ? " country" : " countries");
    }
    void SetAddMode()
    {
        lblcountryid.Text = "";
        litFormTitle.Text = "Add Country";
        btnSubmit.Text = "Submit";
    }
    void SetEditMode()
    {
        litFormTitle.Text = "Edit Country";
        btnSubmit.Text = "Update";
    }
    void ClearForm()
    {
        txtcountryname.Text = "";
        txtcountrycode.Text = "";
        SetAddMode();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblcountryid.Text))
        {
            objState.CountryName = txtcountryname.Text.Trim();
            objState.CountryCode = txtcountrycode.Text.Trim();
            objState.CountryId = lblcountryid.Text;
            string res = objState.Update_Country(objState);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Country Edited Successfully');", true);
                ClearForm();
                loaddata();
            }
            return;
        }

        objState.CountryName = txtcountryname.Text.Trim();
        objState.CountryCode = txtcountrycode.Text.Trim();
        objState.MentionBy = Session["useradmin"].ToString();
        string addRes = objState.Insert_Country(objState);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Country Added Successfully');", true);
            ClearForm();
            loaddata();
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
            Label lblCountryname = (Label)GridView1.Rows[index].FindControl("lblCountryname");
            Label lblCountrycode = (Label)GridView1.Rows[index].FindControl("lblCountrycode");
            lblcountryid.Text = lblid.Text;
            txtcountryname.Text = lblCountryname.Text;
            txtcountrycode.Text = lblCountrycode.Text;
            SetEditMode();
        }
    }
}
