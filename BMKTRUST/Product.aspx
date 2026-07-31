<%@ Page Title="Product &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="ProductPage" %>

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
                <span class="section-label">Our Offerings</span>
                <h2 class="section-title">Product</h2>
                <div class="title-underline"></div>
            </div>
            <div class="info-panel animate-on-scroll">
                <h3>Products That Support Our Mission</h3>
                <p>
                    Bharat Manav Kalyan Trust is developing product offerings that help sustain our NGO programs
                    while creating livelihood and value for communities. Details of available products will be
                    updated here as they are launched.
                </p>
                <p class="upcoming-note"><strong>Coming soon</strong> — product catalogue and purchase options will be published shortly.</p>
                <p style="margin-top:18px;">
                    <a href="<%= ResolveUrl("~/Donate.aspx") %>" class="btn btn-primary">Support Our Work →</a>
                    <a href="<%= ResolveUrl("~/index.aspx") %>#contact" class="btn btn-outline-dark" style="margin-left:8px;">Contact Us</a>
                </p>
            </div>
        </div>
    </section>
</asp:Content>
