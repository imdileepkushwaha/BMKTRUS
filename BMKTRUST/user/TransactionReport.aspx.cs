using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                loaduser();
                balance();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void balance()
    {
        objaccount.UserId = Session["userId"].ToString();
        objaccount.userType = "1";
        DataTable dt = new DataTable();
        dt = objaccount.getUserWalletBalanceReportrechargewallet(objaccount);
        if (dt.Rows.Count > 0)
        {
            LblCredited.Text = dt.Rows[0]["sumCr"].ToString();
            LblDebited.Text = dt.Rows[0]["sumdr"].ToString();
            LblCurrentWallet.Text = dt.Rows[0]["bal"].ToString();
        }

       
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        loaduser();
    }
    void loaduser()
    {
        if (txtfromdate.Text != "")
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.ToDate = DateTime.MinValue;
        }

        int pageSize;
        if (!int.TryParse(ddlRecordFilter.SelectedValue, out pageSize) || pageSize <= 0)
            pageSize = 25;
        GridView1.PageSize = pageSize;

        objaccount.NoOfRow = "";
        objaccount.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objaccount.getTransactionReport(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loaduser();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the run time error "  
        //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
    }

    protected void ExportGridToExcel()
    {
        GridView1.AllowPaging = false;
        loaduser();

        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "TransactionReport_" + DateTime.Now + ".xls";
        System.IO.StringWriter strwritter = new System.IO.StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.HeaderStyle.BackColor = System.Drawing.Color.AliceBlue;
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();
    }

    protected void imgExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }
    protected void ddlRecordFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0;
        loaduser();
    }
}