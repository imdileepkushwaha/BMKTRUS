<%@ Page Title="Deduction Charge" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="deductioncharge.aspx.cs" Inherits="deductioncharge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Deduction Charge</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Utility management</a></li>
            <li class="active">Deduction Charge</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page has-sticky-actions adm-deduction-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Charge Settings</h3>
                                <span class="adm-code-pill">Global config</span>
                            </div>
                            <div class="box-body">
                               

                                <asp:GridView ID="GridView1" runat="server" CssClass="adm-deduction-grid"
                                    Width="100%" AutoGenerateColumns="False" GridLines="None" ShowHeader="false"
                                    EmptyDataText="No deduction charge settings found.">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="adm-deduction-card">
                                                    <div class="adm-deduction-card__meta">
                                                        <span class="adm-deduction-card__badge">Setting #<%# Container.DataItemIndex + 1 %></span>
                                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                    </div>

                                                    <div class="adm-section-title"><i class="fa fa-university"></i> Tax &amp; Admin Charges</div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Admin Charge (%)</label>
                                                                <div class="adm-deduction-input adm-deduction-input--pct">
                                                                    <asp:TextBox ID="TxtAdminCharge" runat="server" Text='<%# Eval("admincharge") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                    <span class="adm-deduction-suffix">%</span>
                                                                </div>
                                                                <span class="adm-field-hint">Platform admin deduction</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>TDS With PAN (%)</label>
                                                                <div class="adm-deduction-input adm-deduction-input--pct">
                                                                    <asp:TextBox ID="TxtTdswithpam" runat="server" Text='<%# Eval("tdswithpan") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                    <span class="adm-deduction-suffix">%</span>
                                                                </div>
                                                                <span class="adm-field-hint">When PAN is available</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>TDS Without PAN (%)</label>
                                                                <div class="adm-deduction-input adm-deduction-input--pct">
                                                                    <asp:TextBox ID="TxtTdswithoutpan" runat="server" Text='<%# Eval("tdswithoutpan") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                    <span class="adm-deduction-suffix">%</span>
                                                                </div>
                                                                <span class="adm-field-hint">When PAN is missing</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="adm-section-title"><i class="fa fa-credit-card"></i> Cash Wallet</div>
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Cash Wallet</label>
                                                                <div class="adm-deduction-input adm-deduction-input--inr">
                                                                    <span class="adm-deduction-prefix">₹</span>
                                                                    <asp:TextBox ID="TxtcashWallet" runat="server" Text='<%# Eval("CashWallet") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                </div>
                                                                <span class="adm-field-hint">Base cash wallet value</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Cash Wallet %</label>
                                                                <div class="adm-deduction-input adm-deduction-input--pct">
                                                                    <asp:TextBox ID="TxtcashWalletPercentage" runat="server" Text='<%# Eval("CashWalletPercent") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                    <span class="adm-deduction-suffix">%</span>
                                                                </div>
                                                                <span class="adm-field-hint">Wallet share percentage</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Capping Amount</label>
                                                                <div class="adm-deduction-input adm-deduction-input--inr">
                                                                    <span class="adm-deduction-prefix">₹</span>
                                                                    <asp:TextBox ID="TxtCappingAmount" runat="server" Text='<%# Eval("CappingAmount") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                </div>
                                                                <span class="adm-field-hint">Maximum earning cap</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="adm-section-title"><i class="fa fa-money"></i> Deposit Limits</div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Minimum Deposit</label>
                                                                <div class="adm-deduction-input adm-deduction-input--inr">
                                                                    <span class="adm-deduction-prefix">₹</span>
                                                                    <asp:TextBox ID="TxtMinAmt" runat="server" Text='<%# Eval("MinDepositAmount") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                </div>
                                                                <span class="adm-field-hint">Lowest allowed deposit</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Maximum Deposit</label>
                                                                <div class="adm-deduction-input adm-deduction-input--inr">
                                                                    <span class="adm-deduction-prefix">₹</span>
                                                                    <asp:TextBox ID="TxtMaxAmt" runat="server" Text='<%# Eval("MaxDepositAmount") %>' CssClass="form-control" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                                                </div>
                                                                <span class="adm-field-hint">Highest allowed deposit</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="adm-sticky-actions">
                    <div class="adm-sticky-actions__inner">
                        <span class="adm-sticky-actions__hint"><i class="fa fa-info-circle"></i> Review values carefully before saving</span>
                        <asp:LinkButton ID="btnUpdate" CssClass="btn btn-primary" OnClick="btnUpdate_Click" runat="server">
                            <i class="fa fa-save"></i> Save Changes
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode === 46 || charCode === 8 || charCode === 9) return true;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }
    </script>
</asp:Content>
