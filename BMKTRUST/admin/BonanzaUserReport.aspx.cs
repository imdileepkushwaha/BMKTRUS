using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;
using DataTier;

public partial class BonanzaUserReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsUser objclsUser = new clsUser();
    clsClosing objCl = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            FillAssociatesDetails();
        }
    }

    public void FillAssociatesDetails()
    {
        DataTable dt = new DataTable();
        //objCl.GenerateUserId = Session["userid"].ToString();
        string Userid=txtuserid.Text;
        string awardid = "";
        if (DDLSTBonanza.SelectedIndex != 0)
        {
            awardid = DDLSTBonanza.SelectedValue;
        }
        dt = getUserRewardReportadmin(Userid, awardid);
        grdBank.DataSource = dt;
        grdBank.DataBind();
    }
    public DataTable getUserRewardReportadmin(string Userid,string awardid)
    {

        string str_query = "SELECT A.UserId,U.UserName,P.Fromdate,P.Todate,P.Id,P.AwardName,P.LeftID TargetLeft,P.RightID TargetRight,A.LeftID,A.RightID,'0' AS RemainingLeft,'0' AS RemainingRight,A.achievedate,'Complete' Status FROM BonanzaAchiverUser A JOIN BonanzaAchiver P  ON A.AwardId=P.Id JOIN userdetail U on A.UserId=U.UserId where 1=1 ";

        if (Userid != string.Empty)
        {
            str_query += " and AU.UserId='" + Userid + "'";
        }
        if (Userid != string.Empty)
        {
            str_query += " and AU.awardid='" + awardid + "'";
        }
        DataTable ds = null;
        ObjData.StartConnection();
        try
        {
            ds = ObjData.RunDataTable(str_query);
        }
        catch (Exception ex)
        {
            ds = null;
        }
        ObjData.EndConnection();
        return ds;
    }
    protected void grdBank_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    DataRowView drv = e.Row.DataItem as DataRowView;
        //    if (e.Row.Cells[5].Text.ToUpper()=="YES")
        //    {
        //        e.Row.BackColor = System.Drawing.Color.LightGreen;
        //       // e.Row.ForeColor = System.Drawing.Color.White;
        //    }
        //    //else
        //    //{
        //    //    e.Row.BackColor = System.Drawing.Color.Green;
        //    //}
        //}
    }
}