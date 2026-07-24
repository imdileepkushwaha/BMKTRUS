using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;

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

            if (lnkAddUser != null && !string.IsNullOrEmpty(userId))
            {
                lnkAddUser.HRef = ResolveUrl("~/RegistrationNew.aspx")
                    + "?UserId=" + HttpUtility.UrlEncode(userId)
                    + "&standingposition=1";
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }

    private string GetUserAvatarUrl()
    {
        string fileName = BmkPhotoHelper.NormalizePhotoFileName(
            Session["UserImage"] != null ? Session["UserImage"].ToString() : string.Empty);

        if (string.IsNullOrEmpty(fileName))
        {
            fileName = LoadPhotoFileNameFromDb();
            if (!string.IsNullOrEmpty(fileName))
            {
                Session["UserImage"] = fileName;
            }
        }

        if (string.IsNullOrEmpty(fileName))
        {
            return ResolveUrl(DefaultAvatar);
        }

        string relativePath = "~/ProductImage/" + fileName;
        string physicalPath = Server.MapPath(relativePath);
        if (!string.IsNullOrEmpty(physicalPath) && File.Exists(physicalPath))
        {
            return ResolveUrl(relativePath);
        }

        // Session may be stale after a new upload — refresh once from DB
        string dbFile = LoadPhotoFileNameFromDb();
        if (!string.IsNullOrEmpty(dbFile) && !dbFile.Equals(fileName, StringComparison.OrdinalIgnoreCase))
        {
            Session["UserImage"] = dbFile;
            relativePath = "~/ProductImage/" + dbFile;
            physicalPath = Server.MapPath(relativePath);
            if (File.Exists(physicalPath))
            {
                return ResolveUrl(relativePath);
            }
        }

        return ResolveUrl(DefaultAvatar);
    }

    private string LoadPhotoFileNameFromDb()
    {
        try
        {
            if (Session["userid"] == null)
                return string.Empty;

            clsUser objUser = new clsUser();
            objUser.UserId = Session["userid"].ToString();
            DataTable dt = objUser.getUserName(objUser);
            if (dt == null || dt.Rows.Count == 0)
                return string.Empty;

            string photo = string.Empty;
            if (dt.Columns.Contains("Photo") && dt.Rows[0]["Photo"] != DBNull.Value)
                photo = Convert.ToString(dt.Rows[0]["Photo"]);
            else if (dt.Columns.Contains("PhotoImage") && dt.Rows[0]["PhotoImage"] != DBNull.Value)
                photo = Convert.ToString(dt.Rows[0]["PhotoImage"]);

            return BmkPhotoHelper.NormalizePhotoFileName(photo);
        }
        catch
        {
            return string.Empty;
        }
    }
}
