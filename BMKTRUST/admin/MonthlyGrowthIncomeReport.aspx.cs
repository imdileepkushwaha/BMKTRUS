using BusinessLogicTier;
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MonthlyGrowthIncomeReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] == null)
                Response.Redirect("logout.aspx");
            else
                loaduser();
        }
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
        DataTable dt = objaccount.getMonthlyGrowthIncome(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
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
        Response.AddHeader("content-disposition", "attachment;filename=MonthlyGrowthIncomeReport.xls");
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
