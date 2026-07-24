using BusinessLogicTier;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_WebsitePopup : System.Web.UI.Page
{
    clsWebsite obj = new clsWebsite();

    protected string PopupImageUrl(object path)
    {
        string p = Convert.ToString(path);
        if (string.IsNullOrWhiteSpace(p)) return "";
        return "~/" + p.Trim().TrimStart('~', '/', '\\').Replace("\\", "/");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }
        if (!IsPostBack)
        {
            loaddata();
            SetAddMode();
        }
    }

    void loaddata()
    {
        GridView1.DataSource = obj.GetPopups(false);
        GridView1.DataBind();
    }

    void SetAddMode()
    {
        hdnPopupId.Value = "";
        litFormTitle.Text = "Add Website Popup";
        btnSubmit.Text = "Submit";
        ClearPreview();
    }

    void ClearForm()
    {
        txtTitle.Text = "";
        txtLinkUrl.Text = "";
        txtSortOrder.Text = "1";
        ddActive.SelectedValue = "1";
        SetAddMode();
    }

    void ClearPreview()
    {
        imgPreview.ImageUrl = "";
        imgPreview.Style["display"] = "none";
        litPreviewEmpty.Style["display"] = "block";
    }

    void ShowPreview(string relativePath)
    {
        if (string.IsNullOrWhiteSpace(relativePath))
        {
            ClearPreview();
            return;
        }

        string clean = relativePath.Trim().TrimStart('~', '/', '\\').Replace("\\", "/");
        string url = ResolveUrl("~/" + clean);
        imgPreview.ImageUrl = "~/" + clean;
        imgPreview.Style["display"] = "block";
        litPreviewEmpty.Style["display"] = "none";

        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "popupPreview_" + Guid.NewGuid().ToString("N"),
            "showPopupPreview('" + url.Replace("'", "\\'") + "');", true);
    }

    string UploadImage()
    {
        if (!fuImage.HasFile) return "";
        string ext = Path.GetExtension(fuImage.FileName).ToLowerInvariant();
        if (ext != ".png" && ext != ".jpg" && ext != ".jpeg" && ext != ".gif" && ext != ".webp")
            return "";

        string folder = Server.MapPath("~/site/assets/images/popup/");
        if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);

        string fileName = "popup_" + DateTime.Now.Ticks + ext;
        fuImage.SaveAs(Path.Combine(folder, fileName));
        return "site/assets/images/popup/" + fileName;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int sort = 1;
        int.TryParse(txtSortOrder.Text.Trim(), out sort);

        obj.Title = txtTitle.Text.Trim();
        obj.LinkUrl = txtLinkUrl.Text.Trim();
        obj.SortOrder = sort;
        obj.IsActive = ddActive.SelectedValue == "1";
        obj.MentionBy = Session["useradmin"].ToString();

        string uploaded = UploadImage();
        string res;

        if (!string.IsNullOrEmpty(hdnPopupId.Value))
        {
            obj.PopupId = Convert.ToInt32(hdnPopupId.Value);
            if (!string.IsNullOrEmpty(uploaded))
                obj.ImagePath = uploaded;
            res = obj.UpdatePopup(obj);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "alert('Popup updated successfully');", true);
                ClearForm();
                loaddata();
            }
            return;
        }

        if (string.IsNullOrEmpty(uploaded))
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Please select a popup image');", true);
            return;
        }

        obj.ImagePath = uploaded;
        res = obj.InsertPopup(obj);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Popup added successfully');", true);
            ClearForm();
            loaddata();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                "alert('Unable to save. Please check database connection.');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblTitle = (Label)GridView1.Rows[index].FindControl("lblTitle");
            Label lblLink = (Label)GridView1.Rows[index].FindControl("lblLink");
            Label lblSort = (Label)GridView1.Rows[index].FindControl("lblSort");
            Label lblActive = (Label)GridView1.Rows[index].FindControl("lblActive");
            Label lblPath = (Label)GridView1.Rows[index].FindControl("lblPath");

            hdnPopupId.Value = lblid.Text;
            txtTitle.Text = lblTitle.Text;
            txtLinkUrl.Text = lblLink != null ? lblLink.Text : "";
            txtSortOrder.Text = lblSort.Text;
            ddActive.SelectedValue = lblActive.Text == "Active" ? "1" : "0";
            litFormTitle.Text = "Edit Website Popup";
            btnSubmit.Text = "Update";
            ShowPreview(lblPath != null ? lblPath.Text : "");
        }
        else if (e.CommandName == "toggle")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblActive = (Label)GridView1.Rows[index].FindControl("lblActive");
            bool currentlyActive = lblActive != null && lblActive.Text == "Active";
            string res = obj.SetPopupActive(Convert.ToInt32(lblid.Text), !currentlyActive);
            if (res == "t")
            {
                loaddata();
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(),
                    "alert('Popup " + (!currentlyActive ? "activated" : "deactivated") + " successfully');", true);
            }
        }
        else if (e.CommandName == "mydel")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            string res = obj.DeletePopup(Convert.ToInt32(lblid.Text));
            if (res == "t")
            {
                ClearForm();
                loaddata();
            }
        }
    }
}
