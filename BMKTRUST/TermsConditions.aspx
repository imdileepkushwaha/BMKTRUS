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
                <span class="section-label" data-hi="नीतियाँ">Policies</span>
                <h2 class="section-title" data-hi="नियम एवं शर्तें">Terms &amp; Conditions</h2>
                <div class="title-underline"></div>
            </div>

            <div class="terms-panel animate-on-scroll">
                <span class="terms-updated"><span data-hi="अंतिम अद्यतन:">Last updated:</span> <%= DateTime.Now.ToString("MMMM yyyy") %></span>

                <div class="terms-block">
                    <h3><span class="terms-num">01</span> <span data-hi="शर्तों की स्वीकृति">Acceptance of Terms</span></h3>
                    <p data-hi="इस वेबसाइट का उपयोग करके, सदस्य के रूप में पंजीकरण करके, या भारत मानव कल्याण ट्रस्ट को दान करके आप इन नियम एवं शर्तों से बंधने के लिए सहमत होते हैं। यदि आप इनमें से किसी भी बात से सहमत नहीं हैं, तो कृपया इस वेबसाइट या इसकी सेवाओं का उपयोग न करें।">
                        By accessing this website, registering as a member, or making a donation to
                        Bharat Manav Kalyan Trust, you agree to be bound by these Terms &amp; Conditions.
                        If you do not agree with any part of these terms, please do not use this website
                        or its services.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">02</span> <span data-hi="ट्रस्ट के बारे में">About the Trust</span></h3>
                    <p data-hi="भारत मानव कल्याण ट्रस्ट एक गैर-लाभकारी संस्था है जो पूरे भारत में शिक्षा, स्वास्थ्य, महिला सशक्तिकरण, ग्रामीण विकास और समाज कल्याण के लिए कार्य करती है। ट्रस्ट कोई निवेश योजना, चिट फंड या मनी सर्कुलेशन स्कीम नहीं चलाता, और किसी भी प्रकार की निश्चित आय या रिटर्न का कोई वादा नहीं करता।">
                        Bharat Manav Kalyan Trust is a non-profit organisation working for education,
                        healthcare, women empowerment, rural development, and community welfare across India.
                        The Trust does not operate any investment scheme, chit fund, or money circulation
                        scheme, and makes no promise of guaranteed income or returns of any kind.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">03</span> <span data-hi="सदस्यता एवं पंजीकरण">Membership &amp; Registration</span></h3>
                    <ul>
                        <li data-hi="भारतीय अनुबंध अधिनियम, 1872 के अंतर्गत अनुबंध करने में सक्षम कोई भी व्यक्ति सदस्यता के लिए आवेदन कर सकता है।">Any individual competent to contract under the Indian Contract Act, 1872 may apply for membership.</li>
                        <li data-hi="पंजीकरण के समय दी गई सभी जानकारी सत्य, पूर्ण और वर्तमान होनी चाहिए।">All information provided during registration must be true, complete, and current.</li>
                        <li data-hi="अपने लॉगिन विवरण को गोपनीय रखना और अपने खाते से होने वाली सभी गतिविधियों की ज़िम्मेदारी आपकी है।">You are responsible for keeping your login credentials confidential and for all activity under your account.</li>
                        <li data-hi="इन शर्तों का उल्लंघन करने या गलत जानकारी देने वाली किसी भी सदस्यता को ट्रस्ट निलंबित या समाप्त कर सकता है।">The Trust may suspend or terminate any membership found to be in breach of these terms or involved in misrepresentation.</li>
                    </ul>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">04</span> <span data-hi="दान एवं भुगतान">Donations &amp; Payments</span></h3>
                    <ul>
                        <li data-hi="दान ऑनलाइन भुगतान, यूपीआई, चेक, नकद या बैंक ट्रांसफ़र / एनईएफटी के माध्यम से किया जा सकता है।">Donations may be made through online payment, UPI, cheque, cash, or bank transfer / NEFT.</li>
                        <li data-hi="&#8377;150/- आईडी कार्ड शुल्क हर दान राशि में शामिल है।">&#8377;150/- ID card charges are included in every donation amount contributed.</li>
                        <li data-hi="प्राप्त धनराशि ट्रस्ट के कल्याण कार्यक्रमों और संचालन संबंधी आवश्यकताओं में उपयोग की जाती है।">Funds are utilised for the welfare programs and operational needs of the Trust.</li>
                        <li data-hi="अनुरोध करने पर रसीद या पावती उपलब्ध कराई जाएगी।">A receipt or acknowledgement will be provided on request.</li>
                    </ul>
                    <p class="terms-callout" data-hi="भुगतान की पुष्टि हो जाने के बाद दान एवं योगदान की सभी राशियाँ पूर्णतः अवापसी योग्य (नॉन-रिफंडेबल) और अहस्तांतरणीय हैं।">
                        All donation and contribution amounts are strictly non-refundable and non-transferable
                        once the payment is confirmed.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">05</span> <span data-hi="वेबसाइट का उपयोग">Use of the Website</span></h3>
                    <p data-hi="इस वेबसाइट की सामग्री केवल सामान्य जानकारी के उद्देश्य से दी गई है। हम जानकारी को सही और अद्यतन रखने का पूरा प्रयास करते हैं, फिर भी इसकी पूर्णता, विश्वसनीयता या किसी विशेष उद्देश्य के लिए उपयुक्तता की कोई गारंटी नहीं देते। ऐसी जानकारी पर भरोसा करना पूर्णतः आपके अपने जोखिम पर है।">
                        The content on this website is provided for general information purposes only.
                        While we make every effort to keep the information accurate and up to date, we make
                        no warranty as to its completeness, reliability, or suitability for any purpose.
                        Any reliance you place on such information is strictly at your own risk.
                    </p>
                    <p data-hi="आप सहमत हैं कि इस वेबसाइट का दुरुपयोग नहीं करेंगे, अनधिकृत पहुँच का प्रयास नहीं करेंगे, हानिकारक सामग्री अपलोड नहीं करेंगे और न ही किसी गैरकानूनी उद्देश्य के लिए इसका उपयोग करेंगे।">
                        You agree not to misuse this website, attempt unauthorised access, upload harmful
                        content, or use it for any unlawful purpose.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">06</span> <span data-hi="तृतीय-पक्ष लिंक">Third-Party Links</span></h3>
                    <p data-hi="इस वेबसाइट पर ऐसी बाहरी वेबसाइटों के लिंक हो सकते हैं जो ट्रस्ट के नियंत्रण में नहीं हैं। उन साइटों की प्रकृति, सामग्री और उपलब्धता पर हमारा कोई नियंत्रण नहीं है, और किसी लिंक का होना उनमें व्यक्त विचारों का समर्थन नहीं दर्शाता।">
                        This website may contain links to external websites that are not controlled by the Trust.
                        We have no control over the nature, content, and availability of those sites, and the
                        inclusion of any link does not imply endorsement of the views expressed within them.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">07</span> <span data-hi="दायित्व की सीमा">Limitation of Liability</span></h3>
                    <p data-hi="इस वेबसाइट के उपयोग से होने वाली किसी भी प्रत्यक्ष, अप्रत्यक्ष या परिणामी हानि अथवा क्षति के लिए, जिसमें डेटा या लाभ की हानि भी शामिल है, ट्रस्ट उत्तरदायी नहीं होगा। हमारे नियंत्रण से बाहर की तकनीकी समस्याओं के कारण वेबसाइट के अस्थायी रूप से अनुपलब्ध रहने की ज़िम्मेदारी भी हमारी नहीं होगी।">
                        The Trust shall not be liable for any direct, indirect, or consequential loss or damage
                        arising out of the use of this website, including loss of data or profits. We also take
                        no responsibility for the website being temporarily unavailable due to technical issues
                        beyond our control.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">08</span> <span data-hi="निजता">Privacy</span></h3>
                    <p data-hi="पंजीकरण या दान के समय ली गई व्यक्तिगत जानकारी का उपयोग केवल संवाद, रिकॉर्ड रखने और वैधानिक अनुपालन के लिए किया जाता है। हम आपकी व्यक्तिगत जानकारी किसी तीसरे पक्ष को न बेचते हैं और न ही किराए पर देते हैं।">
                        Personal information collected during registration or donation is used solely for
                        communication, record keeping, and statutory compliance. We do not sell or rent your
                        personal details to any third party.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">09</span> <span data-hi="इन शर्तों में बदलाव">Changes to These Terms</span></h3>
                    <p data-hi="ट्रस्ट को बिना पूर्व सूचना के किसी भी समय इन नियम एवं शर्तों में संशोधन करने का अधिकार है। किसी भी बदलाव के बाद वेबसाइट का उपयोग जारी रखना संशोधित शर्तों की स्वीकृति माना जाएगा।">
                        The Trust reserves the right to revise these Terms &amp; Conditions at any time without
                        prior notice. Continued use of this website after any change constitutes acceptance of
                        the revised terms.
                    </p>
                </div>

                <div class="terms-block">
                    <h3><span class="terms-num">10</span> <span data-hi="संपर्क">Contact</span></h3>
                    <p>
                        <span data-hi="इन नियम एवं शर्तों से जुड़े किसी भी प्रश्न के लिए कृपया">For any question regarding these Terms &amp; Conditions, please</span>
                        <a href="<%= ResolveUrl("~/index.aspx") %>#contact" data-hi="ट्रस्ट से संपर्क करें">contact the Trust</a>.
                    </p>
                </div>
            </div>

            <div class="terms-actions">
                <a href="<%= ResolveUrl("~/index.aspx") %>" class="btn btn-outline-dark" data-hi="&#8592; होम पर वापस जाएँ">&#8592; Back to Home</a>
            </div>
        </div>
    </section>
</asp:Content>
