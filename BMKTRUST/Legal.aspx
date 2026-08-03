<%@ Page Title="Legal &#8212; Bharat Manav Kalyan Trust" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Legal.aspx.cs" Inherits="LegalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-shell {
            padding: 48px 0 72px;
            background: linear-gradient(180deg, #F7F9FC 0%, #EEF2F7 100%);
        }
        .page-shell .info-panel { margin-top: 8px; }

        .legal-act-frame {
            position: relative;
            margin: 22px 0 28px;
            padding: 22px 24px 20px;
            border-radius: 14px;
            background:
                linear-gradient(135deg, rgba(232, 197, 71, 0.12) 0%, transparent 42%),
                linear-gradient(180deg, #FFFDF7 0%, #F7F1E2 100%);
            border: 1.5px solid rgba(201, 162, 39, 0.55);
            box-shadow:
                0 0 0 4px rgba(255, 253, 247, 0.9),
                0 0 0 5px rgba(0, 43, 92, 0.12),
                0 12px 28px rgba(0, 26, 58, 0.08);
            text-align: center;
            overflow: hidden;
        }

        .legal-act-frame::before,
        .legal-act-frame::after {
            content: "";
            position: absolute;
            width: 18px;
            height: 18px;
            border-color: #C9A227;
            border-style: solid;
        }

        .legal-act-frame::before {
            top: 10px;
            left: 10px;
            border-width: 2px 0 0 2px;
        }

        .legal-act-frame::after {
            right: 10px;
            bottom: 10px;
            border-width: 0 2px 2px 0;
        }

        .legal-act-seal {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 12px;
            padding: 5px 12px;
            border-radius: 999px;
            background: linear-gradient(135deg, #001A3A, #003D7A);
            color: #E8C547;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        .legal-act-seal-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: #E8C547;
            box-shadow: 0 0 0 3px rgba(232, 197, 71, 0.25);
        }

        .legal-act-en {
            margin: 0 0 6px;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: clamp(1.15rem, 2.4vw, 1.45rem);
            font-weight: 700;
            color: #001A3A;
            line-height: 1.35;
        }

        .legal-act-hi {
            margin: 0;
            font-family: "Noto Sans Devanagari", "Source Sans 3", sans-serif;
            font-size: clamp(1.02rem, 2vw, 1.2rem);
            font-weight: 700;
            color: #5A4508;
            line-height: 1.45;
        }

        .legal-act-divider {
            width: 56px;
            height: 2px;
            margin: 12px auto;
            background: linear-gradient(90deg, transparent, #C9A227, transparent);
            border-radius: 2px;
        }

        .legal-doc-grid {
            display: grid;
            grid-template-columns: minmax(0, 280px);
            gap: 18px;
            margin: 8px 0 26px;
        }

        @media (min-width: 640px) {
            .legal-doc-grid { grid-template-columns: repeat(2, minmax(0, 280px)); }
        }

        .legal-doc-card {
            display: block;
            width: 100%;
            padding: 0;
            border: 0;
            background: transparent;
            text-align: left;
            cursor: pointer;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 28px rgba(0, 26, 58, 0.1);
            border: 1.5px solid rgba(201, 162, 39, 0.45);
            transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease;
        }

        .legal-doc-card:hover {
            transform: translateY(-3px);
            border-color: rgba(201, 162, 39, 0.85);
            box-shadow: 0 16px 34px rgba(0, 26, 58, 0.14);
        }

        .legal-doc-card:focus-visible {
            outline: 3px solid rgba(201, 162, 39, 0.55);
            outline-offset: 3px;
        }

        .legal-doc-thumb {
            position: relative;
            aspect-ratio: 3 / 4;
            background:
                linear-gradient(135deg, rgba(232, 197, 71, 0.18) 0%, transparent 40%),
                linear-gradient(180deg, #FFFDF7 0%, #F0E6C8 100%);
            overflow: hidden;
            padding: 12px;
        }

        .legal-doc-thumb::before,
        .legal-doc-frame-br {
            content: "";
            position: absolute;
            width: 22px;
            height: 22px;
            border-color: #C9A227;
            border-style: solid;
            z-index: 2;
            pointer-events: none;
        }

        .legal-doc-thumb::before {
            top: 8px;
            left: 8px;
            border-width: 2px 0 0 2px;
        }

        .legal-doc-frame-br {
            right: 8px;
            bottom: 8px;
            border-width: 0 2px 2px 0;
        }

        .legal-doc-thumb-inner {
            position: relative;
            height: 100%;
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid rgba(0, 43, 92, 0.12);
            box-shadow:
                0 0 0 3px rgba(255, 253, 247, 0.95),
                0 0 0 4px rgba(201, 162, 39, 0.35),
                0 8px 18px rgba(0, 26, 58, 0.12);
            background: #fff;
        }

        .legal-doc-thumb img {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: top center;
        }

        .legal-doc-thumb::after {
            content: "Click to view";
            position: absolute;
            left: 20px;
            right: 20px;
            bottom: 20px;
            z-index: 3;
            padding: 8px 10px;
            border-radius: 999px;
            text-align: center;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.03em;
            color: #001A3A;
            background: linear-gradient(135deg, #C9A227, #E8C547);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
            opacity: 0;
            transform: translateY(6px);
            transition: opacity 0.2s ease, transform 0.2s ease;
        }

        html[data-lang="hi"] .legal-doc-thumb::after { content: "देखने के लिए क्लिक करें"; }

        .legal-doc-card:hover .legal-doc-thumb::after,
        .legal-doc-card:focus-visible .legal-doc-thumb::after {
            opacity: 1;
            transform: none;
        }

        .legal-doc-meta {
            padding: 14px 16px 16px;
            background: linear-gradient(180deg, #fff, #F7F9FC);
        }

        .legal-doc-meta .eyebrow {
            display: block;
            margin-bottom: 4px;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: #C9A227;
        }

        .legal-doc-meta strong {
            display: block;
            font-size: 1rem;
            color: #001A3A;
            line-height: 1.3;
        }

        .legal-doc-meta span {
            display: block;
            margin-top: 4px;
            font-size: 0.82rem;
            color: #5A6B7C;
            font-weight: 600;
        }

        .legal-doc-lightbox {
            position: fixed;
            inset: 0;
            z-index: 100000;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            opacity: 0;
            visibility: hidden;
            pointer-events: none;
            transition: opacity 0.25s ease, visibility 0.25s ease;
        }

        .legal-doc-lightbox.is-open {
            opacity: 1;
            visibility: visible;
            pointer-events: auto;
        }

        .legal-doc-lightbox-backdrop {
            position: absolute;
            inset: 0;
            background: rgba(0, 10, 25, 0.9);
            backdrop-filter: blur(8px);
        }

        .legal-doc-lightbox-dialog {
            position: relative;
            z-index: 2;
            max-width: min(720px, 94vw);
            max-height: 90vh;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 12px;
            animation: legal-doc-in 0.28s ease;
        }

        @keyframes legal-doc-in {
            from { transform: translateY(10px) scale(0.98); opacity: 0; }
            to { transform: none; opacity: 1; }
        }

        .legal-doc-lightbox-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .legal-doc-lightbox-title {
            color: #fff;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 1.15rem;
            font-weight: 700;
        }

        .legal-doc-lightbox-close {
            width: 40px;
            height: 40px;
            border: 1px solid rgba(255,255,255,0.25);
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
            color: #fff;
            font-size: 22px;
            line-height: 1;
            cursor: pointer;
        }

        .legal-doc-lightbox-close:hover {
            background: linear-gradient(135deg, #C9A227, #E8C547);
            color: #001A3A;
            border-color: transparent;
        }

        .legal-doc-lightbox-media {
            overflow: auto;
            border-radius: 14px;
            background:
                linear-gradient(135deg, rgba(232, 197, 71, 0.14) 0%, transparent 42%),
                #FFFDF7;
            box-shadow: 0 20px 60px rgba(0,0,0,0.45);
            max-height: calc(90vh - 56px);
            padding: 14px;
            border: 1.5px solid rgba(201, 162, 39, 0.55);
            position: relative;
        }

        .legal-doc-lightbox-media::before,
        .legal-doc-lightbox-media::after {
            content: "";
            position: absolute;
            width: 22px;
            height: 22px;
            border-color: #C9A227;
            border-style: solid;
            z-index: 2;
            pointer-events: none;
        }

        .legal-doc-lightbox-media::before {
            top: 10px;
            left: 10px;
            border-width: 2px 0 0 2px;
        }

        .legal-doc-lightbox-media::after {
            right: 10px;
            bottom: 10px;
            border-width: 0 2px 2px 0;
        }

        .legal-doc-lightbox-media img {
            display: block;
            width: 100%;
            height: auto;
            border-radius: 8px;
            border: 1px solid rgba(0, 43, 92, 0.1);
            box-shadow:
                0 0 0 3px rgba(255, 253, 247, 0.95),
                0 0 0 4px rgba(201, 162, 39, 0.3);
            background: #fff;
        }
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

                <div class="legal-act-frame" role="note" aria-label="Governing Act">
                    <div class="legal-act-seal">
                        <span class="legal-act-seal-dot" aria-hidden="true"></span>
                        <span data-hi="शासकीय अधिनियम">Governing Act</span>
                    </div>
                    <p class="legal-act-en">Government Central Under Act, 1882</p>
                    <div class="legal-act-divider" aria-hidden="true"></div>
                    <p class="legal-act-hi">भारतीय न्याय अधिनियम, 1882</p>
                </div>

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

                <h3 style="margin-top:28px;" data-hi="आधिकारिक दस्तावेज़">Official Documents</h3>
                <div class="legal-doc-grid">
                    <button type="button" class="legal-doc-card" id="btnPanCard"
                        data-src="<%= ResolveUrl("~/site/assets/images/legal/pan-card.png") %>"
                        data-title="PAN Card — Bharat Manav Kalyan Trust"
                        data-title-hi="पैन कार्ड — भारत मानव कल्याण ट्रस्ट"
                        aria-label="View PAN Card">
                        <div class="legal-doc-thumb">
                            <span class="legal-doc-frame-br" aria-hidden="true"></span>
                            <div class="legal-doc-thumb-inner">
                                <img src="<%= ResolveUrl("~/site/assets/images/legal/pan-card.png") %>" alt="PAN Card of Bharat Manav Kalyan Trust" loading="lazy" />
                            </div>
                        </div>
                        <div class="legal-doc-meta">
                            <span class="eyebrow" data-hi="आयकर विभाग">Income Tax Department</span>
                            <strong data-hi="पैन कार्ड (ई-पैन)">PAN Card (e-PAN)</strong>
                            <span data-hi="BHARAT MANAV KALYAN TRUST · AAGTB4577K">BHARAT MANAV KALYAN TRUST · AAGTB4577K</span>
                        </div>
                    </button>
                </div>

                <p>
                    <span data-hi="पंजीकरण विवरण, प्रमाणपत्र या किसी कानूनी जानकारी के लिए कृपया">For registration details, certificates, or legal enquiries, please</span>
                    <a href="<%= ResolveUrl("~/index.aspx") %>#contact" data-hi="हमसे संपर्क करें">contact us</a>.
                </p>
                <p style="margin-top:18px;">
                    <a href="<%= ResolveUrl("~/TermsConditions.aspx") %>" class="btn btn-outline-dark" data-hi="नियम एवं शर्तें पढ़ें">Read Terms &amp; Conditions</a>
                    <a href="<%= ResolveUrl("~/site/assets/docs/pan-card.pdf") %>" class="btn btn-primary" style="margin-left:8px;" target="_blank" rel="noopener" data-hi="पैन PDF डाउनलोड">Download PAN PDF</a>
                </p>
            </div>
        </div>
    </section>

    <div class="legal-doc-lightbox" id="legalDocLightbox" aria-hidden="true" role="dialog" aria-modal="true" aria-labelledby="legalDocTitle">
        <div class="legal-doc-lightbox-backdrop" data-close-legal-doc></div>
        <div class="legal-doc-lightbox-dialog">
            <div class="legal-doc-lightbox-toolbar">
                <div class="legal-doc-lightbox-title" id="legalDocTitle">PAN Card</div>
                <button type="button" class="legal-doc-lightbox-close" id="legalDocClose" aria-label="Close">&times;</button>
            </div>
            <div class="legal-doc-lightbox-media">
                <img src="" alt="Document preview" id="legalDocImage" />
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
        (function () {
            var overlay = document.getElementById('legalDocLightbox');
            var img = document.getElementById('legalDocImage');
            var title = document.getElementById('legalDocTitle');
            var closeBtn = document.getElementById('legalDocClose');
            var trigger = document.getElementById('btnPanCard');
            if (!overlay || !img || !trigger) return;

            function openDoc(src, caption) {
                img.src = src;
                img.alt = caption || 'Document';
                if (title) title.textContent = caption || 'Document';
                overlay.classList.add('is-open');
                overlay.setAttribute('aria-hidden', 'false');
                document.documentElement.style.overflow = 'hidden';
                document.body.style.overflow = 'hidden';
            }

            function closeDoc() {
                overlay.classList.remove('is-open');
                overlay.setAttribute('aria-hidden', 'true');
                document.documentElement.style.overflow = '';
                document.body.style.overflow = '';
            }

            trigger.addEventListener('click', function () {
                var lang = (window.BMKLang && window.BMKLang.get() === 'hi') ? 'hi' : 'en';
                var caption = lang === 'hi'
                    ? (trigger.getAttribute('data-title-hi') || trigger.getAttribute('data-title'))
                    : trigger.getAttribute('data-title');
                openDoc(trigger.getAttribute('data-src'), caption);
            });

            if (closeBtn) closeBtn.addEventListener('click', closeDoc);
            overlay.querySelector('[data-close-legal-doc]').addEventListener('click', closeDoc);
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape' && overlay.classList.contains('is-open')) closeDoc();
            });
        })();
    </script>
</asp:Content>
