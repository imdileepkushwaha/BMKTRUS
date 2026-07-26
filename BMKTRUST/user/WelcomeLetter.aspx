<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WelcomeLetter.aspx.cs" Inherits="user_WelcomeLetter" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome Letter | Bharat Manav Kalyan Trust</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,600;0,700;1,600&family=Hind:wght@400;500;600;700&family=Noto+Sans+Devanagari:wght@500;600;700&display=swap" rel="stylesheet" />
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
            --paper: #FFFEFA;
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
            max-width: 794px; /* A4 width ~210mm */
            margin: 0 auto;
            padding: 24px 12px 40px;
        }

        .wl-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 16px;
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

        /* Outer shell — certificate / formal letter frame (A4 proportion) */
        .wl-letter {
            position: relative;
            display: flex;
            flex-direction: column;
            min-height: 1123px; /* A4 height ~297mm */
            background:
                linear-gradient(180deg, rgba(255, 254, 250, 0.98), #fff 40%),
                repeating-linear-gradient(
                    0deg,
                    transparent,
                    transparent 27px,
                    rgba(0, 43, 92, 0.015) 27px,
                    rgba(0, 43, 92, 0.015) 28px
                );
            background-color: var(--paper);
            border-radius: 6px;
            padding: 14px;
            box-shadow:
                0 24px 56px rgba(0, 26, 58, 0.2),
                0 0 0 1px rgba(201, 162, 39, 0.35);
        }

        .wl-frame {
            position: relative;
            flex: 1;
            display: flex;
            flex-direction: column;
            border: 2px solid var(--navy);
            padding: 10px;
            min-height: 0;
        }

        .wl-frame-inner {
            position: relative;
            flex: 1;
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(201, 162, 39, 0.85);
            padding: 28px 32px 22px;
            background: transparent;
            min-height: 0;
        }

        /* Double-line accent via inset rings */
        .wl-frame::before {
            content: "";
            position: absolute;
            inset: 5px;
            border: 1px solid rgba(201, 162, 39, 0.55);
            pointer-events: none;
            z-index: 1;
        }

        .wl-frame-inner::before {
            content: "";
            position: absolute;
            inset: 8px;
            border: 1px solid rgba(0, 43, 92, 0.1);
            pointer-events: none;
            z-index: 0;
        }

        /* Ornamental corners */
        .wl-corner {
            position: absolute;
            width: 26px;
            height: 26px;
            z-index: 3;
            pointer-events: none;
        }

        .wl-corner::before,
        .wl-corner::after {
            content: "";
            position: absolute;
            background: var(--gold);
        }

        .wl-corner-tl { top: -2px; left: -2px; }
        .wl-corner-tr { top: -2px; right: -2px; }
        .wl-corner-bl { bottom: -2px; left: -2px; }
        .wl-corner-br { bottom: -2px; right: -2px; }

        .wl-corner-tl::before,
        .wl-corner-tr::before,
        .wl-corner-bl::before,
        .wl-corner-br::before {
            width: 26px;
            height: 3px;
        }

        .wl-corner-tl::after,
        .wl-corner-tr::after,
        .wl-corner-bl::after,
        .wl-corner-br::after {
            width: 3px;
            height: 26px;
        }

        .wl-corner-tl::before,
        .wl-corner-tl::after { top: 0; left: 0; }
        .wl-corner-tr::before { top: 0; right: 0; }
        .wl-corner-tr::after { top: 0; right: 0; }
        .wl-corner-bl::before { bottom: 0; left: 0; }
        .wl-corner-bl::after { bottom: 0; left: 0; }
        .wl-corner-br::before { bottom: 0; right: 0; }
        .wl-corner-br::after { bottom: 0; right: 0; }

        /* Inner gold diamond accents on corners of inner frame */
        .wl-frame-inner > .wl-ornament {
            position: absolute;
            width: 9px;
            height: 9px;
            background: var(--gold);
            transform: rotate(45deg);
            z-index: 2;
            box-shadow: 0 0 0 2px #fff, 0 0 0 3px rgba(0, 43, 92, 0.25);
        }

        .wl-ornament-tl { top: 2px; left: 2px; }
        .wl-ornament-tr { top: 2px; right: 2px; }
        .wl-ornament-bl { bottom: 2px; left: 2px; }
        .wl-ornament-br { bottom: 2px; right: 2px; }

        /* Top & bottom decorative bands */
        .wl-band {
            position: relative;
            flex-shrink: 0;
            height: 5px;
            margin: 0 8px 16px;
            background: linear-gradient(90deg,
                transparent 0%,
                var(--navy-deep) 8%,
                var(--navy-mid) 35%,
                var(--gold) 50%,
                var(--navy-mid) 65%,
                var(--navy-deep) 92%,
                transparent 100%);
            border-radius: 2px;
        }

        .wl-band-bottom {
            margin: 16px 8px 0;
        }

        .wl-band::before,
        .wl-band::after {
            content: "";
            position: absolute;
            top: 50%;
            width: 7px;
            height: 7px;
            background: var(--gold-light);
            transform: translateY(-50%) rotate(45deg);
            box-shadow: 0 0 0 2px var(--navy);
        }

        .wl-band::before { left: 10%; }
        .wl-band::after { right: 10%; }

        .wl-content {
            position: relative;
            z-index: 2;
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 0;
        }

        .wl-header {
            text-align: center;
            margin-bottom: 18px;
            padding-bottom: 14px;
            border-bottom: 1px solid var(--line);
            position: relative;
            flex-shrink: 0;
        }

        .wl-header::after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: -1px;
            width: 110px;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--gold), transparent);
            transform: translateX(-50%);
        }

        .wl-logo {
            width: 96px;
            height: 96px;
            object-fit: contain;
            border-radius: 50%;
            background: #fff;
            padding: 6px;
            box-shadow:
                0 0 0 2px var(--gold),
                0 0 0 5px var(--navy),
                0 0 0 6px rgba(201, 162, 39, 0.45),
                0 8px 18px rgba(0, 43, 92, 0.1);
            display: block;
            margin: 0 auto 12px;
        }

        .wl-brand-en {
            margin: 0 0 6px;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 0.9rem;
            font-weight: 700;
            letter-spacing: 0.16em;
            text-transform: uppercase;
            color: var(--gold);
        }

        .wl-doc-label {
            display: inline-block;
            margin: 0 0 8px;
            padding: 3px 12px;
            font-size: 0.64rem;
            font-weight: 700;
            letter-spacing: 0.14em;
            text-transform: uppercase;
            color: var(--navy);
            border: 1px solid rgba(201, 162, 39, 0.55);
            background: linear-gradient(180deg, rgba(201, 162, 39, 0.12), rgba(201, 162, 39, 0.04));
        }

        .wl-title {
            margin: 0 0 8px;
            font-family: "Noto Sans Devanagari", "Hind", sans-serif;
            font-size: 1.45rem;
            font-weight: 700;
            line-height: 1.35;
            color: var(--navy);
        }

        .wl-subtitle {
            margin: 0 auto;
            max-width: 520px;
            font-size: 0.9rem;
            font-weight: 500;
            color: var(--muted);
            line-height: 1.45;
        }

        .wl-salute {
            margin: 0 0 4px;
            font-size: 1.05rem;
            font-weight: 500;
            color: var(--text);
            flex-shrink: 0;
        }

        .wl-salute strong {
            font-weight: 700;
            color: var(--navy);
        }

        .wl-heart {
            margin: 0 0 14px;
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--gold);
            flex-shrink: 0;
        }

        .wl-body {
            flex: 1;
        }

        .wl-body p {
            margin: 0 0 12px;
            font-size: 0.95rem;
            font-weight: 500;
            line-height: 1.65;
            color: var(--text);
            text-align: justify;
        }

        .wl-body strong {
            font-weight: 700;
            color: var(--navy);
        }

        .wl-cta {
            margin: 8px 0 16px;
            padding: 12px 14px;
            border-radius: 4px;
            background: linear-gradient(135deg, rgba(0, 43, 92, 0.05), rgba(201, 162, 39, 0.1));
            border: 1px solid rgba(201, 162, 39, 0.35);
            border-left: 4px solid var(--gold);
            font-size: 0.95rem;
            font-weight: 700;
            line-height: 1.55;
            color: var(--navy-deep);
            flex-shrink: 0;
        }

        .wl-thanks {
            margin: 0 0 2px;
            font-size: 0.95rem;
            font-weight: 500;
            flex-shrink: 0;
        }

        .wl-org {
            margin: 0 0 8px;
            font-size: 1rem;
            font-weight: 700;
            color: var(--navy);
            flex-shrink: 0;
        }

        .wl-meta {
            display: grid;
            grid-template-columns: 1fr 180px;
            gap: 20px;
            align-items: end;
            margin-top: auto;
            margin-bottom: 18px;
            flex-shrink: 0;
            padding-top: 12px;
        }

        .wl-details {
            display: grid;
            gap: 0;
            border-radius: 4px;
            border: 1px solid rgba(0, 43, 92, 0.18);
            overflow: hidden;
            background: linear-gradient(180deg, rgba(0, 43, 92, 0.03), #fff);
            box-shadow: inset 0 0 0 1px rgba(201, 162, 39, 0.2);
        }

        .wl-detail-row {
            display: grid;
            grid-template-columns: 130px 1fr;
            gap: 8px;
            padding: 9px 12px;
            font-size: 0.88rem;
            font-weight: 700;
            color: var(--navy);
            border-bottom: 1px solid var(--line);
        }

        .wl-detail-row:last-child { border-bottom: 0; }

        .wl-detail-row span {
            font-weight: 600;
            color: var(--muted);
            text-transform: uppercase;
            font-size: 0.68rem;
            letter-spacing: 0.05em;
            align-self: center;
        }

        .wl-sign { text-align: center; }

        .wl-sign-box {
            width: 170px;
            height: 95px;
            margin: 0 auto 6px;
            border: 1px solid rgba(201, 162, 39, 0.55);
            border-radius: 4px;
            background: linear-gradient(180deg, #fff, #F8F6F0);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            box-shadow:
                inset 0 0 0 2px rgba(0, 43, 92, 0.06),
                0 4px 10px rgba(0, 43, 92, 0.06);
        }

        .wl-sign-box img {
            max-width: 90%;
            max-height: 90%;
            object-fit: contain;
        }

        .wl-sign-box .wl-sign-placeholder {
            font-family: "Segoe Script", "Brush Script MT", cursive;
            font-size: 22px;
            color: var(--navy-mid);
            opacity: 0.75;
        }

        .wl-sign-label {
            margin: 0;
            font-size: 0.74rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            color: var(--navy);
        }

        .wl-footer {
            text-align: center;
            padding-top: 14px;
            border-top: 1px solid var(--line);
            position: relative;
            flex-shrink: 0;
        }

        .wl-footer::before {
            content: "✦";
            position: absolute;
            top: -9px;
            left: 50%;
            transform: translateX(-50%);
            width: 24px;
            background: var(--paper);
            color: var(--gold);
            font-size: 0.7rem;
            line-height: 1;
        }

        .wl-footer-quote {
            margin: 0 0 6px;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 0.98rem;
            font-weight: 600;
            font-style: italic;
            color: var(--navy-mid);
            line-height: 1.4;
        }

        .wl-footer-thanks {
            margin: 0 0 4px;
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--text);
        }

        .wl-footer-team {
            margin: 0;
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--navy);
        }

        .wl-tricolor {
            display: flex;
            height: 4px;
            margin-top: 12px;
            border-radius: 2px;
            overflow: hidden;
            flex-shrink: 0;
        }

        .wl-tricolor span { flex: 1; }
        .wl-tricolor span:nth-child(1) { background: #FF9933; }
        .wl-tricolor span:nth-child(2) { background: #FFFFFF; box-shadow: inset 0 0 0 1px rgba(0,0,0,0.06); }
        .wl-tricolor span:nth-child(3) { background: #138808; }

        @page {
            size: A4 portrait;
            margin: 10mm;
        }

        @media print {
            html, body {
                background: #fff !important;
                width: 100%;
                height: 100%;
                margin: 0 !important;
                padding: 0 !important;
                -webkit-print-color-adjust: exact;
                print-color-adjust: exact;
            }
            form#form1 {
                height: 100%;
                margin: 0;
                padding: 0;
            }
            .wl-toolbar { display: none !important; }
            .wl-page {
                padding: 0 !important;
                max-width: none !important;
                margin: 0 !important;
                width: 100%;
                height: 277mm; /* A4 297mm - 20mm margins */
            }
            .wl-letter {
                box-shadow: none !important;
                border-radius: 0;
                padding: 6px;
                width: 100%;
                height: 277mm;
                min-height: 277mm;
                max-height: 277mm;
                page-break-inside: avoid;
                break-inside: avoid;
                overflow: hidden;
            }
            .wl-frame {
                padding: 8px;
                height: 100%;
            }
            .wl-frame-inner {
                padding: 20px 24px 14px;
                height: 100%;
            }
            .wl-band { margin-bottom: 12px; }
            .wl-band-bottom { margin-top: 12px; }
            .wl-logo {
                width: 88px;
                height: 88px;
                margin-bottom: 10px;
            }
            .wl-header {
                margin-bottom: 14px;
                padding-bottom: 12px;
            }
            .wl-title { font-size: 1.35rem; }
            .wl-body p {
                font-size: 0.92rem;
                line-height: 1.6;
                margin-bottom: 10px;
            }
            .wl-sign-box {
                width: 160px;
                height: 88px;
            }
            .wl-meta { margin-bottom: 14px; }
        }

        @media (max-width: 700px) {
            body {
                background: linear-gradient(180deg, #001A3A 0%, #002B5C 18%, #EEF2F7 18.1%, #F7F9FC 100%);
            }
            .wl-letter {
                min-height: 0;
                padding: 8px;
            }
            .wl-frame { padding: 6px; }
            .wl-frame-inner { padding: 16px 12px 14px; }
            .wl-title { font-size: 1.15rem; }
            .wl-meta {
                grid-template-columns: 1fr;
                gap: 14px;
            }
            .wl-sign { text-align: left; }
            .wl-sign-box { margin-left: 0; }
            .wl-body p { text-align: left; }
            .wl-detail-row {
                grid-template-columns: 1fr;
                gap: 2px;
            }
            .wl-corner { width: 18px; height: 18px; }
            .wl-corner-tl::before,
            .wl-corner-tr::before,
            .wl-corner-bl::before,
            .wl-corner-br::before { width: 18px; }
            .wl-corner-tl::after,
            .wl-corner-tr::after,
            .wl-corner-bl::after,
            .wl-corner-br::after { height: 18px; }
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
                <div class="wl-frame">
                    <span class="wl-corner wl-corner-tl" aria-hidden="true"></span>
                    <span class="wl-corner wl-corner-tr" aria-hidden="true"></span>
                    <span class="wl-corner wl-corner-bl" aria-hidden="true"></span>
                    <span class="wl-corner wl-corner-br" aria-hidden="true"></span>

                    <div class="wl-frame-inner">
                        <span class="wl-ornament wl-ornament-tl" aria-hidden="true"></span>
                        <span class="wl-ornament wl-ornament-tr" aria-hidden="true"></span>
                        <span class="wl-ornament wl-ornament-bl" aria-hidden="true"></span>
                        <span class="wl-ornament wl-ornament-br" aria-hidden="true"></span>

                        <div class="wl-band" aria-hidden="true"></div>

                        <div class="wl-content">
                            <header class="wl-header">
                                <img class="wl-logo" src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                                <p class="wl-brand-en">Bharat Manav Kalyan Trust</p>
                                <span class="wl-doc-label">Official Welcome Letter</span>
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
                        </div>

                        <div class="wl-band wl-band-bottom" aria-hidden="true"></div>
                        <div class="wl-tricolor" aria-hidden="true"><span></span><span></span><span></span></div>
                    </div>
                </div>
            </article>
        </div>
    </form>
</body>
</html>
