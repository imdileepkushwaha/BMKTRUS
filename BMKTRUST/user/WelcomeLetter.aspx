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
            --navy: #002B5C;
            --navy-deep: #001A3A;
            --navy-mid: #003D7A;
            --gold: #C9A227;
            --gold-light: #E8C547;
            --text: #1A2B3C;
            --muted: #5A6B7C;
            --line: rgba(0, 43, 92, 0.12);
            --bg: #EEF2F7;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Hind", "Noto Sans Devanagari", "Segoe UI", sans-serif;
            color: var(--text);
            background:
                radial-gradient(ellipse 80% 50% at 50% -10%, rgba(201, 162, 39, 0.18), transparent 55%),
                linear-gradient(165deg, #001A3A 0%, #002B5C 28%, #EEF2F7 28.1%, #F7F9FC 100%);
        }

        .wl-page {
            max-width: 860px;
            margin: 0 auto;
            padding: 28px 14px 48px;
        }

        .wl-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .wl-toolbar-brand {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .wl-toolbar .eyebrow {
            margin: 0;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--gold-light);
        }

        .wl-toolbar h1 {
            margin: 0;
            font-size: 1.35rem;
            font-weight: 700;
            color: #fff;
            letter-spacing: 0.01em;
        }

        .wl-actions {
            display: flex;
            gap: 10px;
        }

        .wl-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 42px;
            padding: 0 18px;
            border-radius: 10px;
            border: 0;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .wl-btn:hover { transform: translateY(-1px); }

        .wl-btn-primary {
            background: linear-gradient(135deg, var(--gold), var(--gold-light));
            color: var(--navy-deep);
            box-shadow: 0 8px 18px rgba(201, 162, 39, 0.35);
        }

        .wl-btn-ghost {
            background: rgba(255, 255, 255, 0.12);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.28);
            backdrop-filter: blur(6px);
        }

        .wl-letter {
            position: relative;
            background: #fff;
            border-radius: 18px;
            padding: 40px 42px 34px;
            box-shadow: 0 20px 48px rgba(0, 26, 58, 0.18);
            border: 1px solid rgba(201, 162, 39, 0.28);
            overflow: hidden;
        }

        .wl-letter::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--navy-deep), var(--navy-mid), var(--gold), var(--navy-mid), var(--navy-deep));
        }

        .wl-header {
            text-align: center;
            margin-bottom: 22px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--line);
        }

        .wl-logo {
            width: 112px;
            height: 112px;
            object-fit: contain;
            border-radius: 50%;
            background: #fff;
            padding: 8px;
            box-shadow:
                0 0 0 3px var(--gold-light),
                0 0 0 7px rgba(0, 43, 92, 0.15),
                0 10px 24px rgba(0, 43, 92, 0.12);
            display: block;
            margin: 4px auto 18px;
        }

        .wl-brand-en {
            margin: 0 0 6px;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--gold);
        }

        .wl-title {
            margin: 0 0 10px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 1.65rem;
            font-weight: 700;
            line-height: 1.4;
            color: var(--navy);
        }

        .wl-subtitle {
            margin: 0 auto;
            max-width: 520px;
            font-size: 0.95rem;
            font-weight: 500;
            color: var(--muted);
            line-height: 1.5;
        }

        .wl-salute {
            margin: 0 0 6px;
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--text);
        }

        .wl-salute strong {
            font-weight: 700;
            color: var(--navy);
        }

        .wl-heart {
            margin: 0 0 16px;
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--gold);
        }

        .wl-body p {
            margin: 0 0 14px;
            font-size: 1rem;
            font-weight: 500;
            line-height: 1.75;
            color: var(--text);
            text-align: justify;
        }

        .wl-body strong {
            font-weight: 700;
            color: var(--navy);
        }

        .wl-cta {
            margin: 10px 0 20px;
            padding: 14px 16px;
            border-radius: 12px;
            background: linear-gradient(135deg, rgba(0, 43, 92, 0.06), rgba(201, 162, 39, 0.1));
            border-left: 4px solid var(--gold);
            font-size: 1rem;
            font-weight: 700;
            line-height: 1.6;
            color: var(--navy-deep);
        }

        .wl-thanks {
            margin: 0 0 2px;
            font-size: 1rem;
            font-weight: 500;
        }

        .wl-org {
            margin: 0 0 26px;
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--navy);
        }

        .wl-meta {
            display: grid;
            grid-template-columns: 1fr 200px;
            gap: 24px;
            align-items: end;
            margin-bottom: 26px;
        }

        .wl-details {
            display: grid;
            gap: 0;
            border-radius: 12px;
            border: 1px solid var(--line);
            overflow: hidden;
            background: linear-gradient(180deg, #FBF9F4, #fff);
        }

        .wl-detail-row {
            display: grid;
            grid-template-columns: 140px 1fr;
            gap: 8px;
            padding: 10px 14px;
            font-size: 0.92rem;
            font-weight: 700;
            color: var(--navy);
            border-bottom: 1px solid var(--line);
        }

        .wl-detail-row:last-child { border-bottom: 0; }

        .wl-detail-row span {
            font-weight: 600;
            color: var(--muted);
            text-transform: uppercase;
            font-size: 0.72rem;
            letter-spacing: 0.06em;
            align-self: center;
        }

        .wl-sign { text-align: center; }

        .wl-sign-box {
            width: 180px;
            height: 110px;
            margin: 0 auto 8px;
            border: 1px solid rgba(201, 162, 39, 0.45);
            border-radius: 10px;
            background: linear-gradient(180deg, #fff, #FBF9F4);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 6px 16px rgba(0, 43, 92, 0.06);
        }

        .wl-sign-box img {
            max-width: 90%;
            max-height: 90%;
            object-fit: contain;
        }

        .wl-sign-box .wl-sign-placeholder {
            font-family: "Segoe Script", "Brush Script MT", cursive;
            font-size: 26px;
            color: var(--navy-mid);
            opacity: 0.75;
        }

        .wl-sign-label {
            margin: 0;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            color: var(--navy);
        }

        .wl-footer {
            text-align: center;
            padding-top: 18px;
            border-top: 1px solid var(--line);
        }

        .wl-footer-quote {
            margin: 0 0 10px;
            font-size: 0.9rem;
            font-weight: 600;
            font-style: italic;
            color: var(--navy-mid);
            line-height: 1.55;
        }

        .wl-footer-thanks {
            margin: 0 0 6px;
            font-size: 0.9rem;
            font-weight: 600;
            color: var(--text);
        }

        .wl-footer-team {
            margin: 0;
            font-size: 0.9rem;
            font-weight: 700;
            color: var(--navy);
        }

        @media print {
            body {
                background: #fff;
            }
            .wl-toolbar { display: none !important; }
            .wl-page { padding: 0; max-width: none; }
            .wl-letter {
                box-shadow: none;
                border: 1px solid #ddd;
                border-radius: 0;
                padding: 16px 20px;
            }
            .wl-letter::before { height: 3px; }
        }

        @media (max-width: 700px) {
            body {
                background: linear-gradient(180deg, #001A3A 0%, #002B5C 18%, #EEF2F7 18.1%, #F7F9FC 100%);
            }
            .wl-letter { padding: 28px 18px 24px; }
            .wl-title { font-size: 1.25rem; }
            .wl-meta {
                grid-template-columns: 1fr;
                gap: 18px;
            }
            .wl-sign { text-align: left; }
            .wl-sign-box { margin-left: 0; }
            .wl-body p { text-align: left; }
            .wl-detail-row {
                grid-template-columns: 1fr;
                gap: 2px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wl-page">
            <div class="wl-toolbar">
                <div class="wl-toolbar-brand">
                    <p class="eyebrow">Bharat Manav Kalyan Trust</p>
                    <h1>Welcome Letter</h1>
                </div>
                <div class="wl-actions">
                    <a href="Dashboard.aspx" class="wl-btn wl-btn-ghost">Back</a>
                    <button type="button" class="wl-btn wl-btn-primary" onclick="window.print();">Print</button>
                </div>
            </div>

            <article class="wl-letter">
                <header class="wl-header">
                    <img class="wl-logo" src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                    <p class="wl-brand-en">Bharat Manav Kalyan Trust</p>
                    <h2 class="wl-title">
                        भारत मानव कल्याण ट्रस्ट परिवार में आपका स्वागत है!
                    </h2>
                    <p class="wl-subtitle">
                        आपके सहयोग से हम मिलकर समाज में सकारात्मक परिवर्तन ला रहे हैं
                    </p>
                </header>

                <p class="wl-salute">
                    प्रिय <strong><asp:Label ID="lblName" runat="server"></asp:Label></strong>,
                </p>

                <p class="wl-heart">आपका हार्दिक स्वागत है!</p>

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
                    आइए, मिलकर सेवा, सहयोग और सद्भावना के साथ एक उज्ज्वल भविष्य का निर्माण करें।
                </p>

                <p class="wl-thanks">धन्यवाद एवं शुभकामनाएँ,</p>
                <p class="wl-org">भारत मानव कल्याण ट्रस्ट</p>

                <div class="wl-meta">
                    <div class="wl-details">
                        <div class="wl-detail-row">
                            <span>Member ID</span>
                            <asp:Label ID="lblMemberId" runat="server"></asp:Label>
                        </div>
                        <div class="wl-detail-row">
                            <span>Sponsor ID</span>
                            <asp:Label ID="lblSponsorId" runat="server"></asp:Label>
                        </div>
                        <div class="wl-detail-row">
                            <span>Date of Joining</span>
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
                        भारत मानव कल्याण ट्रस्ट के साथ जुड़कर आप समाज में सकारात्मक बदलाव लाने का हिस्सा बने हैं।
                    </p>
                    <p class="wl-footer-thanks">आपके सहयोग और विश्वास के लिए हार्दिक धन्यवाद।</p>
                    <p class="wl-footer-team">— टीम भारत मानव कल्याण ट्रस्ट</p>
                </footer>
            </article>
        </div>
    </form>
</body>
</html>
