using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicTier;

public partial class user_idcard : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objuser = new clsUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                laoddata();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    protected void laoddata()
    {
        objuser.UserId = Session["userid"].ToString();
        DataTable dt = objuser.getUserDetail(objuser);
        Session["dt"] = dt;

        if (dt == null || dt.Rows.Count == 0)
            return;

        DataRow r = dt.Rows[0];

        lbluserid.Text = Dash(Safe(r, "userid"));
        lblusername.Text = Dash(Safe(r, "username"));
        lblmobile.Text = Dash(Safe(r, "mobile"));
        lblemail.Text = Dash(Safe(r, "email"));
        lblgender.Text = Dash(Safe(r, "gender"));
        lbladdress.Text = BuildAddress(r);
        lblstate.Text = Dash(Safe(r, "statename"));
        lblpincode.Text = Dash(Safe(r, "pincode"));
        lblsponsorid.Text = Dash(Safe(r, "sponserid"));
        lblsponsorname.Text = Dash(Safe(r, "Sponsername"));
        lblcity.Text = ResolveCityName(Safe(r, "cityid"), Safe(r, "stateid"));

        ImgMyPhoto.ImageUrl = ResolveMemberPhotoUrl(Safe(r, "PhotoImage"));

        try
        {
            if (!string.IsNullOrWhiteSpace(Safe(r, "regdate")))
                lbljoiningdate.Text = Convert.ToDateTime(r["regdate"]).ToString("dd MMM yyyy");
            else if (!string.IsNullOrWhiteSpace(Safe(r, "mentiondate")))
                lbljoiningdate.Text = Convert.ToDateTime(r["mentiondate"]).ToString("dd MMM yyyy");
            else
                lbljoiningdate.Text = "-";
        }
        catch
        {
            lbljoiningdate.Text = Dash(Safe(r, "regdate"));
        }

        try
        {
            if (!string.IsNullOrWhiteSpace(Safe(r, "dateofbirth")))
                lbldob.Text = Convert.ToDateTime(r["dateofbirth"]).ToString("dd MMM yyyy");
            else
                lbldob.Text = "-";
        }
        catch
        {
            lbldob.Text = Dash(Safe(r, "dateofbirth"));
        }
    }

    string ResolveCityName(string cityId, string stateId)
    {
        if (string.IsNullOrWhiteSpace(cityId) || cityId == "0")
            return "-";

        try
        {
            if (!string.IsNullOrWhiteSpace(stateId) && stateId != "0")
                objState.StateId = stateId;

            DataTable cities = objState.getCity(objState);
            if (cities != null)
            {
                foreach (DataRow row in cities.Rows)
                {
                    if (Convert.ToString(row["CityID"]) == cityId || Convert.ToString(row["CityId"]) == cityId)
                        return Dash(Convert.ToString(row["CityName"]));
                }
            }
        }
        catch { }

        return cityId;
    }

    static string BuildAddress(DataRow r)
    {
        string address = Safe(r, "address");
        string area = Safe(r, "areaname");
        if (!string.IsNullOrWhiteSpace(area) && !address.ToLower().Contains(area.ToLower()))
            address = string.IsNullOrWhiteSpace(address) ? area : (address + ", " + area);
        return Dash(address);
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

    string ResolveMemberPhotoUrl(string photoValue)
    {
        const string defaultAvatar = "~/site/assets/images/default-user.svg";
        if (string.IsNullOrWhiteSpace(photoValue))
            return ResolveUrl(defaultAvatar);

        string value = photoValue.Trim().Replace("\\", "/");

        // Already a usable URL
        if (value.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
            value.StartsWith("https://", StringComparison.OrdinalIgnoreCase) ||
            value.StartsWith("data:", StringComparison.OrdinalIgnoreCase))
        {
            return value;
        }

        if (value.StartsWith("~/"))
            return ResolveUrl(value);

        if (value.StartsWith("../") || value.StartsWith("/"))
            return value;

        // Raw file name from DB (most common when ud.* PhotoImage wins)
        string fileName = value;
        int slash = fileName.LastIndexOf('/');
        if (slash >= 0 && slash < fileName.Length - 1)
            fileName = fileName.Substring(slash + 1);

        if (fileName.Equals("default.png", StringComparison.OrdinalIgnoreCase) ||
            fileName.Equals("img/default.png", StringComparison.OrdinalIgnoreCase))
        {
            return ResolveUrl(defaultAvatar);
        }

        string relative = "~/ProductImage/" + fileName;
        string physical = Server.MapPath(relative);
        if (!string.IsNullOrEmpty(physical) && File.Exists(physical))
            return ResolveUrl(relative);

        return ResolveUrl(defaultAvatar);
    }

    protected void btnprint_Click(object sender, EventArgs e)
    {
        // Kept for compatibility; print is handled client-side via OnClientClick.
    }
}
