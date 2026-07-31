<%@ Page Title="Legal &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Legal.aspx.cs" Inherits="LegalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-shell {
            padding: 48px 0 72px;
            background: linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }
        .page-shell .info-panel { margin-top: 8px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-shell">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label">Compliance</span>
                <h2 class="section-title">Legal</h2>
                <div class="title-underline"></div>
            </div>
            <div class="info-panel animate-on-scroll">
                <h3>Registered Non-Profit Trust</h3>
                <p>
                    Bharat Manav Kalyan Trust operates as a registered non-profit organisation under applicable
                    Indian laws. We are committed to transparency, ethical fundraising, and responsible use of
                    every contribution received for social welfare.
                </p>
                <ul class="legal-list">
                    <li>Registered Trust / NGO working for public charitable purposes</li>
                    <li>Donations and programs managed with accountability</li>
                    <li>Policies aligned with service, dedication, and empowerment</li>
                </ul>
                <p>
                    For registration details, certificates, or legal enquiries, please
                    <a href="<%= ResolveUrl("~/index.aspx") %>#contact">contact us</a>.
                </p>
                <p style="margin-top:18px;">
                    <a href="<%= ResolveUrl("~/TermsConditions.aspx") %>" class="btn btn-outline-dark">Read Terms &amp; Conditions</a>
                </p>
            </div>
        </div>
    </section>
</asp:Content>
