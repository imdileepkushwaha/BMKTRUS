using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;

public partial class admin_EPinAdd : System.Web.UI.Page
{
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    clsplan objplan = new clsplan();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                txtuserid.Text = Session["userid"].ToString();
                loadAmountepin();
                loadusername();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    void loadusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            loadavailableepin();
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            txtavailablepins.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }
    void loadAmountepin()
    {
        DataTable dt = objplan.getPlanAll();
        DataTable dtDonation = dt != null ? dt.Clone() : new DataTable();
        if (dt != null)
        {
            foreach (DataRow row in dt.Rows)
            {
                string planName = Convert.ToString(row["PlanName"]);
                decimal amount = 0;
                decimal.TryParse(Convert.ToString(row["Planamount"]), out amount);
                bool isDonation = planName.IndexOf("Donation", StringComparison.OrdinalIgnoreCase) >= 0;
                bool is1500 = amount == 1500m
                    || planName.IndexOf("1,500", StringComparison.OrdinalIgnoreCase) >= 0
                    || planName.IndexOf("1500", StringComparison.OrdinalIgnoreCase) >= 0;
                if (isDonation && is1500)
                    dtDonation.ImportRow(row);
            }
        }

        ddplan.Items.Clear();
        if (dtDonation.Columns.Contains("PlanName"))
        {
            ddplan.DataSource = dtDonation;
            ddplan.DataTextField = "PlanName";
            ddplan.DataValueField = "Planamount";
            ddplan.DataBind();
        }
        ddplan.Items.Insert(0, new ListItem("Select Plan", "0"));
        ddplan.ClearSelection();
        ddplan.SelectedIndex = 0;
        txtavailablepins.Text = "0";
    }
    void loadavailableepin()
    {
        decimal amount;
        if (ddplan.SelectedValue == "0" || string.IsNullOrEmpty(ddplan.SelectedValue)
            || !decimal.TryParse(ddplan.SelectedValue, out amount) || amount <= 0)
        {
            txtavailablepins.Text = "0";
            return;
        }

        objEPin.Amount = amount;
        objEPin.GenerateUserId = txtuserid.Text;
        DataTable dt = objEPin.getTotalAvailableEPinnew(objEPin);
        if (dt != null && dt.Rows.Count > 0)
            txtavailablepins.Text = dt.Rows[0][0].ToString();
        else
            txtavailablepins.Text = "0";
    }
    void loadtransferusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txttransferuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
             //objUser.UserId = Session["userid"].ToString();
             //  DataTable Dt = objUser.getUserDownlineChkNew(objUser, txttransferuserid.Text);
             //  if (Dt.Rows.Count > 0)
             //  {
                   txttransferusername.Text = dt.Rows[0]["username"].ToString();
               //}
               //else
               //{
               //    txttransferusername.Text = "";
               //    txttransferuserid.Text = "";
               //    Message.Show("this user is not your downline...!!!");
               //}
        }
        else
        {
            txttransferusername.Text = "";
            txttransferuserid.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }
    protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadavailableepin();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txttransferuserid.Text != "")
            {

                if (txtnoofepin.Text != "")
                {
                    objUser.UserId = txtuserid.Text;
                    objUser.TransferUserId = txttransferuserid.Text;
                    objUser.pinamount = Convert.ToDecimal(ddplan.SelectedValue);
                    objUser.NoOfEpin = Convert.ToInt32(txtnoofepin.Text);
                    objUser.MentionBy = Session["userid"].ToString();
                    string rs = objUser.EPinTransfer(objUser);
                    if (rs == "t")
                    {
                        Message.Show("E-Pin Transferred Successfully...!!!");
                        txttransferuserid.Text = "";
                        txttransferusername.Text = "";
                        txtnoofepin.Text = "";
                        txtavailablepins.Text = "";
                        loadAmountepin();
                    }
                    else
                        if (rs == "f")
                        {
                            Message.Show("Invalid Transfer User Id...!!!");
                        }
                        else
                            if (rs == "n")
                            {
                                Message.Show("User do not have sufficient E-Pins...!!!");
                            }
                            else
                            {
                                Message.Show("Unknown Error Occurred...!!!");
                            }
                }
                else
                {
                    Message.Show("Enter No of Pin...!!!");
                }

            }
            else
            {
                Message.Show("Enter transfer user id...!!!");
            }
        }
        else
        {
            Message.Show("Enter user id...!!!");
        }
    }


    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadusername();
    }
    protected void txttransferuserid_TextChanged(object sender, EventArgs e)
    {
        loadtransferusername();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}