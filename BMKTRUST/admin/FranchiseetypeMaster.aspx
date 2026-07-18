<%@ Page Title="Franchisee Type Settings" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseetypeMaster.aspx.cs" Inherits="FranchiseetypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Franchisee Type Settings</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee Master</a></li>
            <li class="active">Franchisee Type</li>
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
                                <h3 class="box-title">Franchisee Types</h3>
                                <span class="adm-code-pill">Editable values</span>
                            </div>
                            <div class="box-body adm-charge-grid">
                                <p class="adm-field-hint" style="margin-top: 0; margin-bottom: 16px;">
                                    Update franchisee type name and profit below, then click Save Changes.
                                </p>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" GridLines="None"
                                        EmptyDataText="No franchisee types found.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtAdminCharge" runat="server" Text='<%# Eval("type") %>' CssClass="form-control"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Profit">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtTdswithpam" runat="server" Text='<%# Eval("profit") %>' CssClass="form-control"></asp:TextBox>
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
