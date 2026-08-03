using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using DataTier;

public partial class user_HelpingBinaryMatrix2X2 : System.Web.UI.Page
{
    Data ObjData = new Data();
    const int MaxLevel = 4; // Level 0..4 => 1+2+4+8+16 = 31 slots

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            string drillId = Request.QueryString["SuperId"];
            if (!string.IsNullOrWhiteSpace(drillId))
                txtuserid.Text = drillId.Trim();
            else
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

    DataTable GetPool2(string userId)
    {
        DataTable dt = new DataTable();
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTableProcedure("sp_getHelpingBinaryPool2", new[] {
                new SqlParameter("@userid", userId)
            });
        }
        catch
        {
            dt = new DataTable();
        }
        finally
        {
            ObjData.EndConnection();
        }
        return dt ?? new DataTable();
    }

    void LoadMatrix(string userId)
    {
        DataTable dt = GetPool2(userId);

        if (dt.Rows.Count == 0)
        {
            litMatrix.Text = "<div class='hbm-empty-msg'>No 2X2 matrix data found for this User Id.</div>";
            return;
        }

        var byId = new Dictionary<int, DataRow>();
        var children = new Dictionary<int, List<DataRow>>();

        foreach (DataRow row in dt.Rows)
        {
            int id = ToInt(row["id"]);
            int parentId = ToInt(row["ParentId"]);
            byId[id] = row;

            if (!children.ContainsKey(parentId))
                children[parentId] = new List<DataRow>();
            if (id != parentId)
                children[parentId].Add(row);
        }

        DataRow root = dt.AsEnumerable()
            .Where(r => ToInt(r["userlevel"]) == 0)
            .OrderBy(r => ToInt(r["id"]))
            .FirstOrDefault();

        if (root == null)
        {
            root = dt.AsEnumerable()
                .FirstOrDefault(r => string.Equals(Convert.ToString(r["userid"]), userId, StringComparison.OrdinalIgnoreCase));
        }
        if (root == null)
            root = dt.Rows[0];

        int rootId = ToInt(root["id"]);

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
                        bool hasSp = parent.Table.Columns.Contains("StandingPosition");
                        List<DataRow> ordered;

                        if (hasSp)
                        {
                            ordered = kids
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
                        }
                        else
                        {
                            // Match HelpingBinaryTree2X2: first by id = left, second = right
                            ordered = kids.OrderBy(k => ToInt(k["id"])).ToList();
                        }

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
        sb.Append("<div class='hbm-tree'><div class='hbm-tree-inner'>");

        for (int L = 0; L <= MaxLevel; L++)
        {
            int cols = 1 << L;
            sb.AppendFormat("<div class='hbm-level-label'>Level {0}</div>", L);
            sb.AppendFormat("<div class='hbm-matrix cols-{0}'>", cols);

            for (int i = 0; i < levelSlots[L].Count; i++)
                sb.Append(RenderCard(levelSlots[L][i], L, i));

            sb.Append("</div>");
        }

        sb.Append("</div></div>");
        litMatrix.Text = sb.ToString();
    }

    string RenderCard(DataRow row, int level, int index)
    {
        if (row == null)
        {
            string vacantPos = level == 0 ? "Root" : ((index % 2 == 0) ? "Left" : "Right");
            return string.Format(
                "<div class='hbm-card empty' title='L{1} {0} — Vacant'><div class='pos'>{0}</div><div class='uid'>—</div><div class='uname'>Vacant</div><span class='lvl'>L{1}</span></div>",
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

        string tooltip = string.Format("L{0} {1} — {2} {3}", level, posLabel, uid, uname).Trim();
        string href = "HelpingBinaryMatrix2X2.aspx?SuperId=" + HttpUtility.UrlEncode(Safe(row, "userid"));

        return string.Format(
            "<a class='hbm-card {0}' href='{1}' title='{2}'><div class='pos'>{3}</div><div class='uid'>{4}</div><div class='uname'>{5}</div><span class='lvl'>L{6}</span></a>",
            posClass, href, tooltip, posLabel, uid, string.IsNullOrWhiteSpace(uname) ? "&nbsp;" : uname, level);
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
        return HttpUtility.HtmlEncode(value ?? "");
    }
}
