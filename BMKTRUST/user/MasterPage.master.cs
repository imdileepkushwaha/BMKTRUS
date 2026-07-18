using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private const string DefaultAvatar = "~/site/assets/images/default-user.svg";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            string avatarUrl = GetUserAvatarUrl();
            dvUserImage3.Src = avatarUrl;
            if (dvUserImageDrop != null)
            {
                dvUserImageDrop.Src = avatarUrl;
            }

            string displayName = Session["username"] != null ? Session["username"].ToString() : "Member";
            string userId = Session["userid"] != null ? Session["userid"].ToString() : "";

            if (lblusernameDrop != null)
            {
                lblusernameDrop.Text = displayName;
            }
            if (lbluseridDrop != null)
            {
                lbluseridDrop.Text = string.IsNullOrEmpty(userId) ? "Member Account" : userId;
            }

            if (Session["status"] != null && Session["status"].ToString() == "1")
            {
            }
            else
            {
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }

    private string GetUserAvatarUrl()
    {
        string userImage = Session["UserImage"] != null ? Session["UserImage"].ToString().Trim() : string.Empty;
        if (string.IsNullOrEmpty(userImage) ||
            userImage.Equals("default.png", StringComparison.OrdinalIgnoreCase) ||
            userImage.Equals("null", StringComparison.OrdinalIgnoreCase))
        {
            return DefaultAvatar;
        }

        string relativePath = "~/ProductImage/" + userImage;
        string physicalPath = Server.MapPath(relativePath);
        if (!string.IsNullOrEmpty(physicalPath) && File.Exists(physicalPath))
        {
            return relativePath;
        }

        return DefaultAvatar;
    }
}
