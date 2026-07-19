<%@ Page Title="Contact Details" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="WebsiteContact.aspx.cs" Inherits="admin_WebsiteContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Contact Details</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Website Management</a></li>
            <li class="active">Contact Details</li>
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
                                <h3 class="box-title">Contact Information</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-section-title"><i class="fa fa-phone"></i> Phone & Address</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Contact Number</label>
                                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" MaxLength="50" placeholder="+91 98765 43210"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>WhatsApp Number</label>
                                            <asp:TextBox ID="txtWhatsApp" CssClass="form-control" runat="server" MaxLength="50" placeholder="919876543210"></asp:TextBox>
                                            <span class="adm-field-hint">Digits with country code (used for wa.me link)</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" MaxLength="200" placeholder="info@example.org"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" MaxLength="500" TextMode="MultiLine" Rows="2" placeholder="Full address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-section-title"><i class="fa fa-share-alt"></i> Social Links</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Facebook URL</label>
                                            <asp:TextBox ID="txtFacebook" CssClass="form-control" runat="server" MaxLength="500" placeholder="https://facebook.com/..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Instagram URL</label>
                                            <asp:TextBox ID="txtInstagram" CssClass="form-control" runat="server" MaxLength="500" placeholder="https://instagram.com/..."></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Twitter / X URL</label>
                                            <asp:TextBox ID="txtTwitter" CssClass="form-control" runat="server" MaxLength="500" placeholder="https://twitter.com/..."></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>YouTube URL</label>
                                            <asp:TextBox ID="txtYoutube" CssClass="form-control" runat="server" MaxLength="500" placeholder="https://youtube.com/..."></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>LinkedIn URL</label>
                                            <asp:TextBox ID="txtLinkedIn" CssClass="form-control" runat="server" MaxLength="500" placeholder="https://linkedin.com/..."></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Reset" OnClick="btnCancel_Click" />
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
