using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_NewsAdd : System.Web.UI.Page
{
    clsNews objnews = new clsNews();
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
        GridView1.DataSource = objnews.getNews();
        GridView1.DataBind();
    }
    void SetAddMode()
    {
        lblnewsid.Text = "";
        litFormTitle.Text = "Add News";
        btnSubmit.Text = "Submit";
    }
    void ClearForm()
    {
        txtnews.Text = "";
        SetAddMode();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblnewsid.Text))
        {
            objnews.NewsDetail = txtnews.Text;
            objnews.NewsId = lblnewsid.Text;
            string res = objnews.Update_News(objnews);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('News Edited Successfully');", true);
                ClearForm();
                loaddata();
            }
            return;
        }

        objnews.NewsDetail = txtnews.Text;
        objnews.MentionBy = Session["useradmin"].ToString();
        string addRes = objnews.Insert_News(objnews);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('News Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else if (addRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('News already exists.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Unknow error occurred');", true);
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblnews = (Label)GridView1.Rows[index].FindControl("lblnews");
            lblnewsid.Text = lblid.Text;
            txtnews.Text = lblnews.Text;
            litFormTitle.Text = "Edit News Details";
            btnSubmit.Text = "Update";
        }
        if (e.CommandName == "mydel")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            objnews.NewsId = lblid.Text;
            objnews.Delete_News(objnews);
            loaddata();
            ClearForm();
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('News Deleted Successfully');", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
}
