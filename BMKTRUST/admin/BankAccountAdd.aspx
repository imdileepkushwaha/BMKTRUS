<%@ Page Title="Bank Account" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="BankAccountAdd.aspx.cs" Inherits="admin_BankAccountAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtaccountholdername.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Acc Holder Name');
                document.getElementById("<%=txtaccountholdername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositaccountno.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Account No');
                document.getElementById("<%=txtdepositaccountno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositbank.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtdepositbank.ClientID%>").focus();
                return false;
            }
            return true;
        }

        function validate2() {
            if (document.getElementById("<%=txtaccholdernameedit.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Account Holder Name');
                document.getElementById("<%=txtaccholdernameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaccountnoedit.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Account No');
                document.getElementById("<%=txtaccountnoedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositbankedit.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtdepositbankedit.ClientID%>").focus();
                return false;
            }
            return true;
        }

        function previewQrImage(input, imgClientId) {
            var img = document.getElementById(imgClientId);
            if (!img) return;
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                    img.style.display = 'block';
                    img.style.visibility = 'visible';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Bank Account Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Utility management</a></li>
            <li class="active">Bank Account</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Bank Account</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtdepositbank.ClientID %>">Bank Name</label>
                                            <asp:TextBox ID="txtdepositbank" runat="server" CssClass="form-control" placeholder="e.g. HDFC Bank" />
                                            <span class="adm-field-hint">Bank where this account is held</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtdepositaccountno.ClientID %>">Account Number</label>
                                            <asp:TextBox ID="txtdepositaccountno" runat="server" CssClass="form-control" placeholder="Account number" />
                                            <span class="adm-field-hint">Full deposit account number</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtifsccode.ClientID %>">IFSC Code</label>
                                            <asp:TextBox ID="txtifsccode" runat="server" CssClass="form-control" placeholder="e.g. SBIN0001234" />
                                            <span class="adm-field-hint">11-character IFSC for NEFT / IMPS</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtaccountholdername.ClientID %>">Account Holder Name</label>
                                            <asp:TextBox ID="txtaccountholdername" runat="server" CssClass="form-control" placeholder="Name as per bank passbook" />
                                            <span class="adm-field-hint">Exact name printed on the account</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label >Upload QR Code</label>
                                            <asp:FileUpload ID="ProductImageUpload" runat="server" ClientIDMode="Static" CssClass="form-control" data-preview="#bankQrPreview" />
                                            <span class="adm-field-hint">PNG / JPG payment QR image — preview appears instantly</span>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>QR Preview</label>
                                            <div class="adm-qr-preview" id="bankQrPreviewBox">
                                                <img id="bankQrPreview" alt="QR Preview" width="100" height="100"
                                                    style="display: none; object-fit: contain; max-width: 100px; max-height: 100px;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Bank Account List</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        EmptyDataText="No bank accounts found." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="60px" />
                                                <ItemStyle Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account Number">
                                                <ItemTemplate>
                                                    <span class="adm-code-pill">
                                                        <asp:Label ID="lblaccountno" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account Holder">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblaccountholdername" runat="server" Text='<%# Eval("accountholdername") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IFSC">
                                                <ItemTemplate>
                                                    <span class="adm-code-pill">
                                                        <asp:Label ID="lblimage" runat="server" Text='<%# Eval("IFSCCode") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="QR Code">
                                                <ItemTemplate>
                                                    <asp:Image ID="lblbranchname" runat="server" Width="48" Height="48"
                                                        ImageUrl='<%# "../ProductImage/" + Eval("BranchName") %>'
                                                        CssClass="img-rounded" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="90px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton Style="display: none;" ID="lbEdit" CommandName="edt"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" runat="server"
                                                        CssClass="adm-action-btn" ToolTip="Edit">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDel" CommandName="del"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" runat="server"
                                                        CssClass="adm-action-btn-danger" ToolTip="Delete account"
                                                        OnClientClick="return confirm('Delete this bank account?');">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Width="90px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="myModal" class="modal fade">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Bank Account Details</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Account Number</label>
                                            <asp:Label ID="lblbankaccountid" runat="server" Visible="false" Text="0"></asp:Label>
                                            <asp:TextBox ID="txtaccountnoedit" onkeypress="return isNumber(event)" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Account Holder Name</label>
                                            <asp:TextBox ID="txtaccholdernameedit" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Bank Name</label>
                                            <asp:TextBox ID="txtdepositbankedit" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Current QR</label>
                                            <div class="adm-qr-preview">
                                                <asp:Image ID="ImageButton1" runat="server" ClientIDMode="Static" Width="100px" Height="100px" Style="object-fit: contain;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Upload New QR</label>
                                            <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" CssClass="form-control" data-preview="#ImageButton1" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
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

        function setQrPreview(imgSelector, dataUrl) {
            var $img = $(imgSelector);
            if (!$img.length) return;
            $img.attr('src', dataUrl).css({ display: 'block', visibility: 'visible' });
        }

        function bindBankQrPreview() {
            $(document).off('change.bankQr', '#ProductImageUpload').on('change.bankQr', '#ProductImageUpload', function () {
                var input = this;
                if (!input.files || !input.files[0]) return;
                var reader = new FileReader();
                reader.onload = function (e) {
                    setQrPreview('#bankQrPreview', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            });

            $(document).off('change.bankQrEdit', '#FileUpload1').on('change.bankQrEdit', '#FileUpload1', function () {
                var input = this;
                if (!input.files || !input.files[0]) return;
                var reader = new FileReader();
                reader.onload = function (e) {
                    setQrPreview('#ImageButton1', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            });
        }

        $(function () {
            bindBankQrPreview();
        });

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                bindBankQrPreview();
            });
        }
    </script>
</asp:Content>
