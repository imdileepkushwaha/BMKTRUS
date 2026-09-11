using BusinessLogicTier;
using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalculateClosing : System.Web.UI.Page
{
    clsBank objbank = new clsBank();
    clsClosing objCl = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TxtFromdate.Attributes.Add("readonly", "readonly");
            TxtTodate.Attributes.Add("readonly", "readonly");
            TxtTodate.Text = DateTime.Now.ToString("dd/MMM/yyyy");
            TxtFromdate.Text = DateTime.Now.AddDays(-6).ToString("dd/MMM/yyyy");
            if (Session["useradmin"] != null)
            {
                fillpreviousDate();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
   

   
    static bool TryParseClosingDate(string value, out DateTime date)
    {
        date = DateTime.MinValue;
        if (string.IsNullOrWhiteSpace(value))
            return false;
        string[] formats = { "dd/MMM/yyyy", "dd/MM/yyyy", "d/M/yyyy", "dd-MMM-yyyy", "yyyy-MM-dd" };
        if (DateTime.TryParseExact(value.Trim(), formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out date))
            return true;
        string[] parts = value.Trim().Split('/', '-');
        if (parts.Length >= 3)
        {
            string swapped = parts[1] + "/" + parts[0] + "/" + parts[2];
            if (DateTime.TryParse(swapped, CultureInfo.InvariantCulture, DateTimeStyles.None, out date))
                return true;
        }
        return DateTime.TryParse(value, CultureInfo.GetCultureInfo("en-GB"), DateTimeStyles.None, out date);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (TxtFromdate.Text != string.Empty)
        {
            DateTime fromDt;
            if (!TryParseClosingDate(TxtFromdate.Text, out fromDt))
            {
                string popupScript = "alert('Invalid From Date. Use dd/MMM/yyyy (example 01/Sep/2026).');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                return;
            }
            TxtFromdate.Text = fromDt.ToString("dd/MMM/yyyy");
            TxtTodate.Text = fromDt.AddDays(6).ToString("dd/MMM/yyyy");
            CalculateweeklyClosing();
        }
        else
        {
            string popupScript = "alert('Date can not be blank');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        
    }   
    public void CalculateweeklyClosing()
    {
        int h = objCl.ClaculateClosingJoining(objCl, TxtFromdate.Text, TxtTodate.Text);
        if (h == 1)
        {
            fillpreviousDate();
            string popupScript = "alert('Weekly closing created successfully. Level Income + Direct Income Weekly Payout me aa gaye.');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else if (h == 2)
        {
            string popupScript = "alert('Closing Already generated. Is week ki sari income pehle se Weekly Payout me hai.');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else if (h == 3)
        {
            string popupScript = "alert('Is date range me koi pending Level / Direct income nahi hai. Pehle Level Closing chalao, ya From Date check karo.');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else
        {
            string popupScript = "alert('Unknow error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
    }
    public void fillpreviousDate()
    {
        DataTable Dt = objCl.getPreviousDate();
        if (Dt.Rows.Count > 0)
        {
            if (Dt.Rows[0][0].ToString() != "")
            {
                TxtFromdate.Text = Convert.ToDateTime(Dt.Rows[0][0].ToString()).AddDays(1).ToString("dd/MMM/yyyy");
                TxtTodate.Text = Convert.ToDateTime(Dt.Rows[0][0].ToString()).AddDays(7).ToString("dd/MMM/yyyy");
            }
        }
        
    }

   
}