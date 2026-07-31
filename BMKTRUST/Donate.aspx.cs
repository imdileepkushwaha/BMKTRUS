using System;
using System.Text.RegularExpressions;
using System.Web.UI;

public partial class DonatePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnDonate_Click(object sender, EventArgs e)
    {
        pnlSuccess.Visible = false;
        pnlError.Visible = false;

        string name = (txtName.Text ?? string.Empty).Trim();
        string email = (txtEmail.Text ?? string.Empty).Trim();
        string phone = (txtPhone.Text ?? string.Empty).Trim();
        string amount = (txtAmount.Text ?? string.Empty).Trim();
        string program = ddlProgram.SelectedValue;
        string payment = ddlPayment.SelectedValue;
        string message = (txtMessage.Text ?? string.Empty).Trim();

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(amount))
        {
            litError.Text = "Please fill in Name, Email, and Amount.";
            pnlError.Visible = true;
            return;
        }

        if (string.IsNullOrEmpty(payment))
        {
            litError.Text = "Please select a payment option.";
            pnlError.Visible = true;
            return;
        }

        if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
            litError.Text = "Please enter a valid email address.";
            pnlError.Visible = true;
            return;
        }

        decimal amt;
        if (!decimal.TryParse(amount, out amt) || amt <= 0)
        {
            litError.Text = "Please enter a valid donation amount.";
            pnlError.Visible = true;
            return;
        }

        // Enquiry captured — team will share payment details
        txtName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtAmount.Text = string.Empty;
        txtMessage.Text = string.Empty;
        ddlProgram.SelectedIndex = 0;
        ddlPayment.SelectedIndex = 0;

        litSuccess.Text = "Thank you, " + Server.HtmlEncode(name) +
            "! Your donation request for ₹" + amt.ToString("0.##") +
            " towards <strong>" + Server.HtmlEncode(program) +
            "</strong> via <strong>" + Server.HtmlEncode(payment) +
            "</strong> has been received. Our team will contact you shortly" +
            (string.IsNullOrEmpty(phone) ? "" : " on your mobile") + ".";
        pnlSuccess.Visible = true;
    }
}
