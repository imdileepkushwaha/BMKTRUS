<%@ Page Title="Franchisee Stock Detail" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseeStockDetail.aspx.cs" Inherits="FranchiseeStockDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Franchisee Stock Detail</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee Management</a></li>
            <li class="active">Franchisee Stock Detail</li>
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
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Franchisee</label>
                                            <asp:DropDownList ID="DDLstFranchisee" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="getproduct"></asp:DropDownList>
                                            <span class="adm-field-hint">Products load after franchisee is selected</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Product</label>
                                            <asp:DropDownList ID="DDLstProduct" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="adm-field-hint">Optional — leave blank for all products</span>
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
                                <h3 class="box-title">Franchisee Stock</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" ShowFooter="true" FooterStyle-BorderColor="Wheat"
                                        CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False"
                                        OnRowCommand="GridView1_RowCommand" DataKeyNames="ProductID" OnRowDataBound="GridView1_RowDataBound"
                                        GridLines="None" EmptyDataText="No stock records found for the selected filters.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Franchisee name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid123" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluseridEmailId" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%-- <asp:TemplateField HeaderText="BV">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluseridContactNo" runat="server" Text='<%#Eval("BV") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="DP">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluseridContactNo" runat="server" Text='<%#Eval("DP") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Stock Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStockNo" runat="server" Text='<%# Eval("StockLeft") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BV Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbvleft" runat="server" Text='<%# Eval("BVLEFT") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotalbvleft" runat="server" Text=""></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DP Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldpleft" runat="server" Text='<%# Eval("DPLEFT") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lbltotaldpleft" runat="server" Text=""></asp:Label>
                                                </FooterTemplate>
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
</asp:Content>
