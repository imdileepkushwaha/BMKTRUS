<%@ Page Title="2X2 Level Summary Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="HelpingBinaryPool2SummaryReport.aspx.cs" Inherits="user_HelpingBinaryPool2SummaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-lvlrpt .lvl-summary {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 20px;
        }

        .bmk-lvlrpt .lvl-cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            align-content: start;
        }

        .bmk-lvlrpt .lvl-card {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 18px;
            border-radius: 14px;
            background: linear-gradient(180deg, #fff, #FBF9F4);
            border: 1px solid rgba(0, 43, 92, 0.1);
            box-shadow: 0 8px 20px rgba(0, 43, 92, 0.06);
        }

        .bmk-lvlrpt .lvl-card .ico {
            width: 46px;
            height: 46px;
            min-width: 46px;
            border-radius: 12px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #001A3A, #003D7A);
            color: #E8C547;
            font-size: 1.35rem;
        }

        .bmk-lvlrpt .lvl-card .val {
            display: block;
            font-size: 1.45rem;
            font-weight: 700;
            color: #002B5C;
            line-height: 1.2;
        }

        .bmk-lvlrpt .lvl-card .cap {
            display: block;
            margin-top: 2px;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            color: #5A6B7C;
        }

        .bmk-lvlrpt .lvl-notes {
            padding: 18px 20px;
            border-radius: 14px;
            border: 1px solid rgba(0, 43, 92, 0.1);
            background: linear-gradient(180deg, #fff, #FBF9F4);
            box-shadow: 0 8px 20px rgba(0, 43, 92, 0.06);
        }

        .bmk-lvlrpt .lvl-notes h4 {
            margin: 0 0 12px;
            font-size: 1rem;
            font-weight: 700;
            color: #002B5C;
        }

        .bmk-lvlrpt .lvl-notes ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .bmk-lvlrpt .lvl-notes li {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin: 10px 0;
            font-size: 0.88rem;
            font-weight: 500;
            color: #1A2B3C;
            line-height: 1.45;
        }

        .bmk-lvlrpt .lvl-notes li .lico {
            width: 26px;
            height: 26px;
            min-width: 26px;
            border-radius: 8px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: rgba(0, 43, 92, 0.07);
            color: #002B5C;
            font-size: 0.95rem;
        }

        .bmk-lvlrpt .lvl-notes li b { color: #002B5C; }

        @media (max-width: 1199px) {
            .bmk-lvlrpt .lvl-summary { grid-template-columns: 1fr; }
        }

        @media (max-width: 520px) {
            .bmk-lvlrpt .lvl-cards { grid-template-columns: 1fr; }
        }

        .bmk-lvlrpt .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 12px;
        }

        .bmk-lvlrpt .table > thead > tr > th {
            background: linear-gradient(135deg, #001A3A, #003D7A) !important;
            color: #fff !important;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            border: 0 !important;
            padding: 12px 14px !important;
            white-space: nowrap;
            vertical-align: middle;
        }

        .bmk-lvlrpt .table > tbody > tr > td {
            padding: 12px 14px !important;
            vertical-align: middle !important;
            border-color: rgba(0, 43, 92, 0.08) !important;
            color: #1A2B3C;
            font-weight: 600;
            font-size: 0.9rem;
            background: #fff;
        }

        .bmk-lvlrpt .table > tbody > tr:nth-child(even) > td {
            background: #FAFBFD;
        }

        .bmk-lvlrpt .table > tbody > tr:hover > td {
            background: rgba(201, 162, 39, 0.08) !important;
        }

        .bmk-lvlrpt .lvl-name {
            font-weight: 700;
            color: #002B5C;
        }

        .bmk-lvlrpt .cnt {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 34px;
            min-height: 26px;
            padding: 0 10px;
            border-radius: 999px;
            background: rgba(201, 162, 39, 0.16);
            color: #7A5E0C;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .bmk-lvlrpt .req {
            font-weight: 700;
            color: #5A6B7C;
        }

        .bmk-lvlrpt .lvl-prog {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 160px;
        }

        .bmk-lvlrpt .lvl-prog .bar {
            flex: 1 1 auto;
            height: 8px;
            border-radius: 999px;
            background: rgba(0, 43, 92, 0.1);
            overflow: hidden;
        }

        .bmk-lvlrpt .lvl-prog .bar > span {
            display: block;
            height: 100%;
            border-radius: 999px;
            background: linear-gradient(90deg, #003D7A, #C9A227);
        }

        .bmk-lvlrpt .lvl-prog .bar.full > span {
            background: linear-gradient(90deg, #0F6A08, #138808);
        }

        .bmk-lvlrpt .lvl-prog em {
            font-style: normal;
            font-size: 0.78rem;
            font-weight: 700;
            color: #002B5C;
            min-width: 38px;
            text-align: right;
        }

        .bmk-lvlrpt .lvl-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            min-height: 34px;
            padding: 0 14px;
            border-radius: 999px;
            border: 1px solid rgba(0, 43, 92, 0.16);
            background: #fff;
            color: #002B5C !important;
            font-size: 0.82rem;
            font-weight: 700;
            text-decoration: none !important;
        }

        .bmk-lvlrpt .lvl-btn:hover {
            border-color: rgba(201, 162, 39, 0.7);
            background: #FAF8F3;
            color: #001A3A !important;
        }

        .bmk-lvlrpt .active-level {
            display: inline-flex;
            align-items: center;
            min-height: 26px;
            padding: 0 10px;
            margin-left: 6px;
            border-radius: 999px;
            background: rgba(0, 43, 92, 0.08);
            color: #002B5C;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .bmk-lvlrpt .empty-state {
            text-align: center;
            padding: 36px 16px;
            color: #5A6B7C;
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>2X2 Level Summary Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; 2X2 Level Summary</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-gold" href="HelpingBinaryPool2SummaryReport.aspx">Level Summary</a>
                <a class="btn-ghost" href="HelpingBinaryLevelWiseReport2X2.aspx">Level Wise</a>
                <a class="btn-ghost" href="HelpingBinaryMatrix2X2.aspx">2X2 Matrix</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-lvlrpt">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

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
                                <div class="form-group bmk-form-actions" style="padding-top: 24px;">
                                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="lvl-summary">
                    <div class="lvl-cards">
                        <div class="lvl-card">
                            <span class="ico"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                            <div>
                                <span class="val"><asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></span>
                                <span class="cap">कुल सदस्य</span>
                            </div>
                        </div>
                        <div class="lvl-card">
                            <span class="ico"><iconify-icon icon="solar:layers-minimalistic-bold"></iconify-icon></span>
                            <div>
                                <span class="val"><asp:Literal ID="litRequired" runat="server" Text="0"></asp:Literal></span>
                                <span class="cap">आवश्यक सदस्य</span>
                            </div>
                        </div>
                        <div class="lvl-card">
                            <span class="ico"><iconify-icon icon="solar:graph-up-bold"></iconify-icon></span>
                            <div>
                                <span class="val"><asp:Literal ID="litPercent" runat="server" Text="0%"></asp:Literal></span>
                                <span class="cap">कुल प्रगति</span>
                            </div>
                        </div>
                        <div class="lvl-card">
                            <span class="ico"><iconify-icon icon="solar:cup-star-bold"></iconify-icon></span>
                            <div>
                                <span class="val"><asp:Literal ID="litLevels" runat="server" Text="0/0"></asp:Literal></span>
                                <span class="cap">पूर्ण स्तर</span>
                            </div>
                        </div>
                    </div>

                    <div class="lvl-notes">
                        <h4>आपकी प्रगति</h4>
                        <ul>
                            <li>
                                <span class="lico"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                                <span>आपकी टीम में अब तक <b><asp:Literal ID="litNoteTeam" runat="server" Text="0"></asp:Literal></b> सदस्य जुड़ चुके हैं।</span>
                            </li>
                            <li>
                                <span class="lico"><iconify-icon icon="solar:target-bold"></iconify-icon></span>
                                <span>सभी <b><asp:Literal ID="litNoteLevels" runat="server" Text="0"></asp:Literal></b> स्तर पूरे करने के लिए <b><asp:Literal ID="litNoteRequired" runat="server" Text="0"></asp:Literal></b> सदस्यों की आवश्यकता है।</span>
                            </li>
                            <li>
                                <span class="lico"><iconify-icon icon="solar:graph-up-bold"></iconify-icon></span>
                                <span>आपकी वर्तमान प्रगति <b><asp:Literal ID="litNotePercent" runat="server" Text="0%"></asp:Literal></b> है।</span>
                            </li>
                            <li>
                                <span class="lico"><iconify-icon icon="solar:medal-ribbons-star-bold"></iconify-icon></span>
                                <span>आपने <b><asp:Literal ID="litNoteDone" runat="server" Text="0"></asp:Literal></b> स्तर सफलतापूर्वक पूरे कर लिए हैं।</span>
                            </li>
                            <li>
                                <span class="lico"><iconify-icon icon="solar:rocket-2-bold"></iconify-icon></span>
                                <span>जितनी बड़ी आपकी टीम होगी, उतनी ही तेजी से आपकी आय एवं ग्रोथ बढ़ेगी।</span>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Level Summary</h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvLevels" runat="server" CssClass="table table-bordered table-hover"
                                Width="100%" AutoGenerateColumns="False"
                                OnRowCommand="gvLevels_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate><%# Eval("SrNo") %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <span class="lvl-name">Level <%# Eval("SrNo") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Completed">
                                        <ItemTemplate>
                                            <span class="cnt"><%# Eval("MemberCount") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Required">
                                        <ItemTemplate>
                                            <span class="req"><%# Eval("Required") %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Progress">
                                        <ItemTemplate>
                                            <div class="lvl-prog">
                                                <div class="bar <%# Eval("BarClass") %>">
                                                    <span style="width: <%# Eval("Percent") %>%"></span>
                                                </div>
                                                <em><%# Eval("Percent") %>%</em>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkLevel" runat="server" CssClass="lvl-btn"
                                                CommandName="ViewLevel"
                                                CommandArgument='<%# Eval("DbLevelNo") + "|" + Eval("SrNo") %>'
                                                Visible='<%# Convert.ToInt32(Eval("MemberCount")) > 0 %>'>
                                                <iconify-icon icon="solar:eye-bold"></iconify-icon>
                                                View Members
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">No downline found.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

                <div class="box box-primary" id="divMembers" runat="server" visible="false">
                    <div class="box-header with-border">
                        <h3 class="box-title">
                            Members
                            <asp:Label ID="lblSelectedLevel" runat="server" CssClass="active-level"></asp:Label>
                        </h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvMembers" runat="server" CssClass="table table-bordered table-hover"
                                Width="100%" AutoGenerateColumns="False"
                                AllowPaging="True" PageSize="10"
                                OnPageIndexChanging="gvMembers_PageIndexChanging"
                                PagerStyle-CssClass="bmk-pager">
                                <PagerSettings Mode="NumericFirstLast" FirstPageText="&laquo;" LastPageText="&raquo;" PageButtonCount="10" />
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="userid" HeaderText="User Id" />
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="empty-state">No members in this level.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
