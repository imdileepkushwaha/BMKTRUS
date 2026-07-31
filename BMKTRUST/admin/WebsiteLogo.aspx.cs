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
                imgLogoPreview.ImageUrl = WithVersion("~/" + logo.TrimStart('~', '/').Replace("\\", "/"));
            else
                imgLogoPreview.ImageUrl = WithVersion("~/" + CanonicalLogoPath);
        }
        else
        {
            txtSiteNameEn.Text = "Bharat Manav Kalyan Trust";
            txtSiteNameHi.Text = "भारत मानव कल्याण ट्रस्ट";
            txtTagline.Text = "सेवा • समर्पण • सशक्तिकरण";
            imgLogoPreview.ImageUrl = WithVersion("~/" + CanonicalLogoPath);
        }
    }

    // Every page (site, user panel, admin, ID card, invoices) points at logo.png,
    // so the upload always overwrites that single canonical file.
    const string CanonicalLogoPath = "site/assets/images/logo.png";

    string WithVersion(string appRelativePath)
    {
        try
        {
            string physical = Server.MapPath(appRelativePath);
            if (!File.Exists(physical)) return appRelativePath;
            return appRelativePath + "?v=" + File.GetLastWriteTimeUtc(physical).Ticks;
        }
        catch
        {
            return appRelativePath;
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

        byte[] data = fuLogo.FileBytes;
        if (data == null || data.Length == 0) return "";

        File.WriteAllBytes(Path.Combine(folder, "logo.png"), data);

        // Keep a dated copy so an earlier logo can be restored if needed
        try
        {
            File.WriteAllBytes(Path.Combine(folder, "logo_" + DateTime.Now.Ticks + ext), data);
        }
        catch { }

        return CanonicalLogoPath;
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
