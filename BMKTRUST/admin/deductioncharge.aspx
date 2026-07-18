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
            <div class="adm-util-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Charge Settings</h3>
                                <span class="adm-code-pill">Editable values</span>
                            </div>
                            <div class="box-body adm-charge-grid">
                                <p class="adm-field-hint" style="margin-top: 0; margin-bottom: 16px;">
                                    Update admin charge, TDS, wallet and deposit limits below, then click Save Changes.
                                </p>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" GridLines="None"
                                        EmptyDataText="No deduction charge settings found.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Admin Charge">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtAdminCharge" runat="server" Text='<%# Eval("admincharge") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TDS With PAN">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtTdswithpam" runat="server" Text='<%# Eval("tdswithpan") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TDS Without PAN">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtTdswithoutpan" runat="server" Text='<%# Eval("tdswithoutpan") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cash Wallet">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtcashWallet" runat="server" Text='<%# Eval("CashWallet") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cash Wallet %">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtcashWalletPercentage" runat="server" Text='<%# Eval("CashWalletPercent") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Capping Amount">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtCappingAmount" runat="server" Text='<%# Eval("CappingAmount") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Min Deposit">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtMinAmt" runat="server" Text='<%# Eval("MinDepositAmount") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Max Deposit">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtMaxAmt" runat="server" Text='<%# Eval("MaxDepositAmount") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:LinkButton ID="btnUpdate" CssClass="btn btn-primary" OnClick="btnUpdate_Click" runat="server">
                                    <i class="fa fa-save"></i> Save Changes
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
