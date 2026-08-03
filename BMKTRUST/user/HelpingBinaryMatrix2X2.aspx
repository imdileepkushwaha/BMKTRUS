<%@ Page Title="Helping Binary 2X2 Matrix" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="HelpingBinaryMatrix2X2.aspx.cs" Inherits="user_HelpingBinaryMatrix2X2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .hbm-wrap {
            --hbm-green: #22A84A;
            --hbm-deep: #178A3A;
            --hbm-dark: #0F5C28;
            --hbm-soft: #E8F8EE;
            --hbm-line: #D7EBDD;
            --hbm-muted: #4B7A5C;
            --hbm-gold: #C9A227;
        }

        .hbm-legend {
            display: flex;
            flex-wrap: wrap;
            gap: 10px 18px;
            margin-bottom: 14px;
            font-size: 0.85rem;
            color: var(--hbm-muted);
            font-weight: 600;
        }

        .hbm-legend span {
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .hbm-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            display: inline-block;
        }

        .hbm-dot.left { background: var(--hbm-green); }
        .hbm-dot.right { background: var(--hbm-dark); }
        .hbm-dot.empty { background: #CBD5E1; }
        .hbm-dot.root { background: linear-gradient(135deg, var(--hbm-dark), var(--hbm-green)); }

        .hbm-hint {
            margin: 0 0 12px;
            font-size: 0.82rem;
            color: var(--hbm-muted);
            font-weight: 600;
        }

        .hbm-tree {
            overflow-x: auto;
            padding: 10px 4px 20px;
        }

        .hbm-tree-inner {
            width: max-content;
            min-width: 100%;
        }

        .hbm-level-label {
            text-align: center;
            font-size: 0.73rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--hbm-deep);
            margin: 18px 0 9px;
        }

        .hbm-matrix {
            display: grid;
            gap: 10px;
            justify-content: center;
            margin: 0 auto;
        }

        .hbm-matrix.cols-1 { grid-template-columns: minmax(140px, 190px); }
        .hbm-matrix.cols-2 { grid-template-columns: repeat(2, minmax(130px, 180px)); }
        .hbm-matrix.cols-4 { grid-template-columns: repeat(4, minmax(116px, 152px)); }
        .hbm-matrix.cols-8 { grid-template-columns: repeat(8, minmax(100px, 126px)); }
        .hbm-matrix.cols-16 { grid-template-columns: repeat(16, minmax(115px, 104px)); }

        .hbm-card {
            background: linear-gradient(180deg, #fff 0%, #F7FCF8 100%);
            border: 1px solid var(--hbm-line);
            border-radius: 12px;
            padding: 10px 8px;
            text-align: center;
            box-shadow: 0 6px 14px rgba(15, 92, 40, 0.08);
            min-height: 74px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 2px;
            position: relative;
            overflow: hidden;
            text-decoration: none;
            color: inherit;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }

        a.hbm-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(15, 92, 40, 0.14);
            text-decoration: none;
            color: inherit;
        }

        .hbm-card.root {
            background: linear-gradient(135deg, #0F5C28 0%, #178A3A 50%, #22A84A 100%);
            color: #fff;
            border: 0;
            box-shadow: 0 8px 18px rgba(15, 92, 40, 0.22);
        }

        .hbm-card.left-pos { border-top: 3px solid var(--hbm-green); }
        .hbm-card.right-pos { border-top: 3px solid var(--hbm-dark); }

        .hbm-card.empty {
            background: #F8FAFC;
            border-style: dashed;
            color: #94A3B8;
            box-shadow: none;
            cursor: default;
            pointer-events: none;
        }

        .hbm-card .pos {
            font-size: 0.64rem;
            font-weight: 700;
            letter-spacing: 0.05em;
            text-transform: uppercase;
            opacity: 0.85;
            line-height: 1.3;
        }

        .hbm-card.root .pos { color: #A8E6BC; }

        .hbm-card .uid {
            font-size: 0.88rem;
            font-weight: 700;
            color: var(--hbm-dark);
            line-height: 1.3;
            white-space: normal;
            overflow-wrap: anywhere;
            word-break: break-word;
        }

        .hbm-card.root .uid { color: #fff; font-size: 1rem; }

        .hbm-card .uname {
            font-size: 0.76rem;
            font-weight: 600;
            color: var(--hbm-muted);
            line-height: 1.25;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .hbm-card.root .uname { color: rgba(255,255,255,0.88); font-size: 0.82rem; }

        .hbm-card .lvl {
            position: absolute;
            top: 4px;
            right: 6px;
            font-size: 0.58rem;
            font-weight: 700;
            color: var(--hbm-green);
            background: var(--hbm-soft);
            padding: 1px 5px;
            border-radius: 999px;
        }

        .hbm-card.root .lvl {
            background: rgba(255,255,255,0.18);
            color: #fff;
        }

        .hbm-empty-msg {
            text-align: center;
            padding: 22px 16px;
            color: var(--hbm-muted);
            font-weight: 600;
        }

        @media (max-width: 900px) {
            .hbm-matrix { gap: 8px; }
            .hbm-matrix.cols-4 { grid-template-columns: repeat(4, 108px); }
            .hbm-matrix.cols-8 { grid-template-columns: repeat(8, 94px); }
            .hbm-matrix.cols-16 { grid-template-columns: repeat(16, 80px); }
        }

        @media (max-width: 560px) {
            .hbm-card { min-height: 66px; padding: 8px 6px; }
            .hbm-matrix.cols-1 { grid-template-columns: 140px; }
            .hbm-matrix.cols-2 { grid-template-columns: repeat(2, 128px); }
            .hbm-matrix.cols-4 { grid-template-columns: repeat(4, 100px); }
            .hbm-matrix.cols-8 { grid-template-columns: repeat(8, 88px); }
            .hbm-matrix.cols-16 { grid-template-columns: repeat(16, 76px); }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>2X2 Matrix</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; Level Growth Tree</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-gold" href="HelpingBinaryMatrix2X2.aspx">2X2 Matrix</a>
                <a class="btn-ghost" href="HelpingBinaryLevelWiseReport2X2.aspx">Level Wise</a>
                <a class="btn-ghost" href="HelpingBinaryPool2SummaryReport.aspx">Summary</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel hbm-wrap">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Search Member</h3>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>User Id</label>
                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group" style="padding-top: 24px;">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Show Matrix" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Reset" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Pool 2 · 2 × 2 Matrix (Levels 0–4)</h3>
            </div>
            <div class="box-body">
                <div class="hbm-legend">
                    <span><i class="hbm-dot root"></i> Root</span>
                    <span><i class="hbm-dot left"></i> Left child</span>
                    <span><i class="hbm-dot right"></i> Right child</span>
                    <span><i class="hbm-dot empty"></i> Vacant</span>
                </div>
                <p class="hbm-hint">Tip: click any filled ID to open that member&rsquo;s 2X2 matrix.</p>
                <asp:Literal ID="litMatrix" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        (function () {
            function centerMatrix() {
                var tree = document.querySelector('.hbm-tree');
                if (!tree) return;
                var overflow = tree.scrollWidth - tree.clientWidth;
                if (overflow > 0) tree.scrollLeft = overflow / 2;
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', centerMatrix);
            } else {
                centerMatrix();
            }
            window.addEventListener('load', centerMatrix);
        })();
    </script>
</asp:Content>
