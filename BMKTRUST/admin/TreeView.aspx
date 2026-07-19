<%@ Page Title="Tree View" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Tree View</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">My Network</a></li>
            <li class="active">Tree View</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page adm-tree-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Enter member user ID"></asp:TextBox>
                                            <span class="adm-field-hint">Loads the network tree for this member</span>
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
                                <h3 class="box-title">Network Tree</h3>
                            </div>
                            <div class="box-body">
                                <asp:Panel ID="pnllist" runat="server" Visible="false" CssClass="adm-tree-panel">
                                    <div class="adm-tree-meta">
                                        <div class="adm-tree-meta__item">
                                            <span class="adm-tree-meta__label">Root member</span>
                                            <span class="adm-tree-meta__value">
                                                <asp:Label ID="lblRootUser" runat="server"></asp:Label>
                                            </span>
                                        </div>
                                        <div class="adm-tree-meta__hint">
                                            Click <strong>+</strong> to expand downline levels
                                        </div>
                                    </div>
                                    <div class="adm-tree-wrap">
                                        <asp:TreeView ShowLines="true" ID="Account_Chart" runat="server" ExpandDepth="0"
                                            ImageSet="Arrows" OnTreeNodePopulate="Account_Chart_TreeNodePopulate"
                                            BorderStyle="None" NodeIndent="22" CssClass="adm-net-tree">
                                            <HoverNodeStyle CssClass="adm-net-tree__hover" Font-Underline="false" />
                                            <SelectedNodeStyle CssClass="adm-net-tree__selected" Font-Underline="false" />
                                            <RootNodeStyle CssClass="adm-net-tree__root" Font-Bold="true" />
                                            <ParentNodeStyle CssClass="adm-net-tree__parent" Font-Bold="false" />
                                            <LeafNodeStyle CssClass="adm-net-tree__leaf" />
                                            <NodeStyle CssClass="adm-net-tree__node" HorizontalPadding="6px" NodeSpacing="2px" VerticalPadding="2px" />
                                        </asp:TreeView>
                                        <asp:Literal ID="ltteam" runat="server"></asp:Literal>
                                    </div>
                                </asp:Panel>

                                <asp:Panel ID="pnlEmpty" runat="server" Visible="true" CssClass="adm-tree-empty">
                                    <div class="adm-tree-empty__card">
                                        <div class="adm-tree-empty__title">No tree loaded</div>
                                        <p class="adm-tree-empty__text">Enter a User ID above and click Search to view the member network tree.</p>
                                    </div>
                                </asp:Panel>
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
