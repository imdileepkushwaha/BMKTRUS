using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.UI;
using BusinessLogicTier;

public partial class user_HelpingBinaryMatrix : System.Web.UI.Page
{
    clsUser objUser = new clsUser();
    const int MaxLevel = 3;

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
            LoadMatrix(txtuserid.Text.Trim());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtuserid.Text))
        {
            litMatrix.Text = "<div class='hbm-empty-msg'>Enter User Id.</div>";
            return;
        }
        LoadMatrix(txtuserid.Text.Trim());
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtuserid.Text = Session["userid"].ToString();
        LoadMatrix(txtuserid.Text.Trim());
    }

    void LoadMatrix(string userId)
    {
        objUser.UserId = userId;
        DataTable dt = objUser.getHelpingBinary(objUser);

        if (dt == null || dt.Rows.Count == 0)
        {
            litMatrix.Text = "<div class='hbm-empty-msg'>No helping binary data found for this User Id.</div>";
            return;
        }

        // Index nodes by id; children by ParentId
        var byId = new Dictionary<int, DataRow>();
        var children = new Dictionary<int, List<DataRow>>();

        foreach (DataRow row in dt.Rows)
        {
            int id = ToInt(row["id"]);
            int parentId = ToInt(row["ParentId"]);
            byId[id] = row;

            if (!children.ContainsKey(parentId))
                children[parentId] = new List<DataRow>();
            // Skip self-as-parent noise for root (parent 0)
            if (id != parentId)
                children[parentId].Add(row);
        }

        DataRow root = dt.AsEnumerable()
            .Where(r => ToInt(r["userlevel"]) == 0)
            .OrderBy(r => ToInt(r["id"]))
            .FirstOrDefault();

        if (root == null)
            root = dt.Rows[0];

        int rootId = ToInt(root["id"]);

        // Build ordered slots per level (binary positions L/R left-to-right)
        // Level 0: 1 slot, Level 1: 2, Level 2: 4, Level 3: 8
        var levelSlots = new List<DataRow>[MaxLevel + 1];
        for (int L = 0; L <= MaxLevel; L++)
            levelSlots[L] = new List<DataRow>();

        levelSlots[0].Add(root);

        for (int L = 0; L < MaxLevel; L++)
        {
            foreach (DataRow parent in levelSlots[L])
            {
                DataRow left = null;
                DataRow right = null;

                if (parent != null)
                {
                    int pid = ToInt(parent["id"]);
                    List<DataRow> kids;
                    if (children.TryGetValue(pid, out kids) && kids != null && kids.Count > 0)
                    {
                        // Prefer StandingPosition: 1=Left, 2=Right; fallback order by id
                        var ordered = kids
                            .OrderBy(k =>
                            {
                                int sp = ToInt(Safe(k, "StandingPosition"));
                                if (sp == 1) return 0;
                                if (sp == 2) return 1;
                                return 2;
                            })
                            .ThenBy(k => ToInt(k["id"]))
                            .ToList();

                        foreach (DataRow kid in ordered)
                        {
                            int sp = ToInt(Safe(kid, "StandingPosition"));
                            if (sp == 1 && left == null) left = kid;
                            else if (sp == 2 && right == null) right = kid;
                        }

                        // Fill remaining by order if SP missing/duplicate
                        foreach (DataRow kid in ordered)
                        {
                            if (kid == left || kid == right) continue;
                            if (left == null) left = kid;
                            else if (right == null) right = kid;
                        }
                    }
                }

                levelSlots[L + 1].Add(left);
                levelSlots[L + 1].Add(right);
            }
        }

        var sb = new StringBuilder();
        sb.Append("<div class='hbm-tree'>");

        for (int L = 0; L <= MaxLevel; L++)
        {
            int cols = 1 << L; // 1,2,4,8
            sb.AppendFormat("<div class='hbm-level-label'>Level {0}</div>", L);
            sb.AppendFormat("<div class='hbm-matrix cols-{0}'>", cols);

            for (int i = 0; i < levelSlots[L].Count; i++)
            {
                sb.Append(RenderCard(levelSlots[L][i], L, i, cols));
            }

            sb.Append("</div>");
        }

        sb.Append("</div>");
        litMatrix.Text = sb.ToString();
    }

    static string RenderCard(DataRow row, int level, int index, int cols)
    {
        if (row == null)
        {
            string vacantPos = level == 0 ? "Root" : ((index % 2 == 0) ? "Left" : "Right");
            return string.Format(
                "<div class='hbm-card empty'><div class='pos'>{0}</div><div class='uid'>—</div><div class='uname'>Vacant</div><span class='lvl'>L{1}</span></div>",
                vacantPos, level);
        }

        int sp = ToInt(Safe(row, "StandingPosition"));
        string posLabel;
        string posClass;

        if (level == 0 || sp == 0)
        {
            posLabel = "Root";
            posClass = "root";
        }
        else if (sp == 1)
        {
            posLabel = "Left";
            posClass = "left-pos";
        }
        else if (sp == 2)
        {
            posLabel = "Right";
            posClass = "right-pos";
        }
        else
        {
            posLabel = (index % 2 == 0) ? "Left" : "Right";
            posClass = (index % 2 == 0) ? "left-pos" : "right-pos";
        }

        string uid = Html(Safe(row, "userid"));
        string uname = Html(Safe(row, "UserName"));
        if (string.IsNullOrWhiteSpace(uname))
            uname = Html(Safe(row, "username"));

        return string.Format(
            "<div class='hbm-card {0}'><div class='pos'>{1}</div><div class='uid'>{2}</div><div class='uname'>{3}</div><span class='lvl'>L{4}</span></div>",
            posClass, posLabel, uid, string.IsNullOrWhiteSpace(uname) ? "&nbsp;" : uname, level);
    }

    static string Safe(DataRow row, string col)
    {
        if (row == null || row.Table == null || !row.Table.Columns.Contains(col) || row[col] == DBNull.Value)
            return "";
        return Convert.ToString(row[col]).Trim();
    }

    static int ToInt(object value)
    {
        if (value == null || value == DBNull.Value) return 0;
        int n;
        return int.TryParse(Convert.ToString(value), out n) ? n : 0;
    }

    static string Html(string value)
    {
        return System.Web.HttpUtility.HtmlEncode(value ?? "");
    }
}
