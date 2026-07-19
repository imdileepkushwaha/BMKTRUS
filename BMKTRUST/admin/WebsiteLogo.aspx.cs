using BusinessLogicTier;
using System;
using System.Data;
using System.IO;
using System.Web.UI;

public partial class admin_WebsiteLogo : System.Web.UI.Page
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
            txtSiteNameEn.Text = Convert.ToString(r["SiteNameEn"]);
            txtSiteNameHi.Text = Convert.ToString(r["SiteNameHi"]);
            txtTagline.Text = Convert.ToString(r["Tagline"]);
            string logo = Convert.ToString(r["LogoPath"]);
            if (!string.IsNullOrEmpty(logo))
                imgLogoPreview.ImageUrl = "~/" + logo.TrimStart('~', '/').Replace("\\", "/");
            else
                imgLogoPreview.ImageUrl = "~/site/assets/images/logo.png";
        }
        else
        {
            txtSiteNameEn.Text = "Bharat Manav Kalyan Trust";
            txtSiteNameHi.Text = "भारत मानव कल्याण ट्रस्ट";
            txtTagline.Text = "सेवा • समर्पण • सशक्तिकरण";
            imgLogoPreview.ImageUrl = "~/site/assets/images/logo.png";
        }
    }

    string UploadLogo()
    {
        if (!fuLogo.HasFile) return "";
        string ext = Path.GetExtension(fuLogo.FileName).ToLowerInvariant();
        if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".gif" && ext != ".webp")
            return "";

        string folder = Server.MapPath("~/site/assets/images/");
        if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);

        string fileName = "logo_" + DateTime.Now.Ticks + ext;
        fuLogo.SaveAs(Path.Combine(folder, fileName));

        // Also refresh default logo.png for favicon/loader compatibility
        string defaultLogo = Path.Combine(folder, "logo.png");
        try
        {
            File.Copy(Path.Combine(folder, fileName), defaultLogo, true);
        }
        catch { }

        return "site/assets/images/" + fileName;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtSiteNameEn.Text))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Enter Site Name (English)');", true);
            return;
        }

        obj.SiteNameEn = txtSiteNameEn.Text.Trim();
        obj.SiteNameHi = txtSiteNameHi.Text.Trim();
        obj.Tagline = txtTagline.Text.Trim();
        obj.MentionBy = Session["useradmin"].ToString();
        string uploaded = UploadLogo();
        if (!string.IsNullOrEmpty(uploaded))
            obj.LogoPath = uploaded;

        string res = obj.SaveLogoSettings(obj);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Logo & branding saved successfully');", true);
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
