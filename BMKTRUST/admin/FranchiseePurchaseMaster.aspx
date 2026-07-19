<%@ Page Title="Franchisee Purchase Entry" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseePurchaseMaster.aspx.cs" Inherits="FranchiseePurchaseMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=TxtFranchiseeId.ClientID%>").value == "") {
                alert('Enter Franchisee');
                document.getElementById("<%=TxtFranchiseeId.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=DDLstProduct.ClientID%>").value == "0") {
                alert('Select Product');
                document.getElementById("<%=DDLstProduct.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtPurchaseStock.ClientID%>").value == "") {
                alert('Enter Purchase Quantity  ');
                document.getElementById("<%=TxtPurchaseStock.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtPurchaseStock.ClientID%>").value == "0") {
                alert('Enter Purchase Quantity  ');
                document.getElementById("<%=TxtPurchaseStock.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtPurchasePrice.ClientID%>").value == "") {
                alert('Enter Price');
                document.getElementById("<%=TxtPurchasePrice.ClientID%>").focus();
                return false;
            }
        }

        function validate2() {
            if (document.getElementById("<%=TxtAmount.ClientID%>").value == "") {
                alert('Select Amount');
                document.getElementById("<%=TxtAmount.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtMrp.ClientID%>").value == "") {
                alert('Enter MRP');
                document.getElementById("<%=TxtMrp.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtQuantity.ClientID%>").value == "0") {
                alert('Select Quantity');
                document.getElementById("<%=TxtQuantity.ClientID%>").focus();
                return false;
            }
        }

        function validate3() {
            if (document.getElementById("<%=TxtFranchiseeId.ClientID%>").value == "") {
                alert('Enter Franchiseeid');
                document.getElementById("<%=TxtFranchiseeId.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Franchisee Purchase Entry</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee Management</a></li>
            <li class="active">Franchisee Purchase Entry</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page has-sticky-actions adm-purchase-page">
                <div class="row">

                    <%-- 1. Franchisee --%>
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Franchisee Details</h3>
                                <span class="adm-code-pill">Step 1</span>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Franchisee ID</label>
                                            <asp:TextBox ID="TxtFranchiseeId" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnTextChanged="TxtFranchiseeId_TextChanged" placeholder="Enter franchisee ID" />
                                            <span class="adm-field-hint">Press Tab / leave field to load name</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Franchisee Name</label>
                                            <asp:TextBox ID="TxtFRanchiseeName" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto-filled" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Product</label>
                                            <asp:DropDownList ID="DDLstProduct" CssClass="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="DDLstProduct_SelectedIndexChanged"></asp:DropDownList>
                                            <asp:TextBox ID="TxtImage" runat="server" Enabled="false" CssClass="form-control" Visible="false" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 2. Product entry --%>
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Product</h3>
                                <span class="adm-code-pill">Step 2</span>
                            </div>
                            <div class="box-body">
                                <div class="adm-section-title"><i class="fa fa-info-circle"></i> Stock &amp; Quantity</div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Available Stock</label>
                                            <asp:TextBox ID="TxtAvailableStock" runat="server" Enabled="false" CssClass="form-control" placeholder="0" />
                                            <asp:HiddenField ID="HDGST" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Purchase Quantity</label>
                                            <asp:TextBox ID="TxtPurchaseStock" runat="server" CssClass="form-control" placeholder="Enter quantity" onkeypress="return isNumber(event)" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>GST (%)</label>
                                            <asp:TextBox ID="TxtDP" runat="server" CssClass="form-control" Enabled="false" Visible="false" />
                                            <asp:TextBox ID="TxtGST" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto" />
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-section-title"><i class="fa fa-inr"></i> Pricing</div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>MRP</label>
                                            <asp:TextBox ID="TxtPurchaseMRP" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>DP</label>
                                            <asp:TextBox ID="TxtPurchasePrice" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>BV</label>
                                            <asp:TextBox ID="TxtBV" runat="server" CssClass="form-control" Enabled="false" placeholder="Auto" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Add Product" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Remove All" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <%-- 3. Cart + billing --%>
                    <asp:Panel ID="PnlDt" Visible="false" runat="server">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Purchase Cart</h3>
                                    <span class="adm-code-pill">Items</span>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%"
                                            AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" ShowFooter="true"
                                            OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No products added yet." GridLines="None">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="50px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image">
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="40px" Width="40px" CssClass="img-rounded" />
                                                        <asp:Label ID="LblProductImageG" runat="server" Text='<%# Eval("Image") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product Code">
                                                    <ItemTemplate>
                                                        <span class="adm-code-pill">
                                                            <asp:Label ID="LblProductCodeG" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                                                        </span>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Product Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblProductNameG" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="DP/Pieces">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblDP" runat="server" Text='<%# Eval("DP") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="MRP">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LBlMrp" runat="server" Text='<%# Eval("MRP") %>'></asp:Label>
                                                        <asp:Label ID="LblBv" runat="server" Text='<%# Eval("BV") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="LblProductAmountG" runat="server" Text='<%# Eval("Amount") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="LblStock" runat="server" Text='<%# Eval("STOCK") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Quantity">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="label1" runat="server" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Purchase Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblPurchaseAmount" runat="server" Text='<%# Eval("PurchaseAmount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="CGST">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblCGST" runat="server" Text='<%# Eval("CGST") %>'></asp:Label>
                                                        <asp:Label ID="LblGSTPER" runat="server" Text='<%# Eval("GSTPER") %>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SGST">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblSGST" runat="server" Text='<%# Eval("SGST") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="IGST">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblIGST" runat="server" Text='<%# Eval("IGST") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="label1" runat="server" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Calculate Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Eval("TotalAmount") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="LblTotalDP" runat="server" Text='<%# Eval("TOTALDP") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Total BV">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblTotalBV" runat="server" Text='<%# Eval("TOTALBV") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                            runat="server" CssClass="adm-action-btn" ToolTip="Edit item">
                                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="lbDelete" CommandName="del" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                            runat="server" CssClass="adm-action-btn-danger" ToolTip="Remove item"
                                                            OnClientClick="return confirm('Remove this product from cart?');">
                                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                    <HeaderStyle Width="100px" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- Hidden legacy GST fields (kept for code-behind) --%>
                        <div style="display: none;">
                            <asp:TextBox ID="TxtCGST" runat="server" CssClass="form-control" TextMode="Number" step="0.00" onchange="gettotal2();" />
                            <asp:Label ID="TxtCGstAmount" runat="server" CssClass="form-control" />
                            <asp:TextBox ID="TxtSGST" runat="server" CssClass="form-control" TextMode="Number" step="0.00" onchange="gettotal2();" />
                            <asp:Label ID="TxtSGstAmount" runat="server" CssClass="form-control" />
                            <asp:TextBox ID="TxtIGST" runat="server" CssClass="form-control" TextMode="Number" step="0.00" onchange="gettotal2();" />
                            <asp:Label ID="TxtIGstAmount" runat="server" CssClass="form-control" />
                            <asp:Label ID="TxtpaybleAmount" runat="server" CssClass="form-control" />
                            <asp:HiddenField ID="HDTotal" runat="server" />
                            <asp:TextBox ID="TxtShipping" CssClass="form-control" runat="server" Enabled="false" Text="150.00"></asp:TextBox>
                            <asp:DropDownList ID="DDLSTWallet" runat="server" CssClass="form-control">
                                <asp:ListItem Value="1">Main Wallet</asp:ListItem>
                                <asp:ListItem Value="2">Shopping Wallet</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="TxtTotalPrice" runat="server" CssClass="form-control" ReadOnly="true" />
                            <asp:TextBox ID="TXTTTAmount" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                        </div>

                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Bill Summary</h3>
                                    <span class="adm-code-pill">Totals</span>
                                </div>
                                <div class="box-body">
                                    <div class="row adm-purchase-totals">
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>Total Purchase</label>
                                                <asp:TextBox ID="TxtTotalpurchase" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>CGST</label>
                                                <asp:TextBox ID="TxtTotalCGST" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>SGST</label>
                                                <asp:TextBox ID="TxtTotalSGST" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>IGST</label>
                                                <asp:TextBox ID="TxtTotalIGST" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>Total Amount</label>
                                                <asp:TextBox ID="TxtTotalTotalDP" runat="server" CssClass="form-control" ReadOnly="true" />
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-4 col-xs-6">
                                            <div class="form-group">
                                                <label>Total BV</label>
                                                <asp:TextBox ID="TxtTotalBV" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="adm-section-title"><i class="fa fa-credit-card"></i> Payment</div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Discount</label>
                                                <asp:TextBox ID="TxtCash" CssClass="form-control" Enabled="false" runat="server" AutoPostBack="true" OnTextChanged="TxtCash_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Payable Amount</label>
                                                <asp:TextBox ID="TxtRestAmount" Enabled="false" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="TxtRestAmount_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Payment Mode</label>
                                                <asp:DropDownList ID="DDlstPaymentMode" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                    <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                                                    <asp:ListItem Value="Draft">Draft</asp:ListItem>
                                                    <asp:ListItem Value="UPI">UPI</asp:ListItem>
                                                    <asp:ListItem Value="Paytm">Paytm</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Transaction No</label>
                                                <asp:TextBox ID="TxtTransactionNo" CssClass="form-control" runat="server" placeholder="UPI / cheque / ref no."></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="adm-sticky-actions">
                            <asp:Button ID="BtnSubmitPurchase" OnClientClick="return validate3();" CssClass="btn btn-success" runat="server" Text="Submit Purchase" OnClick="BtnSubmitPurchase_Click" />
                        </div>
                    </asp:Panel>

                </div>

                <%-- Edit modal --%>
                <div id="myModal" class="modal fade">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Product Details</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                                            <label>Product Code</label>
                                            <asp:TextBox ID="TxtProductCode" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Product Name</label>
                                            <asp:TextBox ID="TxtProductName" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>DP/Pieces</label>
                                            <asp:TextBox ID="TxtDPedit" CssClass="form-control" runat="server" onchange="gettotal();"></asp:TextBox>
                                            <asp:TextBox ID="TxtAmount" Visible="false" CssClass="form-control" runat="server" onchange="gettotal();"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>MRP</label>
                                            <asp:TextBox ID="TxtMrp" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <asp:TextBox ID="TxtQuantity" CssClass="form-control" runat="server" TextMode="Number" onchange="gettotal();"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <asp:Label ID="TxtTotalAmount" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/MM/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/MM/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>
