<%@ Page Title="User View" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="UserView.aspx.cs" Inherits="admin_UserView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>User View</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="UserReport.aspx">User Report</a></li>
            <li class="active">User View</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="adm-util-page adm-user-view">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-body adm-user-view__hero">
                        <div class="adm-user-view__hero-main">
                            <asp:Image ID="imgPhoto" runat="server" CssClass="adm-user-view__photo" AlternateText="User photo" />
                            <div>
                                <div class="adm-user-view__id">
                                    <asp:Label ID="lblUserId" runat="server"></asp:Label>
                                </div>
                                <h2 class="adm-user-view__name">
                                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                                </h2>
                                <div class="adm-user-view__badges">
                                    <asp:Label ID="lblActiveStatus" runat="server"></asp:Label>
                                    <asp:Label ID="lblTopUpStatus" runat="server"></asp:Label>
                                    <asp:Label ID="lblEpinStatus" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="adm-user-view__actions">
                            <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="UserReport.aspx" CssClass="btn btn-default">
                                <i class="fa fa-arrow-left"></i> Back
                            </asp:HyperLink>
                            <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary">
                                <i class="fa fa-pencil"></i> Edit
                            </asp:HyperLink>
                            <asp:HyperLink ID="lnkBank" runat="server" CssClass="btn btn-info">
                                <i class="fa fa-university"></i> Bank
                            </asp:HyperLink>
                            <asp:HyperLink ID="lnkKyc" runat="server" CssClass="btn btn-warning">
                                <i class="fa fa-id-card"></i> KYC Upload
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <section class="adm-uv-panel">
                    <header class="box-header with-border">
                        <h3 class="box-title">Personal Details</h3>
                    </header>
                    <div class="adm-uv-panel__body">
                        <dl class="adm-uv-fields">
                            <div class="adm-uv-field">
                                <dt>Password</dt>
                                <dd><asp:Label ID="lblPassword" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Mobile</dt>
                                <dd><asp:Label ID="lblMobile" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Email</dt>
                                <dd><asp:Label ID="lblEmail" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Gender</dt>
                                <dd><asp:Label ID="lblGender" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Date of Birth</dt>
                                <dd><asp:Label ID="lblDob" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Course Name</dt>
                                <dd><asp:Label ID="lblCourseName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Telegram Name</dt>
                                <dd><asp:Label ID="lblTelegramName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Telegram Number</dt>
                                <dd><asp:Label ID="lblTelegramNumber" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Reg. Date</dt>
                                <dd><asp:Label ID="lblRegDate" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Activation Date</dt>
                                <dd><asp:Label ID="lblActivationDate" runat="server"></asp:Label></dd>
                            </div>
                        </dl>
                    </div>
                </section>
            </div>

            <div class="col-md-6">
                <section class="adm-uv-panel">
                    <header class="box-header with-border">
                        <h3 class="box-title">Network &amp; Package</h3>
                    </header>
                    <div class="adm-uv-panel__body">
                        <dl class="adm-uv-fields">
                            <div class="adm-uv-field">
                                <dt>Sponsor ID</dt>
                                <dd><asp:Label ID="lblSponsorId" runat="server" CssClass="adm-uv-mono"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Sponsor Name</dt>
                                <dd><asp:Label ID="lblSponsorName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Parent User</dt>
                                <dd><asp:Label ID="lblParentName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Package</dt>
                                <dd><asp:Label ID="lblPackage" runat="server" CssClass="adm-uv-highlight"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Plan Amount</dt>
                                <dd><asp:Label ID="lblPlanAmount" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field adm-uv-field--wallet">
                                <dt>Recharge Wallet</dt>
                                <dd><asp:Label ID="lblRechargeWallet" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field adm-uv-field--wallet">
                                <dt>Utility Wallet</dt>
                                <dd><asp:Label ID="lblUtilityWallet" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Nominee Name</dt>
                                <dd><asp:Label ID="lblNomineeName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Nominee Relation</dt>
                                <dd><asp:Label ID="lblNomineeRelation" runat="server"></asp:Label></dd>
                            </div>
                        </dl>
                    </div>
                </section>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <section class="adm-uv-panel">
                    <header class="box-header with-border">
                        <h3 class="box-title">Address Details</h3>
                    </header>
                    <div class="adm-uv-panel__body">
                        <div class="adm-uv-address">
                            <span class="adm-uv-address__label">Full Address</span>
                            <p class="adm-uv-address__text"><asp:Label ID="lblAddress" runat="server"></asp:Label></p>
                        </div>
                        <dl class="adm-uv-fields">
                            <div class="adm-uv-field">
                                <dt>Area</dt>
                                <dd><asp:Label ID="lblArea" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>City</dt>
                                <dd><asp:Label ID="lblCity" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>State</dt>
                                <dd><asp:Label ID="lblState" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Pin Code</dt>
                                <dd><asp:Label ID="lblPincode" runat="server" CssClass="adm-uv-mono"></asp:Label></dd>
                            </div>
                        </dl>
                    </div>
                </section>
            </div>

            <div class="col-md-6">
                <section class="adm-uv-panel">
                    <header class="box-header with-border">
                        <h3 class="box-title">Bank Details</h3>
                    </header>
                    <div class="adm-uv-panel__body">
                        <div class="adm-uv-bank-strip">
                            <div>
                                <span class="adm-uv-address__label">Account Holder</span>
                                <div class="adm-uv-bank-strip__name"><asp:Label ID="lblAccHolder" runat="server"></asp:Label></div>
                            </div>
                            <div>
                                <span class="adm-uv-address__label">Account No</span>
                                <div class="adm-uv-bank-strip__acc"><asp:Label ID="lblAccNo" runat="server" CssClass="adm-uv-mono"></asp:Label></div>
                            </div>
                        </div>
                        <dl class="adm-uv-fields">
                            <div class="adm-uv-field">
                                <dt>IFSC Code</dt>
                                <dd><asp:Label ID="lblIfsc" runat="server" CssClass="adm-uv-mono"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Bank Name</dt>
                                <dd><asp:Label ID="lblBankName" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>Branch</dt>
                                <dd><asp:Label ID="lblBranch" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>UPI ID</dt>
                                <dd><asp:Label ID="lblUpi" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>PhonePe</dt>
                                <dd><asp:Label ID="lblPhonePe" runat="server"></asp:Label></dd>
                            </div>
                            <div class="adm-uv-field">
                                <dt>BHIM</dt>
                                <dd><asp:Label ID="lblBhim" runat="server"></asp:Label></dd>
                            </div>
                        </dl>
                    </div>
                </section>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <section class="adm-uv-panel">
                    <header class="box-header with-border">
                        <h3 class="box-title">KYC Documents</h3>
                    </header>
                    <div class="adm-uv-panel__body">
                        <div class="adm-uv-id-row">
                            <div class="adm-uv-id-chip">
                                <span class="adm-uv-id-chip__label">PAN Number</span>
                                <span class="adm-uv-id-chip__value"><asp:Label ID="lblPanNumber" runat="server"></asp:Label></span>
                            </div>
                            <div class="adm-uv-id-chip">
                                <span class="adm-uv-id-chip__label">Aadhaar Number</span>
                                <span class="adm-uv-id-chip__value"><asp:Label ID="lblAadhaarNumber" runat="server"></asp:Label></span>
                            </div>
                            <div class="adm-uv-id-chip">
                                <span class="adm-uv-id-chip__label">GST Number</span>
                                <span class="adm-uv-id-chip__value"><asp:Label ID="lblGstNumber" runat="server"></asp:Label></span>
                            </div>
                        </div>

                        <div class="adm-uv-kyc-grid">
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>Signup Form</strong>
                                    <asp:Label ID="lblSignupStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkSignupImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgSignup" runat="server" CssClass="adm-kyc-card__img" AlternateText="Signup form" />
                                </a>
                            </div>
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>PAN Card</strong>
                                    <asp:Label ID="lblPanStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkPanImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgPan" runat="server" CssClass="adm-kyc-card__img" AlternateText="PAN card" />
                                </a>
                            </div>
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>Cancel Cheque</strong>
                                    <asp:Label ID="lblChequeStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkChequeImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgCheque" runat="server" CssClass="adm-kyc-card__img" AlternateText="Cancel cheque" />
                                </a>
                            </div>
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>Aadhaar Front</strong>
                                    <asp:Label ID="lblAadhaarStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkAadhaarImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgAadhaar" runat="server" CssClass="adm-kyc-card__img" AlternateText="Aadhaar front" />
                                </a>
                            </div>
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>Aadhaar Back</strong>
                                    <asp:Label ID="lblAadhaarBackStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkAadhaarBackImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgAadhaarBack" runat="server" CssClass="adm-kyc-card__img" AlternateText="Aadhaar back" />
                                </a>
                            </div>
                            <div class="adm-kyc-card">
                                <div class="adm-kyc-card__head">
                                    <strong>GST Document</strong>
                                    <asp:Label ID="lblGstStatus" runat="server"></asp:Label>
                                </div>
                                <a runat="server" id="lnkGstImg" href="#" target="_blank" class="adm-kyc-card__img-wrap">
                                    <asp:Image ID="imgGst" runat="server" CssClass="adm-kyc-card__img" AlternateText="GST document" />
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
