<%@ Page Title="Donate &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Donate.aspx.cs" Inherits="DonatePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .donate-page {
            padding: 48px 0 72px;
            background:
                radial-gradient(ellipse 70% 40% at 50% 0%, rgba(201, 162, 39, 0.14), transparent 55%),
                linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }

        .donate-hero {
            text-align: center;
            margin-bottom: 36px;
        }

        .donate-hero .section-label {
            display: inline-block;
            margin-bottom: 10px;
        }

        .donate-hero h1 {
            font-family: var(--font-serif);
            font-size: clamp(1.8rem, 3vw, 2.6rem);
            color: var(--navy);
            margin: 0 0 12px;
        }

        .donate-hero p {
            max-width: 640px;
            margin: 0 auto;
            color: var(--text);
            opacity: 0.88;
            line-height: 1.7;
        }

        .donate-grid {
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 28px;
            align-items: start;
        }

        .donate-card {
            background: #fff;
            border-radius: 18px;
            padding: 32px 28px;
            border: 1px solid rgba(0, 43, 92, 0.08);
            box-shadow: 0 12px 36px rgba(0, 26, 58, 0.08);
        }

        .donate-card h2 {
            font-family: var(--font-serif);
            font-size: 1.45rem;
            color: var(--navy);
            margin: 0 0 8px;
        }

        .donate-card .card-sub {
            margin: 0 0 22px;
            color: var(--text);
            opacity: 0.8;
            font-size: 0.95rem;
        }

        .donate-form .form-group {
            margin-bottom: 16px;
        }

        .donate-form label {
            display: block;
            font-size: 0.82rem;
            font-weight: 700;
            color: var(--navy);
            margin-bottom: 6px;
            letter-spacing: 0.02em;
        }

        .donate-form .form-control {
            width: 100%;
            min-height: 46px;
            border-radius: 10px;
            border: 1px solid rgba(0, 43, 92, 0.15);
            padding: 10px 14px;
            font-family: inherit;
            font-size: 0.95rem;
            color: var(--navy);
            background: #FBFCFD;
        }

        .donate-form textarea.form-control {
            min-height: 110px;
            resize: vertical;
        }

        .donate-form .form-control:focus {
            outline: none;
            border-color: var(--gold);
            box-shadow: 0 0 0 3px rgba(201, 162, 39, 0.18);
            background: #fff;
        }

        .donate-amounts {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 10px;
        }

        .donate-amounts button {
            border: 1px solid rgba(0, 43, 92, 0.15);
            background: #fff;
            color: var(--navy);
            border-radius: 999px;
            padding: 8px 14px;
            font-weight: 700;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .donate-amounts button:hover,
        .donate-amounts button.is-active {
            background: linear-gradient(135deg, #C9A227, #E8C547);
            border-color: transparent;
            color: #001A3A;
        }

        .donate-alert {
            padding: 12px 14px;
            border-radius: 10px;
            margin-bottom: 16px;
            font-size: 0.92rem;
            font-weight: 600;
        }

        .donate-alert-success {
            background: rgba(34, 168, 74, 0.12);
            color: #0F5C28;
            border: 1px solid rgba(34, 168, 74, 0.28);
        }

        .donate-alert-error {
            background: rgba(200, 60, 60, 0.1);
            color: #8B1E1E;
            border: 1px solid rgba(200, 60, 60, 0.25);
        }

        .donate-side-title {
            font-family: var(--font-serif);
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--navy);
            margin: 0 0 18px;
        }

        .donate-benefit {
            background: #fff;
            border-radius: 14px;
            padding: 20px 22px;
            margin-bottom: 16px;
            border: 1px solid rgba(0, 43, 92, 0.07);
            box-shadow: 0 6px 22px rgba(0, 26, 58, 0.06);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .donate-benefit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 30px rgba(0, 26, 58, 0.1);
        }

        .donate-benefit h4 {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.02rem;
            font-weight: 700;
            color: var(--navy);
            margin: 0 0 8px;
        }

        .donate-benefit-ico {
            font-size: 1.05rem;
            line-height: 1;
            color: var(--gold-dark);
        }

        .donate-benefit p {
            margin: 0;
            line-height: 1.65;
            font-size: 0.94rem;
            color: var(--text);
            opacity: 0.9;
        }

        .donate-benefit a {
            color: var(--gold-dark);
            font-weight: 700;
        }

        .donate-pillars {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-top: 16px;
        }

        .donate-pillars span {
            padding: 6px 12px;
            border-radius: 999px;
            background: rgba(0, 43, 92, 0.06);
            color: var(--navy);
            font-size: 0.8rem;
            font-weight: 700;
        }

        @media (max-width: 900px) {
            .donate-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="donate-page">
        <div class="container">
            <div class="donate-hero">
                <span class="section-label">Support Our Mission</span>
                <h1>Donate to Bharat Manav Kalyan Trust</h1>
                <div class="title-underline" style="margin: 0 auto 16px;"></div>
                <p>
                    Your contribution helps us continue education, healthcare, women empowerment, and community welfare programs across India.
                    Every donation brings hope to someone in need.
                </p>
            </div>

            <div class="donate-grid">
                <div class="donate-card">
                    <h2>Donation Enquiry</h2>
                    <p class="card-sub">Fill the form and our team will guide you with secure donation options.</p>

                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="donate-alert donate-alert-success">
                        <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
                    </asp:Panel>
                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="donate-alert donate-alert-error">
                        <asp:Literal ID="litError" runat="server"></asp:Literal>
                    </asp:Panel>

                    <div class="donate-form">
                        <div class="form-group">
                            <label for="<%= txtName.ClientID %>">Full Name *</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your full name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtEmail.ClientID %>">Email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="you@example.com" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtPhone.ClientID %>">Mobile</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+91 XXXXX XXXXX"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Suggested Amount</label>
                            <div class="donate-amounts" id="donateAmounts">
                                <button type="button" data-amount="500">₹500</button>
                                <button type="button" data-amount="1000">₹1,000</button>
                                <button type="button" data-amount="2000">₹2,000</button>
                                <button type="button" data-amount="3000">₹3,000</button>
                                <button type="button" data-amount="6000">₹6,000</button>
                                <button type="button" data-amount="10000">₹10,000</button>
                            </div>
                            <label for="<%= txtAmount.ClientID %>">Amount (₹) *</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter amount"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= ddlProgram.ClientID %>">Support Program</label>
                            <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                                <asp:ListItem Value="General Donation">General Donation</asp:ListItem>
                                <asp:ListItem Value="Education for All">Education for All</asp:ListItem>
                                <asp:ListItem Value="Healthcare Camps">Healthcare Camps</asp:ListItem>
                                <asp:ListItem Value="Women Empowerment">Women Empowerment</asp:ListItem>
                                <asp:ListItem Value="Rural Development">Rural Development</asp:ListItem>
                                <asp:ListItem Value="Food Security">Food Security</asp:ListItem>
                                <asp:ListItem Value="Disaster Relief">Disaster Relief</asp:ListItem>
                                <asp:ListItem Value="Old Age Homes">Old Age Homes (Upcoming)</asp:ListItem>
                                <asp:ListItem Value="Swachta Abhiyan">Swachta Abhiyan (Upcoming)</asp:ListItem>
                                <asp:ListItem Value="Free Eye Camp">Free Eye Camp (Upcoming)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="<%= ddlPayment.ClientID %>">Payment Option *</label>
                            <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">-- Select Payment Option --</asp:ListItem>
                                <asp:ListItem Value="Online">Online Payment</asp:ListItem>
                                <asp:ListItem Value="UPI">UPI</asp:ListItem>
                                <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                                <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                <asp:ListItem Value="Bank Transfer">Bank Transfer / NEFT</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtMessage.ClientID %>">Message (optional)</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Any note for our team..."></asp:TextBox>
                        </div>
                        <asp:Button ID="btnDonate" runat="server" Text="Submit Donation Request" CssClass="btn btn-primary" OnClick="btnDonate_Click" />
                    </div>
                </div>

                <div class="donate-side">
                    <h3 class="donate-side-title">Why Donate?</h3>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#10084;</span> Make a Real Impact</h4>
                        <p>Your donation directly supports our programs and helps create lasting change in communities.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#128737;</span> Transparency</h4>
                        <p>We maintain complete transparency in how funds are utilized and provide regular updates.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#127894;</span> Membership ID Card</h4>
                        <p>&#8377;150/- ID card charges are included in every donation amount you contribute.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#9888;</span> Non-Refundable</h4>
                        <p>All donation amounts are non-refundable once the contribution is confirmed.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#9993;</span> What Happens Next</h4>
                        <p>
                            After you submit this form, our team will share bank / UPI details and confirm your donation.
                            Prefer talking to us? <a href="<%= ResolveUrl("~/index.aspx") %>#contact">Contact the Trust</a>.
                        </p>
                    </div>

                    <div class="donate-pillars">
                        <span>सेवा</span>
                        <span>समर्पण</span>
                        <span>सशक्तिकरण</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        (function () {
            var amountInput = document.getElementById('<%= txtAmount.ClientID %>');
            var buttons = document.querySelectorAll('#donateAmounts button');
            if (!amountInput || !buttons.length) return;

            buttons.forEach(function (btn) {
                btn.addEventListener('click', function () {
                    buttons.forEach(function (b) { b.classList.remove('is-active'); });
                    btn.classList.add('is-active');
                    amountInput.value = btn.getAttribute('data-amount') || '';
                    amountInput.focus();
                });
            });
        })();
    </script>
</asp:Content>
