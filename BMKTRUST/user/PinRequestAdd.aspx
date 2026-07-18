<%@ Page Title="Deposit Request" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PinRequestAdd.aspx.cs" Inherits="user_PinRequestAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            var plan = document.getElementById("<%=ddplan.ClientID%>");
            var epin = document.getElementById("<%=txtnoofepin.ClientID%>");
            var bank = document.getElementById("<%=ddbankaccountno.ClientID%>");
            var amount = document.getElementById("<%=txtamount.ClientID%>");
            var txn = document.getElementById("<%=TxtTransactionId.ClientID%>");
            var file = document.getElementById("<%=ImageUpload.ClientID%>");

            if (!plan || plan.value == "0") {
                alert('Select Plan');
                if (plan) plan.focus();
                return false;
            }
            if (!epin || epin.value == "" || parseInt(epin.value, 10) < 1) {
                alert('Enter No of E-Pin (minimum 1)');
                if (epin) epin.focus();
                return false;
            }
            if (!bank || bank.value == "0") {
                alert('Select Bank Account');
                if (bank) bank.focus();
                return false;
            }
            if (!amount || amount.value == "") {
                alert('Enter Amount');
                if (amount) amount.focus();
                return false;
            }
            if (!txn || txn.value == "") {
                alert('Enter TransactionID');
                if (txn) txn.focus();
                return false;
            }
            if (!file || !file.value) {
                alert('Please upload payment receipt');
                return false;
            }
            return true;
        }

        function gettotal() {

            var Epin = 0, EpinAmount = 1650, TotalAMount = 0;
            if (document.getElementById("<%=txtnoofepin.ClientID%>").value != "") {
                Epin = document.getElementById("<%=txtnoofepin.ClientID%>").value;
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value != "") {
                EpinAmount = document.getElementById("<%=txtamount.ClientID%>").value;
            }
            var TotalAMount = Epin * EpinAmount;
            document.getElementById("<%=txttotalamount.ClientID%>").value = TotalAMount;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">E-Pin Management</span>
                <h1>E-Pin Request</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; E-Pin &nbsp;/&nbsp; Request</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="PinRequestAdd.aspx">Request</a>
                <a class="btn-ghost" href="EPinReport.aspx">Report</a>
                <a class="btn-ghost" href="EPinTransfer.aspx">Transfer</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">E-Pin Request</h3>
                </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <div class="box-body">

                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Deposit Account :</label>
                                <asp:DropDownList ID="ddbankaccountno2" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Account No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Deposit Account No :</label>
                                <asp:TextBox ID="txtdepositaccouaantno" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Deposit Bank :</label>
                                <asp:TextBox ID="txtdepositbanssk" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>IFSC Code :</label>
                                <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Holder Name :</label>
                                <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Branch Name :</label>
                                <asp:TextBox ID="txtbranchname" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Id :</label>
                                <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Name :</label>
                                <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Balance :</label>
                                <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Enter Amount :</label>
                                <asp:TextBox ID="txtamountaaa" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>Deposit Mode :</label>
                                <asp:DropDownList ID="ddmode" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select">Select </asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                                    <asp:ListItem Value="RTGS">RTGS</asp:ListItem>
                                    <asp:ListItem Value="NEFT">NEFT</asp:ListItem>
                                    <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Plan</label>
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>E-Pin Amount</label>
                                <asp:TextBox ID="txtamount" onkeypress="return isNumber(event)" Text="" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>No of E-Pin :</label>
                                <asp:TextBox ID="txtnoofepin" TextMode="Number" onchange="gettotal();" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Total Amount :</label>
                                <asp:TextBox ID="txttotalamount" onkeypress="return isNumber(event)" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Account Type :</label>
                                <asp:DropDownList ID="ddbankaccountno" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Account</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Number :</label>
                                <asp:TextBox ID="txtdepositaccountno" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Bank Name :</label>
                                <asp:TextBox ID="txtdepositbank" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>IFSC Code :</label>
                                <asp:TextBox ID="txtifsccode1" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>



                        <div class="col-md-6">
                            <div class="form-group">
                                <label>QR Code:</label>
                                <br>
                                <asp:Image ID="QR" runat="server" Width="200px" Height="200px" />

                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Holder Name:</label>

                                <asp:TextBox ID="txtaccountholdername1" runat="server" Enabled="false" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Transaction Id:</label>

                                <asp:TextBox ID="TxtTransactionId" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Narration :</label>
                                <asp:TextBox ID="TxtNarration" runat="server" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>Remark :</label>
                                <asp:TextBox ID="TextBox4" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>TransactionId/ChequeNo :</label>
                                <asp:TextBox ID="TxtTransactionIdaa" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>

                <div class="box-body" style="padding-top:0;">
                    <div class="form-group">
                        <span class="bmk-photo-label">Upload Receipt</span>
                        <label class="bmk-dropzone">
                            <span class="bmk-dropzone-icon">
                                <iconify-icon icon="solar:gallery-add-bold-duotone"></iconify-icon>
                            </span>
                            <span class="bmk-dropzone-title">Drop payment receipt or browse</span>
                            <span class="bmk-dropzone-sub">JPG, PNG &mdash; clear payment screenshot / slip</span>
                            <span class="bmk-dropzone-btn">Browse File</span>
                            <span id="bmkFileNamePin" class="bmk-dropzone-file">No file selected</span>
                            <asp:FileUpload ID="ImageUpload" runat="server" CssClass="bmk-file-input" accept="image/*" onchange="bmkKycPicked(this,'bmkFileNamePin','bmkLocalPreviewPin','bmkLocalWrapPin')" />
                        </label>
                        <div class="bmk-photo-local-preview" id="bmkLocalWrapPin" style="display:none;">
                            <img id="bmkLocalPreviewPin" alt="Receipt preview" />
                        </div>
                    </div>
                </div>
                <div class="box-footer bmk-photo-actions">
                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" UseSubmitBehavior="true" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                </div>
            </div>
    </div>
    <script type="text/javascript">
        function bmkKycPicked(input, nameId, imgId, wrapId) {
            var nameEl = document.getElementById(nameId);
            var wrap = document.getElementById(wrapId);
            var img = document.getElementById(imgId);
            if (!input || !input.files || !input.files[0]) {
                if (nameEl) nameEl.textContent = 'No file selected';
                if (wrap) wrap.style.display = 'none';
                return;
            }
            var file = input.files[0];
            if (nameEl) nameEl.textContent = file.name;
            if (img && wrap && file.type.indexOf('image/') === 0) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                    wrap.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
</asp:Content>



