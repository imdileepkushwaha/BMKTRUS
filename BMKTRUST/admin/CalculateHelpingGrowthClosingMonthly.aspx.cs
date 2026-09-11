using DataTier;
using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class admin_CalculateHelpingGrowthClosingMonthly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            TxtFromdate.Attributes.Add("readonly", "readonly");
            TxtTodate.Attributes.Add("readonly", "readonly");
            DateTime first = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            TxtFromdate.Text = first.ToString("dd/MMM/yyyy");
            TxtTodate.Text = first.AddMonths(1).AddDays(-1).ToString("dd/MMM/yyyy");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(TxtFromdate.Text) || string.IsNullOrWhiteSpace(TxtTodate.Text))
        {
            Alert("From Date / To Date blank nahi ho sakte.");
            return;
        }

        DateTime fromDate, toDate;
        if (!DateTime.TryParse(TxtFromdate.Text, out fromDate) || !DateTime.TryParse(TxtTodate.Text, out toDate))
        {
            Alert("Invalid date format.");
            return;
        }

        if (fromDate > toDate)
        {
            Alert("From Date To Date se badi nahi ho sakti.");
            return;
        }

        bool ok = RunClosing("sp_GenerateHelpingLevelIncomePool2Single", fromDate, toDate);
        Alert(ok
            ? "Growth Monthly Closing completed for " + fromDate.ToString("dd/MMM/yyyy") + " to " + toDate.ToString("dd/MMM/yyyy") + "."
            : "Growth Monthly Closing failed. Please try again.");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    void Alert(string message)
    {
        string popupScript = "alert('" + message.Replace("'", "\\'") + "');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
    }

    bool RunClosing(string procName, DateTime fromDate, DateTime toDate)
    {
        Data ObjData = new Data();
        ObjData.StartConnection();
        try
        {
            ObjData.RunDataTableProcedure(procName, new[] {
                new SqlParameter("@FromDate", fromDate),
                new SqlParameter("@ToDate", toDate)
            });
            return true;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            ObjData.EndConnection();
        }
    }
}
