using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                LblUsernameSideMenu.Text = Session["useradmin"].ToString();
                LblMainId.Text = Session["useradmin"].ToString();
                //LblFullname.Text = Session["useradmin"].ToString();
            }
        }
    }
}
