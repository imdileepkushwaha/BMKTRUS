using BusinessLogicTier;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_DonationRequestAdd : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            Response.Redirect("logout.aspx");
            return;
        }

        if (!IsPostBack)
        {
            txtuserid.Text = Session["userid"].ToString();
            txtamount.Text = clsAccount.DonationAmount.ToString("0.00");
            loadbankaccount();
            CheckEligibility();
            BindMyRequests();
        }
    }

    void CheckEligibility()
    {
        string userId = Session["userid"].ToString();
        int active = objaccount.CountDonationActiveChildren(userId);
        bool eligible = active >= clsAccount.MinActiveDonationChildren;
        bool pending = objaccount.HasPendingDonation(userId);

        if (!eligible)
        {
            lblEligible.ForeColor = System.Drawing.Color.FromArgb(180, 35, 24);
            lblEligible.Text = "Not eligible. Aapke neeche (parent) minimum " + clsAccount.MinActiveDonationChildren +
                " active IDs honi chahiye. Abhi active: " + active + ".";
            pnlForm.Visible = false;
        }
        else if (pending)
        {
            lblEligible.ForeColor = System.Drawing.Color.FromArgb(180, 120, 0);
            lblEligible.Text = "Eligible (active IDs: " + active + "). Ek pending donation request pehle se hai.";
            pnlForm.Visible = false;
        }
        else
        {
            lblEligible.ForeColor = System.Drawing.Color.FromArgb(15, 106, 8);
            lblEligible.Text = "Eligible. Active IDs under you: " + active + ". Donation amount Rs. " +
                clsAccount.DonationAmount.ToString("0.00") + ".";
            pnlForm.Visible = true;
        }
    }

    void loadbankaccount()
    {
        ddbankaccountno.Items.Clear();
        DataTable dt = objaccount.getCompanyAccountDetail();
        ddbankaccountno.DataSource = dt;
        ddbankaccountno.DataTextField = "accno2";
        ddbankaccountno.DataValueField = "id";
        ddbankaccountno.DataBind();
        ddbankaccountno.Items.Insert(0, new ListItem("Select Account", "0"));
    }

    void loadaccountdetail()
    {
        objaccount.Id = ddbankaccountno.SelectedValue;
        DataTable dt = objaccount.getCompanyAccountDetailById(objaccount);
        if (dt != null && dt.Rows.Count > 0)
        {
            txtdepositaccountno.Text = Convert.ToString(dt.Rows[0]["accountno"]);
            txtaccountholdername.Text = Convert.ToString(dt.Rows[0]["AccountHolderName"]);
            txtdepositbank.Text = Convert.ToString(dt.Rows[0]["BankName"]);
            txtifsccode.Text = Convert.ToString(dt.Rows[0]["IFSCCode"]);
            string qrFile = Convert.ToString(dt.Rows[0]["BranchName"]);
            QR.ImageUrl = string.IsNullOrWhiteSpace(qrFile) ? "" : ("../ProductImage/" + qrFile);
            QR.Visible = !string.IsNullOrWhiteSpace(qrFile);
        }
        else
        {
            txtdepositaccountno.Text = "";
            txtaccountholdername.Text = "";
            txtdepositbank.Text = "";
            txtifsccode.Text = "";
            QR.ImageUrl = "";
        }
    }

    protected void ddbankaccountno_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadaccountdetail();
    }

    string UploadImage()
    {
        if (!ImageUpload.HasFile)
            return "";
        string fileName = Path.GetFileName(ImageUpload.PostedFile.FileName);
        string imagename = DateTime.Now.Ticks + fileName;
        ImageUpload.PostedFile.SaveAs(Server.MapPath("~/ProductImage/") + imagename);
        return imagename;
    }

    void BindMyRequests()
    {
        GridView1.DataSource = objaccount.getDonationRequestByUser(Session["userid"].ToString());
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        Label lblstatus = e.Row.FindControl("lblstatus") as Label;
        if (lblstatus == null) return;
        if (lblstatus.Text == "Pending")
            lblstatus.CssClass = "label label-warning";
        else if (lblstatus.Text == "Approved")
            lblstatus.CssClass = "label label-success";
        else if (lblstatus.Text == "Rejected")
            lblstatus.CssClass = "label label-danger";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userId = Session["userid"].ToString();
        if (ddbankaccountno.SelectedValue == "0")
        {
            Message.Show("Select Account...!!!");
            return;
        }
        if (string.IsNullOrWhiteSpace(TxtTransactionId.Text))
        {
            Message.Show("Enter Transaction Id...!!!");
            return;
        }
        if (!ImageUpload.HasFile)
        {
            Message.Show("Upload payment slip...!!!");
            return;
        }

        int bankId;
        if (!int.TryParse(ddbankaccountno.SelectedValue, out bankId))
        {
            Message.Show("Select Account...!!!");
            return;
        }

        string img = UploadImage();
        string rs = objaccount.InsertDonationRequest(userId, bankId, TxtTransactionId.Text.Trim(), img);
        if (rs == "t")
        {
            Message.Show("Donation request submitted successfully.");
            TxtTransactionId.Text = "";
            ddbankaccountno.SelectedIndex = 0;
            loadaccountdetail();
        }
        else if (rs == "not_eligible")
            Message.Show("Not eligible. Minimum 2 active IDs required under you.");
        else if (rs == "pending")
            Message.Show("Pending donation request already exists.");
        else
            Message.Show("Unknown error occurred.");

        CheckEligibility();
        BindMyRequests();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
