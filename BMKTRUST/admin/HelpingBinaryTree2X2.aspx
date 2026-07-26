<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HelpingBinaryTree2X2.aspx.cs" Inherits="admin_HelpingBinaryTree2X2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Helping Binary 2X2 Matrix</title>
    <style type="text/css">
        :root {
            --m2-line: #2a6b5a;
            --m2-accent: #1fa87a;
            --m2-accent2: #f0b429;
            --m2-text: #e8f5f0;
            --m2-muted: #9cb8ae;
            --m2-empty: #1b3d3d;
            --m2-card: #1a4540;
            --m2-card-border: #2d7a66;
        }
        * { box-sizing: border-box; }
        body {
            margin: 0; padding: 12px;
            font-family: "Segoe UI", Tahoma, sans-serif;
            background: radial-gradient(ellipse at top, #1a4a42 0%, transparent 55%), linear-gradient(180deg, #0c2222 0%, #0f2a2a 100%);
            color: var(--m2-text); min-height: 100vh;
        }
        .m2-head {
            display: flex; align-items: center; justify-content: space-between; gap: 12px;
            margin-bottom: 12px; padding: 10px 14px;
            background: rgba(20, 54, 54, 0.85); border: 1px solid var(--m2-line); border-radius: 10px;
        }
        .m2-head h1 { margin: 0; font-size: 16px; font-weight: 700; color: #fff; }
        .m2-badge {
            padding: 4px 10px; border-radius: 999px;
            background: rgba(31, 168, 122, 0.2); border: 1px solid var(--m2-accent);
            color: #7dffc8; font-size: 11px; font-weight: 700;
        }
        .m2-wrap { overflow-x: auto; padding-bottom: 10px; }
        .m2-tree { min-width: 1680px; display: flex; flex-direction: column; }
        .m2-level { display: flex; justify-content: center; width: 100%; position: relative; }
        .m2-level-label {
            position: absolute; left: 0; top: 50%; transform: translateY(-50%); z-index: 2;
            font-size: 9px; font-weight: 700; letter-spacing: 0.08em; text-transform: uppercase;
            color: #7dffc8; background: rgba(15, 42, 42, 0.95); border: 1px solid var(--m2-line);
            border-radius: 6px; padding: 3px 7px; white-space: nowrap;
        }
        .m2-slot { display: flex; flex-direction: column; align-items: center; padding: 0 2px; }
        .m2-level.l0 .m2-slot { flex: 0 0 100%; }
        .m2-level.l1 .m2-slot { flex: 0 0 50%; }
        .m2-level.l2 .m2-slot { flex: 0 0 25%; }
        .m2-level.l3 .m2-slot { flex: 0 0 12.5%; }
        .m2-level.l4 .m2-slot { flex: 0 0 6.25%; }
        .m2-branch { position: relative; width: 100%; height: 18px; }
        .m2-branch.has-kids { margin-bottom: -9px; }
        .m2-branch::before {
            content: ""; position: absolute; top: 0; left: 50%; width: 2px; height: 9px;
            background: var(--m2-line); transform: translateX(-50%);
        }
        .m2-branch.has-kids::after {
            content: ""; position: absolute; top: 9px; left: 25%; right: 25%; height: 2px; background: var(--m2-line);
        }
        .m2-branch.half-left::after { left: 25%; right: 50%; }
        .m2-branch.half-right::after { left: 50%; right: 25%; }
        .m2-down { width: 2px; height: 9px; background: var(--m2-line); margin: 0 auto; }
        .m2-card {
            width: 100%; max-width: 120px; min-height: 70px;
            background: linear-gradient(160deg, var(--m2-card) 0%, #123530 100%);
            border: 1px solid var(--m2-card-border); border-radius: 10px; padding: 6px 4px 8px;
            text-align: center; text-decoration: none; color: inherit; display: block;
            box-shadow: 0 5px 14px rgba(0,0,0,.25);
            transition: transform .15s ease, border-color .15s ease;
        }
        a.m2-card:hover { transform: translateY(-2px); border-color: var(--m2-accent2); }
        .m2-card.root {
            max-width: 150px; border-color: var(--m2-accent2);
            background: linear-gradient(160deg, #255a48 0%, #163c34 100%);
        }
        .m2-card.empty {
            background: var(--m2-empty); border-style: dashed; border-color: #2f5550;
            color: var(--m2-muted); box-shadow: none; cursor: default;
        }
        .m2-avatar {
            width: 30px; height: 30px; margin: 0 auto 4px; border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 11px; font-weight: 800; color: #062018;
            background: linear-gradient(145deg, #7dffc8, var(--m2-accent));
        }
        .m2-card.root .m2-avatar {
            width: 36px; height: 36px;
            background: linear-gradient(145deg, #ffd978, var(--m2-accent2));
        }
        .m2-card.empty .m2-avatar { background: #294846; color: #7a9a92; }
        .m2-id { font-size: 10px; font-weight: 700; color: #fff; word-break: break-all; line-height: 1.15; }
        .m2-card.root .m2-id { font-size: 12px; color: #ffe7a3; }
        .m2-name {
            margin-top: 2px; font-size: 9px; color: var(--m2-muted);
            word-break: break-word; line-height: 1.2; max-height: 2.4em; overflow: hidden;
        }
        .m2-level.l3 .m2-card { max-width: 100%; min-height: 62px; }
        .m2-level.l3 .m2-avatar { width: 26px; height: 26px; font-size: 10px; }
        .m2-level.l3 .m2-id { font-size: 9px; }
        .m2-level.l4 .m2-card { max-width: 100%; min-height: 56px; padding: 4px 2px 6px; border-radius: 8px; }
        .m2-level.l4 .m2-avatar { width: 22px; height: 22px; font-size: 9px; margin-bottom: 2px; }
        .m2-level.l4 .m2-id { font-size: 8px; }
        .m2-level.l4 .m2-name { font-size: 8px; }
        .m2-msg { margin-top: 10px; color: #ff8e8e; font-size: 13px; text-align: center; }
        .m2-legend {
            margin-top: 8px; display: flex; gap: 14px; justify-content: center; flex-wrap: wrap;
            font-size: 11px; color: var(--m2-muted);
        }
        .m2-legend span::before {
            content: ""; display: inline-block; width: 10px; height: 10px; border-radius: 3px;
            margin-right: 6px; vertical-align: -1px;
        }
        .m2-legend .filled::before { background: var(--m2-accent); }
        .m2-legend .vacant::before { background: #294846; border: 1px dashed #4a726a; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="m2-head">
            <h1>Helping Binary 2X2 Matrix</h1>
            <span class="m2-badge">POOL 2 · LEVEL 0–4</span>
        </div>
        <div class="m2-wrap">
            <div class="m2-tree">
                <asp:Literal ID="ltTree" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="m2-legend">
            <span class="filled">Filled ID</span>
            <span class="vacant">Vacant Slot</span>
        </div>
        <asp:Label ID="lblMsg" runat="server" CssClass="m2-msg"></asp:Label>
    </form>
</body>
</html>
