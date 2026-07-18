using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class AwardReport : System.Web.UI.Page
{
    clsUser objuser = new clsUser();
    clsaward objAward = new clsaward();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            loadaward();
        }
    }

    //void loadaward()
    //{
    //    DataTable dt = new DataTable();
    //    dt = objAward.getawardDetailfromdashboard();
    //    GridView1.DataSource = dt;
    //    GridView1.DataBind();
    //}


    void loadaward()
    {

        string UserId = Session["userid"].ToString();
        DataTable dt = new DataTable();
        dt = objuser.getawardindashboar(UserId);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            
            Label lbllevelno = e.Row.FindControl("lbllevelno") as Label;
            Label lbltotalmember = e.Row.FindControl("lbltotalmember") as Label;
            Label lbltotalactive = e.Row.FindControl("lbltotalactive") as Label;

            Label lbltotalrequired = e.Row.FindControl("lbltotalrequired") as Label;
         
            string UserId = Session["userid"].ToString();
            DataTable Dt = objuser.getawardindashboar(UserId);
            if (Dt.Rows.Count > 0)
            {
                lbllevelno.Text = Dt.Rows[0]["LevelNo"].ToString();
                lbltotalmember.Text = Dt.Rows[0]["TotalMember"].ToString();
              
                lbltotalactive.Text = Dt.Rows[0]["ActiveMember"].ToString();
                lbltotalrequired.Text = Dt.Rows[0]["blank"].ToString();
             
            }
        }
    }
}