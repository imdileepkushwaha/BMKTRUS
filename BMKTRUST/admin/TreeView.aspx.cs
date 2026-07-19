using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DownlineReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objuser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                //txtuserid.Text = Session["useradmin"].ToString();
                //txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    public void Fill_Sub_Heads(string MainID, TreeNode Main_Head_Node)
    {
        DataTable dt = new DataTable();
        objuser.UserId = MainID;
        dt = objuser.FillSubNode(objuser);
        Open_Heads(dt, Main_Head_Node.ChildNodes);
    }
    public void Open_Heads(DataTable dt, TreeNodeCollection node_First)
    {
        foreach (DataRow dr in dt.Rows)
        {
            TreeNode t1 = new TreeNode();
            string userName = Convert.ToString(dr["username"]).Trim();
            string userId = Convert.ToString(dr["userid"]).Trim();
            t1.Text = userName + "  ·  " + userId;
            t1.Value = userId;
            t1.ToolTip = "User ID: " + userId + (string.IsNullOrEmpty(userName) ? "" : " | " + userName);
            node_First.Add(t1);
            t1.PopulateOnDemand = ((int)(dr["Subnode"]) > 0);
        }
    }
    protected void Account_Chart_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    {
        Fill_Sub_Heads(e.Node.Value, e.Node);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            Account_Chart.Nodes.Clear();

            DataTable dattab = new DataTable();
            objuser.UserId = txtuserid.Text;
            dattab = objuser.Find_UserDetail2(objuser).Tables[0];
            Open_Heads(dattab, Account_Chart.Nodes);
            pnllist.Visible = true;
            pnlEmpty.Visible = false;

            if (dattab != null && dattab.Rows.Count > 0)
            {
                string name = Convert.ToString(dattab.Rows[0]["username"]).Trim();
                string id = Convert.ToString(dattab.Rows[0]["userid"]).Trim();
                lblRootUser.Text = string.IsNullOrEmpty(name) ? id : (name + "  ·  " + id);
            }
            else
            {
                lblRootUser.Text = txtuserid.Text.Trim();
            }
        }
        else
        {
            Message.Show("Enter User ID...!!!");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}