using System;
using System.Data;
using System.IO;
using System.Web.UI;
using BusinessLogicTier;

public partial class user_WelcomeLetter : System.Web.UI.Page
{
    clsUser objUser = new clsUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("logout.aspx");
                return;
            }
            LoadLetter();
        }
    }

    void LoadLetter()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable dt = objUser.getUserDetail(objUser);
        if (dt == null || dt.Rows.Count == 0)
            return;

        DataRow r = dt.Rows[0];

        lblName.Text = Dash(Safe(r, "username"));

        lblMemberId.Text = Dash(Safe(r, "userid"));
        lblSponsorId.Text = Dash(Safe(r, "sponserid"));

        try
        {
            if (!string.IsNullOrWhiteSpace(Safe(r, "regdate")))
                lblJoiningDate.Text = Convert.ToDateTime(r["regdate"]).ToString("dd/MM/yyyy");
            else if (!string.IsNullOrWhiteSpace(Safe(r, "mentiondate")))
                lblJoiningDate.Text = Convert.ToDateTime(r["mentiondate"]).ToString("dd/MM/yyyy");
            else
                lblJoiningDate.Text = "-";
        }
        catch
        {
            lblJoiningDate.Text = Dash(Safe(r, "regdate"));
        }

        // Optional chairman signature if uploaded to site/assets/images/signature.png
        string signVirtual = "~/site/assets/images/signature.png";
        string signPhysical = Server.MapPath(signVirtual);
        if (File.Exists(signPhysical))
        {
            imgSignature.ImageUrl = signVirtual;
            imgSignature.Visible = true;
            spanSignPlaceholder.Visible = false;
        }
    }

    static string Safe(DataRow row, string col)
    {
        if (row == null || row.Table == null || !row.Table.Columns.Contains(col) || row[col] == DBNull.Value)
            return "";
        return Convert.ToString(row[col]).Trim();
    }

    static string Dash(string value)
    {
        return string.IsNullOrWhiteSpace(value) ? "-" : value;
    }
}
