<%@ Page Title="Gallery &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="GalleryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .gallery-page {
            padding: 48px 0 72px;
            background: linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }
        .gallery-page-actions {
            text-align: center;
            margin-top: 28px;
        }
        .gallery-empty {
            text-align: center;
            padding: 48px 20px;
            background: #fff;
            border-radius: 16px;
            border: 1px dashed rgba(0, 43, 92, 0.18);
            color: var(--navy);
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="gallery-page">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label" data-hi="गैलरी">Gallery</span>
                <h2 class="section-title" data-hi="सभी तस्वीरें">All Photos</h2>
                <div class="title-underline"></div>
                <p class="section-subtitle gallery-subtitle">हमारे कार्य की सभी झलकियाँ</p>
            </div>

            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="gallery-empty" data-hi="अभी कोई तस्वीर उपलब्ध नहीं है।">
                No gallery images available yet.
            </asp:Panel>

            <div class="gallery-grid gallery-grid-full">
                <asp:Repeater ID="rptGalleryAll" runat="server">
                    <ItemTemplate>
                        <article class="gallery-item animate-on-scroll" data-delay="<%# (Container.ItemIndex % 6) * 90 %>" data-gallery-index="<%# Container.ItemIndex %>">
                            <button type="button" class="gallery-card"
                                data-src="<%# ResolveUrl("~/" + Convert.ToString(Eval("ImagePath")).TrimStart('~','/')) %>"
                                data-title="<%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>"
                                aria-label="View <%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>">
                                <div class="gallery-card-media">
                                    <img src="<%# ResolveUrl("~/" + Convert.ToString(Eval("ImagePath")).TrimStart('~','/')) %>"
                                        alt="<%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %>" loading="lazy" />
                                    <div class="gallery-card-shade"></div>
                                </div>
                                <div class="gallery-card-body">
                                    <span class="gallery-card-index"><%# (Container.ItemIndex + 1).ToString("00") %></span>
                                    <h4 class="gallery-item-title"><%# Server.HtmlEncode(Convert.ToString(Eval("Title"))) %></h4>
                                    <span class="gallery-card-action"><span class="gallery-action-icon">+</span> <span data-hi="देखें">View</span></span>
                                </div>
                            </button>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="gallery-page-actions">
                <a href="<%= ResolveUrl("~/index.aspx") %>" class="btn btn-outline-dark" data-hi="← होम पर वापस जाएँ">← Back to Home</a>
            </div>
        </div>
    </section>
</asp:Content>
