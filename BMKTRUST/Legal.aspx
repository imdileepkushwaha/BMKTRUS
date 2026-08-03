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
                <span class="section-label" data-hi="अनुपालन">Compliance</span>
                <h2 class="section-title" data-hi="कानूनी जानकारी">Legal</h2>
                <div class="title-underline"></div>
            </div>
            <div class="info-panel animate-on-scroll">
                <h3 data-hi="पंजीकृत गैर-लाभकारी ट्रस्ट">Registered Non-Profit Trust</h3>
                <p data-hi="भारत मानव कल्याण ट्रस्ट भारतीय कानूनों के अंतर्गत एक पंजीकृत गैर-लाभकारी संस्था के रूप में कार्य करता है। हम पारदर्शिता, नैतिक तरीके से धन संग्रह और समाज कल्याण के लिए मिले हर योगदान के ज़िम्मेदार उपयोग के प्रति प्रतिबद्ध हैं।">
                    Bharat Manav Kalyan Trust operates as a registered non-profit organisation under applicable
                    Indian laws. We are committed to transparency, ethical fundraising, and responsible use of
                    every contribution received for social welfare.
                </p>
                <ul class="legal-list">
                    <li data-hi="सार्वजनिक परोपकारी उद्देश्यों के लिए कार्यरत पंजीकृत ट्रस्ट / एनजीओ">Registered Trust / NGO working for public charitable purposes</li>
                    <li data-hi="दान और कार्यक्रमों का संचालन पूरी जवाबदेही के साथ">Donations and programs managed with accountability</li>
                    <li data-hi="सेवा, समर्पण और सशक्तिकरण के अनुरूप नीतियाँ">Policies aligned with service, dedication, and empowerment</li>
                </ul>
                <p>
                    <span data-hi="पंजीकरण विवरण, प्रमाणपत्र या किसी कानूनी जानकारी के लिए कृपया">For registration details, certificates, or legal enquiries, please</span>
                    <a href="<%= ResolveUrl("~/index.aspx") %>#contact" data-hi="हमसे संपर्क करें">contact us</a>.
                </p>
                <p style="margin-top:18px;">
                    <a href="<%= ResolveUrl("~/TermsConditions.aspx") %>" class="btn btn-outline-dark" data-hi="नियम एवं शर्तें पढ़ें">Read Terms &amp; Conditions</a>
                </p>
            </div>
        </div>
    </section>
</asp:Content>
