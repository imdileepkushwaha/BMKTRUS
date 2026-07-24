<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmRegistration.aspx.cs" Inherits="user_ConfirmRegistration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Successful | Bharat Manav Kalyan Trust</title>
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
            --white: #FFFFFF;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Hind", "Noto Sans Devanagari", "Segoe UI", sans-serif;
            color: var(--text);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 28px 14px;
            background:
                radial-gradient(ellipse 70% 45% at 50% -8%, rgba(201, 162, 39, 0.22), transparent 55%),
                linear-gradient(165deg, #001A3A 0%, #002B5C 38%, #EEF2F7 38.1%, #F7F9FC 100%);
        }

        .cr-shell {
            width: 100%;
            max-width: 440px;
        }

        .cr-card {
            position: relative;
            overflow: hidden;
            border-radius: 22px;
            background: var(--white);
            box-shadow: 0 24px 56px rgba(0, 26, 58, 0.22);
            border: 1px solid rgba(201, 162, 39, 0.35);
            text-align: center;
            padding: 0 0 28px;
        }

        .cr-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--navy-deep), var(--navy-mid), var(--gold), var(--navy-mid), var(--navy-deep));
        }

        .cr-hero {
            position: relative;
            padding: 32px 26px 22px;
            background: linear-gradient(145deg, var(--navy-deep) 0%, var(--navy) 55%, var(--navy-mid) 100%);
            color: var(--white);
        }

        .cr-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(201, 162, 39, 0.12);
            top: -70px;
            right: -50px;
            pointer-events: none;
        }

        .cr-logo {
            position: relative;
            z-index: 1;
            width: 92px;
            height: 92px;
            margin: 0 auto 16px;
            border-radius: 50%;
            background: var(--white);
            padding: 8px;
            box-shadow:
                0 0 0 3px var(--gold-light),
                0 0 0 7px rgba(255, 255, 255, 0.15),
                0 10px 24px rgba(0, 0, 0, 0.2);
            object-fit: contain;
            display: block;
        }

        .cr-check {
            position: relative;
            z-index: 1;
            width: 48px;
            height: 48px;
            margin: 0 auto 14px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--gold), var(--gold-light));
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 18px rgba(201, 162, 39, 0.35);
        }

        .cr-check svg {
            width: 24px;
            height: 24px;
            fill: var(--navy-deep);
        }

        .cr-welcome {
            position: relative;
            z-index: 1;
            margin: 0 0 6px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 2rem;
            font-weight: 700;
            line-height: 1.2;
            color: var(--gold-light);
        }

        .cr-org {
            position: relative;
            z-index: 1;
            margin: 0;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 1.25rem;
            font-weight: 700;
            line-height: 1.3;
            color: var(--white);
        }

        .cr-brand-en {
            position: relative;
            z-index: 1;
            margin: 8px 0 0;
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: rgba(232, 197, 71, 0.85);
        }

        .cr-body {
            padding: 24px 26px 0;
        }

        .cr-msg {
            margin: 0 auto 18px;
            max-width: 360px;
            font-size: 1rem;
            font-weight: 500;
            line-height: 1.6;
            color: var(--text);
        }

        .cr-creds {
            margin: 0 auto 18px;
            max-width: 360px;
            padding: 16px 18px;
            border-radius: 14px;
            background: linear-gradient(180deg, #FBF9F4, #fff);
            border: 1px solid rgba(0, 43, 92, 0.1);
            text-align: left;
            box-shadow: 0 8px 20px rgba(0, 43, 92, 0.06);
        }

        .cr-creds__row {
            display: flex;
            flex-wrap: wrap;
            gap: 4px 10px;
            align-items: baseline;
            font-size: 0.95rem;
            font-weight: 700;
            line-height: 1.45;
            color: var(--navy);
        }

        .cr-creds__row + .cr-creds__row {
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid rgba(0, 43, 92, 0.08);
        }

        .cr-creds__label {
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: var(--muted);
            flex: 0 0 100%;
        }

        .cr-note {
            margin: 0 auto 20px;
            max-width: 360px;
            padding: 12px 14px;
            border-radius: 12px;
            background: linear-gradient(135deg, rgba(0, 43, 92, 0.05), rgba(201, 162, 39, 0.1));
            border-left: 4px solid var(--gold);
            font-size: 0.9rem;
            font-weight: 500;
            line-height: 1.55;
            color: var(--navy-deep);
            text-align: left;
        }

        .cr-member {
            margin: 0 0 18px;
            font-size: 0.95rem;
            font-weight: 600;
            color: var(--muted);
        }

        .cr-member strong {
            color: var(--navy);
            font-weight: 700;
        }

        .cr-login {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 46px;
            padding: 0 28px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--gold), var(--gold-light));
            color: var(--navy-deep);
            text-decoration: none;
            font-size: 1rem;
            font-weight: 700;
            box-shadow: 0 10px 22px rgba(201, 162, 39, 0.35);
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .cr-login:hover {
            transform: translateY(-1px);
            box-shadow: 0 14px 26px rgba(201, 162, 39, 0.45);
            color: var(--navy-deep);
            text-decoration: none;
        }

        .cr-hidden {
            display: none !important;
        }

        @media (max-width: 420px) {
            body {
                background: linear-gradient(180deg, #001A3A 0%, #002B5C 28%, #EEF2F7 28.1%, #F7F9FC 100%);
            }
            .cr-welcome { font-size: 1.65rem; }
            .cr-org { font-size: 1.1rem; }
            .cr-hero { padding: 28px 18px 18px; }
            .cr-body { padding: 20px 18px 0; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cr-shell">
            <div class="cr-card">
                <div class="cr-hero">
                    <img class="cr-logo" src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                    <div class="cr-check" aria-hidden="true">
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M9.2 16.6 4.9 12.3l1.4-1.4 2.9 2.9 8.5-8.5 1.4 1.4z" />
                        </svg>
                    </div>
                    <h1 class="cr-welcome">स्वागत है!</h1>
                    <h2 class="cr-org">भारत मानव कल्याण ट्रस्ट</h2>
                    <p class="cr-brand-en">Bharat Manav Kalyan Trust</p>
                </div>

                <div class="cr-body">
                    <p class="cr-msg">
                        आपकी रजिस्ट्रेशन प्रक्रिया सफलतापूर्वक पूर्ण हो गई है।
                        अब आप हमारे परिवार का एक महत्वपूर्ण हिस्सा हैं।
                    </p>

                    <div class="cr-creds">
                        <div class="cr-creds__row">
                            <span class="cr-creds__label">आपका यूज़र आईडी</span>
                            <asp:Label ID="LblLoginId" runat="server"></asp:Label>
                        </div>
                        <div class="cr-creds__row">
                            <span class="cr-creds__label">आपका पासवर्ड</span>
                            <asp:Label ID="LblPassword" runat="server"></asp:Label>
                        </div>
                    </div>

                    <p class="cr-note">
                        आपका एक कदम समाज के उत्थान की दिशा में महत्वपूर्ण योगदान है।
                        आइए मिलकर सेवा, समर्पण और विकास की नई मिसाल कायम करें।
                    </p>

                    <p class="cr-member">
                        प्रिय
                        <strong>
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                            <asp:Label ID="lblLastname" runat="server"></asp:Label>
                        </strong>
                    </p>

                    <a href="index.aspx" class="cr-login">Login करें</a>

                    <asp:Label ID="LblSponsorName" runat="server" CssClass="cr-hidden"></asp:Label>
                    <asp:Label ID="LblSponsorId" runat="server" CssClass="cr-hidden"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
