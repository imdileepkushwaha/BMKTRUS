using BusinessLogicTier;
using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Web.UI;

public partial class IndexPage : Page
{
    clsWebsite objWeb = new clsWebsite();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindWebsiteContent();
            var master = Master as SiteMaster;
            if (master != null && !string.IsNullOrEmpty(litHeroEn.Text))
                master.SetPageTitle(litHeroEn.Text + " — " + litHeroTagline.Text);
        }
    }

    void BindWebsiteContent()
    {
        string siteEn = "Bharat Manav Kalyan Trust";
        string siteHi = "भारत मानव कल्याण ट्रस्ट";
        string tagline = "सेवा • समर्पण • सशक्तिकरण";
        string logoPath = "~/site/assets/images/logo.png";
        string address = "New Delhi, India";
        string phone = "+91 98765 43210";
        string email = "info@bharatmanavkalyantrust.org";

        try
        {
            DataTable settings = objWeb.GetSettings();
            if (settings != null && settings.Rows.Count > 0)
            {
                DataRow r = settings.Rows[0];
                siteEn = FirstNonEmpty(Convert.ToString(r["SiteNameEn"]), siteEn);
                siteHi = FirstNonEmpty(Convert.ToString(r["SiteNameHi"]), siteHi);
                tagline = FirstNonEmpty(Convert.ToString(r["Tagline"]), tagline);
                string logo = Convert.ToString(r["LogoPath"]);
                if (!string.IsNullOrWhiteSpace(logo))
                    logoPath = "~/" + logo.TrimStart('~', '/', '\\').Replace("\\", "/");
                address = FirstNonEmpty(Convert.ToString(r["Address"]), address);
                phone = FirstNonEmpty(Convert.ToString(r["Phone"]), phone);
                email = FirstNonEmpty(Convert.ToString(r["Email"]), email);
            }

            DataTable gallery = objWeb.GetGallery(true);
            rptGallery.DataSource = gallery;
            rptGallery.DataBind();
        }
        catch
        {
            rptGallery.DataSource = null;
            rptGallery.DataBind();
        }

        litHeroEn.Text = Server.HtmlEncode(siteEn);
        litHeroHi.Text = Server.HtmlEncode(siteHi);
        litHeroTagline.Text = Server.HtmlEncode(tagline);
        imgHeroLogo.ImageUrl = logoPath;
        imgHeroLogo.AlternateText = siteEn + " Logo";

        litContactAddress.Text = Server.HtmlEncode(address);
        litContactPhone.Text = Server.HtmlEncode(phone);
        hypContactPhone.NavigateUrl = "tel:" + clsWebsite.DigitsOnly(phone);
        litContactEmail.Text = Server.HtmlEncode(email);
        hypContactEmail.NavigateUrl = "mailto:" + email;
    }

    static string FirstNonEmpty(string value, string fallback)
    {
        return string.IsNullOrWhiteSpace(value) ? fallback : value.Trim();
    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        pnlContactSuccess.Visible = false;
        pnlContactError.Visible = false;

        string name = (txtName.Text ?? string.Empty).Trim();
        string email = (txtEmail.Text ?? string.Empty).Trim();
        string message = (txtMessage.Text ?? string.Empty).Trim();

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
        {
            litContactError.Text = "Please fill in all required fields.";
            pnlContactError.Visible = true;
            return;
        }

        if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
            litContactError.Text = "Please enter a valid email address.";
            pnlContactError.Visible = true;
            return;
        }

        txtName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtSubject.Text = string.Empty;
        txtMessage.Text = string.Empty;

        litContactSuccess.Text = "Thank you! Your message has been received. We will get back to you soon.";
        pnlContactSuccess.Visible = true;
    }
}
