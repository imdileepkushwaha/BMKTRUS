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
            --cr-green: #22A84A;
            --cr-green-deep: #178A3A;
            --cr-green-dark: #0F5C28;
            --cr-heading: #14532D;
            --cr-black: #0B0B0B;
            --cr-white: #FFFFFF;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Hind", "Noto Sans Devanagari", "Segoe UI", sans-serif;
            background: #F3F5F4;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px 14px;
        }

        .cr-shell {
            width: 100%;
            max-width: 420px;
        }

        .cr-card {
            position: relative;
            overflow: hidden;
            border-radius: 28px 28px 24px 24px;
            background: linear-gradient(180deg, #2FC25A 0%, var(--cr-green) 42%, var(--cr-green-deep) 100%);
            box-shadow: 0 22px 48px rgba(23, 138, 58, 0.28);
            color: var(--cr-white);
            text-align: center;
            padding: 34px 26px 28px;
        }

        .cr-card::before {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
            top: -80px;
            right: -60px;
            pointer-events: none;
        }

        .cr-check {
            width: 74px;
            height: 74px;
            margin: 0 auto 18px;
            border-radius: 50%;
            background: var(--cr-white);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 24px rgba(0, 0, 0, 0.12);
            position: relative;
            z-index: 1;
        }

        .cr-check svg {
            width: 36px;
            height: 36px;
            fill: var(--cr-green-deep);
        }

        .cr-welcome {
            position: relative;
            z-index: 1;
            margin: 0 0 6px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 42px;
            font-weight: 700;
            line-height: 1.15;
            color: var(--cr-heading);
            letter-spacing: 0.01em;
        }

        .cr-welcome .emoji {
            font-size: 34px;
            vertical-align: middle;
            margin-right: 4px;
        }

        .cr-org {
            position: relative;
            z-index: 1;
            margin: 0 0 18px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 26px;
            font-weight: 700;
            line-height: 1.25;
            color: var(--cr-heading);
        }

        .cr-msg {
            position: relative;
            z-index: 1;
            margin: 0 auto 22px;
            max-width: 340px;
            font-size: 17px;
            font-weight: 500;
            line-height: 1.55;
            color: var(--cr-white);
            text-shadow: 0 1px 0 rgba(0, 0, 0, 0.08);
        }

        .cr-creds {
            position: relative;
            z-index: 1;
            margin: 0 auto 22px;
            max-width: 340px;
            padding: 18px 20px;
            border-radius: 16px;
            background: var(--cr-black);
            color: var(--cr-white);
            text-align: left;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.22);
        }

        .cr-creds__row {
            font-size: 18px;
            font-weight: 700;
            line-height: 1.45;
            letter-spacing: 0.01em;
        }

        .cr-creds__row + .cr-creds__row {
            margin-top: 8px;
        }

        .cr-creds__label {
            font-weight: 600;
            opacity: 0.95;
        }

        .cr-note {
            position: relative;
            z-index: 1;
            margin: 0 auto 22px;
            max-width: 340px;
            font-size: 15px;
            font-weight: 500;
            line-height: 1.55;
            color: var(--cr-white);
        }

        .cr-note .star {
            margin-right: 4px;
        }

        .cr-logo {
            position: relative;
            z-index: 1;
            width: 88px;
            height: 88px;
            margin: 0 auto 18px;
            border-radius: 50%;
            background: var(--cr-white);
            padding: 8px;
            box-shadow: 0 0 0 4px rgba(212, 175, 55, 0.75), 0 8px 20px rgba(0, 0, 0, 0.18);
            object-fit: contain;
            display: block;
        }

        .cr-member {
            position: relative;
            z-index: 1;
            margin: 0 0 18px;
            font-size: 15px;
            font-weight: 600;
            color: rgba(255, 255, 255, 0.95);
        }

        .cr-member strong {
            color: #FFF59D;
            font-weight: 700;
        }

        .cr-login {
            position: relative;
            z-index: 1;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 46px;
            padding: 0 28px;
            border-radius: 999px;
            background: var(--cr-white);
            color: var(--cr-green-dark);
            text-decoration: none;
            font-size: 16px;
            font-weight: 700;
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.16);
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        .cr-login:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 22px rgba(0, 0, 0, 0.2);
            color: var(--cr-green-dark);
            text-decoration: none;
        }

        .cr-hidden {
            display: none !important;
        }

        @media (max-width: 420px) {
            .cr-welcome { font-size: 36px; }
            .cr-org { font-size: 22px; }
            .cr-msg { font-size: 16px; }
            .cr-creds__row { font-size: 16px; }
            .cr-card { padding: 28px 18px 24px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cr-shell">
            <div class="cr-card">
                <div class="cr-check" aria-hidden="true">
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.2 16.6 4.9 12.3l1.4-1.4 2.9 2.9 8.5-8.5 1.4 1.4z" />
                    </svg>
                </div>

                <h1 class="cr-welcome"><span class="emoji">🎉</span> स्वागत है!</h1>
                <h2 class="cr-org">भारत मानव कल्याण ट्रस्ट</h2>

                <p class="cr-msg">
                    आपकी रजिस्ट्रेशन प्रक्रिया सफलतापूर्वक पूर्ण हो गई है।
                    अब आप हमारे परिवार का एक महत्वपूर्ण हिस्सा हैं। 🙏
                </p>

                <div class="cr-creds">
                    <div class="cr-creds__row">
                        <span class="cr-creds__label">आपका यूज़र आईडी:</span>
                        <asp:Label ID="LblLoginId" runat="server"></asp:Label>
                    </div>
                    <div class="cr-creds__row">
                        <span class="cr-creds__label">आपका पासवर्ड:</span>
                        <asp:Label ID="LblPassword" runat="server"></asp:Label>
                    </div>
                </div>

                <p class="cr-note">
                    <span class="star">⭐</span>
                    आपका एक कदम समाज के उत्थान की दिशा में महत्वपूर्ण योगदान है।
                    आइए मिलकर सेवा, समर्पण और विकास की नई मिसाल कायम करें।
                </p>

                <img class="cr-logo" src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />

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
    </form>
</body>
</html>
