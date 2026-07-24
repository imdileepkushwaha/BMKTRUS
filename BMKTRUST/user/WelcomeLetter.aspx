<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelcomeLetter.aspx.cs" Inherits="user_WelcomeLetter" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome Letter | Bharat Manav Kalyan Trust</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Hind:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@500;600;700&display=swap" rel="stylesheet" />
    <style type="text/css">
        :root {
            --wl-green: #22A84A;
            --wl-green-deep: #178A3A;
            --wl-heading: #1E5AA8;
            --wl-welcome: #1F8F3E;
            --wl-detail: #3F3D7A;
            --wl-text: #2A2A2A;
            --wl-muted: #6B7280;
            --wl-line: #E5E7EB;
            --wl-bg: #F3F5F4;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Hind", "Noto Sans Devanagari", "Segoe UI", sans-serif;
            background: var(--wl-bg);
            color: var(--wl-text);
        }

        .wl-page {
            max-width: 860px;
            margin: 0 auto;
            padding: 24px 14px 40px;
        }

        .wl-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 16px;
        }

        .wl-toolbar h1 {
            margin: 0;
            font-size: 22px;
            font-weight: 700;
            color: var(--wl-green-deep);
        }

        .wl-actions {
            display: flex;
            gap: 10px;
        }

        .wl-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 40px;
            padding: 0 18px;
            border-radius: 10px;
            border: 0;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
        }

        .wl-btn-primary {
            background: var(--wl-green);
            color: #fff;
            box-shadow: 0 8px 18px rgba(23, 138, 58, 0.22);
        }

        .wl-btn-ghost {
            background: #fff;
            color: var(--wl-text);
            border: 1px solid var(--wl-line);
        }

        .wl-letter {
            background: #fff;
            border-radius: 18px;
            padding: 36px 40px 32px;
            box-shadow: 0 12px 32px rgba(15, 92, 40, 0.08);
            border: 1px solid rgba(34, 168, 74, 0.12);
        }

        .wl-header {
            text-align: center;
            margin-bottom: 18px;
        }

        .wl-title {
            margin: 0 0 8px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 28px;
            font-weight: 700;
            line-height: 1.35;
            color: var(--wl-heading);
        }

        .wl-title .sun {
            margin-right: 6px;
        }

        .wl-subtitle {
            margin: 0 auto 18px;
            max-width: 560px;
            font-size: 15px;
            font-weight: 500;
            color: var(--wl-muted);
            line-height: 1.45;
        }

        .wl-logo {
            width: 120px;
            height: 120px;
            object-fit: contain;
            border-radius: 50%;
            background: #fff;
            padding: 8px;
            box-shadow: 0 0 0 4px rgba(212, 175, 55, 0.7), 0 8px 20px rgba(0, 0, 0, 0.08);
            display: block;
            margin: 0 auto 22px;
        }

        .wl-salute {
            margin: 0 0 10px;
            font-size: 18px;
            font-weight: 500;
        }

        .wl-salute strong {
            font-weight: 700;
            color: #111;
        }

        .wl-heart {
            margin: 0 0 14px;
            font-size: 20px;
            font-weight: 700;
            color: var(--wl-welcome);
        }

        .wl-body p {
            margin: 0 0 14px;
            font-size: 16px;
            font-weight: 500;
            line-height: 1.7;
            color: var(--wl-text);
            text-align: justify;
        }

        .wl-body strong {
            font-weight: 700;
        }

        .wl-cta {
            margin: 8px 0 18px;
            font-size: 16px;
            font-weight: 700;
            line-height: 1.6;
            color: #111;
        }

        .wl-thanks {
            margin: 0 0 4px;
            font-size: 16px;
            font-weight: 500;
        }

        .wl-org {
            margin: 0 0 24px;
            font-size: 16px;
            font-weight: 700;
            color: #111;
        }

        .wl-meta {
            display: grid;
            grid-template-columns: 1fr 200px;
            gap: 24px;
            align-items: end;
            margin-bottom: 28px;
        }

        .wl-details {
            display: grid;
            gap: 8px;
        }

        .wl-detail-row {
            display: grid;
            grid-template-columns: 130px 1fr;
            gap: 8px;
            font-size: 15px;
            font-weight: 700;
            color: var(--wl-detail);
        }

        .wl-detail-row span {
            font-weight: 600;
            color: var(--wl-detail);
        }

        .wl-sign {
            text-align: center;
        }

        .wl-sign-box {
            width: 180px;
            height: 110px;
            margin: 0 auto 8px;
            border: 2px solid #C4C9D4;
            border-radius: 8px;
            background: #FAFBFD;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .wl-sign-box img {
            max-width: 90%;
            max-height: 90%;
            object-fit: contain;
        }

        .wl-sign-box .wl-sign-placeholder {
            font-family: "Segoe Script", "Brush Script MT", cursive;
            font-size: 28px;
            color: #334155;
            opacity: 0.85;
        }

        .wl-sign-label {
            margin: 0;
            font-size: 13px;
            font-weight: 700;
            color: var(--wl-detail);
        }

        .wl-footer {
            text-align: center;
            padding-top: 8px;
            border-top: 1px solid var(--wl-line);
        }

        .wl-footer-quote {
            margin: 14px 0 10px;
            font-size: 14px;
            font-weight: 600;
            font-style: italic;
            color: var(--wl-green-deep);
            line-height: 1.55;
        }

        .wl-footer-thanks {
            margin: 0 0 8px;
            font-size: 14px;
            font-weight: 600;
            color: var(--wl-text);
        }

        .wl-footer-team {
            margin: 0;
            font-size: 14px;
            font-weight: 700;
            color: #111;
        }

        @media print {
            body { background: #fff; }
            .wl-toolbar { display: none !important; }
            .wl-page { padding: 0; max-width: none; }
            .wl-letter {
                box-shadow: none;
                border: 0;
                border-radius: 0;
                padding: 12px 18px;
            }
        }

        @media (max-width: 700px) {
            .wl-letter { padding: 24px 18px; }
            .wl-title { font-size: 22px; }
            .wl-meta {
                grid-template-columns: 1fr;
                gap: 18px;
            }
            .wl-sign { text-align: left; }
            .wl-sign-box { margin-left: 0; }
            .wl-body p { text-align: left; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wl-page">
            <div class="wl-toolbar">
                <h1>Welcome Letter</h1>
                <div class="wl-actions">
                    <a href="Dashboard.aspx" class="wl-btn wl-btn-ghost">Back</a>
                    <button type="button" class="wl-btn wl-btn-primary" onclick="window.print();">Print</button>
                </div>
            </div>

            <article class="wl-letter">
                <header class="wl-header">
                    <h2 class="wl-title">
                        <span class="sun">☀️</span>
                        भारत मानव कल्याण ट्रस्ट परिवार में आपका स्वागत है!
                    </h2>
                    <p class="wl-subtitle">
                        आपके सहयोग से हम मिलकर समाज में सकारात्मक परिवर्तन ला रहे हैं
                    </p>
                    <img class="wl-logo" src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                </header>

                <p class="wl-salute">
                    प्रिय <strong><asp:Label ID="lblName" runat="server"></asp:Label></strong>,
                </p>

                <p class="wl-heart">❤️ आपका हार्दिक स्वागत है!</p>

                <div class="wl-body">
                    <p>
                        हमें अत्यंत हर्ष और गर्व है कि आपने सामाजिक सेवा के इस पावन अभियान में
                        <strong>भारत मानव कल्याण ट्रस्ट</strong> से जुड़ने का निर्णय लिया है।
                    </p>
                    <p>
                        आपका यह कदम मानवता, सेवा और समर्पण की दिशा में एक महत्वपूर्ण योगदान है —
                        चाहे वह शिक्षा, स्वास्थ्य या सामाजिक उत्थान का क्षेत्र हो।
                    </p>
                    <p>
                        आप अब उस परिवार का महत्वपूर्ण हिस्सा हैं जो निरंतर बदलाव और आशा लाने के लिए प्रयासरत है।
                    </p>
                </div>

                <p class="wl-cta">
                    🌟 आइए, मिलकर सेवा, सहयोग और सद्भावना के साथ एक उज्ज्वल भविष्य का निर्माण करें।
                </p>

                <p class="wl-thanks">धन्यवाद एवं शुभकामनाएँ,</p>
                <p class="wl-org">भारत मानव कल्याण ट्रस्ट</p>

                <div class="wl-meta">
                    <div class="wl-details">
                        <div class="wl-detail-row">
                            <span>Member ID:</span>
                            <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                        </div>
                        <div class="wl-detail-row">
                            <span>Sponsor ID:</span>
                            <asp:Label ID="lblSponsorId" runat="server"></asp:Label>
                        </div>
                        <div class="wl-detail-row">
                            <span>Date of Joining:</span>
                            <asp:Label ID="lblJoiningDate" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div class="wl-sign">
                        <div class="wl-sign-box">
                            <asp:Image ID="imgSignature" runat="server" Visible="false" AlternateText="Signature" />
                            <span id="spanSignPlaceholder" runat="server" class="wl-sign-placeholder">Signature</span>
                        </div>
                        <p class="wl-sign-label">संस्थापक &amp; चेयरमैन</p>
                    </div>
                </div>

                <footer class="wl-footer">
                    <p class="wl-footer-quote">
                        🍃 भारत मानव कल्याण ट्रस्ट के साथ जुड़कर आप समाज में सकारात्मक बदलाव लाने का हिस्सा बने हैं।
                    </p>
                    <p class="wl-footer-thanks">आपके सहयोग और विश्वास के लिए हार्दिक धन्यवाद। 🙏</p>
                    <p class="wl-footer-team">— टीम भारत मानव कल्याण ट्रस्ट</p>
                </footer>
            </article>
        </div>
    </form>
</body>
</html>
