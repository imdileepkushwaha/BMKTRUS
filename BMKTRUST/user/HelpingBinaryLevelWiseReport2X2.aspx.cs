using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTier;

public partial class user_HelpingBinaryLevelWiseReport2X2 : System.Web.UI.Page
{
    Data ObjData = new Data();

    // Matrix is binary (2 children per node), so level capacity = 2^level.
    // Depth mirrors HelpingBinaryTree2X2 so both pages report the same pool size.
    const int MatrixDepth = 4;

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
            LoadReport(txtuserid.Text.Trim());
        }
    }

    DataTable GetHelpingBinaryPool2(string userId)
    {
        DataTable dt = new DataTable();
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTableProcedure("sp_getHelpingBinaryPool2", new[] {
                new SqlParameter("@userid", userId)
            });
        }
        catch (Exception)
        {
            dt = new DataTable();
        }
        finally
        {
            ObjData.EndConnection();
        }
        return dt ?? new DataTable();
    }

    int ToInt(object value)
    {
        int n;
        return int.TryParse(Convert.ToString(value), out n) ? n : 0;
    }

    void LoadReport(string userId)
    {
        divMembers.Visible = false;
        ViewState["SelectedLevel"] = null;
        gvMembers.PageIndex = 0;
        gvMembers.DataSource = null;
        gvMembers.DataBind();
        lblSelectedLevel.Text = "";

        DataTable dt = GetHelpingBinaryPool2(userId);
        ViewState["Pool2Data"] = dt;

        if (dt.Rows.Count == 0 || !dt.Columns.Contains("userlevel"))
        {
            gvLevels.DataSource = null;
            gvLevels.DataBind();
            ApplySummary(0, CapacityUpTo(MatrixDepth), 0, MatrixDepth);
            Message.Show("No 2X2 downline found for this User Id.");
            return;
        }

        // Only Level 1..MatrixDepth (4) — ignore deeper downline for this report
        var counts = dt.AsEnumerable()
            .Select(r => ToInt(r["userlevel"]))
            .Where(lvl => lvl >= 1 && lvl <= MatrixDepth)
            .GroupBy(lvl => lvl)
            .ToDictionary(g => g.Key, g => g.Count());

        var levels = Enumerable.Range(1, MatrixDepth)
            .Select(level =>
            {
                int completed = counts.ContainsKey(level) ? counts[level] : 0;
                long required = 1L << level; // L1=2, L2=4, L3=8, L4=16
                int percent = (int)Math.Round(completed * 100.0 / required);
                if (percent > 100) percent = 100;
                if (percent < 0) percent = 0;

                return new
                {
                    LevelNo = level,
                    MemberCount = completed,
                    Required = required,
                    Percent = percent,
                    BarClass = percent >= 100 ? "full" : (completed > 0 ? "part" : "none")
                };
            })
            .ToList();

        ApplySummary(
            levels.Sum(x => x.MemberCount),
            levels.Sum(x => x.Required),
            levels.Count(x => x.MemberCount >= x.Required),
            MatrixDepth);

        gvLevels.DataSource = levels;
        gvLevels.DataBind();
    }

    static long CapacityUpTo(int depth)
    {
        long capacity = 0;
        for (int level = 1; level <= depth; level++)
            capacity += 1L << level;
        return capacity;
    }

    void ApplySummary(int total, long required, int completedLevels, int levelCount)
    {
        int percent = required > 0 ? (int)Math.Round(total * 100.0 / required) : 0;
        if (percent > 100) percent = 100;
        if (percent < 0) percent = 0;

        lblTotal.Text = total.ToString("N0");
        litRequired.Text = required.ToString("N0");
        litPercent.Text = percent + "%";
        litLevels.Text = completedLevels + "/" + levelCount;
    }

    void ShowLevelMembers(int levelNo)
    {
        ViewState["SelectedLevel"] = levelNo;
        gvMembers.PageIndex = 0;
        BindLevelMembers();
    }

    void BindLevelMembers()
    {
        DataTable dt = ViewState["Pool2Data"] as DataTable;
        if (dt == null || dt.Rows.Count == 0 || ViewState["SelectedLevel"] == null)
        {
            divMembers.Visible = false;
            return;
        }

        int levelNo = ToInt(ViewState["SelectedLevel"]);

        DataTable members = dt.Clone();
        foreach (DataRow row in dt.Rows)
        {
            if (ToInt(row["userlevel"]) == levelNo)
                members.ImportRow(row);
        }

        // Keep only userid + UserName columns for clean bind if extras exist
        if (!members.Columns.Contains("userid") && members.Columns.Contains("UserId"))
            members.Columns["UserId"].ColumnName = "userid";

        // Deleting the last page's rows would otherwise leave the grid on an out-of-range page
        int lastPage = members.Rows.Count == 0 ? 0 : (members.Rows.Count - 1) / gvMembers.PageSize;
        if (gvMembers.PageIndex > lastPage)
            gvMembers.PageIndex = lastPage;

        divMembers.Visible = true;
        lblSelectedLevel.Text = "Level " + levelNo + " · " + members.Rows.Count + " members";
        gvMembers.DataSource = members;
        gvMembers.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtuserid.Text))
        {
            Message.Show("Enter User Id...!!!!");
            return;
        }
        LoadReport(txtuserid.Text.Trim());
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void gvLevels_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "ViewLevel") return;
        int levelNo;
        if (!int.TryParse(Convert.ToString(e.CommandArgument), out levelNo)) return;
        ShowLevelMembers(levelNo);
    }

    protected void gvMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMembers.PageIndex = e.NewPageIndex;
        BindLevelMembers();
    }
}
