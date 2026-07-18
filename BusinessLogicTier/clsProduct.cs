using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DataTier;
using System.Data.SqlClient;

namespace BusinessLogicTier
{
    public class clsProduct
    {
        Data ObjData = new Data();
        public string CategoryId { get; set; }
        public string CategoryName { get; set; }
        public string ProductId { get; set; }
        public string purchasestatus { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public Decimal BV { get; set; }
        public Decimal Amount { get; set; }
        public Decimal GST { get; set; }
        public string Description { get; set; }
        public string HSNCODE { get; set; }
        public string BATCHNO { get; set; }
        public string MentionBy { get; set; }
        public string ProductImage { get; set; }
        public string ProductImage2 { get; set; }
        public string ProductImage3 { get; set; }
        public string Status { get; set; }
        public string PurchaseStatus { get; set; }
        public string UserId { get; set; }
        public Decimal TotalAmount{get;set;}
        public DateTime Fromdate { get; set; }
        public DateTime Todate { get; set; }
        public Decimal MRP { get; set; }
        public string State { get; set; }
        public string City { get; set; }
        public string PinCode { get; set; }
        public string FranchiseeID { get; set; }
        public string PaymentMode { get; set; }
        public string PaymentCode { get; set; }
        public string TransactionCode { get; set; }
        public string QrCode { get; set; }
        public Decimal CashWalletDeduction { get; set; }

        public Decimal PurchaseAmount { get; set; }
        public Decimal CGST { get; set; }
        public Decimal SGST { get; set; }
        public Decimal IGST { get; set; }
        public string CouponCode { get; set; }
        public string tehsilid { get; set; }
        public string marketid { get; set; }
        public string Level { get; set; }

        public DataTable getCategory()
        {
            string str_query = "select * from CategoryMaster order by CategoryName";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getCheckStockfranchisee(string ID, String franchiseeId)
        {
            string str_query = "SELECT ProductID,isnull(Sum(CrQuantity),0) as Cr,isnull(Sum(DrQuantity),0) as Dr FROM FranchiseeStockMaster where ProductId='" + ID + "' and Franchiseeid='" + franchiseeId + "' GROUP BY ProductID ";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getProductForuserPurchase(string UserId)
        {

            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataTable Dt = new DataTable();
            ObjData.StartConnection();
            try
            {
                s2 = "sp_getproductuserpurchase";
                SqlParameter[] parameter = {
                    new SqlParameter("@FranchiseeID",UserId),



                };
                Dt = ObjData.RunDataTableProcedure(s2, parameter);



            }
            catch (Exception ex)
            {

            }
            finally
            {
                ObjData.EndConnection();

            }
            return Dt;
        }

        public DataTable getProductForPurchaseFranchiseeWise(string id)
        {
            string str_query = " SELECT DISTINCT a.productid,b.ProductName FROM FranchiseeStockMaster a LEFT JOIN productmaster b ON a.ProductID=b.ProductId WHERE FranchiseeId='" + id + "' ";
            str_query += " order by a.productid";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }


        public string Insert_Category(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_add_CategoryMaster";
                SqlParameter[] parameter = {  
                new SqlParameter("@CategoryName",objState.CategoryName), 
                new SqlParameter("@MentionBy",objState.MentionBy)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_Category(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "update CategoryMaster set CategoryName='" + objState.CategoryName + "' where CategoryId='" + objState.CategoryId + "'";

                ObjData.RunInsUpDelQueryTrans(s2, tr);
                res = "t";
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable ProductPageWiseoutside(int pageindex, int pageSize)
        {
            DataTable Dt = new DataTable();
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "GetProductPageWiseoutside";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@PageIndex",pageindex), 
                new SqlParameter("@PageSize",pageSize), 
                 new SqlParameter("@RecordCount",4)                 
                };
                Dt = ObjData.RunDataTableProcedureTRansGetPage(s2, tr, parameter);

                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return Dt;
        }
        public DataTable getProductnewnew(clsProduct objstate)
        {
            string str_query = "select sm.*,cm.categoryname,('ProductImage/'+ sm.productimage) as Image,('ProductImage/'+ sm.productimage2) as Image2,('ProductImage/'+ sm.productimage3) as Image3  from ProductMaster sm left join CategoryMaster cm on sm.CategoryId=cm.CategoryId where sm.productId='" + objstate.ProductId + "'  order by ProductName,cm.categoryname";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getProductAll(clsProduct objP)
        {
            string str_query = "select row_number() over(order by ProductName,cm.categoryname) as srno,sm.*,cm.categoryname,('../ProductImage/'+ sm.productimage) as Image,case when sm.status=1 then 'Active' else 'Deactive' end as status1,case when sm.purchasestatus=0 then 'Open' else 'Sold' end as purchaseStatus1,('../ProductImage/'+ sm.ProductImage2) as Image2,('../ProductImage/'+ sm.productimage3) as Image3,Bv     from ProductMaster sm left join CategoryMaster cm on sm.CategoryId=cm.CategoryId  where 1=1 ";

            if (objP.ProductName != String.Empty)
            {
                str_query += " and ProductName like '% "+objP.ProductName+" %' ";
            }
            if (objP.Status != string.Empty)
            {
                str_query += " and Status='"+objP.Status+"'";
            }
            if (objP.PurchaseStatus != string.Empty)
            {
                str_query += " and PurchaseStatus='" + objP.PurchaseStatus + "'";
            }
            if (objP.ProductId != string.Empty)
            {
                str_query += " and productId='" + objP.ProductId + "'";
            }
            str_query += " order by ProductName,cm.categoryname";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getProductForPurchase()
        {
            string str_query = "SELECT ProductId,Productname,CASE WHEN productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ productimage END AS [Image] FROM ProductMaster   where 1=1 ";           
            str_query += " order by ProductName";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getProductForPurchaseselect(string ID)
        {

            string str_query = "SELECT ProductId,Productname,CASE WHEN productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ productimage END AS [Image],MRP,Amount,bv,GST FROM ProductMaster   where 1=1 and ProductId='" + ID + "' ";
            str_query += " order by ProductName";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getCheckStock(string ID)
        {
            string str_query = "SELECT ProductID,isnull(Sum(CrQuantity),0) as Cr,isnull(Sum(DrQuantity),0) as Dr FROM StockMaster where ProductId='" + ID + "' GROUP BY ProductID ";          
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getProductAllhome(int start,int end)
        {
            string str_query = "WITH OrderedOrders AS ( select ROW_NUMBER() OVER (ORDER BY [ProductID] Desc) AS RowNumber, ProductId,substring(productname,0,20) as ProductName,amount,case when productimage='' then 'ProductImage/images.png' else 'ProductImage/'+ productimage end as Image from ProductMaster ) SELECT RowNumber, ProductId, ProductName,  Image,amount  FROM   OrderedOrders WHERE RowNumber BETWEEN " + start + " AND " + end + "";         
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
       
        public DataTable getProduct(clsProduct objstate)
        {
            string str_query = "select sm.*,cm.categoryname,('../ProductImage/'+ sm.productimage) as Image,('../ProductImage/'+ sm.productimage2) as Image2,('../ProductImage/'+ sm.productimage3) as Image3,(select isnull(Sum(CrQuantity),0) -isnull(Sum(DrQuantity),0) FROM StockMaster where ProductId=sm.productId ) as stock from ProductMaster sm left join CategoryMaster cm on sm.CategoryId=cm.CategoryId where sm.productId='" + objstate.ProductId + "'  order by ProductName,cm.categoryname";

            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string Update_Product(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "Select * from ProductMaster where ProductId='" + objState.ProductId + "' ";//and PurchaseStatus='0'";
                DataSet Ds = ObjData.RunSelectQueryTrans(s2, tr);
                if (Ds.Tables[0].Rows.Count == 1)
                {
                    s2 = "update ProductMaster set ProductName='" + objState.ProductName + "',Description='" + objState.Description + "',amount='" + objState.Amount + "',status='" + objState.Status + "',BV='"+objState.BV+"',MRP='"+objState.MRP+"'  where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);
                    if (objState.ProductImage != "")
                    {
                        s2 = "update ProductMaster set ProductImage='" + objState.ProductImage + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }
                    if (objState.ProductImage2 != "")
                    {
                        s2 = "update ProductMaster set ProductImage2='" + objState.ProductImage2 + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }
                    if (objState.ProductImage3 != "")
                    {
                        s2 = "update ProductMaster set ProductImage3='" + objState.ProductImage3 + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }

                    res = "t";
                    tr.Commit();
                }
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_ProductStatus(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

               
                    s2 = "update ProductMaster set  status='" + objState.Status + "' where ProductId='" + objState.ProductId + "'";                 

                    ObjData.RunInsUpDelQueryTrans(s2, tr);
                    res = "t";
                    tr.Commit();
                
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Insert_Product(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            
            try
            {
                s2 = "sp_add_Product";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@CategoryID",objState.CategoryId), 
                new SqlParameter("@ProductName",objState.ProductName), 
                 new SqlParameter("@Amount",objState.Amount), 
                  new SqlParameter("@Description",objState.Description), 
                new SqlParameter("@MentionBy",objState.MentionBy),
                 new SqlParameter("@ProductImage",objState.ProductImage),
                   new SqlParameter("@ProductImage2",objState.ProductImage2),
                     new SqlParameter("@ProductImage3",objState.ProductImage3),
                      new SqlParameter("@BV",objState.BV),
                        new SqlParameter("@GST",objState.GST),
                          new SqlParameter("@HSNCODE",objState.HSNCODE),
                            new SqlParameter("@BATCHNO",objState.BATCHNO),
                       
                       new SqlParameter("@MRP",objState.MRP)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable ProductPageWiseOld(int pageindex,int pageSize)
        {
            DataTable Dt = new DataTable();
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "GetProductPageWise";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@PageIndex",pageindex), 
                new SqlParameter("@PageSize",pageSize), 
                 new SqlParameter("@RecordCount",4)                 
                };
                Dt = ObjData.RunDataTableProcedureTRansGetPage(s2, tr, parameter);
                
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return Dt;
        }

        public DataTable ProductPageWise(int pageindex, int pageSize,clsProduct obj)
        {
            DataTable Dt = new DataTable();
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "GetProductPageWise";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@PageIndex",pageindex), 
                new SqlParameter("@PageSize",pageSize), 
                new SqlParameter("@State",obj.State), 
                new SqlParameter("@City",obj.City), 
                new SqlParameter("@FID",obj.FranchiseeID), 
                new SqlParameter("@Pincode",obj.PinCode), 
                 new SqlParameter("@RecordCount",4)                 
                };
                Dt = ObjData.RunDataTableProcedureTRansGetPage(s2, tr, parameter);

                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return Dt;
        }

        public DataTable FranchiseePageWise(int pageindex, int pageSize, clsProduct obj)
        {
            DataTable Dt = new DataTable();
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {  
                s2 = "GetFranchiseePageWise";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@PageIndex",pageindex), 
                new SqlParameter("@PageSize",pageSize), 
                new SqlParameter("@State",obj.State), 
                new SqlParameter("@City",obj.City), 
                 new SqlParameter("@TehsilId",obj.tehsilid), 
                  new SqlParameter("@marketId",obj.marketid), 
                new SqlParameter("@FID",obj.FranchiseeID), 
                new SqlParameter("@Pincode",obj.PinCode), 
                 new SqlParameter("@RecordCount",4)                 
                };
                Dt = ObjData.RunDataTableProcedureTRansGetPage(s2, tr, parameter);

                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return Dt;
        }

 public DataTable getProductForPurchaseselectNew(string ID)
        {

            string str_query = "SELECT ProductId,Productname,CASE WHEN productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ productimage END AS [Image],MRP,Amount,bv,GST,DP FROM ProductMaster   where 1=1 and ProductId='" + ID + "' ";
            str_query += " order by ProductName";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public string  AddPurchase(clsProduct objP,DataTable Dt)
        {
            int i = 0;
            
            string res = "";
            string s2 = "";
            string ChkStock = "1";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                //foreach (DataRow Dr in Dt.Rows)
                //{
                //    string Q = "select isnull(Sum(CrQuantity),0) -isnull(Sum(DrQuantity),0) FROM StockMaster where ProductId='" + Dr["ProductId"].ToString() + "'";
                //    DataSet Ds = ObjData.RunSelectQueryTrans(Q, tr);
                //    if (Convert.ToInt32(Dr["Quantity"].ToString()) > Convert.ToInt32(Ds.Tables[0].Rows[0][0].ToString()))
                //    {
                //        ChkStock = "0";
                //    }
                //}
                if (ChkStock == "1")
                {
                    s2 = "sp_add_Purchase";
                    SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objP.UserId), 
                    new SqlParameter("@TotalAmount",objP.TotalAmount), 
                    new SqlParameter("@PurchaseProduct",Dt),
                   
                };
                    DataTable Dtresult = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                    res = Dtresult.Rows[0][1].ToString();

                    tr.Commit();
                }
                else
                {
                    res = "3";
                }
          


            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
       
        }

        public string GetTransactionCode()
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                    s2 = " SELECT dbo.fn_TransactionID() ";
                    DataTable dt = ObjData.RunSelectQueryTTrans(s2, tr);
                    res = dt.Rows[0][0].ToString();
                    tr.Commit();
            }
            catch (Exception ex)
            {
                res = "";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;


        }

        public DataTable AddPurchaseNew(clsProduct objP, DataTable Dt)
        {
            int i = 0;
            DataTable Dtresult = new DataTable();
            string res = "";
            string s2 = "";
            string ChkStock = "1";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {

                //foreach (DataRow Dr in Dt.Rows)
                //{
                //    string Q = "select isnull(Sum(CrQuantity),0) -isnull(Sum(DrQuantity),0) FROM StockMaster where ProductId='" + Dr["ProductId"].ToString() + "'";
                //    DataSet Ds = ObjData.RunSelectQueryTrans(Q, tr);
                //    if (Convert.ToInt32(Dr["Quantity"].ToString()) > Convert.ToInt32(Ds.Tables[0].Rows[0][0].ToString()))
                //    {
                //        ChkStock = "0";
                //    }
                //}
                if (ChkStock == "1")
                {

                    s2 = "sp_add_Purchase_new";
                    SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objP.UserId), 
                    new SqlParameter("@TotalAmount",objP.TotalAmount), 
                    new SqlParameter("@CashWalletAmount",objP.CashWalletDeduction), 
                    new SqlParameter("@FID",objP.FranchiseeID), 
                    new SqlParameter("@PaymentMode",objP.PaymentMode), 
                    new SqlParameter("@PurchaseProduct",Dt),
                    new SqlParameter("@QrCode",objP.QrCode), 
                    new SqlParameter("@CouponCode",objP.CouponCode), 
                    new SqlParameter("@PaymentCode",objP.PaymentCode), 
                    new SqlParameter("@TransactionCode",objP.TransactionCode), 
                   
                };
                    Dtresult = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                    res = Dtresult.Rows[0][1].ToString();

                    if (res == "1")
                        tr.Commit();
                    else
                        tr.Rollback();
                }
                else
                {
                    res = "3";
                }



            }
            catch (Exception ex)
            {
                res = "0";
                Dtresult = null;
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return Dtresult;

        }

        public string Insert_ComingProduct(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_add_ComingProduct";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@CategoryID",objState.CategoryId), 
                new SqlParameter("@ProductName",objState.ProductName), 
                 new SqlParameter("@Amount",objState.Amount), 
                  new SqlParameter("@Description",objState.Description), 
                new SqlParameter("@MentionBy",objState.MentionBy),
                 new SqlParameter("@ProductImage",objState.ProductImage),
                   new SqlParameter("@ProductImage2",objState.ProductImage2),
                     new SqlParameter("@ProductImage3",objState.ProductImage3),
                      new SqlParameter("@BV",objState.BV),
                       new SqlParameter("@MRP",objState.MRP)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string AprovePurchase(clsProduct objP)
        {
            int i = 0;
            DataTable Dtresult = new DataTable();
            string res = "";
            string s2 = "";
            string ChkStock = "1";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {



                    s2 = "sp_ApproveShoppingOrder";
                    SqlParameter[] parameter = {              
                    new SqlParameter("@FId",objP.FranchiseeID), 
                    new SqlParameter("@UserId",objP.UserId), 
                    new SqlParameter("@TransactionCode",objP.TransactionCode), 
                    new SqlParameter("@Status",objP.Status)
                     };
                    Dtresult = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);

                    
                    res = Dtresult.Rows[0][0].ToString();
                    if (res == "1")
                    {
                        tr.Commit();
                    }
                    else
                    {
                        res = "0";
                        tr.Rollback();
                    }

            }
            catch (Exception ex)
            {
                res = "0";
                Dtresult = null;
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;

        }


        public DataTable getPurchaseProduct(clsProduct objstate)
        {
            string str_query = " SELECT PR.PurchaseID,PR.PurchaseDate,P.ProductName,CASE WHEN P.productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ P.productimage END AS [Image],PR.Quantity,PR.Amount,PR.TotalAmount,PR.PurchaseBy AS UserID,U.UserName,PR.QrCode,PR.PaymentCode,PR.TRANSACTIONCode,PR.FranchiseeId,sm.StateId,cm.CityId,fd.UserName AS FranchiseeName,pm.type AS PaymentMode, iif(isnull(PR.Pstatus,0)=1,'Paid','Due') AS PStatus,(CASE WHEN isnull(PR.Rstatus,0)=0 THEN 'NotDelivered' WHEN isnull(PR.Rstatus,0)=1 THEN 'Delivered' ELSE 'Rejected' end)  AS RStatus FROM PurchaseProductMaster PR INNER  JOIN ProductMaster P ON PR.ProductID=P.ProductID INNER JOIN Userdetail U ON PR.PurchaseBy=U.UserId JOIN franchiseedetail fd ON PR.FranchiseeId=fd.id JOIN citymaster cm ON fd.CityId=cm.CityId JOIN statemaster sm ON cm.StateId=sm.StateId JOIN master_paymentmode pm ON PR.PaymentMode=pm.id  where 1=1 ";

            if (objstate.Fromdate != DateTime.MinValue)
            {
                str_query += " and PR.PurchaseDate>='"+objstate.Fromdate+"'";
            }
            if (objstate.Todate != DateTime.MinValue)
            {
                str_query += " and PR.PurchaseDate<='" + objstate.Todate + "'";
            }
            if (objstate.UserId != null && objstate.UserId != string.Empty)
            {
                str_query += " and PR.PurchaseBy='" + objstate.UserId + "'";
            }
            if (objstate.FranchiseeID != null && objstate.FranchiseeID != string.Empty)
            {
                str_query += " and PR.FranchiseeId='" + objstate.FranchiseeID + "'";
            }
            if (objstate.TransactionCode != null && objstate.TransactionCode != string.Empty)
            {
                str_query += " and PR.TRANSACTIONCode='" + objstate.TransactionCode + "'";
            }
            str_query += " order by PR.PurchaseID";
            DataTable dt = null;
            
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getPurchaseProductnew(clsProduct objstate)
        {
            //string str_query = "SELECT PR.PurchaseID,PR.PurchaseDate,P.ProductName,CASE WHEN P.productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ P.productimage END AS [Image],PR.Quantity,PR.Amount,PR.TotalAmount,PR.PurchaseBy AS UserID,U.UserName FROM PurchaseProductMaster PR INNER  JOIN ProductMaster P ON PR.ProductID=P.ProductID INNER JOIN Userdetail U ON PR.PurchaseBy=U.UserId where 1=1 ";
            string str_query = "SELECT PR.PurchaseID,PR.PurchaseDate,P.ProductName,P.MRP As BV,CASE WHEN P.productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ P.productimage END AS [Image],(SELECT isnull(Sum(CrQuantity),0) -isnull(Sum(DrQuantity),0) as Stock FROM StockMaster where ProductId=PR.ProductID) as Stock, PR.Quantity,PR.Amount,PR.TotalAmount,PR.PurchaseBy AS UserID,U.UserName,PR.ProductID FROM PurchaseProductMaster PR INNER  JOIN ProductMaster P ON PR.ProductID=P.ProductID INNER JOIN Userdetail U ON PR.PurchaseBy=U.UserId where 1=1";


            if (objstate.UserId != string.Empty)
            {
                str_query += " and PR.PurchaseBy='" + objstate.UserId + "'";
            }
            if (objstate.CategoryId != string.Empty)
            {
                str_query += " and PR.PurchaseID='" + objstate.CategoryId + "'";
            }
            str_query += " order by PR.PurchaseID";
            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }


        public DataTable getPurchaseProductForApproval(clsProduct objstate)
        {
            string str_query = " SELECT PR.PurchaseID,PR.PurchaseDate,sum(PR.Quantity) AS Quantity,sum(PR.TotalAmount) AS TotalAmount,PR.PurchaseBy AS UserID,U.UserName,PR.QrCode,PR.PaymentCode,PR.TRANSACTIONCode,PR.FranchiseeId,sm.StateId,cm.CityId,fd.UserName AS FranchiseeName,pm.type AS PaymentMode, iif(isnull(PR.Pstatus,0)=1,'Paid','Due') AS PStatus,(case when isnull(PR.Rstatus,0) = 0 then 'NotDelivered' when isnull(PR.Rstatus,0) = 1 then 'Delivered' else 'Rejected' end) AS RStatus FROM PurchaseProductMaster PR INNER  JOIN ProductMaster P ON PR.ProductID=P.ProductID INNER JOIN Userdetail U  ON PR.PurchaseBy=U.UserId JOIN franchiseedetail fd ON PR.FranchiseeId=fd.id JOIN citymaster cm ON fd.CityId=cm.CityId  JOIN statemaster sm ON cm.StateId=sm.StateId JOIN master_paymentmode pm ON PR.PaymentMode=pm.id  where 1=1 ";
            if (objstate.Fromdate != DateTime.MinValue)
            {
                str_query += " and cast(PR.PurchaseDate as date)>='" + objstate.Fromdate + "'";
            }
            if (objstate.Todate != DateTime.MinValue)
            {
                str_query += " and cast(PR.PurchaseDate as date)<='" + objstate.Todate + "'";
            }
            if (objstate.UserId != string.Empty)
            {
                str_query += " and PR.PurchaseBy='" + objstate.UserId + "'";
            }
            if (objstate.FranchiseeID != string.Empty)
            {
                str_query += " and PR.FranchiseeId='" + objstate.FranchiseeID + "'";
            }
            if (objstate.TransactionCode != string.Empty)
            {
                str_query += " and PR.TRANSACTIONCode='" + objstate.TransactionCode + "'";
            }
            if (objstate.Status != string.Empty)
            {
                str_query += " and isnull(PR.Rstatus,0)='" + objstate.Status + "'";
            }
            if (objstate.PaymentCode != string.Empty)
            {
                str_query += " and PR.PaymentCode='" + objstate.PaymentCode + "'";
            }
            str_query += " GROUP BY PR.PurchaseID,PR.PurchaseDate,PR.PurchaseBy,U.UserName,PR.QrCode,PR.PaymentCode,PR.TRANSACTIONCode,PR.FranchiseeId,sm.StateId,cm.CityId,fd.UserName,pm.type,PR.Pstatus,PR.Rstatus order by PR.PurchaseID";
            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }



        public DataTable getPurchaseProductQuantity(clsProduct objstate)
        {
            string str_query = "SELECT PU.PurchaseId,Sum(PU.TotalAmount) AS TotalAmount,PU.Purchaseby AS UserId,Convert(CHAR,PU.PurchaseDate,103) AS PurchaseDate,(SELECT Username FROM UserDetail WHERE UserId=PU.Purchaseby) AS Username,(SELECT Email FROM UserDetail WHERE UserId=PU.Purchaseby) AS EmailId,(SELECT Mobile FROM UserDetail WHERE UserId=PU.Purchaseby) AS ContactNo,(SELECT Address+' '+C.CityName+' '+S.StateName+' '+U.Pincode FROM UserDetail U INNER JOIN CityMaster C ON U.CityId=C.CityId INNER JOIN StateMaster S on S.Stateid=C.StateId   WHERE UserId=PU.Purchaseby) AS address,(Select top 1 isnull(invoicestatus,0) from PurchaseProductMaster where purchaseId=PU.purchaseId) as InvoiceStatus  FROM   PurchaseProductMaster PU  where 1=1 ";

            if (objstate.Fromdate != DateTime.MinValue)
            {
                str_query += " and PU.PurchaseDate>='" + objstate.Fromdate + "'";
            }
            if (objstate.Todate != DateTime.MinValue)
            {
                str_query += " and PU.PurchaseDate<='" + objstate.Todate + "'";
            }
            if (objstate.UserId != string.Empty)
            {
                str_query += " and PU.PurchaseBy='" + objstate.UserId + "'";
            }
            str_query += "GROUP BY PU.PurchaseId,PU.Purchaseby,Convert(CHAR,PU.PurchaseDate,103)";
            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
       
        public DataTable getPurchaseProductQuantityChild(string ID)
        {
            string str_query = "SELECT PR.PurchaseID,PR.PurchaseDate,P.ProductName,CASE WHEN P.productimage='' THEN '../ProductImage/images.png' ELSE  '../ProductImage/'+ P.productimage END AS [Image],PR.Quantity,PR.Amount,PR.TotalAmount,PR.PurchaseBy AS UserID,PR.ProductID FROM PurchaseProductMaster PR INNER  JOIN ProductMaster P ON PR.ProductID=P.ProductID  where 1=1 ";


            if (ID != string.Empty)
            {
                str_query += " and PR.PurchaseID='" + ID + "'";
            }
            str_query += " order by PR.PurchaseID";
            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getFranchiseeBV(clsProduct objstate)
        {
            string str_query = "Get_FranchiseePV";
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@fdate",objstate.Fromdate),
                new SqlParameter("@tdate", objstate.Todate),
                new SqlParameter("@userid",objstate.FranchiseeID),
            };

            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTableProcedure(str_query, param);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable getUserBV(clsProduct objstate)
        {
            string str_query = "Get_UserBV";
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@fdate",objstate.Fromdate),
                new SqlParameter("@tdate", objstate.Todate),
                new SqlParameter("@fuserid",objstate.FranchiseeID),
                new SqlParameter("@userid",objstate.UserId),
                new SqlParameter("@Status",objstate.Status),
                 new SqlParameter("@Lvl", objstate.Level),
               
            };

            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTableProcedure(str_query, param);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable getUserBVPage(clsProduct objstate,string noofrows)
        {
            string str_query = "Get_UserBVNew";
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@fdate",objstate.Fromdate),
                new SqlParameter("@tdate", objstate.Todate),
                new SqlParameter("@fuserid",objstate.FranchiseeID),
                new SqlParameter("@userid",objstate.UserId),
                new SqlParameter("@Status",objstate.Status),
                 new SqlParameter("@Lvl", objstate.Level),
                  new SqlParameter("@rows", noofrows == "" ? null :noofrows),
               
            };

            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTableProcedure(str_query, param);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable Get_UserReferalBV(clsProduct objstate)
        {
            string str_query = "Get_UserReferalBV";
            SqlParameter[] param = new SqlParameter[]{
                new SqlParameter("@fdate",objstate.Fromdate),
                new SqlParameter("@tdate", objstate.Todate),
                new SqlParameter("@fuserid",objstate.FranchiseeID),
                new SqlParameter("@userid",objstate.UserId),
                new SqlParameter("@Status",objstate.Status),
                  new SqlParameter("@Lvl", objstate.Level),
            };

            DataTable dt = null;

            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTableProcedure(str_query, param);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

        public DataTable GetImages(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataTable ds = new DataTable();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_AddImages";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@id",objState.CategoryId), 
                new SqlParameter("@Image",objState.ProductImage), 
                 new SqlParameter("@ProductId",objState.ProductId), 
                  new SqlParameter("@status",objState.Status), 
                 new SqlParameter("@query","Select")
                };
                ds = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                ds = null;
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return ds;
        }

        public string Insert_Videos(clsProduct objState, string query)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_AddVideos";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@id",objState.CategoryId), 
                new SqlParameter("@VideoUrl",objState.ProductImage), 
                 new SqlParameter("@title",objState.ProductName), 
                 new SqlParameter("@description",objState.Description), 
                  new SqlParameter("@status",objState.Status), 
                 new SqlParameter("@query",query)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataTable GetVideos(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataTable ds = new DataTable();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "sp_AddVideos";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@id",objState.CategoryId), 
                new SqlParameter("@VideoUrl",objState.ProductImage), 
                 new SqlParameter("@title",objState.ProductName), 
                 new SqlParameter("@description",objState.Description), 
                  new SqlParameter("@status",objState.Status), 
                 new SqlParameter("@query","Select")
                };
                ds = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                ds = null;
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return ds;
        }
        public DataTable getComingProductAll(clsProduct objP)
        {
            string str_query = "select row_number() over(order by ProductName,cm.categoryname) as srno,sm.*,cm.categoryname,('../ProductImage/'+ sm.productimage) as Image,case when sm.status=1 then 'Active' else 'Deactive' end as status1,case when sm.purchasestatus=0 then 'Open' else 'Sold' end as purchaseStatus1,('../ProductImage/'+ sm.ProductImage2) as Image2,('../ProductImage/'+ sm.productimage3) as Image3,Bv     from ComingProduct_Master sm left join CategoryMaster cm on sm.CategoryId=cm.CategoryId  where 1=1 ";

            if (objP.ProductName != String.Empty)
            {
                str_query += " and ProductName like '% " + objP.ProductName + " %' ";
            }
            if (objP.Status != string.Empty)
            {
                str_query += " and Status='" + objP.Status + "'";
            }
            if (objP.PurchaseStatus != string.Empty)
            {
                str_query += " and PurchaseStatus='" + objP.PurchaseStatus + "'";
            }
            if (objP.ProductId != string.Empty)
            {
                str_query += " and productId='" + objP.ProductId + "'";
            }
            str_query += " order by ProductName,cm.categoryname";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string Insert_Images(clsProduct objState, string query)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "sp_AddImages";
                SqlParameter[] parameter = {                                              
                new SqlParameter("@id",objState.CategoryId), 
                new SqlParameter("@Image",objState.ProductImage), 
                 new SqlParameter("@ProductId",objState.ProductId), 
                  new SqlParameter("@status",objState.Status), 
                 new SqlParameter("@query",query)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Update_ComingProduct(clsProduct objState)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = "Select * from ComingProduct_Master where ProductId='" + objState.ProductId + "' ";//and PurchaseStatus='0'";
                DataSet Ds = ObjData.RunSelectQueryTrans(s2, tr);
                if (Ds.Tables[0].Rows.Count == 1)
                {
                    s2 = "update ComingProduct_Master set ProductName='" + objState.ProductName + "',Description='" + objState.Description + "',amount='" + objState.Amount + "',status='" + objState.Status + "',BV='" + objState.BV + "',MRP='" + objState.MRP + "'  where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);
                    if (objState.ProductImage != "")
                    {
                        s2 = "update ComingProduct_Master set ProductImage='" + objState.ProductImage + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }
                    if (objState.ProductImage2 != "")
                    {
                        s2 = "update ComingProduct_Master set ProductImage2='" + objState.ProductImage2 + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }
                    if (objState.ProductImage3 != "")
                    {
                        s2 = "update ComingProduct_Master set ProductImage3='" + objState.ProductImage3 + "' where ProductId='" + objState.ProductId + "'";// and PurchaseStatus='0'";
                        ObjData.RunInsUpDelQueryTrans(s2, tr);
                    }

                    res = "t";
                    tr.Commit();
                }
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string GetUpdateBannerStatus(string query, int status)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "U_S_Banner";
                SqlParameter[] parameter = {                                              
                  new SqlParameter("@status",status), 
                 new SqlParameter("@query",query)
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string Deleteimageslider(int id)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = " DELETE FROM ImageMaster WHERE id='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                tr.Commit();

                res = "t";
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public string DeleteVideo(int id)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = " DELETE FROM VideosMaster WHERE id='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                tr.Commit();

                res = "t";
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string DeleteComingProducts(int id)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = " INSERT INTO ComingProduct_MasterHistory SELECT * FROM ComingProduct_Master WHERE ProductId='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);

                s2 = " DELETE FROM ComingProduct_Master WHERE ProductId='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                tr.Commit();

                res = "t";
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public string DeleteCoupon(int id)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {

                s2 = " SELECT * FROM tbl_CouponAssignment WHERE couponid='" + id + "' ";
                DataTable dt = ObjData.RunSelectQueryTTrans(s2, tr);

                if (dt == null || dt.Rows.Count == 0)
                {
                    s2 = " INSERT INTO tbl_CouponHistory SELECT amount, fromdate, todate, entrydate, status, minshopamount, Code, EntryBy FROM tbl_Coupon WHERE id='" + id + "' ";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);

                    s2 = " DELETE FROM dbo.tbl_Coupon WHERE id = '" + id + "' ";
                    ObjData.RunInsUpDelQueryTrans(s2, tr);

                    tr.Commit();
                    res = "t";

                }
                else
                {
                    tr.Rollback();
                    res = "f";
                }
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }

        public DataTable getProductForPurchaseVendorWise(string id)
        {
            string str_query = " SELECT DISTINCT a.productid,b.ProductName FROM FranchiseeStockMaster a LEFT JOIN productmaster b ON a.ProductID=b.ProductId WHERE VendorPurchaseID='" + id + "' ";
            str_query += " order by a.productid";
            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }

    }
}
