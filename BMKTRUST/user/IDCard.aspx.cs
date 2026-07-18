using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data;
using  System.Globalization;


public partial class user_idcard : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objuser = new clsUser();
    clsBank objbank = new clsBank();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {

               // loadcountry();
               // loadbank();
                laoddata();


            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }


    }

  // protected void loadstate()
  //  {
  //      ddstate.Items.Clear();
  //      DataTable dt = new DataTable();
  //      objState.CountryId = ddcountry.SelectedValue.ToString();
  //      dt = objState.getState(objState);

  //      ddstate.DataSource = dt;
  //      ddstate.DataTextField = "StateName";
  //      ddstate.DataValueField = "StateID";
  //      ddstate.DataBind();
  //      ListItem li = new ListItem("Select State", "0");
  //      ddstate.Items.Insert(0, li);
  //  }
  //protected  void loadcity()
  //  {
  //      ddcity.Items.Clear();
  //      DataTable dt = new DataTable();
  //      objState.StateId = ddstate.SelectedValue.ToString();
  //      dt = objState.getCity(objState);

  //      ddcity.DataSource = dt;
  //      ddcity.DataTextField = "CityName";
  //      ddcity.DataValueField = "CityID";
  //      ddcity.DataBind();
  //      ListItem li = new ListItem("Select City", "0");
  //      ddcity.Items.Insert(0, li);
  //  }

  protected  void laoddata()
    {
        objuser.UserId = Session["userid"].ToString();
        DataTable dt = new DataTable();
        dt = objuser.getUserDetail(objuser);

      Session["dt"]=dt;

        if (dt.Rows.Count > 0)
        {
            lbluserid.Text = dt.Rows[0]["userid"].ToString();
            lblusername.Text = dt.Rows[0]["username"].ToString();
         //   lblDob.Text = dt.Rows[0]["DateofBirth"].ToString();

            //lblState.Text = dt.Rows[0]["statename"].ToString();

           // lblcity.Text = dt.Rows[0]["citynew"].ToString();
          //  LblSponserId.Text = dt.Rows[0]["sponserId"].ToString();
           // LblParentId.Text = dt.Rows[0]["parentuserid"].ToString();
            ImgMyPhoto.ImageUrl = "../ProductImage/" + dt.Rows[0]["PhotoImage"].ToString();
          //  lbljoiningdate.Text = dt.Rows[0]["parentuserid"].ToString();
          //  LblParentName.Text = dt.Rows[0]["parentname"].ToString();
          //  LblSponserName.Text = dt.Rows[0]["sponsername"].ToString();
           lbljoiningdate.Text = dt.Rows[0]["regdate"].ToString();
         //   lbladdress.Text = dt.Rows[0]["address"].ToString();
            //ddcountry.SelectedValue = dt.Rows[0]["countryid"].ToString();
            //loadstate();
          //  ddstate.Text = dt.Rows[0]["StateName"].ToString();
            //loadcity();
            //ddcity.Text = dt.Rows[0]["CityName"].ToString();
            lblmobile.Text = dt.Rows[0]["mobile"].ToString();
            lblemail.Text = dt.Rows[0]["email"].ToString();
         
            // Lblactivatedate.Text = dt.Rows[0]["activationdate"].ToString();
         

        }

    }


  protected void btnprint_Click(object sender, EventArgs e)
  {
      try
      {

          DataTable dt = (DataTable)Session["dt"];

          if (dt.Rows.Count > 0)
          {
              Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "window.open('printidcard.aspx?print=1&rptName=" + buildReportHeader() + "', '', 'location=0,status=0,scrollbars=1,menubar=1,resizable=1');", true);
          }
          else
          {
              ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('No Record Found');</script>");
          }
      }
      catch { }
  }

  private string buildReportHeader()
  {
      string rptheader = "";
      string header = Page.Header.Title;
      if (header.Length > 0)
      {
          string[] parts = header.Split('-');
          if (parts.Length > 0)
          {
              rptheader = parts[0];
          }
          else
          {
              rptheader = "Report";
          }
      }
      else
      {
          rptheader = "Report";
      }
      return rptheader;
  }

}