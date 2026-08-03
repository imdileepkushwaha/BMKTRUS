using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTier;

public partial class user_HelpingBinaryPool2SummaryReport : System.Web.UI.Page
{
    Data ObjData = new Data();

    // Show only income levels up to DB LevelNo 13 → max 7 rows (Sr 1..7)
    const int MaxDbLevelNo = 13;
    const int MaxSrRows = 7;

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

    DataTable RunPool2Proc(string procName, string userId)
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

    void LoadReport(string userId)
    {
        divMembers.Visible = false;
        ViewState["SelectedLevel"] = null;
        ViewState["SelectedSr"] = null;
        ViewState["ReportUserId"] = userId;
        gvMembers.PageIndex = 0;
        gvMembers.DataSource = null;
        gvMembers.DataBind();
        lblSelectedLevel.Text = "";

        DataTable dtSummary = RunPool2Proc("sp_getHelpingBinaryPool2Summary", userId);

        if (dtSummary.Rows.Count == 0 || !dtSummary.Columns.Contains("LevelNo"))
        {
            gvLevels.DataSource = null;
            gvLevels.DataBind();
            ApplySummary(0, 0, 0, 0);
            Message.Show("No 2X2 level summary found for this User Id.");
            return;
        }

        var levels = dtSummary.AsEnumerable()
            .Where(r => ToInt(r["LevelNo"]) > 0 && ToInt(r["LevelNo"]) <= MaxDbLevelNo)
            .OrderBy(r => ToInt(r["LevelNo"]))
            .Take(MaxSrRows)
            .Select((r, index) =>
            {
                int dbLevelNo = ToInt(r["LevelNo"]);
                int srNo = index + 1; // display Level as 1..7
                int completed = ToInt(r["Team"]);
                long required = ToLong(r["Target"]);
                if (required <= 0) required = 1;

                int percent = (int)Math.Round(completed * 100.0 / required);
                if (percent > 100) percent = 100;
                if (percent < 0) percent = 0;

                return new
                {
                    SrNo = srNo,
                    LevelNo = srNo,          // shown in Level column
                    DbLevelNo = dbLevelNo,   // used for View Members filter
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
            MaxSrRows);

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

        litNoteTeam.Text = total.ToString("N0");
        litNoteLevels.Text = levelCount.ToString();
        litNoteRequired.Text = required.ToString("N0");
        litNotePercent.Text = percent + "%";
        litNoteDone.Text = completedLevels.ToString();
    }

    void ShowLevelMembers(int dbLevelNo, int srNo)
    {
        ViewState["SelectedLevel"] = dbLevelNo;
        ViewState["SelectedSr"] = srNo;
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

        string userId = Convert.ToString(ViewState["ReportUserId"]);
        if (string.IsNullOrWhiteSpace(userId))
            userId = (txtuserid.Text ?? "").Trim();

        int levelNo = ToInt(ViewState["SelectedLevel"]);
        DataTable dt = RunPool2Proc("sp_getHelpingBinaryPool2", userId);

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

        // Map DB level (1,3,5...) back to display Sr (1..7) for the label
        int displaySr = 0;
        if (ViewState["SelectedSr"] != null)
            displaySr = ToInt(ViewState["SelectedSr"]);

        divMembers.Visible = true;
        lblSelectedLevel.Text = "Level " + (displaySr > 0 ? displaySr : levelNo) + " · " + members.Rows.Count + " members";
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
        // CommandArgument = "DbLevelNo|SrNo"
        string arg = Convert.ToString(e.CommandArgument) ?? "";
        string[] parts = arg.Split('|');
        int dbLevelNo, srNo;
        if (parts.Length < 2 || !int.TryParse(parts[0], out dbLevelNo) || !int.TryParse(parts[1], out srNo))
            return;
        ShowLevelMembers(dbLevelNo, srNo);
    }

    protected void gvMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvMembers.PageIndex = e.NewPageIndex;
        BindLevelMembers();
    }
}
