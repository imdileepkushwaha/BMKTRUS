using BusinessLogicTier;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_HelpingLevelIncomeReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    decimal incomeTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] == null)
                Response.Redirect("logout.aspx");
            else
            {
                BindLevelFilter();
                loaduser();
            }
        }
    }

    void BindLevelFilter()
    {
        ddlLevel.Items.Clear();
        ddlLevel.Items.Add(new ListItem("All Levels", ""));
        for (int i = 1; i <= 15; i++)
            ddlLevel.Items.Add(new ListItem("Level " + i, i.ToString()));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }

    void loaduser()
    {
        if (txtfromdate.Text != "")
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        else
            objaccount.FromDate = DateTime.MinValue;

        if (txttodate.Text != "")
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        else
            objaccount.ToDate = DateTime.MinValue;

        objaccount.UserId = (txtuserid.Text ?? "").Trim();
        objaccount.LevelNo = ddlLevel.SelectedValue;
        DataTable dt = objaccount.getHelpingLevelIncome(objaccount);
        dt = FilterByLevel(dt, ddlLevel.SelectedValue);
        incomeTotal = SumIncome(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    static DataTable FilterByLevel(DataTable dt, string levelValue)
    {
        int filterLevel;
        if (dt == null || !dt.Columns.Contains("LevelNo") ||
            !int.TryParse(levelValue, out filterLevel))
            return dt;

        DataView dv = dt.DefaultView;
        dv.RowFilter = "LevelNo = " + filterLevel;
        return dv.ToTable();
    }

    static decimal SumIncome(DataTable dt)
    {
        if (dt == null || dt.Rows.Count == 0 || !dt.Columns.Contains("Income"))
            return 0;
        decimal total = 0;
        foreach (DataRow row in dt.Rows)
        {
            if (row["Income"] != DBNull.Value)
                total += Convert.ToDecimal(row["Income"]);
        }
        return total;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string totalText = incomeTotal.ToString("0.00");
        if (e.Row.RowType == DataControlRowType.Header)
        {
            Label lbl = e.Row.FindControl("lblHeaderIncomeSum") as Label;
            if (lbl != null)
                lbl.Text = totalText;
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lbl = e.Row.FindControl("lblFooterIncomeSum") as Label;
            if (lbl != null)
                lbl.Text = totalText;
            e.Row.Font.Bold = true;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void ExportToExcel(object sender, EventArgs e)
    {
        loaduser();
        if (GridView1.Rows.Count == 0) return;

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=LevelBonusReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    else
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    cell.CssClass = "textmode";
                }
            }
            GridView1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}
