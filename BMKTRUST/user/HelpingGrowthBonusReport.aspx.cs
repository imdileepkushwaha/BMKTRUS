using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_HelpingGrowthBonusReport : System.Web.UI.Page
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
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
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

        DataTable dt = objaccount.getHelpingGrowthBonus(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    // Display only: DB LevelNo 3→1, 5→2, 7→3, 9→4, 11→5, 13→6, 15→7
    protected string FormatDisplayLevel(object levelNo)
    {
        int n;
        if (!int.TryParse(Convert.ToString(levelNo), out n) || n < 3)
            return Convert.ToString(levelNo);
        return ((n - 1) / 2).ToString();
    }
}
