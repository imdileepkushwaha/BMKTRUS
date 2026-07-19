using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;

public partial class SiteMaster : MasterPage
{
    clsWebsite _web = new clsWebsite();

    protected void Page_Load(object sender, EventArgs e)
    {
        FaviconUrl = ResolveUrl("~/site/assets/images/logo.png");
        BindWebsiteSettings();
    }

    void BindWebsiteSettings()
    {
        string siteEn = "Bharat Manav Kalyan Trust";
        string siteHi = "भारत मानव कल्याण ट्रस्ट";
        string tagline = "सेवा • समर्पण • सशक्तिकरण";
        string logoPath = "~/site/assets/images/logo.png";
        string address = "New Delhi, India";
        string phone = "+91 98765 43210";
        string whatsapp = "919876543210";
        string email = "info@bharatmanavkalyantrust.org";
        string facebook = "https://facebook.com/";
        string instagram = "https://instagram.com/";
        string twitter = "https://twitter.com/";
        string youtube = "https://youtube.com/";
        string linkedin = "https://linkedin.com/";

        try
        {
            DataTable dt = _web.GetSettings();
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];
                siteEn = FirstNonEmpty(Convert.ToString(r["SiteNameEn"]), siteEn);
                siteHi = FirstNonEmpty(Convert.ToString(r["SiteNameHi"]), siteHi);
                tagline = FirstNonEmpty(Convert.ToString(r["Tagline"]), tagline);
                string logo = Convert.ToString(r["LogoPath"]);
                if (!string.IsNullOrWhiteSpace(logo))
                    logoPath = "~/" + logo.TrimStart('~', '/', '\\').Replace("\\", "/");
                address = FirstNonEmpty(Convert.ToString(r["Address"]), address);
                phone = FirstNonEmpty(Convert.ToString(r["Phone"]), phone);
                whatsapp = FirstNonEmpty(Convert.ToString(r["WhatsApp"]), whatsapp);
                email = FirstNonEmpty(Convert.ToString(r["Email"]), email);
                facebook = FirstNonEmpty(Convert.ToString(r["FacebookUrl"]), facebook);
                instagram = FirstNonEmpty(Convert.ToString(r["InstagramUrl"]), instagram);
                twitter = FirstNonEmpty(Convert.ToString(r["TwitterUrl"]), twitter);
                youtube = FirstNonEmpty(Convert.ToString(r["YoutubeUrl"]), youtube);
                linkedin = FirstNonEmpty(Convert.ToString(r["LinkedInUrl"]), linkedin);
            }
        }
        catch
        {
            // Keep defaults if DB is unavailable
        }

        imgLoaderLogo.ImageUrl = logoPath;
        imgNavLogo.ImageUrl = logoPath;
        imgFooterLogo.ImageUrl = logoPath;
        imgNavLogo.AlternateText = siteEn;
        imgFooterLogo.AlternateText = siteEn;

        litBrandHi.Text = Server.HtmlEncode(siteHi);
        litBrandEn.Text = Server.HtmlEncode(siteEn);
        litFooterName.Text = Server.HtmlEncode(siteEn);
        litFooterNameHi.Text = Server.HtmlEncode(siteHi);
        litFooterTagline.Text = Server.HtmlEncode(tagline);
        litFooterMotto.Text = Server.HtmlEncode(tagline);
        litCopyrightName.Text = Server.HtmlEncode(siteEn);

        litFooterAddress.Text = Server.HtmlEncode(address);
        litFooterPhone.Text = Server.HtmlEncode(phone);
        hypFooterPhone.NavigateUrl = "tel:" + clsWebsite.DigitsOnly(phone);
        litFooterWhatsApp.Text = Server.HtmlEncode(phone);
        hypFooterWhatsApp.NavigateUrl = clsWebsite.WhatsAppLink(whatsapp);
        litFooterEmail.Text = Server.HtmlEncode(email);
        hypFooterEmail.NavigateUrl = "mailto:" + email;

        hypFacebook.NavigateUrl = facebook;
        hypInstagram.NavigateUrl = instagram;
        hypTwitter.NavigateUrl = twitter;
        hypYoutube.NavigateUrl = youtube;
        hypLinkedIn.NavigateUrl = linkedin;

        hypWhatsAppFloat.NavigateUrl = clsWebsite.WhatsAppLink(whatsapp);

        if (string.IsNullOrWhiteSpace(litPageTitle.Text) || litPageTitle.Text.Contains("Bharat Manav Kalyan Trust"))
            litPageTitle.Text = siteEn + " — " + tagline;

        FaviconUrl = ResolveUrl(logoPath);
    }

    public string FaviconUrl { get; private set; }

    static string FirstNonEmpty(string value, string fallback)
    {
        return string.IsNullOrWhiteSpace(value) ? fallback : value.Trim();
    }

    public void SetPageTitle(string title)
    {
        if (!string.IsNullOrWhiteSpace(title) && litPageTitle != null)
            litPageTitle.Text = title;
    }
}
