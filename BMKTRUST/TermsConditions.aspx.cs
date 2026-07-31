using System;
using System.Web.UI;

public partial class TermsConditionsPage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var master = Master as SiteMaster;
            if (master != null)
                master.SetPageTitle("Terms & Conditions — Bharat Manav Kalyan Trust");
        }
    }
}
