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
                <span class="section-label" data-hi="हमारे मिशन में सहयोग करें">Support Our Mission</span>
                <h1 data-hi="भारत मानव कल्याण ट्रस्ट को दान करें">Donate to Bharat Manav Kalyan Trust</h1>
                <div class="title-underline" style="margin: 0 auto 16px;"></div>
                <p data-hi="आपका योगदान हमें पूरे भारत में शिक्षा, स्वास्थ्य, महिला सशक्तिकरण और समाज कल्याण के कार्यक्रम जारी रखने में मदद करता है। हर दान किसी ज़रूरतमंद तक आशा पहुँचाता है।">
                    Your contribution helps us continue education, healthcare, women empowerment, and community welfare programs across India.
                    Every donation brings hope to someone in need.
                </p>
            </div>

            <div class="donate-grid">
                <div class="donate-card">
                    <h2 data-hi="दान संबंधी जानकारी">Donation Enquiry</h2>
                    <p class="card-sub" data-hi="फ़ॉर्म भरें, हमारी टीम आपको सुरक्षित दान विकल्पों की जानकारी देगी।">Fill the form and our team will guide you with secure donation options.</p>

                    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="donate-alert donate-alert-success">
                        <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
                    </asp:Panel>
                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="donate-alert donate-alert-error">
                        <asp:Literal ID="litError" runat="server"></asp:Literal>
                    </asp:Panel>

                    <div class="donate-form">
                        <div class="form-group">
                            <label for="<%= txtName.ClientID %>" data-hi="पूरा नाम *">Full Name *</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your full name" data-hi-placeholder="आपका पूरा नाम"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtEmail.ClientID %>" data-hi="ईमेल *">Email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="you@example.com" TextMode="Email" data-hi-placeholder="you@example.com"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtPhone.ClientID %>" data-hi="मोबाइल नंबर">Mobile</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="+91 XXXXX XXXXX" data-hi-placeholder="+91 XXXXX XXXXX"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label data-hi="सुझाई गई राशि">Suggested Amount</label>
                            <div class="donate-amounts" id="donateAmounts">
                                <button type="button" data-amount="500">₹500</button>
                                <button type="button" data-amount="1000">₹1,000</button>
                                <button type="button" data-amount="2000">₹2,000</button>
                                <button type="button" data-amount="3000">₹3,000</button>
                                <button type="button" data-amount="6000">₹6,000</button>
                                <button type="button" data-amount="10000">₹10,000</button>
                            </div>
                            <label for="<%= txtAmount.ClientID %>" data-hi="राशि (₹) *">Amount (₹) *</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter amount" data-hi-placeholder="राशि दर्ज करें"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="<%= ddlProgram.ClientID %>" data-hi="किस कार्यक्रम के लिए">Support Program</label>
                            <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                                <asp:ListItem Value="General Donation" data-hi="सामान्य दान">General Donation</asp:ListItem>
                                <asp:ListItem Value="Education for All" data-hi="सभी के लिए शिक्षा">Education for All</asp:ListItem>
                                <asp:ListItem Value="Healthcare Camps" data-hi="स्वास्थ्य शिविर">Healthcare Camps</asp:ListItem>
                                <asp:ListItem Value="Women Empowerment" data-hi="महिला सशक्तिकरण">Women Empowerment</asp:ListItem>
                                <asp:ListItem Value="Rural Development" data-hi="ग्रामीण विकास">Rural Development</asp:ListItem>
                                <asp:ListItem Value="Food Security" data-hi="खाद्य सुरक्षा">Food Security</asp:ListItem>
                                <asp:ListItem Value="Disaster Relief" data-hi="आपदा राहत">Disaster Relief</asp:ListItem>
                                <asp:ListItem Value="Old Age Homes" data-hi="वृद्धाश्रम (आगामी)">Old Age Homes (Upcoming)</asp:ListItem>
                                <asp:ListItem Value="Swachta Abhiyan" data-hi="स्वच्छता अभियान (आगामी)">Swachta Abhiyan (Upcoming)</asp:ListItem>
                                <asp:ListItem Value="Free Eye Camp" data-hi="निःशुल्क नेत्र शिविर (आगामी)">Free Eye Camp (Upcoming)</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="<%= ddlPayment.ClientID %>" data-hi="भुगतान का माध्यम *">Payment Option *</label>
                            <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" data-hi="-- भुगतान का माध्यम चुनें --">-- Select Payment Option --</asp:ListItem>
                                <asp:ListItem Value="Online" data-hi="ऑनलाइन भुगतान">Online Payment</asp:ListItem>
                                <asp:ListItem Value="UPI" data-hi="यूपीआई">UPI</asp:ListItem>
                                <asp:ListItem Value="Cheque" data-hi="चेक">Cheque</asp:ListItem>
                                <asp:ListItem Value="Cash" data-hi="नकद">Cash</asp:ListItem>
                                <asp:ListItem Value="Bank Transfer" data-hi="बैंक ट्रांसफ़र / एनईएफटी">Bank Transfer / NEFT</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="<%= txtMessage.ClientID %>" data-hi="संदेश (वैकल्पिक)">Message (optional)</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Any note for our team..." data-hi-placeholder="हमारी टीम के लिए कोई संदेश..."></asp:TextBox>
                        </div>
                        <asp:Button ID="btnDonate" runat="server" Text="Submit Donation Request" CssClass="btn btn-primary" OnClick="btnDonate_Click" data-hi-value="दान अनुरोध भेजें" />
                    </div>
                </div>

                <div class="donate-side">
                    <h3 class="donate-side-title" data-hi="दान क्यों करें?">Why Donate?</h3>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#10084;</span> <span data-hi="वास्तविक बदलाव लाएँ">Make a Real Impact</span></h4>
                        <p data-hi="आपका दान सीधे हमारे कार्यक्रमों तक पहुँचता है और समुदायों में स्थायी बदलाव लाने में मदद करता है।">Your donation directly supports our programs and helps create lasting change in communities.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#128737;</span> <span data-hi="पारदर्शिता">Transparency</span></h4>
                        <p data-hi="धनराशि के उपयोग में हम पूरी पारदर्शिता रखते हैं और नियमित रूप से जानकारी साझा करते हैं।">We maintain complete transparency in how funds are utilized and provide regular updates.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#127894;</span> <span data-hi="सदस्यता आईडी कार्ड">Membership ID Card</span></h4>
                        <p data-hi="&#8377;150/- आईडी कार्ड शुल्क आपके द्वारा दी गई हर दान राशि में शामिल है।">&#8377;150/- ID card charges are included in every donation amount you contribute.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#9888;</span> <span data-hi="वापसी योग्य नहीं">Non-Refundable</span></h4>
                        <p data-hi="योगदान की पुष्टि हो जाने के बाद दान की कोई भी राशि वापस नहीं की जाती।">All donation amounts are non-refundable once the contribution is confirmed.</p>
                    </div>

                    <div class="donate-benefit">
                        <h4><span class="donate-benefit-ico">&#9993;</span> <span data-hi="आगे क्या होगा">What Happens Next</span></h4>
                        <p>
                            <span data-hi="यह फ़ॉर्म भेजने के बाद हमारी टीम आपको बैंक / यूपीआई विवरण देगी और आपके दान की पुष्टि करेगी। बात करना चाहेंगे?">After you submit this form, our team will share bank / UPI details and confirm your donation.
                            Prefer talking to us?</span> <a href="<%= ResolveUrl("~/index.aspx") %>#contact" data-hi="ट्रस्ट से संपर्क करें">Contact the Trust</a>.
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
