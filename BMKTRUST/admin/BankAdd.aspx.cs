using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_BankAdd : System.Web.UI.Page
{
    clsBank objbank = new clsBank();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loaddata();
                SetAddMode();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loaddata()
    {
        GridView1.DataSource = objbank.getBank();
        GridView1.DataBind();
    }
    void SetAddMode()
    {
        lblbankid.Text = "";
        litFormTitle.Text = "Add Bank";
        btnSubmit.Text = "Submit";
    }
    void ClearForm()
    {
        txtbankname.Text = "";
        SetAddMode();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(lblbankid.Text))
        {
            objbank.BankName = txtbankname.Text;
            objbank.BankId = lblbankid.Text;
            string res = objbank.Update_Bank(objbank);
            if (res == "t")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Bank Edited Successfully');", true);
                ClearForm();
                loaddata();
            }
            return;
        }

        objbank.BankName = txtbankname.Text;
        objbank.MentionBy = Session["useradmin"].ToString();
        string addRes = objbank.Insert_Bank(objbank);
        if (addRes == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Bank Added Successfully');", true);
            ClearForm();
            loaddata();
        }
        else if (addRes == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Bank already exists.');", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Unknow error occurred');", true);
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblbankname = (Label)GridView1.Rows[index].FindControl("lblbankname");
            lblbankid.Text = lblid.Text;
            txtbankname.Text = lblbankname.Text;
            litFormTitle.Text = "Edit Bank Details";
            btnSubmit.Text = "Update";
        }
    }
}
