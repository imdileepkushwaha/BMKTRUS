<%@ Page Title="Binary Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="leveltree.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Treeview</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; Treeview</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-ghost" href="DownlineReport.aspx">Downline</a>
                <a class="btn-ghost" href="leveltree.aspx">Treeview</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Member</h3>
                        </div>
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id :</label>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">


                                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                                
                            </div>


                        </div>
                    </div>
                    
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Genealogy Report</h3>
                        </div>
                        <div class="box-body">
                            <iframe id="f1" runat="server" style="height: 500px; width: 100%; border: 0px;"></iframe>

                            


                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>


