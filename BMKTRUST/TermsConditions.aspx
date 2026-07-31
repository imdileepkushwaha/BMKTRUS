<%@ Page Title="Terms &amp; Conditions &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="TermsConditions.aspx.cs" Inherits="TermsConditionsPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-shell {
            padding: 48px 0 72px;
            background: linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }

        .terms-panel {
            max-width: 960px;
            margin: 0 auto;
            background: #fff;
            border-radius: 18px;
            padding: 40px 42px;
            border: 1px solid rgba(0, 43, 92, 0.07);
            box-shadow: 0 12px 36px rgba(0, 26, 58, 0.07);
        }

        .terms-updated {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 999px;
            background: rgba(201, 162, 39, 0.12);
            border: 1px solid rgba(201, 162, 39, 0.35);
            color: var(--gold-dark);
            font-size: 0.8rem;
            font-weight: 700;
            margin-bottom: 22px;
        }

        .terms-block {
            padding-top: 22px;
            margin-top: 22px;
            border-top: 1px solid rgba(0, 43, 92, 0.08);
        }

        .terms-block:first-of-type {
            padding-top: 0;
            margin-top: 0;
            border-top: 0;
        }

        .terms-block h3 {
            display: flex;
            align-items: baseline;
            gap: 10px;
            font-family: var(--font-serif);
            font-size: 1.3rem;
            color: var(--navy);
            margin: 0 0 12px;
        }

        .terms-num {
            flex-shrink: 0;
            font-family: var(--font-sans);
            font-size: 0.78rem;
            font-weight: 800;
            letter-spacing: 1px;
            color: var(--gold-dark);
        }

        .terms-block p {
            margin: 0 0 12px;
            line-height: 1.75;
            color: var(--text);
            opacity: 0.9;
        }

        .terms-block ul {
            margin: 0 0 12px;
            padding-left: 1.2rem;
            line-height: 1.8;
            color: var(--text);
            opacity: 0.9;
        }

        .terms-callout {
            padding: 14px 16px;
            border-radius: 12px;
            background: rgba(200, 60, 60, 0.06);
            border-left: 3px solid rgba(200, 60, 60, 0.5);
            color: #8B1E1E;
            font-weight: 600;
        }

        .terms-actions {
            text-align: center;
            margin-top: 30px;
        }

        @media (max-width: 640px) {
            .terms-panel {
                padding: 28px 22px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="page-shell">
        <div class="container">
            <div class="section-header animate-on-scroll">
                <span class="section-label">Policies</span>
                <h2 class="section-title">Terms &amp; Conditions</h2>
                <div class="title-underline"></div>
            </div>

            <div class="terms-panel animate-on-scroll">
                <span class="terms-updated">Last updated: <%= DateTime.Now.ToString("MMMM yyyy") %></span>

                <div class="terms-block">
                    <h3><span class="terms-num">01</span> Acceptance of Terms</h3>
                    <p>
                        By accessing this website, registering as a member, or making a donation to
                        Bharat Manav Kalyan Trust, you agree to be bound by these Terms &amp; Conditions.
                        If you do not agree with any part of these terms, please do not use this website
                        or its services.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">02</span> About the Trust</h3>
                    <p>
                        Bharat Manav Kalyan Trust is a non-profit organisation working for education,
                        healthcare, women empowerment, rural development, and community welfare across India.
                        The Trust does not operate any investment scheme, chit fund, or money circulation
                        scheme, and makes no promise of guaranteed income or returns of any kind.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">03</span> Membership &amp; Registration</h3>
                    <ul>
                        <li>Any individual competent to contract under the Indian Contract Act, 1872 may apply for membership.</li>
                        <li>All information provided during registration must be true, complete, and current.</li>
                        <li>You are responsible for keeping your login credentials confidential and for all activity under your account.</li>
                        <li>The Trust may suspend or terminate any membership found to be in breach of these terms or involved in misrepresentation.</li>
                    </ul>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">04</span> Donations &amp; Payments</h3>
                    <ul>
                        <li>Donations may be made through online payment, UPI, cheque, cash, or bank transfer / NEFT.</li>
                        <li>&#8377;150/- ID card charges are included in every donation amount contributed.</li>
                        <li>Funds are utilised for the welfare programs and operational needs of the Trust.</li>
                        <li>A receipt or acknowledgement will be provided on request.</li>
                    </ul>
                    <p class="terms-callout">
                        All donation and contribution amounts are strictly non-refundable and non-transferable
                        once the payment is confirmed.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">05</span> Use of the Website</h3>
                    <p>
                        The content on this website is provided for general information purposes only.
                        While we make every effort to keep the information accurate and up to date, we make
                        no warranty as to its completeness, reliability, or suitability for any purpose.
                        Any reliance you place on such information is strictly at your own risk.
                    </p>
                    <p>
                        You agree not to misuse this website, attempt unauthorised access, upload harmful
                        content, or use it for any unlawful purpose.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">06</span> Third-Party Links</h3>
                    <p>
                        This website may contain links to external websites that are not controlled by the Trust.
                        We have no control over the nature, content, and availability of those sites, and the
                        inclusion of any link does not imply endorsement of the views expressed within them.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">07</span> Limitation of Liability</h3>
                    <p>
                        The Trust shall not be liable for any direct, indirect, or consequential loss or damage
                        arising out of the use of this website, including loss of data or profits. We also take
                        no responsibility for the website being temporarily unavailable due to technical issues
                        beyond our control.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">08</span> Privacy</h3>
                    <p>
                        Personal information collected during registration or donation is used solely for
                        communication, record keeping, and statutory compliance. We do not sell or rent your
                        personal details to any third party.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">09</span> Changes to These Terms</h3>
                    <p>
                        The Trust reserves the right to revise these Terms &amp; Conditions at any time without
                        prior notice. Continued use of this website after any change constitutes acceptance of
                        the revised terms.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">10</span> Contact</h3>
                    <p>
                        For any question regarding these Terms &amp; Conditions, please
                        <a href="<%= ResolveUrl("~/index.aspx") %>#contact">contact the Trust</a>.
                    </p>
                </div>
            </div>

            <div class="terms-actions">
                <a href="<%= ResolveUrl("~/index.aspx") %>" class="btn btn-outline-dark">&#8592; Back to Home</a>
            </div>
        </div>
    </section>
</asp:Content>
