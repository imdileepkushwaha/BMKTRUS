using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;

public partial class admin_WebsiteContact : System.Web.UI.Page
{
    clsWebsite obj = new clsWebsite();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadSettings();
        }
    }

    void LoadSettings()
    {
        DataTable dt = obj.GetSettings();
        if (dt != null && dt.Rows.Count > 0)
        {
            DataRow r = dt.Rows[0];
            txtPhone.Text = Convert.ToString(r["Phone"]);
            txtWhatsApp.Text = Convert.ToString(r["WhatsApp"]);
            txtEmail.Text = Convert.ToString(r["Email"]);
            txtAddress.Text = Convert.ToString(r["Address"]);
            txtFacebook.Text = Convert.ToString(r["FacebookUrl"]);
            txtInstagram.Text = Convert.ToString(r["InstagramUrl"]);
            txtTwitter.Text = Convert.ToString(r["TwitterUrl"]);
            txtYoutube.Text = Convert.ToString(r["YoutubeUrl"]);
            txtLinkedIn.Text = Convert.ToString(r["LinkedInUrl"]);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        obj.Phone = txtPhone.Text.Trim();
        obj.WhatsApp = txtWhatsApp.Text.Trim();
        obj.Email = txtEmail.Text.Trim();
        obj.Address = txtAddress.Text.Trim();
        obj.FacebookUrl = txtFacebook.Text.Trim();
        obj.InstagramUrl = txtInstagram.Text.Trim();
        obj.TwitterUrl = txtTwitter.Text.Trim();
        obj.YoutubeUrl = txtYoutube.Text.Trim();
        obj.LinkedInUrl = txtLinkedIn.Text.Trim();
        obj.MentionBy = Session["useradmin"].ToString();

        string res = obj.SaveContactSettings(obj);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Contact details saved successfully');", true);
            LoadSettings();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Unable to save. Please check database connection.');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        LoadSettings();
    }
}
