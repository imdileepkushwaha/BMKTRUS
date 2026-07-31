using BusinessLogicTier;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsBank objbank = new clsBank();
    clsAccount objaccount = new clsAccount();

    private const string DefaultAvatar = "~/site/assets/images/default-user.svg";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                loadcountry();
                loadbank();
                loaddata();
                BindStats();
                BindReferralLinks();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void loaddata()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable dt = objUser.getUserDetail(objUser);
        if (dt == null || dt.Rows.Count == 0)
            return;

        DataRow row = dt.Rows[0];

        txtsponserid.Text = Safe(row, "sponserid");
        loadsusername();
        txtname.Text = Safe(row, "surname");
        txtLastname.Text = Safe(row, "username");
        txtmobile.Text = Safe(row, "mobile");
        txtemail.Text = Safe(row, "email");

        string gender = Safe(row, "gender");
        if (!string.IsNullOrEmpty(gender) && ddgender.Items.FindByValue(gender) != null)
            ddgender.SelectedValue = gender;

        txtaddress.Text = Safe(row, "address");

        string countryId = Safe(row, "countryid");
        if (!string.IsNullOrEmpty(countryId) && ddcountry.Items.FindByValue(countryId) != null)
            ddcountry.SelectedValue = countryId;
        loadstate();

        string stateId = Safe(row, "stateid");
        if (!string.IsNullOrEmpty(stateId) && ddstate.Items.FindByValue(stateId) != null)
            ddstate.SelectedValue = stateId;
        loadcity();

        string cityId = Safe(row, "cityid");
        if (!string.IsNullOrEmpty(cityId) && ddcity.Items.FindByValue(cityId) != null)
            ddcity.SelectedValue = cityId;

        txtareaname.Text = Safe(row, "areaname");
        txtpincode.Text = Safe(row, "pincode");
        try
        {
            txtdateofbirth.Text = Convert.ToDateTime(row["dateofbirth"].ToString()).ToString("dd/MM/yyyy");
        }
        catch { }

        txtnomineename.Text = Safe(row, "nomineename");
        txtnomineerelation.Text = Safe(row, "nomineerelation");
        txtaccountholdername.Text = Safe(row, "accountholdername");
        txtaccountno.Text = Safe(row, "accountno");
        txtpan.Text = Safe(row, "pannumber");
        txtifsccode.Text = Safe(row, "ifsccode");
        txtbranchname.Text = Safe(row, "branchname");

        string bank = Safe(row, "bankname");
        if (!string.IsNullOrEmpty(bank) && ddbank.Items.FindByValue(bank) != null)
            ddbank.SelectedValue = bank;

        litBankHolder.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(txtaccountholdername.Text) ? "—" : txtaccountholdername.Text);
        litBankAccount.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(txtaccountno.Text) ? "—" : txtaccountno.Text);
        litBankIfsc.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(txtifsccode.Text) ? "—" : txtifsccode.Text);
        litBankPan.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(txtpan.Text) ? "—" : txtpan.Text);
        litBankName.Text = HttpUtility.HtmlEncode(
            ddbank.SelectedItem != null && ddbank.SelectedValue != "0"
                ? ddbank.SelectedItem.Text
                : "—");

        BindMemberCard(row);
    }

    void BindMemberCard(DataRow row)
    {
        string userId = Session["userid"].ToString();
        string first = Safe(row, "surname");
        string last = Safe(row, "username");
        string fullName = (first + " " + last).Trim();
        if (string.IsNullOrEmpty(fullName))
            fullName = Session["username"] != null ? Session["username"].ToString() : userId;

        litUserIdBadge.Text = HttpUtility.HtmlEncode(userId);
        litUserIdSub.Text = HttpUtility.HtmlEncode(userId);
        litDisplayName.Text = HttpUtility.HtmlEncode(fullName);
        litFirstName.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(first) ? fullName.Split(' ')[0] : first);

        string email = Safe(row, "email");
        string mobile = Safe(row, "mobile");
        litEmail.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(email) ? "—" : email);
        litPhone.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(mobile) ? "—" : mobile);

        string stateName = Safe(row, "statename");
        string cityName = "";
        if (ddcity.SelectedItem != null && ddcity.SelectedValue != "0")
            cityName = ddcity.SelectedItem.Text;
        string location = string.IsNullOrEmpty(cityName)
            ? (string.IsNullOrEmpty(stateName) ? "India" : stateName)
            : (string.IsNullOrEmpty(stateName) ? cityName : cityName + ", " + stateName);
        litLocation.Text = HttpUtility.HtmlEncode(location);

        string gender = Safe(row, "gender");
        litGender.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(gender) || gender == "0" ? "—" : gender);

        string address = Safe(row, "address");
        litAddress.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(address) ? "—" : address);

        string package = "Member";
        decimal planAmt = 0;
        if (row.Table.Columns.Contains("planamount") && row["planamount"] != DBNull.Value)
        {
            decimal.TryParse(row["planamount"].ToString(), out planAmt);
            if (planAmt > 0)
                package = "₹" + planAmt.ToString("0") + " Plan";
        }
        litPackage.Text = HttpUtility.HtmlEncode(package);

        string statusVal = Safe(row, "Status");
        if (string.IsNullOrEmpty(statusVal))
            statusVal = Safe(row, "status");
        bool isActive = statusVal == "1" || statusVal.Equals("Active", StringComparison.OrdinalIgnoreCase);
        lblStatusBadge.Text = isActive ? "Active" : "Inactive";
        lblStatusBadge.CssClass = isActive ? "bmk-badge bmk-badge-ok" : "bmk-badge bmk-badge-warn";

        string pan = Safe(row, "pannumber");
        string gst = row.Table.Columns.Contains("GSTimage") ? Safe(row, "GSTimage") : "";
        bool kycDone = (!string.IsNullOrEmpty(pan) && pan.Length > 4)
            || (!string.IsNullOrEmpty(gst) && !gst.Equals("img/default.png", StringComparison.OrdinalIgnoreCase));
        lblKycBadge.Text = kycDone ? "KYC Submitted" : "KYC Pending";
        lblKycBadge.CssClass = kycDone ? "bmk-badge bmk-badge-ok" : "bmk-badge bmk-badge-warn";

        litSponsorId.Text = HttpUtility.HtmlEncode(txtsponserid.Text);
        litSponsorName.Text = HttpUtility.HtmlEncode(string.IsNullOrEmpty(txtsponsername.Text) ? "—" : txtsponsername.Text);

        imgProfile.ImageUrl = ResolveProfilePhotoUrl(row);
    }

    string ResolveProfilePhotoUrl(DataRow row)
    {
        string fileName = BmkPhotoHelper.NormalizePhotoFileName(
            Session["UserImage"] != null ? Session["UserImage"].ToString() : string.Empty);

        if (string.IsNullOrEmpty(fileName) && row != null)
        {
            if (row.Table.Columns.Contains("PhotoImage"))
                fileName = BmkPhotoHelper.NormalizePhotoFileName(Safe(row, "PhotoImage"));
            else if (row.Table.Columns.Contains("Photo"))
                fileName = BmkPhotoHelper.NormalizePhotoFileName(Safe(row, "Photo"));
        }

        if (string.IsNullOrEmpty(fileName))
            return ResolveUrl(DefaultAvatar);

        string relativePath = "~/ProductImage/" + fileName;
        string physical = Server.MapPath(relativePath);
        if (!string.IsNullOrEmpty(physical) && File.Exists(physical))
            return ResolveUrl(relativePath);

        return ResolveUrl(DefaultAvatar);
    }

    void BindStats()
    {
        string userId = Session["userid"].ToString();
        decimal wallet = 0;
        int leftDirect = 0, rightDirect = 0;
        int leftTeam = 0, rightTeam = 0, middleTeam = 0;
        decimal directIncome = 0, binaryIncome = 0, levelIncome = 0, selfIncome = 0;
        string rank = "—";

        try
        {
            objaccount.UserId = userId;
            objaccount.userType = "1";
            DataTable dtBal = objaccount.getUserWalletBalanceReport(objaccount);
            if (dtBal != null && dtBal.Rows.Count > 0)
                decimal.TryParse(Safe(dtBal.Rows[0], "bal"), out wallet);
        }
        catch { }

        try
        {
            objUser.UserId = userId;
            DataTable leftDt = objUser.getUserleftDirect(objUser);
            DataTable rightDt = objUser.getUserrightDirect(objUser);
            if (leftDt != null && leftDt.Rows.Count > 0)
                int.TryParse(leftDt.Rows[0][0].ToString(), out leftDirect);
            if (rightDt != null && rightDt.Rows.Count > 0)
                int.TryParse(rightDt.Rows[0][0].ToString(), out rightDirect);
        }
        catch { }

        try
        {
            DataTable dtInc = objUser.getTotalincome(userId);
            if (dtInc != null && dtInc.Rows.Count > 0)
            {
                DataRow r = dtInc.Rows[0];
                int.TryParse(Safe(r, "leftcount"), out leftTeam);
                int.TryParse(Safe(r, "rightcount"), out rightTeam);
                int.TryParse(Safe(r, "middlecount"), out middleTeam);
                decimal.TryParse(Safe(r, "sponcering"), out directIncome);
                decimal.TryParse(Safe(r, "Binaryincome"), out binaryIncome);
                decimal.TryParse(Safe(r, "DailyLevelIncome"), out levelIncome);
                decimal.TryParse(Safe(r, "selfincome"), out selfIncome);
                rank = string.IsNullOrEmpty(Safe(r, "Rank")) ? "—" : Safe(r, "Rank");
            }
        }
        catch { }

        // Dashboard sources level income from the helping-level ledger, keep both in sync
        decimal helpingLevelIncome = GetHelpingLevelIncomeTotal(userId);
        if (helpingLevelIncome > 0) levelIncome = helpingLevelIncome;

        int directTotal = leftDirect + rightDirect;
        int teamTotal = leftTeam + rightTeam + middleTeam;
        if (teamTotal <= 0) teamTotal = directTotal;
        decimal totalEarnings = directIncome + binaryIncome + levelIncome + selfIncome;

        litDirectCount.Text = directTotal.ToString();
        litTeamCount.Text = teamTotal.ToString();
        litWalletMini.Text = wallet.ToString("0.00");
        litMetricEarnings.Text = totalEarnings.ToString("0.00");
        litDirectMembers.Text = directTotal.ToString();
        litTeamNet.Text = teamTotal.ToString();
        litReferralIncome.Text = directIncome.ToString("0.00");
        litLevelIncomeNet.Text = levelIncome.ToString("0.00");
        litRank.Text = HttpUtility.HtmlEncode(rank);
    }

    decimal GetHelpingLevelIncomeTotal(string userId)
    {
        decimal total = 0;
        try
        {
            objaccount.UserId = userId;
            objaccount.FromDate = DateTime.MinValue;
            objaccount.ToDate = DateTime.MinValue;
            DataTable dtHelp = objaccount.getHelpingLevelIncome(objaccount);
            if (dtHelp != null)
            {
                foreach (DataRow row in dtHelp.Rows)
                {
                    decimal amt;
                    if (decimal.TryParse(Convert.ToString(row["Income"]), out amt))
                        total += amt;
                }
            }
        }
        catch
        {
            total = 0;
        }
        return total;
    }

    void BindReferralLinks()
    {
        string userId = Session["userid"].ToString();
        string baseUrl = clsUtility.ProjectWebsite.TrimEnd('/');
        TxtLeftLinkLink.Text = baseUrl + "/RegistrationNew.aspx?UserId=" + userId + "&standingposition=1";
        TxtRightLink.Text = baseUrl + "/Register.aspx?UserId=" + userId + "&standingposition=2";
    }

    static string Safe(DataRow row, string col)
    {
        if (row == null || row.Table == null || !row.Table.Columns.Contains(col) || row[col] == DBNull.Value)
            return string.Empty;
        return Convert.ToString(row[col]).Trim();
    }

    void loadbank()
    {
        ddbank.Items.Clear();
        DataTable dt = objbank.getBank();
        ddbank.DataSource = dt;
        ddbank.DataTextField = "BankName";
        ddbank.DataValueField = "BankID";
        ddbank.DataBind();
        ddbank.Items.Insert(0, new ListItem("Select Bank", "0"));
    }

    void loadcountry()
    {
        ddcountry.Items.Clear();
        DataTable dt = objState.getCountry();
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ddcountry.Items.Insert(0, new ListItem("Select Country", "0"));
    }

    void loadstate()
    {
        ddstate.Items.Clear();
        objState.CountryId = ddcountry.SelectedValue;
        DataTable dt = objState.getState(objState);
        ddstate.DataSource = dt;
        ddstate.DataTextField = "StateName";
        ddstate.DataValueField = "StateID";
        ddstate.DataBind();
        ddstate.Items.Insert(0, new ListItem("Select State", "0"));
    }

    void loadcity()
    {
        ddcity.Items.Clear();
        objState.StateId = ddstate.SelectedValue;
        DataTable dt = objState.getCity(objState);
        ddcity.DataSource = dt;
        ddcity.DataTextField = "CityName";
        ddcity.DataValueField = "CityID";
        ddcity.DataBind();
        ddcity.Items.Insert(0, new ListItem("Select City", "0"));
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objUser.UserId = Session["userid"].ToString();
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
        objUser.Gender = ddgender.SelectedValue;
        objUser.Address = txtaddress.Text;
        objUser.CityId = ddcity.SelectedValue;
        objUser.CountryId = ddcountry.SelectedValue;
        objUser.StateId = ddstate.SelectedValue;
        objUser.AreaName = txtareaname.Text;
        objUser.Pincode = txtpincode.Text;
        objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirth.Text);
        objUser.MentionBy = Session["userid"].ToString();
        objUser.NomineeName = txtnomineename.Text;
        objUser.NomineeRelation = txtnomineerelation.Text;
        objUser.AccHolderName = txtaccountholdername.Text;
        objUser.AccNo = txtaccountno.Text;
        objUser.IFSCCode = txtifsccode.Text;
        objUser.PanCardNo = txtpan.Text;
        objUser.BankName = ddbank.SelectedValue;
        objUser.BranchName = txtbranchname.Text;
        string res = objUser.Update_UserProfile(objUser);
        if (res == "f")
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('User Not Found.');", true);
        else if (res == "0")
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Unknow error occurred');", true);
        else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('User Details Updated Successfully.');", true);
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }

    protected void ddstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadcity();
    }

    void loadsusername()
    {
        objUser.UserId = txtsponserid.Text;
        DataTable dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtsponsername.Text = dt.Rows[0]["username"].ToString();
        }
        else if (txtsponserid.Text == "0")
        {
            txtsponsername.Text = "Company";
            txtsponserid.Text = "0";
        }
        else
        {
            txtsponsername.Text = "";
            txtsponserid.Text = "";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Invalid User Id');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
