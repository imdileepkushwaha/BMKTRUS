<%@ Page Title="Add Logo" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="WebsiteLogo.aspx.cs" Inherits="admin_WebsiteLogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Add Logo</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Website Management</a></li>
            <li class="active">Add Logo</li>
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
                                <h3 class="box-title">Logo & Branding</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Site Name (English)</label>
                                            <asp:TextBox ID="txtSiteNameEn" CssClass="form-control" runat="server" MaxLength="200" placeholder="Bharat Manav Kalyan Trust"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Site Name (Hindi)</label>
                                            <asp:TextBox ID="txtSiteNameHi" CssClass="form-control" runat="server" MaxLength="200" placeholder="भारत मानव कल्याण ट्रस्ट"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Tagline</label>
                                            <asp:TextBox ID="txtTagline" CssClass="form-control" runat="server" MaxLength="300" placeholder="सेवा • समर्पण • सशक्तिकरण"></asp:TextBox>
                                            <span class="adm-field-hint">Shown on hero, footer and brand areas</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Upload Logo</label>
                                            <asp:FileUpload ID="fuLogo" runat="server" />
                                            <span class="adm-field-hint">PNG / JPG recommended. Leave empty to keep current logo.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Current Logo</label>
                                            <div class="adm-qr-preview">
                                                <asp:Image ID="imgLogoPreview" runat="server" Width="100" Height="100" />
                                            </div>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
