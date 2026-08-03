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
            ShowError("Please fill in Name, Email, and Amount.", "कृपया नाम, ईमेल और राशि भरें।");
            return;
        }

        if (string.IsNullOrEmpty(payment))
        {
            ShowError("Please select a payment option.", "कृपया भुगतान का माध्यम चुनें।");
            return;
        }

        if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
            ShowError("Please enter a valid email address.", "कृपया एक वैध ईमेल पता दर्ज करें।");
            return;
        }

        decimal amt;
        if (!decimal.TryParse(amount, out amt) || amt <= 0)
        {
            ShowError("Please enter a valid donation amount.", "कृपया एक वैध दान राशि दर्ज करें।");
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
        pnlSuccess.Attributes["data-hi"] = "धन्यवाद, " + Server.HtmlEncode(name) +
            "! <strong>" + Server.HtmlEncode(program) +
            "</strong> के लिए <strong>" + Server.HtmlEncode(payment) +
            "</strong> के माध्यम से ₹" + amt.ToString("0.##") +
            " का आपका दान अनुरोध हमें मिल गया है। हमारी टीम शीघ्र ही आपसे" +
            (string.IsNullOrEmpty(phone) ? "" : " आपके मोबाइल पर") + " संपर्क करेगी।";
        pnlSuccess.Visible = true;
    }

    // The client-side switcher reads data-hi, so alerts stay bilingual after a postback.
    void ShowError(string english, string hindi)
    {
        litError.Text = english;
        pnlError.Attributes["data-hi"] = hindi;
        pnlError.Visible = true;
    }
}
