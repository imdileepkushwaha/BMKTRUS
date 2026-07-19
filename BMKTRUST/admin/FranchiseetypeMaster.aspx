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
            <div class="adm-util-page has-sticky-actions adm-deduction-page adm-ftype-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Franchisee Types</h3>
                                <span class="adm-code-pill">Editable values</span>
                            </div>
                            <div class="box-body">
                                <asp:GridView ID="GridView1" runat="server" CssClass="adm-deduction-grid adm-ftype-grid"
                                    Width="100%" AutoGenerateColumns="False" GridLines="None" ShowHeader="false"
                                    EmptyDataText="No franchisee types found.">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="adm-deduction-card adm-ftype-card">
                                                    <div class="adm-deduction-card__meta">
                                                        <span class="adm-deduction-card__badge">Type #<%# Container.DataItemIndex + 1 %></span>
                                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-7">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Franchisee Type</label>
                                                                <div class="adm-deduction-input">
                                                                    <asp:TextBox ID="TxtAdminCharge" runat="server" Text='<%# Eval("type") %>' CssClass="form-control" placeholder="e.g. Gold / Silver / Diamond"></asp:TextBox>
                                                                </div>
                                                                <span class="adm-field-hint">Display name used across franchisee modules</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-5">
                                                            <div class="form-group adm-deduction-field">
                                                                <label>Profit (%)</label>
                                                                <div class="adm-deduction-input adm-deduction-input--pct">
                                                                    <asp:TextBox ID="TxtTdswithpam" runat="server" Text='<%# Eval("profit") %>' CssClass="form-control" onkeypress="return isNumberKey(event)" placeholder="0"></asp:TextBox>
                                                                    <span class="adm-deduction-suffix">%</span>
                                                                </div>
                                                                <span class="adm-field-hint">Profit percentage for this type</span>
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
                        <span class="adm-sticky-actions__hint"><i class="fa fa-info-circle"></i> Review type names and profit before saving</span>
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
