using System;
using System.Web.UI;

public partial class user_HelpingBinaryMatrix2X2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            txtuserid.Text = Session["userid"].ToString();
            f1.Src = "HelpingBinaryTree2X2.aspx?SuperId=" + txtuserid.Text;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtuserid.Text))
        {
            Message.Show("Enter User Id...!!!!");
            return;
        }
        f1.Src = "HelpingBinaryTree2X2.aspx?SuperId=" + txtuserid.Text.Trim();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
