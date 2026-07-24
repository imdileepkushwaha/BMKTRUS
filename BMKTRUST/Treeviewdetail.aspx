<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Treeviewdetail.aspx.cs" Inherits="Treeviewdetail" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Genealogy Tree</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        :root {
            --navy: #002B5C;
            --navy-deep: #001A3A;
            --navy-mid: #003D7A;
            --gold: #C9A227;
            --gold-light: #E8C547;
            --line: rgba(0, 43, 92, 0.22);
            --muted: #5A6B7C;
        }

        * { box-sizing: border-box; }

        html, body {
            margin: 0;
            padding: 0;
            background: linear-gradient(180deg, #F4F7FB 0%, #FFFFFF 100%);
            font-family: "Segoe UI", system-ui, sans-serif;
            color: var(--navy);
            min-height: 100%;
        }

        .tree-wrap {
            padding: 18px 12px 32px;
            overflow-x: auto;
        }

        .tree { text-align: center; min-width: max-content; margin: 0 auto; }

        .tree ul {
            padding-top: 22px;
            position: relative;
            display: flex;
            justify-content: center;
            margin: 0;
        }

        .tree li {
            list-style-type: none;
            position: relative;
            padding: 22px 8px 0;
            text-align: center;
        }

        .tree li::before,
        .tree li::after {
            content: '';
            position: absolute;
            top: 0;
            right: 50%;
            border-top: 2px solid var(--line);
            width: 50%;
            height: 22px;
        }

        .tree li::after {
            right: auto;
            left: 50%;
            border-left: 2px solid var(--line);
        }

        .tree li:only-child::after,
        .tree li:only-child::before { display: none; }

        .tree li:only-child { padding-top: 0; }

        .tree li:first-child::before,
        .tree li:last-child::after { border: 0 none; }

        .tree li:last-child::before {
            border-right: 2px solid var(--line);
            border-radius: 0 6px 0 0;
        }

        .tree li:first-child::after { border-radius: 6px 0 0 0; }

        .tree ul ul::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            border-left: 2px solid var(--line);
            width: 0;
            height: 22px;
        }

        .node {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            padding: 12px 14px 10px;
            min-width: 132px;
            max-width: 160px;
            border-radius: 14px;
            border: 1px solid rgba(0, 43, 92, 0.12);
            background: linear-gradient(180deg, #FFFFFF 0%, #FBF9F4 100%);
            box-shadow: 0 8px 20px rgba(0, 43, 92, 0.08);
            cursor: pointer;
            transition: transform 0.15s ease, box-shadow 0.15s ease, border-color 0.15s ease;
            user-select: none;
        }

        .node:hover {
            transform: translateY(-2px);
            border-color: rgba(201, 162, 39, 0.55);
            box-shadow: 0 12px 24px rgba(0, 43, 92, 0.14);
        }

        .node img {
            width: 46px;
            height: 46px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--gold-light);
            background: #fff;
            margin-bottom: 2px;
        }

        .node .name {
            font-size: 0.82rem;
            font-weight: 700;
            color: var(--navy);
            line-height: 1.25;
            word-break: break-word;
        }

        .node .status {
            display: inline-flex;
            align-items: center;
            min-height: 22px;
            padding: 0 8px;
            border-radius: 999px;
            font-size: 0.68rem;
            font-weight: 700;
            letter-spacing: 0.03em;
            text-transform: uppercase;
            background: rgba(0, 43, 92, 0.08);
            color: var(--navy-mid);
        }

        .node .status.is-active {
            background: rgba(19, 136, 8, 0.12);
            color: #0F6A08;
        }

        .node .status.is-inactive {
            background: rgba(180, 35, 24, 0.1);
            color: #B42318;
        }

        .node .amount {
            margin-top: 2px;
            font-size: 0.8rem;
            font-weight: 700;
            color: var(--navy-deep);
            letter-spacing: 0.01em;
        }

        .node .amount .rupee {
            color: var(--gold);
            margin-right: 1px;
        }

        .hint {
            text-align: center;
            font-size: 0.8rem;
            color: var(--muted);
            font-weight: 600;
            margin-bottom: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hiddenParentId" runat="server" />
        <div class="tree-wrap">
            <div class="hint">Click a member to expand downline</div>
            <div class="tree">
                <ul id="treeRoot"></ul>
            </div>
        </div>
    </form>

    <script>
        $(document).ready(function () {
            var parentId = $('#<%= hiddenParentId.ClientID %>').val();
            loadTree(parentId, $('#treeRoot'));
        });

        function statusClass(status) {
            var s = (status || '').toString().toLowerCase();
            if (s === 'active' || s === 'paid') return 'is-active';
            if (s === 'deactive' || s === 'inactive' || s === 'unpaid') return 'is-inactive';
            return '';
        }

        function formatAmount(val) {
            if (val === null || val === undefined || val === '') return '0';
            return val;
        }

        function loadTree(parentId, container) {
            $.ajax({
                url: 'Treeviewdetail.aspx/GetChildren',
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify({ parentId: parentId }),
                success: function (res) {
                    var data = res.d || [];

                    $.each(data, function (i, item) {
                        var li = $('<li></li>');
                        var st = statusClass(item.status);

                        var node = $(
                            '<div class="node">' +
                                '<img src="' + (item.photoimage || '') + '" alt="" />' +
                                '<div class="name">' + (item.username || '') + '</div>' +
                                '<small class="status ' + st + '">' + (item.status || '') + '</small>' +
                                '<div class="amount"><span class="rupee">&#8377;</span>' + formatAmount(item.topupamount) + '</div>' +
                            '</div>'
                        );

                        var childUL = $('<ul style="display:none"></ul>');

                        node.on('click', function (e) {
                            e.stopPropagation();
                            if (childUL.children().length === 0) {
                                loadTree(item.userid, childUL);
                            }
                            childUL.toggle();
                        });

                        li.append(node);
                        li.append(childUL);
                        container.append(li);
                    });
                },
                error: function (err) {
                    console.log(err.responseText);
                }
            });
        }
    </script>
</body>
</html>
