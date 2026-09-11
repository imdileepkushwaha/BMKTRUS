using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_HelpingLevelIncomeReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    decimal incomeTotal = 0;
    decimal adminTotal = 0;
    decimal tdsTotal = 0;
    decimal payableTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                BindLevelFilter();
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                loaduser();
            }
            else
            {
                Response.Redirect("logout.aspx");
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
        if (Session["userid"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (txtfromdate.Text != "")
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        else
            objaccount.FromDate = DateTime.MinValue;

        if (txttodate.Text != "")
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        else
            objaccount.ToDate = DateTime.MinValue;

        objaccount.UserId = Session["userid"].ToString();
        txtuserid.Text = objaccount.UserId;
        objaccount.LevelNo = ddlLevel.SelectedValue;

        DataTable dt = objaccount.getHelpingLevelIncome(objaccount);
        dt = FilterByLevel(dt, ddlLevel.SelectedValue);
        incomeTotal = SumCol(dt, "Income");
        adminTotal = SumCol(dt, "admincharge");
        tdsTotal = SumCol(dt, "tdscharge");
        payableTotal = SumCol(dt, "paybleamount");
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

    static decimal SumCol(DataTable dt, string col)
    {
        if (dt == null || dt.Rows.Count == 0 || !dt.Columns.Contains(col))
            return 0;
        decimal total = 0;
        foreach (DataRow row in dt.Rows)
        {
            if (row[col] != DBNull.Value)
                total += Convert.ToDecimal(row[col]);
        }
        return total;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            SetLbl(e.Row, "lblHeaderIncomeSum", incomeTotal);
            SetLbl(e.Row, "lblHeaderAdminSum", adminTotal);
            SetLbl(e.Row, "lblHeaderTdsSum", tdsTotal);
            SetLbl(e.Row, "lblHeaderPayableSum", payableTotal);
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            SetLbl(e.Row, "lblFooterIncomeSum", incomeTotal);
            SetLbl(e.Row, "lblFooterAdminSum", adminTotal);
            SetLbl(e.Row, "lblFooterTdsSum", tdsTotal);
            SetLbl(e.Row, "lblFooterPayableSum", payableTotal);
            e.Row.Font.Bold = true;
        }
    }

    static void SetLbl(GridViewRow row, string id, decimal value)
    {
        Label lbl = row.FindControl(id) as Label;
        if (lbl != null)
            lbl.Text = value.ToString("0.00");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
