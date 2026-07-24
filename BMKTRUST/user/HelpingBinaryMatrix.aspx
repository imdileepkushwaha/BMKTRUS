<%@ Page Title="Helping Binary Matrix" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="HelpingBinaryMatrix.aspx.cs" Inherits="user_HelpingBinaryMatrix" %>

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
        }

        .hbm-legend {
            display: flex;
            flex-wrap: wrap;
            gap: 12px 18px;
            margin-bottom: 16px;
            font-size: 0.88rem;
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

        .hbm-tree {
            overflow-x: auto;
            padding: 12px 4px 24px;
        }

        .hbm-level-label {
            text-align: center;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--hbm-deep);
            margin: 18px 0 10px;
        }

        .hbm-matrix {
            display: grid;
            gap: 14px;
            justify-content: center;
            margin: 0 auto;
        }

        .hbm-matrix.cols-1 { grid-template-columns: minmax(140px, 220px); }
        .hbm-matrix.cols-2 { grid-template-columns: repeat(2, minmax(140px, 220px)); }
        .hbm-matrix.cols-4 { grid-template-columns: repeat(4, minmax(120px, 180px)); }
        .hbm-matrix.cols-8 { grid-template-columns: repeat(8, minmax(100px, 140px)); }

        .hbm-card {
            background: linear-gradient(180deg, #fff 0%, #F7FCF8 100%);
            border: 1px solid var(--hbm-line);
            border-radius: 14px;
            padding: 12px 10px;
            text-align: center;
            box-shadow: 0 8px 18px rgba(15, 92, 40, 0.08);
            min-height: 88px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 2px;
            position: relative;
        }

        .hbm-card.root {
            background: linear-gradient(135deg, #0F5C28 0%, #178A3A 50%, #22A84A 100%);
            color: #fff;
            border: 0;
            box-shadow: 0 12px 24px rgba(15, 92, 40, 0.22);
        }

        .hbm-card.left-pos { border-top: 3px solid var(--hbm-green); }
        .hbm-card.right-pos { border-top: 3px solid var(--hbm-dark); }

        .hbm-card.empty {
            background: #F8FAFC;
            border-style: dashed;
            color: #94A3B8;
            box-shadow: none;
        }

        .hbm-card .pos {
            font-size: 0.68rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            opacity: 0.85;
        }

        .hbm-card.root .pos { color: #A8E6BC; }

        .hbm-card .uid {
            font-size: 0.95rem;
            font-weight: 700;
            color: var(--hbm-dark);
            word-break: break-all;
        }

        .hbm-card.root .uid { color: #fff; font-size: 1.05rem; }

        .hbm-card .uname {
            font-size: 0.82rem;
            font-weight: 600;
            color: var(--hbm-muted);
            word-break: break-word;
        }

        .hbm-card.root .uname { color: rgba(255,255,255,0.88); }

        .hbm-card .lvl {
            position: absolute;
            top: 6px;
            right: 8px;
            font-size: 0.65rem;
            font-weight: 700;
            color: var(--hbm-green);
            background: var(--hbm-soft);
            padding: 1px 6px;
            border-radius: 999px;
        }

        .hbm-card.root .lvl {
            background: rgba(255,255,255,0.18);
            color: #fff;
        }

        .hbm-empty-msg {
            text-align: center;
            padding: 28px 16px;
            color: var(--hbm-muted);
            font-weight: 600;
        }

        @media (max-width: 900px) {
            .hbm-matrix.cols-8 { grid-template-columns: repeat(4, minmax(110px, 1fr)); }
            .hbm-matrix.cols-4 { grid-template-columns: repeat(2, minmax(120px, 1fr)); }
        }

        @media (max-width: 560px) {
            .hbm-matrix.cols-2,
            .hbm-matrix.cols-4,
            .hbm-matrix.cols-8 {
                grid-template-columns: repeat(2, minmax(120px, 1fr));
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>Helping Binary Matrix</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; Helping Binary</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-ghost" href="leveltree.aspx">Treeview</a>
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
                <h3 class="box-title">2 × 2 Matrix (3 Levels)</h3>
            </div>
            <div class="box-body">
                <div class="hbm-legend">
                    <span><i class="hbm-dot left"></i> Left (StandingPosition = 1)</span>
                    <span><i class="hbm-dot right"></i> Right (StandingPosition = 2)</span>
                    <span><i class="hbm-dot empty"></i> Vacant</span>
                </div>
                <asp:Literal ID="litMatrix" runat="server"></asp:Literal>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
