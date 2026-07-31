<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HelpingBinaryTree.aspx.cs" Inherits="admin_HelpingBinaryTree" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Helping Level Matrix</title>
    <style type="text/css">
        :root {
            --hb-line: #3d5a80;
            --hb-accent: #4cc9f0;
            --hb-accent2: #f4a261;
            --hb-text: #eaf2ff;
            --hb-muted: #9db4ce;
            --hb-empty: #1a2740;
            --hb-card: #1e3358;
            --hb-card-border: #3d6ea8;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0; padding: 12px;
            font-family: "Segoe UI", Tahoma, sans-serif;
            background: radial-gradient(ellipse at top, #243b63 0%, transparent 55%), linear-gradient(180deg, #0d1728 0%, #121f35 100%);
            color: var(--hb-text); min-height: 100vh;
        }
        .hb-head {
            display: flex; align-items: center; justify-content: space-between; gap: 12px;
            margin-bottom: 12px; padding: 10px 14px;
            background: rgba(30, 51, 88, 0.9); border: 1px solid var(--hb-line); border-radius: 10px;
        }
        .hb-head h1 { margin: 0; font-size: 16px; font-weight: 700; color: #fff; }
        .hb-badge {
            padding: 4px 10px; border-radius: 999px;
            background: rgba(76, 201, 240, 0.15); border: 1px solid var(--hb-accent);
            color: #9be7ff; font-size: 11px; font-weight: 700;
        }
        .hb-wrap { overflow-x: auto; padding-bottom: 10px; }
        .hb-tree { min-width: 1680px; display: flex; flex-direction: column; }
        .hb-level { display: flex; justify-content: center; width: 100%; position: relative; }
        .hb-level-label {
            position: absolute; left: 0; top: 50%; transform: translateY(-50%); z-index: 2;
            font-size: 9px; font-weight: 700; letter-spacing: 0.08em; text-transform: uppercase;
            color: #9be7ff; background: rgba(13, 23, 40, 0.95); border: 1px solid var(--hb-line);
            border-radius: 6px; padding: 3px 7px; white-space: nowrap;
        }
        .hb-slot { display: flex; flex-direction: column; align-items: center; padding: 0 2px; }
        .hb-level.l0 .hb-slot { flex: 0 0 100%; }
        .hb-level.l1 .hb-slot { flex: 0 0 50%; }
        .hb-level.l2 .hb-slot { flex: 0 0 25%; }
        .hb-level.l3 .hb-slot { flex: 0 0 12.5%; }
        .hb-level.l4 .hb-slot { flex: 0 0 6.25%; }
        .hb-branch { position: relative; width: 100%; height: 18px; }
        .hb-branch.has-kids { margin-bottom: -9px; }
        .hb-branch::before {
            content: ""; position: absolute; top: 0; left: 50%; width: 2px; height: 9px;
            background: var(--hb-line); transform: translateX(-50%);
        }
        .hb-branch.has-kids::after {
            content: ""; position: absolute; top: 9px; left: 25%; right: 25%; height: 2px; background: var(--hb-line);
        }
        .hb-branch.half-left::after { left: 25%; right: 50%; }
        .hb-branch.half-right::after { left: 50%; right: 25%; }
        .hb-down { width: 2px; height: 9px; background: var(--hb-line); margin: 0 auto; }
        .hb-card {
            width: 100%; max-width: 120px; min-height: 70px;
            background: linear-gradient(160deg, var(--hb-card) 0%, #152744 100%);
            border: 1px solid var(--hb-card-border); border-radius: 10px; padding: 6px 4px 8px;
            text-align: center; text-decoration: none; color: inherit; display: block;
            box-shadow: 0 5px 14px rgba(0,0,0,.28);
            transition: transform .15s ease, border-color .15s ease;
        }
        a.hb-card:hover { transform: translateY(-2px); border-color: var(--hb-accent2); }
        .hb-card.root {
            max-width: 150px; border-color: var(--hb-accent2);
            background: linear-gradient(160deg, #2b4f7d 0%, #1a3358 100%);
        }
        .hb-card.empty {
            background: var(--hb-empty); border-style: dashed; border-color: #314866;
            color: var(--hb-muted); box-shadow: none; cursor: default;
        }
        .hb-avatar {
            width: 30px; height: 30px; margin: 0 auto 4px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 11px; font-weight: 800; color: #0b1a2b;
            background: linear-gradient(145deg, #9be7ff, var(--hb-accent));
        }
        .hb-card.root .hb-avatar {
            width: 36px; height: 36px;
            background: linear-gradient(145deg, #ffd3a8, var(--hb-accent2));
        }
        .hb-card.empty .hb-avatar { background: #2a3d5a; color: #7f93ad; }
        .hb-id { font-size: 10px; font-weight: 700; color: #fff; word-break: break-all; line-height: 1.15; }
        .hb-card.root .hb-id { font-size: 12px; color: #ffd7b0; }
        .hb-name {
            margin-top: 2px; font-size: 9px; color: var(--hb-muted);
            word-break: break-word; line-height: 1.2; max-height: 2.4em; overflow: hidden;
        }
        .hb-level.l3 .hb-card { max-width: 100%; min-height: 62px; }
        .hb-level.l3 .hb-avatar { width: 26px; height: 26px; font-size: 10px; }
        .hb-level.l3 .hb-id { font-size: 9px; }
        .hb-level.l4 .hb-card { max-width: 100%; min-height: 56px; padding: 4px 2px 6px; border-radius: 8px; }
        .hb-level.l4 .hb-avatar { width: 22px; height: 22px; font-size: 9px; margin-bottom: 2px; }
        .hb-level.l4 .hb-id { font-size: 8px; }
        .hb-level.l4 .hb-name { font-size: 8px; }
        .hb-msg { margin-top: 10px; color: #ff8e8e; font-size: 13px; text-align: center; }
        .hb-legend {
            margin-top: 8px; display: flex; gap: 14px; justify-content: center; flex-wrap: wrap;
            font-size: 11px; color: var(--hb-muted);
        }
        .hb-legend span::before {
            content: ""; display: inline-block; width: 10px; height: 10px; border-radius: 3px;
            margin-right: 6px; vertical-align: -1px;
        }
        .hb-legend .filled::before { background: var(--hb-accent); }
        .hb-legend .vacant::before { background: #2a3d5a; border: 1px dashed #4a6285; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hb-head">
            <h1>Helping Level Matrix</h1>
            <span class="hb-badge">LEVEL 0–4</span>
        </div>
        <div class="hb-wrap">
            <div class="hb-tree">
                <asp:Literal ID="ltTree" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="hb-legend">
            <span class="filled">Filled ID</span>
            <span class="vacant">Vacant Slot</span>
        </div>
        <asp:Label ID="lblMsg" runat="server" CssClass="hb-msg"></asp:Label>
    </form>
</body>
</html>
