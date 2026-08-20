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
    const int MaxLevel = 15;

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

    DataTable RunProc(string procName, string userId)
    {
        DataTable dt = new DataTable();
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTableProcedure(procName, new[] {
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

    long ToLong(object value)
    {
        long n;
        return long.TryParse(Convert.ToString(value), out n) ? n : 0;
    }

    object Col(DataRow row, params string[] names)
    {
        if (row == null || row.Table == null) return null;
        foreach (string name in names)
        {
            if (row.Table.Columns.Contains(name))
                return row[name];
        }
        return null;
    }

    void LoadReport(string userId)
    {
        divMembers.Visible = false;
        ViewState["SelectedLevel"] = null;
        gvMembers.PageIndex = 0;
        gvMembers.DataSource = null;
        gvMembers.DataBind();
        lblSelectedLevel.Text = "";

        DataTable dtSummary = RunProc("sp_getHelpingBinarySummary", userId);
        DataTable dtTree = RunProc("sp_getHelpingBinary", userId);
        ViewState["BinaryData"] = dtTree;

        if (dtSummary.Rows.Count == 0 ||
            (!dtSummary.Columns.Contains("LevelNo") && !dtSummary.Columns.Contains("levelno")))
        {
            gvLevels.DataSource = null;
            gvLevels.DataBind();
            ApplySummary(0, 0, 0, MaxLevel);
            Message.Show("No level summary found for this User Id.");
            return;
        }

        var levels = dtSummary.AsEnumerable()
            .Select(r =>
            {
                int level = ToInt(Col(r, "LevelNo", "levelno"));
                int completed = ToInt(Col(r, "Team", "team"));
                long required = ToLong(Col(r, "Target", "target"));
                if (required < 0) required = 0;

                int percent = required > 0 ? (int)Math.Round(completed * 100.0 / required) : 0;
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
            .Where(x => x.LevelNo >= 1 && x.LevelNo <= MaxLevel)
            .OrderBy(x => x.LevelNo)
            .ToList();

        if (levels.Count == 0)
        {
            gvLevels.DataSource = null;
            gvLevels.DataBind();
            ApplySummary(0, 0, 0, MaxLevel);
            Message.Show("No level summary found for this User Id.");
            return;
        }

        ApplySummary(
            levels.Sum(x => x.MemberCount),
            levels.Sum(x => x.Required),
            levels.Count(x => x.Required > 0 && x.MemberCount >= x.Required),
            levels.Count);

        gvLevels.DataSource = levels;
        gvLevels.DataBind();
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
        if (ViewState["SelectedLevel"] == null)
        {
            divMembers.Visible = false;
            return;
        }

        int levelNo = ToInt(ViewState["SelectedLevel"]);
        DataTable dt = ViewState["BinaryData"] as DataTable;
        if (dt == null || dt.Rows.Count == 0)
        {
            string userId = (txtuserid.Text ?? "").Trim();
            dt = RunProc("sp_getHelpingBinary", userId);
            ViewState["BinaryData"] = dt;
        }

        DataTable members = dt.Clone();
        if (dt.Columns.Contains("userlevel"))
        {
            foreach (DataRow row in dt.Rows)
            {
                if (ToInt(row["userlevel"]) == levelNo)
                    members.ImportRow(row);
            }
        }

        if (!members.Columns.Contains("userid") && members.Columns.Contains("UserId"))
            members.Columns["UserId"].ColumnName = "userid";

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
