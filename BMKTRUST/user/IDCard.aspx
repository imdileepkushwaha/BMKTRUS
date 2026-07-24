<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IDCard.aspx.cs" Inherits="user_idcard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Member ID Card | Bharat Manav Kalyan Trust</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600;700&family=Source+Sans+3:wght@400;600;700&display=swap" rel="stylesheet" />
    <style type="text/css">
        :root {
            --id-navy: #002B5C;
            --id-navy-deep: #001A3A;
            --id-navy-light: #003D7A;
            --id-gold: #C9A227;
            --id-gold-light: #E8C547;
            --id-heading: #002B5C;
            --id-ink: #1A2B3C;
            --id-muted: #5A6B7C;
            --id-line: #E8E4D8;
            --id-bg: #FAF8F3;
            --id-card-w: 340px;
            --id-card-h: 540px;
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: "Source Sans 3", "Segoe UI", sans-serif;
            background:
                radial-gradient(ellipse at top, rgba(201, 162, 39, 0.14), transparent 50%),
                linear-gradient(180deg, #FAFBFD 0%, var(--id-bg) 100%);
            color: var(--id-ink);
        }

        .id-page {
            max-width: 920px;
            margin: 0 auto;
            padding: 28px 16px 48px;
        }

        .id-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 24px;
        }

        .id-toolbar h1 {
            margin: 0;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 28px;
            font-weight: 700;
            color: var(--id-heading);
        }

        .id-toolbar p {
            margin: 4px 0 0;
            font-size: 13px;
            color: var(--id-muted);
            font-weight: 600;
        }

        .id-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .id-btn {
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

        .id-btn-primary {
            background: linear-gradient(135deg, var(--id-navy), var(--id-navy-light));
            color: #fff;
            box-shadow: 0 8px 18px rgba(0, 26, 58, 0.28);
        }

        .id-btn-ghost {
            background: #fff;
            color: var(--id-heading);
            border: 1px solid var(--id-line);
        }

        .id-stage {
            display: flex;
            justify-content: center;
            gap: 28px;
            flex-wrap: wrap;
        }

        .id-card {
            width: var(--id-card-w);
            height: var(--id-card-h);
            border-radius: 22px;
            overflow: hidden;
            position: relative;
            background: #fff;
            box-shadow:
                0 20px 40px rgba(0, 26, 58, 0.14),
                0 2px 0 rgba(255, 255, 255, 0.6) inset;
            border: 1px solid rgba(201, 162, 39, 0.28);
        }

        .id-card--front {
            background:
                linear-gradient(165deg, #F7F1E3 0%, #FFFFFF 42%, #FAFBFD 100%);
        }

        .id-card--front::before {
            content: "";
            position: absolute;
            inset: 0 0 auto 0;
            height: 148px;
            background:
                radial-gradient(circle at 85% 20%, rgba(232, 197, 71, 0.28), transparent 40%),
                linear-gradient(135deg, #001A3A 0%, #002B5C 45%, #003D7A 100%);
        }

        .id-card--front::after {
            content: "";
            position: absolute;
            left: -40px;
            top: 108px;
            width: 140%;
            height: 70px;
            background: #fff;
            border-radius: 50% 50% 0 0 / 100% 100% 0 0;
            z-index: 1;
        }

        .id-card__inner {
            position: relative;
            z-index: 2;
            height: 100%;
            padding: 18px 20px 20px;
            display: flex;
            flex-direction: column;
        }

        .id-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            color: #fff;
            min-height: 72px;
        }

        .id-brand img {
            width: 54px;
            height: 54px;
            object-fit: contain;
            background: #fff;
            border-radius: 14px;
            padding: 4px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.18);
            border: 1.5px solid rgba(201, 162, 39, 0.55);
        }

        .id-brand__text strong {
            display: block;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 18px;
            line-height: 1.15;
            font-weight: 700;
        }

        .id-brand__text span {
            display: block;
            margin-top: 3px;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--id-gold-light);
            opacity: 0.95;
        }

        .id-photo-wrap {
            align-self: center;
            margin-top: 18px;
            width: 132px;
            height: 132px;
            border-radius: 50%;
            padding: 5px;
            background: linear-gradient(145deg, #fff, #F7F1E3);
            box-shadow: 0 10px 24px rgba(0, 26, 58, 0.12);
            border: 3px solid rgba(201, 162, 39, 0.45);
        }

        .id-photo-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
            display: block;
            background: #F3EFE4;
        }

        .id-name {
            margin: 16px 0 4px;
            text-align: center;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 26px;
            font-weight: 700;
            line-height: 1.15;
            color: var(--id-heading);
        }

        .id-role {
            text-align: center;
            margin: 0 0 14px;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
            color: var(--id-gold);
        }

        .id-chip {
            align-self: center;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            min-height: 34px;
            padding: 0 14px;
            border-radius: 999px;
            background: rgba(0, 43, 92, 0.08);
            color: var(--id-navy);
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 16px;
            border: 1px solid rgba(201, 162, 39, 0.28);
        }

        .id-chip span {
            opacity: 0.7;
            font-weight: 600;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.06em;
        }

        .id-rows {
            margin-top: auto;
            display: grid;
            gap: 10px;
            padding-top: 12px;
            border-top: 1px solid var(--id-line);
        }

        .id-row {
            display: grid;
            grid-template-columns: 88px 1fr;
            gap: 8px;
            align-items: start;
        }

        .id-row dt {
            margin: 0;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: var(--id-muted);
        }

        .id-row dd {
            margin: 0;
            font-size: 13px;
            font-weight: 600;
            color: var(--id-heading);
            word-break: break-word;
            line-height: 1.35;
        }

        .id-card--back {
            background:
                linear-gradient(180deg, #001A3A 0%, #002B5C 42%, #003D7A 100%);
            color: #fff;
        }

        .id-card--back .id-card__inner {
            padding: 0;
            display: flex;
            flex-direction: column;
        }

        .id-back-top {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 18px 20px 16px;
            background: linear-gradient(135deg, #001A3A 0%, #002B5C 55%, #003D7A 100%);
            border-bottom: 2px solid rgba(201, 162, 39, 0.45);
            flex-shrink: 0;
        }

        .id-back-top img {
            width: 48px;
            height: 48px;
            object-fit: contain;
            background: #fff;
            border-radius: 12px;
            padding: 4px;
            border: 1.5px solid rgba(201, 162, 39, 0.55);
        }

        .id-back-top strong {
            display: block;
            font-family: "Cormorant Garamond", Georgia, serif;
            font-size: 18px;
            font-weight: 700;
            color: #fff;
        }

        .id-back-top span {
            display: block;
            margin-top: 2px;
            font-size: 11px;
            color: var(--id-gold-light);
            font-weight: 600;
            letter-spacing: 0.06em;
            text-transform: uppercase;
        }

        .id-back-body {
            flex: 1;
            min-height: 0;
            background: #fff;
            color: var(--id-ink);
            padding: 16px 18px 14px;
            overflow: auto;
        }

        .id-back-block {
            margin-bottom: 12px;
        }

        .id-back-block h3 {
            margin: 0 0 6px;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--id-gold);
        }

        .id-back-block p,
        .id-back-block .id-back-value {
            margin: 0;
            font-size: 13px;
            font-weight: 600;
            line-height: 1.45;
            color: var(--id-heading);
            word-break: break-word;
        }

        .id-back-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px 12px;
            margin-bottom: 12px;
        }

        .id-note {
            margin-top: 4px;
            padding: 12px 14px;
            border-radius: 12px;
            background: linear-gradient(180deg, #FBF9F4, #F7F9FC);
            border: 1px solid rgba(0, 43, 92, 0.1);
            font-size: 11px;
            line-height: 1.5;
            color: var(--id-muted);
        }

        .id-note strong {
            display: block;
            margin-bottom: 4px;
            color: var(--id-navy);
            font-size: 12px;
        }

        .id-footer-mark {
            flex-shrink: 0;
            margin-top: 0;
            padding: 14px 16px;
            text-align: center;
            font-size: 11px;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: rgba(232, 197, 71, 0.95);
            background: linear-gradient(135deg, #001A3A 0%, #002B5C 55%, #003D7A 100%);
            border-top: 2px solid rgba(201, 162, 39, 0.45);
        }

        @media print {
            body {
                background: #fff;
            }

            .id-toolbar,
            .id-actions {
                display: none !important;
            }

            .id-page {
                padding: 0;
                max-width: none;
            }

            .id-stage {
                gap: 16px;
            }

            .id-card {
                box-shadow: none;
                break-inside: avoid;
            }
        }

        @media (max-width: 760px) {
            .id-toolbar h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="id-page">
            <div class="id-toolbar">
                <div>
                    <h1>Member ID Card</h1>
                    <p>Bharat Manav Kalyan Trust &mdash; official membership identity</p>
                </div>
                <div class="id-actions">
                    <a href="Dashboard.aspx" class="id-btn id-btn-ghost">Back</a>
                    <asp:Button ID="btnprint" runat="server" Text="Print" CssClass="id-btn id-btn-primary" OnClientClick="window.print(); return false;" />
                </div>
            </div>

            <div class="id-stage">
                <!-- FRONT -->
                <article class="id-card id-card--front">
                    <div class="id-card__inner">
                        <div class="id-brand">
                            <asp:Image ID="imgLogoFront" runat="server" ImageUrl="~/site/assets/images/logo.png" AlternateText="BMK Trust Logo" />
                            <div class="id-brand__text">
                                <strong>Bharat Manav Kalyan Trust</strong>
                                <span>Member Identity Card</span>
                            </div>
                        </div>

                        <div class="id-photo-wrap">
                            <asp:Image ID="ImgMyPhoto" runat="server" AlternateText="Member photo" />
                        </div>

                        <h2 class="id-name"><asp:Label ID="lblusername" runat="server"></asp:Label></h2>
                        <p class="id-role">Registered Member</p>

                        <div class="id-chip">
                            <span>ID</span>
                            <asp:Label ID="lbluserid" runat="server"></asp:Label>
                        </div>

                        <dl class="id-rows">
                            <div class="id-row">
                                <dt>Mobile</dt>
                                <dd><asp:Label ID="lblmobile" runat="server"></asp:Label></dd>
                            </div>
                            <div class="id-row">
                                <dt>Email</dt>
                                <dd><asp:Label ID="lblemail" runat="server"></asp:Label></dd>
                            </div>
                            <div class="id-row">
                                <dt>Joined</dt>
                                <dd><asp:Label ID="lbljoiningdate" runat="server"></asp:Label></dd>
                            </div>
                            <div class="id-row">
                                <dt>Gender</dt>
                                <dd><asp:Label ID="lblgender" runat="server"></asp:Label></dd>
                            </div>
                        </dl>
                    </div>
                </article>

                <!-- BACK -->
                <article class="id-card id-card--back">
                    <div class="id-card__inner">
                        <div class="id-back-top">
                            <asp:Image ID="imgLogoBack" runat="server" ImageUrl="~/site/assets/images/logo.png" AlternateText="BMK Trust Logo" />
                            <div>
                                <strong>Bharat Manav Kalyan Trust</strong>
                                <span>सेवा • समर्पण • सशक्तिकरण</span>
                            </div>
                        </div>

                        <div class="id-back-body">
                            <div class="id-back-block">
                                <h3>Address</h3>
                                <p><asp:Label ID="lbladdress" runat="server"></asp:Label></p>
                            </div>

                            <div class="id-back-grid">
                                <div class="id-back-block">
                                    <h3>City</h3>
                                    <div class="id-back-value"><asp:Label ID="lblcity" runat="server"></asp:Label></div>
                                </div>
                                <div class="id-back-block">
                                    <h3>State</h3>
                                    <div class="id-back-value"><asp:Label ID="lblstate" runat="server"></asp:Label></div>
                                </div>
                                <div class="id-back-block">
                                    <h3>Pin Code</h3>
                                    <div class="id-back-value"><asp:Label ID="lblpincode" runat="server"></asp:Label></div>
                                </div>
                                <div class="id-back-block">
                                    <h3>Date of Birth</h3>
                                    <div class="id-back-value"><asp:Label ID="lbldob" runat="server"></asp:Label></div>
                                </div>
                            </div>

                            <div class="id-back-grid">
                                <div class="id-back-block">
                                    <h3>Sponsor ID</h3>
                                    <div class="id-back-value"><asp:Label ID="lblsponsorid" runat="server"></asp:Label></div>
                                </div>
                                <div class="id-back-block">
                                    <h3>Sponsor Name</h3>
                                    <div class="id-back-value"><asp:Label ID="lblsponsorname" runat="server"></asp:Label></div>
                                </div>
                            </div>

                            <div class="id-note">
                                <strong>Important</strong>
                                This card is the property of Bharat Manav Kalyan Trust. If found, please return to the Trust office. Misuse is prohibited.
                            </div>
                        </div>

                        <div class="id-footer-mark">Authorized Membership Card</div>
                    </div>
                </article>
            </div>
        </div>
    </form>
</body>
</html>
