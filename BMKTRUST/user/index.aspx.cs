using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net.Mime;

public partial class admin_index : System.Web.UI.Page
{
    clsLogin objlogin = new clsLogin();
    clsUser objuser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }



    protected void btnLogin_Click(object sender, EventArgs e)
    {

        objlogin.username = txtusername.Text;
        objlogin.password = txtpassword.Text;
        ViewState["pwd"] = txtpassword.Text;
        objlogin.ipaddress = GetIp();        
        DataTable dt = new DataTable();
        dt = objlogin.Chk_UserLoginDetails(objlogin);
        if (dt.Rows.Count > 0)
        {
            clsVerfification vr = new clsVerfification();
            DataTable dtverify = vr.getStatus(txtusername.Text);

            DataTable dt2 = objlogin.Chk_userDetails(txtusername.Text);
            if (dt2 != null && dt2.Rows.Count > 0)
            {
                //if (dtverify != null && dtverify.Rows[0]["MobStatus"].ToString() == "True" && dtverify.Rows[0]["EmailStatus"].ToString() == "True")
                //{
                Session["userid"] = txtusername.Text;
                Session["username"] = dt.Rows[0]["username2"].ToString();
                Session["UserImage"] = BmkPhotoHelper.NormalizePhotoFileName(dt.Rows[0]["UserImage"].ToString());
                Session["status"] = dt.Rows[0]["status1"].ToString();
                Session["Mobile"] = dt.Rows[0]["status1"].ToString();
                if (dt.Rows[0]["status123"].ToString() == "1")
                {
                    ViewState["otp"] = dt.Rows[0]["otp"].ToString();
                    objlogin.Sendotp(dt.Rows[0]["otp"].ToString(), dt.Rows[0]["mobile"].ToString());
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal12();", true);
                }
                else
                {
                    Response.Redirect("Dashboard.aspx");
                }
                //}
                //else
                //{
                //    byte[] byt = System.Text.Encoding.UTF8.GetBytes(txtusername.Text);
                //    Response.Redirect("VerifyRegistration.aspx?UserId=" + Convert.ToBase64String(byt));
                //}
            }
            else
            {
                dt = objlogin.Chk_UserTempLoginDetails(objlogin);
                if (dt.Rows.Count > 0)
                {
                    byte[] byt = System.Text.Encoding.UTF8.GetBytes(txtusername.Text);
                    Response.Redirect("VerifyRegistration.aspx?UserId=" + Convert.ToBase64String(byt));
                }
                else
                {
                    Message.Show("Invalid Login Details...!!!");
                }
            }
        }
        else
        {
                Message.Show("Invalid Login Details...!!!");
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        objuser.UserId= txtuserid.Text;

        string res = objlogin.SendPassword(objuser);
        
        if (res == "0")
        {
            Message.Show("Error Occurred");
        }
        else
            if (res == "f")
            {
                Message.Show("Invalid User Id");
            }
            else
            {
                Message.Show("Password sent to your registered mobile no. & Email");
            }
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        //lblmessage.Text = "sgdsgsd";

        string popupScript2 = "Closepopup();";
        ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);

    }

   
    protected void BtnResend_Click(object sender, EventArgs e)
    {

        //objlogin.Sendotp(ViewState["otp"].ToString(), Session["Mobile"].ToString());
        //string popupScript2 = "Closepopup();";
        //ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal12();", true);


        objlogin.username = txtusername.Text;
        objlogin.password = ViewState["pwd"].ToString();
        objlogin.ipaddress = GetIp();

        DataTable dt = new DataTable();
        dt = objlogin.Chk_UserLoginDetails(objlogin);
        if (dt.Rows.Count > 0)
        {
            Session["userid"] = txtusername.Text;
            Session["username"] = dt.Rows[0]["username2"].ToString();
            Session["UserImage"] = BmkPhotoHelper.NormalizePhotoFileName(dt.Rows[0]["UserImage"].ToString());
            Session["status"] = dt.Rows[0]["status1"].ToString();
            if (dt.Rows[0]["status123"].ToString() == "1")
            {
                objlogin.Sendotp(dt.Rows[0]["otp"].ToString(), dt.Rows[0]["mobile"].ToString());
                string popupScript2 = "Closepopup();";
                ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal12();", true);

            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }
        else
        {
            string popupScript2 = "Closepopup1();";
            ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            Message.Show("Invalid Login Details...!!!");
        }
    }
    public string GetIp()
    {
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        return ipaddress;
    }
    protected void BtnConfirm_Click(object sender, EventArgs e)
    {
        objlogin.username = txtusername.Text;
        objlogin.OTP = TxtOtp.Text;
        objlogin.ipaddress = GetIp();
        string res = objlogin.Confirmotp(objlogin);
        if (res == "1")
        {
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            LblMessages.Visible = true;
            string popupScript2 = "Closepopup1();";
            ScriptManager.RegisterStartupScript(uplMaster, uplMaster.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal12();", true);
        }
    }
}