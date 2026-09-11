<%@ Page Title="Donation Request" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DonationRequestAdd.aspx.cs" Inherits="user_DonationRequestAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <script type="text/javascript">
        function validateDonation() {
            var bank = document.getElementById("<%=ddbankaccountno.ClientID%>");
            var txn = document.getElementById("<%=TxtTransactionId.ClientID%>");
            if (bank && bank.value == "0") {
                alert('Select Account');
                bank.focus();
                return false;
            }
            if (txn && txn.value.replace(/^\s+|\s+$/g, '') == "") {
                alert('Enter Transaction Id');
                txn.focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">Donation</span>
                <h1>Donation Request</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; Donation &nbsp;/&nbsp; Request</p>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Eligibility</h3>
                    </div>
                    <div class="box-body">
                        <asp:Label ID="lblEligible" runat="server" Font-Bold="true"></asp:Label>
                    </div>
                </div>

                <asp:Panel ID="pnlForm" runat="server">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Pay to Admin</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtuserid" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Amount</label>
                                        <asp:TextBox ID="txtamount" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Account</label>
                                        <asp:DropDownList ID="ddbankaccountno" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Account</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Account Number</label>
                                        <asp:TextBox ID="txtdepositaccountno" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Bank Name</label>
                                        <asp:TextBox ID="txtdepositbank" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>IFSC Code</label>
                                        <asp:TextBox ID="txtifsccode" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Account Holder Name</label>
                                        <asp:TextBox ID="txtaccountholdername" runat="server" CssClass="form-control" Enabled="false" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>QR Code</label>
                                        <div>
                                            <asp:Image ID="QR" runat="server" Width="180px" Height="180px" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Transaction Id</label>
                                        <asp:TextBox ID="TxtTransactionId" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Payment Slip</label>
                                        <asp:FileUpload ID="ImageUpload" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit Donation"
                                OnClientClick="return validateDonation();" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </asp:Panel>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">My Donation Requests</h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                Width="100%" AutoGenerateColumns="False" EmptyDataText="No donation requests." GridLines="None"
                                OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate><%# Eval("MentionDate", "{0:dd/MM/yyyy hh:mm tt}") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate><%# Eval("Amount", "{0:0.00}") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate><%# Eval("OnlineTransactionId") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank">
                                        <ItemTemplate><%# Eval("BankName") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reject Reason">
                                        <ItemTemplate><%# Eval("RejectReason") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Slip">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="lnkSlip" runat="server" Target="_blank"
                                                NavigateUrl='<%# string.IsNullOrEmpty(Convert.ToString(Eval("Img"))) ? "" : ResolveUrl("~/ProductImage/" + Eval("Img")) %>'
                                                Text='<%# string.IsNullOrEmpty(Convert.ToString(Eval("Img"))) ? "-" : "View" %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
