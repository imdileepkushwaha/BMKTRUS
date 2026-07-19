<%@ Page Title="Franchisee Purchase Detail" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseePurchaseDetail.aspx.cs" Inherits="FranchiseePurchaseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Franchisee Purchase Detail</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee Management</a></li>
            <li class="active">Franchisee Purchase Detail</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page adm-purchase-detail-page">
                <div class="row">

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>From Date</label>
                                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="Select from date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>To Date</label>
                                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="Select to date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Franchisee ID</label>
                                            <asp:TextBox ID="TxtFranchiseeId" runat="server" CssClass="form-control" placeholder="Enter franchisee ID" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Purchase Results</h3>
                                <span class="adm-code-pill">Expand row for products</span>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%"
                                        AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"
                                        DataKeyNames="PurchaseID" EmptyDataText="No purchase records found. Adjust filters and search." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <img alt="Expand" class="adm-expand-toggle" style="cursor: pointer" src="img/PLUS.jpg" title="Show products" />
                                                    <asp:Panel ID="pnlOrders" runat="server" Style="display: none">
                                                        <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover dataTable adm-nested-grid">
                                                            <Columns>
                                                                <asp:BoundField ItemStyle-Width="120px" DataField="ProductID" HeaderText="Product Code" />
                                                                <asp:TemplateField HeaderText="Image">
                                                                    <ItemTemplate>
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="40px" Width="40px" CssClass="img-rounded" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField ItemStyle-Width="150px" DataField="ProductName" HeaderText="Product Name" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="MRP" HeaderText="MRP" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="Quantity" HeaderText="Quantity" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="BV" HeaderText="BV" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="DP" HeaderText="DP" />
                                                                <asp:BoundField ItemStyle-Width="110px" DataField="PurchaseAmount" HeaderText="Purchase Amount" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="CGST" HeaderText="CGST" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="SGST" HeaderText="SGST" />
                                                                <asp:BoundField ItemStyle-Width="90px" DataField="IGST" HeaderText="IGST" />
                                                                <asp:BoundField ItemStyle-Width="100px" DataField="TotalDP" HeaderText="Total DP" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <HeaderStyle Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Purchase Id">
                                                <ItemTemplate>
                                                    <span class="adm-code-pill">
                                                        <asp:Label ID="lbluserid123" runat="server" Text='<%# Eval("PurchaseID") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Franchisee ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFranchiseeID" runat="server" Text='<%# Eval("FranchiseeID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Franchisee Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Franchisee Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Purchase Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridEmailId" runat="server" Text='<%# Eval("PurchaseAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CGST">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridContactNo" runat="server" Text='<%# Eval("CGST") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="SGST">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridaddress" runat="server" Text='<%# Eval("SGST") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IGST">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("IGST") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total DP">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid3" runat="server" Text='<%# Eval("TotalDP") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid2" runat="server" Text='<%# Eval("TotalAmount") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="LblTotalBV" runat="server" Text='<%# Eval("TotalBV") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payment">
                                                <ItemTemplate>
                                                    <div class="adm-payment-meta">
                                                        <span><strong>Discount</strong> <asp:Label ID="lblCash" runat="server" Text='<%# Eval("Cash") %>'></asp:Label></span>
                                                        <span><strong>Payable</strong> <asp:Label ID="LblRestAmount" runat="server" Text='<%# Eval("restamount") %>'></asp:Label></span>
                                                        <span><strong>Mode</strong> <asp:Label ID="LblPaymentmode" runat="server" Text='<%# Eval("Paymentmode") %>'></asp:Label></span>
                                                        <span><strong>Txn</strong> <asp:Label ID="LblChequeno" runat="server" Text='<%# Eval("Chequeno") %>'></asp:Label></span>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Purchase Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldate" runat="server" Text='<%# Eval("Purchasedate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnApprove" CommandName="approve" OnClick="btnApprove_click" runat="server" CssClass="adm-action-btn" ToolTip="Approve">
                                                        <i class="fa fa-check"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="btnReject" CommandName="reject" OnClick="btnReject_click" runat="server" CssClass="adm-action-btn-danger" ToolTip="Reject">
                                                        <i class="fa fa-times"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Invoice">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text="Invoice" CssClass="btn btn-xs btn-primary"
                                                        NavigateUrl='<%# string.Format("FranchiseeInvoice.aspx?OrderNo={0}", HttpUtility.UrlEncode(Eval("PurchaseID").ToString())) %>'
                                                        Target="_blank"></asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function bindPurchaseExpand() {
            $(document).off('click.purchaseExpand', '[src*=PLUS], .adm-expand-toggle[src*=PLUS]').on('click.purchaseExpand', '[src*=PLUS]', function () {
                var $img = $(this);
                $img.closest('tr').after("<tr class='adm-expand-row'><td></td><td colspan='999'>" + $img.next().html() + "</td></tr>");
                $img.attr('src', 'img/Continue1.png');
            });
            $(document).off('click.purchaseCollapse', '[src*=Continue1]').on('click.purchaseCollapse', '[src*=Continue1]', function () {
                var $img = $(this);
                $img.attr('src', 'img/PLUS.jpg');
                $img.closest('tr').next('.adm-expand-row').remove();
            });
        }

        $(function () {
            bindPurchaseExpand();
        });

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                bindPurchaseExpand();
            });
        }
    </script>
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
            bindPurchaseExpand();
        }
    </script>
</asp:Content>
