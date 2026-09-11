<%@ Page Title="Helping Binary 2X2 Level Wise Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="HelpingBinaryLevelWiseReport2X2.aspx.cs" Inherits="user_HelpingBinaryLevelWiseReport2X2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-lvlrpt .lvl-summary {
            display: block;
            margin-bottom: 20px;
        }

        .bmk-lvlrpt .lvl-cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
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

        @media (max-width: 991px) {
            .bmk-lvlrpt .lvl-cards { grid-template-columns: repeat(2, 1fr); }
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
                <h1>2X2 Level Wise Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; 2X2 Level Wise</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-gold" href="HelpingBinaryLevelWiseReport2X2.aspx">Level Wise</a>
                <a class="btn-ghost" href="HelpingBinaryMatrix2X2.aspx">2X2 Matrix</a>
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-lvlrpt">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <!-- Search -->
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

                <!-- Summary -->
                <div class="lvl-summary">
                    <div class="lvl-cards">
                        <div class="lvl-card">
                            <span class="ico"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                            <div>
                                <span class="val"><asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></span>
                                <span class="cap">कुल सदस्य</span>
                            </div>
                        </div>
                        <div class="lvl-card" style="display: none;">
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
                </div>

                <!-- Level list -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Level Wise Members</h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:GridView ID="gvLevels" runat="server" CssClass="table table-bordered table-hover"
                                Width="100%" AutoGenerateColumns="False"
                                OnRowCommand="gvLevels_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <span class="lvl-name">Level <%# Eval("LevelNo") %></span>
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
                                                CommandArgument='<%# Eval("LevelNo") %>'
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

                <!-- Members of the selected level -->
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
