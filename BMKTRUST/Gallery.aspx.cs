using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;

public partial class GalleryPage : Page
{
    clsWebsite objWeb = new clsWebsite();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var master = Master as SiteMaster;
            if (master != null)
                master.SetPageTitle("Gallery — Bharat Manav Kalyan Trust");

            BindGallery();
        }
    }

    void BindGallery()
    {
        try
        {
            DataTable gallery = objWeb.GetGallery(true);
            bool hasRows = gallery != null && gallery.Rows.Count > 0;
            pnlEmpty.Visible = !hasRows;
            rptGalleryAll.DataSource = hasRows ? gallery : null;
            rptGalleryAll.DataBind();
        }
        catch
        {
            pnlEmpty.Visible = true;
            rptGalleryAll.DataSource = null;
            rptGalleryAll.DataBind();
        }
    }
}
