using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI;
using DataTier;

public partial class user_HelpingBinaryTree2X2 : System.Web.UI.Page
{
    Data ObjData = new Data();
    const string TreePage = "HelpingBinaryTree2X2.aspx";
    const int MaxLevel = 4; // Level 0..4 => 1+2+4+8+16 = 31 nodes

    protected void Page_Load(object sender, EventArgs e)
    {
        string superId = Request.QueryString["SuperId"];
        if (string.IsNullOrWhiteSpace(superId))
        {
            lblMsg.Text = "User Id missing.";
            return;
        }
        LoadMatrix(superId.Trim());
    }

    DataTable GetDownline(string userId)
    {
        DataTable dt = new DataTable();
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTableProcedure("sp_getHelpingBinaryPool2", new[] {
                new SqlParameter("@userid", userId)
            });
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
        finally
        {
            ObjData.EndConnection();
        }
        return dt;
    }

    DataRow FindRoot(DataTable dt, string userId)
    {
        if (dt == null || dt.Rows.Count == 0) return null;
        DataRow[] roots = dt.Select("userlevel = 0");
        if (roots.Length > 0) return roots[0];
        foreach (DataRow row in dt.Rows)
        {
            if (string.Equals(Convert.ToString(row["userid"]), userId, StringComparison.OrdinalIgnoreCase))
                return row;
        }
        return dt.Rows[0];
    }

    DataRow ChildAt(DataTable dt, DataRow parent, int index)
    {
        if (parent == null || dt == null) return null;
        DataRow[] children = dt.Select("ParentId = " + Convert.ToInt32(parent["id"]), "id ASC");
        return children.Length > index ? children[index] : null;
    }

    DataRow[] BuildSlots(DataTable dt, DataRow root)
    {
        int total = (1 << (MaxLevel + 1)) - 1; // 31
        DataRow[] slots = new DataRow[total];
        slots[0] = root;
        for (int i = 0; i < total; i++)
        {
            int left = 2 * i + 1;
            int right = 2 * i + 2;
            if (left < total) slots[left] = ChildAt(dt, slots[i], 0);
            if (right < total) slots[right] = ChildAt(dt, slots[i], 1);
        }
        return slots;
    }

    string Initials(string name, string userId)
    {
        string src = !string.IsNullOrWhiteSpace(name) ? name.Trim() : (userId ?? "");
        if (string.IsNullOrEmpty(src)) return "?";
        string[] parts = src.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
        if (parts.Length >= 2)
            return (parts[0].Substring(0, 1) + parts[1].Substring(0, 1)).ToUpperInvariant();
        return src.Substring(0, Math.Min(2, src.Length)).ToUpperInvariant();
    }

    string BuildCard(DataRow row, bool isRoot)
    {
        if (row == null)
        {
            return "<div class=\"m2-card empty\"><div class=\"m2-avatar\">+</div><div class=\"m2-id\">Vacant</div><div class=\"m2-name\">Open slot</div></div>";
        }
        string userId = Convert.ToString(row["userid"]);
        string userName = Convert.ToString(row["UserName"]);
        string href = TreePage + "?SuperId=" + HttpUtility.UrlEncode(userId);
        return "<a class=\"m2-card" + (isRoot ? " root" : "") + "\" href=\"" + href + "\">"
            + "<div class=\"m2-avatar\">" + HttpUtility.HtmlEncode(Initials(userName, userId)) + "</div>"
            + "<div class=\"m2-id\">" + HttpUtility.HtmlEncode(userId) + "</div>"
            + "<div class=\"m2-name\">" + HttpUtility.HtmlEncode(userName) + "</div>"
            + "</a>";
    }

    string BuildBranch(DataRow left, DataRow right)
    {
        bool hasL = left != null, hasR = right != null;
        if (!hasL && !hasR) return "";
        string cls = "m2-branch has-kids";
        if (hasL && !hasR) cls += " half-left";
        if (!hasL && hasR) cls += " half-right";
        return "<div class=\"" + cls + "\"></div>";
    }

    void LoadMatrix(string userId)
    {
        DataTable dt = GetDownline(userId);
        DataRow root = FindRoot(dt, userId);
        if (root == null)
        {
            ltTree.Text = "";
            lblMsg.Text = "No 2X2 matrix record found for this User Id.";
            return;
        }

        DataRow[] slots = BuildSlots(dt, root);
        StringBuilder sb = new StringBuilder();
        int index = 0;

        for (int level = 0; level <= MaxLevel; level++)
        {
            int count = 1 << level; // 1,2,4,8,16
            sb.Append("<div class=\"m2-level l").Append(level).Append("\">");
            sb.Append("<div class=\"m2-level-label\">L").Append(level).Append("</div>");

            for (int i = 0; i < count; i++, index++)
            {
                sb.Append("<div class=\"m2-slot\">");
                if (level > 0) sb.Append("<div class=\"m2-down\"></div>");
                sb.Append(BuildCard(slots[index], level == 0));
                if (level < MaxLevel)
                {
                    int leftIdx = 2 * index + 1;
                    int rightIdx = 2 * index + 2;
                    sb.Append(BuildBranch(
                        leftIdx < slots.Length ? slots[leftIdx] : null,
                        rightIdx < slots.Length ? slots[rightIdx] : null));
                }
                sb.Append("</div>");
            }
            sb.Append("</div>");
        }

        ltTree.Text = sb.ToString();
    }
}
