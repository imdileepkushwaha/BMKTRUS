using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using DataTier;

namespace BusinessLogicTier
{
    public class clsWebsite
    {
        Data ObjData = new Data();
        static int _schemaVersion;
        const int SchemaVersion = 2;

        public int GalleryId { get; set; }
        public int PopupId { get; set; }
        public string Title { get; set; }
        public string ImagePath { get; set; }
        public string LinkUrl { get; set; }
        public int SortOrder { get; set; }
        public bool IsActive { get; set; }
        public string MentionBy { get; set; }

        public string SiteNameEn { get; set; }
        public string SiteNameHi { get; set; }
        public string Tagline { get; set; }
        public string LogoPath { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string WhatsApp { get; set; }
        public string Email { get; set; }
        public string FacebookUrl { get; set; }
        public string InstagramUrl { get; set; }
        public string TwitterUrl { get; set; }
        public string YoutubeUrl { get; set; }
        public string LinkedInUrl { get; set; }

        public void EnsureSchema()
        {
            if (_schemaVersion >= SchemaVersion) return;
            ObjData.StartConnection();
            try
            {
                string sql = @"
IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'WebsiteSettings')
BEGIN
    CREATE TABLE WebsiteSettings (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        SiteNameEn NVARCHAR(200) NULL,
        SiteNameHi NVARCHAR(200) NULL,
        Tagline NVARCHAR(300) NULL,
        LogoPath NVARCHAR(500) NULL,
        Address NVARCHAR(500) NULL,
        Phone NVARCHAR(50) NULL,
        WhatsApp NVARCHAR(50) NULL,
        Email NVARCHAR(200) NULL,
        FacebookUrl NVARCHAR(500) NULL,
        InstagramUrl NVARCHAR(500) NULL,
        TwitterUrl NVARCHAR(500) NULL,
        YoutubeUrl NVARCHAR(500) NULL,
        LinkedInUrl NVARCHAR(500) NULL,
        UpdatedBy NVARCHAR(100) NULL,
        UpdatedDate DATETIME NULL DEFAULT GETDATE()
    );
    INSERT INTO WebsiteSettings (SiteNameEn, SiteNameHi, Tagline, LogoPath, Address, Phone, WhatsApp, Email,
        FacebookUrl, InstagramUrl, TwitterUrl, YoutubeUrl, LinkedInUrl, UpdatedBy, UpdatedDate)
    VALUES (N'Bharat Manav Kalyan Trust', N'भारत मानव कल्याण ट्रस्ट', N'सेवा • समर्पण • सशक्तिकरण',
        N'site/assets/images/logo.png', N'New Delhi, India', N'+91 98765 43210', N'919876543210',
        N'info@bharatmanavkalyantrust.org', N'https://facebook.com/', N'https://instagram.com/',
        N'https://twitter.com/', N'https://youtube.com/', N'https://linkedin.com/', N'system', GETDATE());
END

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'WebsiteGallery')
BEGIN
    CREATE TABLE WebsiteGallery (
        GalleryId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(200) NOT NULL,
        ImagePath NVARCHAR(500) NOT NULL,
        SortOrder INT NOT NULL DEFAULT 0,
        IsActive BIT NOT NULL DEFAULT 1,
        MentionBy NVARCHAR(100) NULL,
        MentionDate DATETIME NULL DEFAULT GETDATE()
    );
    INSERT INTO WebsiteGallery (Title, ImagePath, SortOrder, IsActive, MentionBy, MentionDate) VALUES
    (N'Faq', N'site/assets/images/gallery/gallery_1783531400_9332b93b.jpg', 1, 1, N'system', GETDATE()),
    (N'About', N'site/assets/images/gallery/gallery_1783531389_e9e31f3d.jpg', 2, 1, N'system', GETDATE()),
    (N'NGO', N'site/assets/images/gallery/gallery_1783531216_f246131a.png', 3, 1, N'system', GETDATE());
END

IF NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'WebsitePopup')
BEGIN
    CREATE TABLE WebsitePopup (
        PopupId INT IDENTITY(1,1) PRIMARY KEY,
        Title NVARCHAR(200) NOT NULL,
        ImagePath NVARCHAR(500) NOT NULL,
        LinkUrl NVARCHAR(500) NULL,
        SortOrder INT NOT NULL DEFAULT 0,
        IsActive BIT NOT NULL DEFAULT 1,
        MentionBy NVARCHAR(100) NULL,
        MentionDate DATETIME NULL DEFAULT GETDATE()
    );
END";
                ObjData.RunInsUpDelQuery(sql);
                _schemaVersion = SchemaVersion;
            }
            catch
            {
                _schemaVersion = 0;
            }
            finally
            {
                ObjData.EndConnection();
            }
        }

        public DataTable GetSettings()
        {
            EnsureSchema();
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable("SELECT TOP 1 * FROM WebsiteSettings ORDER BY Id");
            }
            catch
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public string SaveLogoSettings(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                object count = ObjData.RunSelectQueryTrans("SELECT COUNT(*) FROM WebsiteSettings", tr).Tables[0].Rows[0][0];
                if (Convert.ToInt32(count) == 0)
                {
                    string ins = @"INSERT INTO WebsiteSettings (SiteNameEn, SiteNameHi, Tagline, LogoPath, UpdatedBy, UpdatedDate)
VALUES (@SiteNameEn, @SiteNameHi, @Tagline, @LogoPath, @UpdatedBy, GETDATE())";
                    SqlParameter[] p = {
                        new SqlParameter("@SiteNameEn", (object)obj.SiteNameEn ?? DBNull.Value),
                        new SqlParameter("@SiteNameHi", (object)obj.SiteNameHi ?? DBNull.Value),
                        new SqlParameter("@Tagline", (object)obj.Tagline ?? DBNull.Value),
                        new SqlParameter("@LogoPath", (object)obj.LogoPath ?? DBNull.Value),
                        new SqlParameter("@UpdatedBy", (object)obj.MentionBy ?? DBNull.Value)
                    };
                    RunParamQuery(ins, tr, p);
                }
                else
                {
                    StringBuilder sb = new StringBuilder();
                    sb.Append("UPDATE WebsiteSettings SET SiteNameEn=@SiteNameEn, SiteNameHi=@SiteNameHi, Tagline=@Tagline, UpdatedBy=@UpdatedBy, UpdatedDate=GETDATE()");
                    if (!string.IsNullOrEmpty(obj.LogoPath))
                        sb.Append(", LogoPath=@LogoPath");
                    sb.Append(" WHERE Id = (SELECT TOP 1 Id FROM WebsiteSettings ORDER BY Id)");
                    SqlParameter[] p = {
                        new SqlParameter("@SiteNameEn", (object)obj.SiteNameEn ?? DBNull.Value),
                        new SqlParameter("@SiteNameHi", (object)obj.SiteNameHi ?? DBNull.Value),
                        new SqlParameter("@Tagline", (object)obj.Tagline ?? DBNull.Value),
                        new SqlParameter("@LogoPath", (object)obj.LogoPath ?? DBNull.Value),
                        new SqlParameter("@UpdatedBy", (object)obj.MentionBy ?? DBNull.Value)
                    };
                    RunParamQuery(sb.ToString(), tr, p);
                }
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string SaveContactSettings(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                object count = ObjData.RunSelectQueryTrans("SELECT COUNT(*) FROM WebsiteSettings", tr).Tables[0].Rows[0][0];
                if (Convert.ToInt32(count) == 0)
                {
                    string ins = @"INSERT INTO WebsiteSettings (Address, Phone, WhatsApp, Email, FacebookUrl, InstagramUrl, TwitterUrl, YoutubeUrl, LinkedInUrl, UpdatedBy, UpdatedDate)
VALUES (@Address, @Phone, @WhatsApp, @Email, @FacebookUrl, @InstagramUrl, @TwitterUrl, @YoutubeUrl, @LinkedInUrl, @UpdatedBy, GETDATE())";
                    RunParamQuery(ins, tr, ContactParams(obj));
                }
                else
                {
                    string upd = @"UPDATE WebsiteSettings SET Address=@Address, Phone=@Phone, WhatsApp=@WhatsApp, Email=@Email,
FacebookUrl=@FacebookUrl, InstagramUrl=@InstagramUrl, TwitterUrl=@TwitterUrl, YoutubeUrl=@YoutubeUrl, LinkedInUrl=@LinkedInUrl,
UpdatedBy=@UpdatedBy, UpdatedDate=GETDATE()
WHERE Id = (SELECT TOP 1 Id FROM WebsiteSettings ORDER BY Id)";
                    RunParamQuery(upd, tr, ContactParams(obj));
                }
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        SqlParameter[] ContactParams(clsWebsite obj)
        {
            return new SqlParameter[] {
                new SqlParameter("@Address", (object)obj.Address ?? DBNull.Value),
                new SqlParameter("@Phone", (object)obj.Phone ?? DBNull.Value),
                new SqlParameter("@WhatsApp", (object)obj.WhatsApp ?? DBNull.Value),
                new SqlParameter("@Email", (object)obj.Email ?? DBNull.Value),
                new SqlParameter("@FacebookUrl", (object)obj.FacebookUrl ?? DBNull.Value),
                new SqlParameter("@InstagramUrl", (object)obj.InstagramUrl ?? DBNull.Value),
                new SqlParameter("@TwitterUrl", (object)obj.TwitterUrl ?? DBNull.Value),
                new SqlParameter("@YoutubeUrl", (object)obj.YoutubeUrl ?? DBNull.Value),
                new SqlParameter("@LinkedInUrl", (object)obj.LinkedInUrl ?? DBNull.Value),
                new SqlParameter("@UpdatedBy", (object)obj.MentionBy ?? DBNull.Value)
            };
        }

        void RunParamQuery(string sql, SqlTransaction tr, SqlParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand(sql, tr.Connection, tr);
            if (parameters != null)
            {
                foreach (SqlParameter p in parameters)
                    cmd.Parameters.Add(p);
            }
            cmd.ExecuteNonQuery();
        }

        public DataTable GetGallery(bool activeOnly)
        {
            EnsureSchema();
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                string q = activeOnly
                    ? "SELECT * FROM WebsiteGallery WHERE IsActive=1 ORDER BY SortOrder, GalleryId"
                    : "SELECT * FROM WebsiteGallery ORDER BY SortOrder, GalleryId";
                dt = ObjData.RunDataTable(q);
            }
            catch
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public string InsertGallery(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                string sql = @"INSERT INTO WebsiteGallery (Title, ImagePath, SortOrder, IsActive, MentionBy, MentionDate)
VALUES (@Title, @ImagePath, @SortOrder, @IsActive, @MentionBy, GETDATE())";
                SqlParameter[] p = {
                    new SqlParameter("@Title", (object)obj.Title ?? ""),
                    new SqlParameter("@ImagePath", (object)obj.ImagePath ?? ""),
                    new SqlParameter("@SortOrder", obj.SortOrder),
                    new SqlParameter("@IsActive", obj.IsActive),
                    new SqlParameter("@MentionBy", (object)obj.MentionBy ?? DBNull.Value)
                };
                RunParamQuery(sql, tr, p);
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string UpdateGallery(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("UPDATE WebsiteGallery SET Title=@Title, SortOrder=@SortOrder, IsActive=@IsActive");
                if (!string.IsNullOrEmpty(obj.ImagePath))
                    sb.Append(", ImagePath=@ImagePath");
                sb.Append(" WHERE GalleryId=@GalleryId");
                SqlParameter[] p = {
                    new SqlParameter("@Title", (object)obj.Title ?? ""),
                    new SqlParameter("@SortOrder", obj.SortOrder),
                    new SqlParameter("@IsActive", obj.IsActive),
                    new SqlParameter("@ImagePath", (object)obj.ImagePath ?? DBNull.Value),
                    new SqlParameter("@GalleryId", obj.GalleryId)
                };
                RunParamQuery(sb.ToString(), tr, p);
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string DeleteGallery(int galleryId)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                RunParamQuery("DELETE FROM WebsiteGallery WHERE GalleryId=@GalleryId", tr,
                    new SqlParameter[] { new SqlParameter("@GalleryId", galleryId) });
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataTable GetPopups(bool activeOnly)
        {
            EnsureSchema();
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                string q = activeOnly
                    ? "SELECT * FROM WebsitePopup WHERE IsActive=1 ORDER BY SortOrder, PopupId DESC"
                    : "SELECT * FROM WebsitePopup ORDER BY SortOrder, PopupId DESC";
                dt = ObjData.RunDataTable(q);
            }
            catch
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable GetActivePopup()
        {
            EnsureSchema();
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable("SELECT TOP 1 * FROM WebsitePopup WHERE IsActive=1 ORDER BY SortOrder, PopupId DESC");
            }
            catch
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public string InsertPopup(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                string sql = @"INSERT INTO WebsitePopup (Title, ImagePath, LinkUrl, SortOrder, IsActive, MentionBy, MentionDate)
VALUES (@Title, @ImagePath, @LinkUrl, @SortOrder, @IsActive, @MentionBy, GETDATE())";
                SqlParameter[] p = {
                    new SqlParameter("@Title", (object)obj.Title ?? ""),
                    new SqlParameter("@ImagePath", (object)obj.ImagePath ?? ""),
                    new SqlParameter("@LinkUrl", (object)obj.LinkUrl ?? DBNull.Value),
                    new SqlParameter("@SortOrder", obj.SortOrder),
                    new SqlParameter("@IsActive", obj.IsActive),
                    new SqlParameter("@MentionBy", (object)obj.MentionBy ?? DBNull.Value)
                };
                RunParamQuery(sql, tr, p);
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string UpdatePopup(clsWebsite obj)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("UPDATE WebsitePopup SET Title=@Title, LinkUrl=@LinkUrl, SortOrder=@SortOrder, IsActive=@IsActive");
                if (!string.IsNullOrEmpty(obj.ImagePath))
                    sb.Append(", ImagePath=@ImagePath");
                sb.Append(" WHERE PopupId=@PopupId");
                SqlParameter[] p = {
                    new SqlParameter("@Title", (object)obj.Title ?? ""),
                    new SqlParameter("@LinkUrl", (object)obj.LinkUrl ?? DBNull.Value),
                    new SqlParameter("@SortOrder", obj.SortOrder),
                    new SqlParameter("@IsActive", obj.IsActive),
                    new SqlParameter("@ImagePath", (object)obj.ImagePath ?? DBNull.Value),
                    new SqlParameter("@PopupId", obj.PopupId)
                };
                RunParamQuery(sb.ToString(), tr, p);
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string SetPopupActive(int popupId, bool isActive)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                RunParamQuery("UPDATE WebsitePopup SET IsActive=@IsActive WHERE PopupId=@PopupId", tr,
                    new SqlParameter[] {
                        new SqlParameter("@IsActive", isActive),
                        new SqlParameter("@PopupId", popupId)
                    });
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string DeletePopup(int popupId)
        {
            EnsureSchema();
            string res = "0";
            SqlConnection cn = ObjData.StartConnectionInTransaction();
            SqlTransaction tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                RunParamQuery("DELETE FROM WebsitePopup WHERE PopupId=@PopupId", tr,
                    new SqlParameter[] { new SqlParameter("@PopupId", popupId) });
                tr.Commit();
                res = "t";
            }
            catch
            {
                try { tr.Rollback(); } catch { }
                res = "0";
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public static string DigitsOnly(string value)
        {
            if (string.IsNullOrEmpty(value)) return "";
            StringBuilder sb = new StringBuilder();
            foreach (char c in value)
            {
                if (char.IsDigit(c)) sb.Append(c);
            }
            return sb.ToString();
        }

        public static string WhatsAppLink(string whatsapp)
        {
            string digits = DigitsOnly(whatsapp);
            if (string.IsNullOrEmpty(digits)) return "#";
            return "https://wa.me/" + digits;
        }
    }
}
