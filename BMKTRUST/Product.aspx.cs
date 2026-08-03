using System;
using System.Web.UI;

public partial class ProductPage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/Projects.aspx", true);
    }
}
