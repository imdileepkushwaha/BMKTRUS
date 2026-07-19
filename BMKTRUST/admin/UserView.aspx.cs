using BusinessLogicTier;
using DataTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class admin_UserView : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsUser objUser = new clsUser();
    clsBank objBank = new clsBank();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            string userId = Request.QueryString["userId"] ?? Request.QueryString["Id"] ?? "";
            if (string.IsNullOrWhiteSpace(userId))
            {
                Response.Redirect("UserReport.aspx");
                return;
            }

            lnkEdit.NavigateUrl = "UserEdit.aspx?userId=" + userId;
            lnkBank.NavigateUrl = "userbankdetail.aspx?Id=" + userId;
            lnkKyc.NavigateUrl = "UploadKYC.aspx?ID=" + userId;
            LoadUser(userId);
        }
    }

    void LoadUser(string userId)
    {
        objUser.UserId = userId;
        DataTable dtDetail = objUser.getUserDetail(objUser);
        if (dtDetail == null || dtDetail.Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "nouser", "alert('User not found');window.location='UserReport.aspx';", true);
            return;
        }

        DataRow r = dtDetail.Rows[0];
        lblUserId.Text = Safe(r, "userid");
        lblUserName.Text = Safe(r, "username");
        lblMobile.Text = Dash(Safe(r, "mobile"));
        lblEmail.Text = Dash(Safe(r, "email"));
        lblGender.Text = Dash(Safe(r, "gender"));
        lblAddress.Text = Dash(Safe(r, "address"));
        lblArea.Text = Dash(Safe(r, "areaname"));
        lblPincode.Text = Dash(Safe(r, "pincode"));
        lblState.Text = Dash(Safe(r, "statename"));
        lblSponsorId.Text = Dash(Safe(r, "sponserid"));
        lblSponsorName.Text = Dash(Safe(r, "Sponsername"));
        lblParentName.Text = Dash(Safe(r, "parentname"));
        lblPlanAmount.Text = Dash(Safe(r, "planamount"));
        lblNomineeName.Text = Dash(Safe(r, "nomineename"));
        lblNomineeRelation.Text = Dash(Safe(r, "nomineerelation"));
        lblAccHolder.Text = Dash(Safe(r, "accountholdername"));
        lblAccNo.Text = Dash(Safe(r, "accountno"));
        lblIfsc.Text = Dash(Safe(r, "ifsccode"));
        lblBranch.Text = Dash(Safe(r, "branchname"));
        lblUpi.Text = Dash(Safe(r, "upino"));
        lblPhonePe.Text = Dash(Safe(r, "phonepay"));
        lblBhim.Text = Dash(Safe(r, "bhimno"));
        lblPanNumber.Text = Dash(Safe(r, "pannumber"));
        lblAadhaarNumber.Text = Dash(Safe(r, "adharnumber"));
        lblGstNumber.Text = Dash(Safe(r, "gstnumber"));
        lblCourseName.Text = Dash(Safe(r, "coursename"));
        lblTelegramName.Text = Dash(Safe(r, "telegramname"));
        lblTelegramNumber.Text = Dash(Safe(r, "telegramnumber"));
        lblActivationDate.Text = Dash(Safe(r, "activationdate"));
        lblRechargeWallet.Text = Dash(Safe(r, "balanceamount"));
        lblUtilityWallet.Text = Dash(Safe(r, "utilityBalance"));

        try
        {
            if (!string.IsNullOrWhiteSpace(Safe(r, "dateofbirth")))
                lblDob.Text = Convert.ToDateTime(r["dateofbirth"]).ToString("dd/MM/yyyy");
            else
                lblDob.Text = "-";
        }
        catch
        {
            lblDob.Text = Dash(Safe(r, "dateofbirth"));
        }

        try
        {
            if (!string.IsNullOrWhiteSpace(Safe(r, "mentiondate")))
                lblRegDate.Text = Convert.ToDateTime(r["mentiondate"]).ToString("dd/MM/yyyy");
            else if (!string.IsNullOrWhiteSpace(Safe(r, "regdate")))
                lblRegDate.Text = Convert.ToDateTime(r["regdate"]).ToString("dd/MM/yyyy");
            else
                lblRegDate.Text = "-";
        }
        catch
        {
            lblRegDate.Text = "-";
        }

        string photo = Safe(r, "PhotoImage");
        imgPhoto.ImageUrl = string.IsNullOrWhiteSpace(photo) ? "img/default.png" : photo;

        string bankId = Safe(r, "bankname");
        lblBankName.Text = ResolveBankName(bankId);

        LoadCityName(Safe(r, "cityid"));
        LoadReportExtras(userId);
        LoadKyc(userId);
    }

    void LoadCityName(string cityId)
    {
        if (string.IsNullOrWhiteSpace(cityId) || cityId == "0")
        {
            lblCity.Text = "-";
            return;
        }

        ObjData.StartConnection();
        try
        {
            DataTable dt = ObjData.RunDataTable("SELECT CityName FROM citymaster WHERE CityId='" + cityId.Replace("'", "''") + "'");
            if (dt != null && dt.Rows.Count > 0)
                lblCity.Text = Dash(dt.Rows[0]["CityName"].ToString());
            else
                lblCity.Text = "-";
        }
        catch
        {
            lblCity.Text = "-";
        }
        finally
        {
            ObjData.EndConnection();
        }
    }

    string ResolveBankName(string bankId)
    {
        if (string.IsNullOrWhiteSpace(bankId) || bankId == "0")
            return "-";

        try
        {
            DataTable dt = objBank.getBank();
            if (dt != null)
            {
                foreach (DataRow row in dt.Rows)
                {
                    if (Convert.ToString(row["BankID"]) == bankId)
                        return Dash(Convert.ToString(row["BankName"]));
                }
            }
        }
        catch { }

        return Dash(bankId);
    }

    void LoadReportExtras(string userId)
    {
        string q = @"SELECT isnull(ud.status,0) as TopUpStatus, ld.password, ld.status as activeStatus,
                            isnull(ud.balanceamount,0) as balanceamount, isnull(ud.utilityBalance,0) as utilityBalance,
                            plm.PlanName as packageName, isnull(ud1.userName,'Company') as sponserName,
                            ud.epinGenerationStatus, cm.CityName, sm.stateName
                     FROM userdetail ud
                     LEFT JOIN citymaster cm ON ud.Cityid=cm.CityId
                     LEFT JOIN statemaster sm on sm.stateId=cm.stateId
                     LEFT JOIN Logindetail ld on ud.userid=ld.username
                     LEFT JOIN EPinMaster epin on epin.UsedUserId=ud.userID
                     LEFT JOIN PlanMaster plm on plm.id=epin.planId
                     LEFT JOIN userdetail ud1 on ud.sponserId=ud1.userId
                     WHERE ud.UserId = '" + userId.Replace("'", "''") + "'";

        ObjData.StartConnection();
        try
        {
            DataTable dt = ObjData.RunDataTable(q);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataRow r = dt.Rows[0];
                lblPassword.Text = Dash(Safe(r, "password"));
                lblPackage.Text = Dash(Safe(r, "packageName"));
                if (lblSponsorName.Text == "-" || string.IsNullOrWhiteSpace(lblSponsorName.Text))
                    lblSponsorName.Text = Dash(Safe(r, "sponserName"));
                if (lblCity.Text == "-" || string.IsNullOrWhiteSpace(lblCity.Text))
                    lblCity.Text = Dash(Safe(r, "CityName"));
                if (lblState.Text == "-" || string.IsNullOrWhiteSpace(lblState.Text))
                    lblState.Text = Dash(Safe(r, "stateName"));
                if (lblRechargeWallet.Text == "-" || string.IsNullOrWhiteSpace(lblRechargeWallet.Text))
                    lblRechargeWallet.Text = Dash(Safe(r, "balanceamount"));
                if (lblUtilityWallet.Text == "-" || string.IsNullOrWhiteSpace(lblUtilityWallet.Text))
                    lblUtilityWallet.Text = Dash(Safe(r, "utilityBalance"));

                string active = Safe(r, "activeStatus");
                lblActiveStatus.Text = active == "1" ? "Active" : "Deactive";
                lblActiveStatus.CssClass = active == "1" ? "Active" : "Deactive";

                string topup = Safe(r, "TopUpStatus");
                lblTopUpStatus.Text = topup == "1" ? "Topup" : "Free";
                lblTopUpStatus.CssClass = topup == "1" ? "Active" : "Deactive";

                string epin = Safe(r, "epinGenerationStatus");
                lblEpinStatus.Text = epin == "1" ? "E-Pin Unblocked" : "E-Pin Blocked";
                lblEpinStatus.CssClass = epin == "1" ? "Active" : "Deactive";
            }
        }
        catch { }
        finally
        {
            ObjData.EndConnection();
        }
    }

    void LoadKyc(string userId)
    {
        objUser.UserId = userId;
        DataTable dt = objUser.getUserName(objUser);
        if (dt == null || dt.Rows.Count == 0)
            return;

        DataRow r = dt.Rows[0];

        if (lblAadhaarNumber.Text == "-" || string.IsNullOrWhiteSpace(lblAadhaarNumber.Text))
            lblAadhaarNumber.Text = Dash(Safe(r, "adharnumber"));
        if (lblPanNumber.Text == "-" || string.IsNullOrWhiteSpace(lblPanNumber.Text))
            lblPanNumber.Text = Dash(Safe(r, "PanNumber"));
        if (lblGstNumber.Text == "-" || string.IsNullOrWhiteSpace(lblGstNumber.Text))
            lblGstNumber.Text = Dash(Safe(r, "gstnumber"));

        BindKycImage(imgSignup, lnkSignupImg, Safe(r, "SignUpForm"));
        BindKycImage(imgPan, lnkPanImg, Safe(r, "PanImage"));
        BindKycImage(imgCheque, lnkChequeImg, Safe(r, "CancelCheque"));
        BindKycImage(imgAadhaar, lnkAadhaarImg, Safe(r, "AadharImage"));
        BindKycImage(imgAadhaarBack, lnkAadhaarBackImg, Safe(r, "AadharImageBack"));
        BindKycImage(imgGst, lnkGstImg, Safe(r, "GSTimage"));

        SetKycStatus(lblSignupStatus, Safe(r, "SignUpImgStatus"));
        SetKycStatus(lblPanStatus, Safe(r, "PanImgStatus"));
        SetKycStatus(lblChequeStatus, Safe(r, "ChequeImgStatus"));
        SetKycStatus(lblAadhaarStatus, Safe(r, "AadharImgStatus"));
        SetKycStatus(lblAadhaarBackStatus, Safe(r, "AadharImgStatus"));

        // GST status comes from userdetail IsGstApplicable in report query; try column if present
        string gstStatus = "";
        if (r.Table.Columns.Contains("IsGstApplicable"))
            gstStatus = Safe(r, "IsGstApplicable");
        else
            gstStatus = GetGstStatus(userId);
        SetKycStatus(lblGstStatus, gstStatus);
    }

    string GetGstStatus(string userId)
    {
        ObjData.StartConnection();
        try
        {
            DataTable dt = ObjData.RunDataTable("SELECT IsGstApplicable FROM userdetail WHERE UserId='" + userId.Replace("'", "''") + "'");
            if (dt != null && dt.Rows.Count > 0)
                return Convert.ToString(dt.Rows[0]["IsGstApplicable"]);
        }
        catch { }
        finally
        {
            ObjData.EndConnection();
        }
        return "";
    }

    void BindKycImage(Image img, HtmlAnchor link, string url)
    {
        string src = string.IsNullOrWhiteSpace(url) ? "img/default.png" : url;
        img.ImageUrl = src;
        if (link != null)
            link.HRef = src;
    }

    void SetKycStatus(Label lbl, string statusCode)
    {
        string text;
        string css;
        switch (statusCode)
        {
            case "1":
                text = "Approved";
                css = "Approved";
                break;
            case "2":
                text = "Rejected";
                css = "Rejected";
                break;
            case "0":
                text = "Pending";
                css = "Pending";
                break;
            default:
                text = "Not Uploaded";
                css = "Pending";
                break;
        }
        lbl.Text = text;
        lbl.CssClass = css;
    }

    static string Safe(DataRow row, string col)
    {
        if (row == null || row.Table == null || !row.Table.Columns.Contains(col) || row[col] == DBNull.Value)
            return "";
        return Convert.ToString(row[col]).Trim();
    }

    static string Dash(string value)
    {
        return string.IsNullOrWhiteSpace(value) ? "-" : value;
    }
}
