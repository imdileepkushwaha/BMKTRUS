using System;
using System.Web.UI;

public partial class SiteMaster : MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void SetPageTitle(string title)
    {
        if (!string.IsNullOrWhiteSpace(title) && litPageTitle != null)
        {
            litPageTitle.Text = title;
        }
    }
}
