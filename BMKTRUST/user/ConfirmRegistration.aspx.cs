using System;
using System.Web.UI;
using BusinessLogicTier;

public partial class user_ConfirmRegistration : System.Web.UI.Page
{
    clsUser objuser = new clsUser();
    Documet_Upload_class ObjDUc = new Documet_Upload_class();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            laoddata();
        }
    }

    void laoddata()
    {
        // Preview-safe: show sample values when session is empty (direct URL open)
        LblLoginId.Text = SessionText("LoginId1", "BMKT000123");
        LblPassword.Text = SessionText("Password1", "Pass@1234");
        LblSponsorName.Text = "Necta Network";
        LblSponsorId.Text = SessionText("SponserId1", "BMKT000001");
        lblName.Text = SessionText("UserName2", "Rahul");
        lblLastname.Text = SessionText("UserNameLastname2", "Sharma");
    }

    static string SessionText(string key, string fallback)
    {
        object val = System.Web.HttpContext.Current.Session[key];
        if (val == null || string.IsNullOrWhiteSpace(Convert.ToString(val)))
            return fallback;
        return Convert.ToString(val);
    }
}
