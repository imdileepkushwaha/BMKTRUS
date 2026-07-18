using System;
using System.Text.RegularExpressions;
using System.Web.UI;

public partial class IndexPage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var master = Master as SiteMaster;
            if (master != null)
            {
                master.SetPageTitle("Bharat Manav Kalyan Trust — Service • Dedication • Empowerment");
            }
        }
    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        pnlContactSuccess.Visible = false;
        pnlContactError.Visible = false;

        string name = (txtName.Text ?? string.Empty).Trim();
        string email = (txtEmail.Text ?? string.Empty).Trim();
        string message = (txtMessage.Text ?? string.Empty).Trim();

        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
        {
            litContactError.Text = "Please fill in all required fields.";
            pnlContactError.Visible = true;
            return;
        }

        if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
        {
            litContactError.Text = "Please enter a valid email address.";
            pnlContactError.Visible = true;
            return;
        }

        // Frontend capture ready; wire to DB/email later if needed.
        txtName.Text = string.Empty;
        txtEmail.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtSubject.Text = string.Empty;
        txtMessage.Text = string.Empty;

        litContactSuccess.Text = "Thank you! Your message has been received. We will get back to you soon.";
        pnlContactSuccess.Visible = true;
    }
}
