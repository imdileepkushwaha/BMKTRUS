<%@ Page Title="My Direct" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="UserDirectAssociates.aspx.cs" EnableEventValidation="false" Inherits="user_UserDirectAssociates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-direct .bmk-stat-pill {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 18px;
            border-radius: 14px;
            background: linear-gradient(180deg, #fff, #FBF9F4);
            border: 1px solid rgba(0, 43, 92, 0.1);
            height: 100%;
            box-shadow: 0 8px 20px rgba(0, 43, 92, 0.06);
        }

        .bmk-direct .bmk-stat-pill .ico {
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

        .bmk-direct .bmk-stat-pill label {
            display: block;
            margin: 0 0 2px;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-direct .bmk-stat-pill .count {
            display: block;
            font-size: 1.45rem;
            font-weight: 700;
            color: #002B5C;
            line-height: 1.2;
        }

        .bmk-direct-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 14px;
        }

        .bmk-direct-toolbar .left,
        .bmk-direct-toolbar .right {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .bmk-direct-toolbar .page-size {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            color: #5A6B7C;
        }

        .bmk-direct-toolbar .page-size select {
            width: 88px !important;
            height: 40px;
            border-radius: 10px !important;
            border: 1px solid rgba(0, 43, 92, 0.14);
            font-weight: 700;
            color: #002B5C;
            background: #fff;
        }

        .bmk-direct .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 12px;
        }

        .bmk-direct .table > thead > tr > th {
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

        .bmk-direct .table > tbody > tr > td {
            padding: 12px 14px !important;
            vertical-align: middle !important;
            border-color: rgba(0, 43, 92, 0.08) !important;
            color: #1A2B3C;
            font-weight: 600;
            font-size: 0.9rem;
            background: #fff;
        }

        .bmk-direct .table > tbody > tr:nth-child(even) > td {
            background: #FAFBFD;
        }

        .bmk-direct .table > tbody > tr:hover > td {
            background: rgba(201, 162, 39, 0.08) !important;
        }

        .bmk-direct .table .Active,
        .bmk-direct .table .active,
        .bmk-direct .table .Paid {
            display: inline-flex;
            align-items: center;
            min-height: 26px;
            padding: 0 10px;
            border-radius: 999px;
            background: rgba(19, 136, 8, 0.12);
            color: #0F6A08 !important;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.03em;
            text-transform: uppercase;
        }

        .bmk-direct .table .Deactive,
        .bmk-direct .table .deactive,
        .bmk-direct .table .Inactive,
        .bmk-direct .table .Unpaid {
            display: inline-flex;
            align-items: center;
            min-height: 26px;
            padding: 0 10px;
            border-radius: 999px;
            background: rgba(180, 35, 24, 0.1);
            color: #B42318 !important;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.03em;
            text-transform: uppercase;
        }

        .bmk-direct .empty-state {
            text-align: center;
            padding: 36px 16px;
            color: #5A6B7C;
            font-weight: 600;
        }

        @media (max-width: 767px) {
            .bmk-direct-toolbar .right {
                width: 100%;
                justify-content: space-between;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Direct</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; My Direct</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-gold" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-ghost" href="DownlineReport.aspx">Downline</a>
                <a class="btn-ghost" href="leveltree.aspx">Treeview</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-direct">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div style="display: none">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </div>

                <!-- Summary -->
                <div class="row gy-3 mb-3">
                    <div class="col-sm-6 col-lg-4">
                        <div class="bmk-stat-pill">
                            <span class="ico"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                            <div>
                                <label>Total Direct</label>
                                <span class="count"><asp:Label ID="LblLeftDirect" runat="server" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4" style="display: none">
                        <div class="bmk-stat-pill">
                            <span class="ico"><iconify-icon icon="solar:user-bold"></iconify-icon></span>
                            <div>
                                <label>Right Team</label>
                                <span class="count"><asp:Label ID="LblRightDirect" runat="server" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- List card -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Direct Associates</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-direct-toolbar">
                            <div class="left">
                                <span class="page-size">
                                    Show
                                    <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged">
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                    records
                                </span>
                            </div>
                            <div class="right">
                                <asp:LinkButton ID="imgExcel" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn"
                                    OnClick="imgExcel_Click" aria-label="Download Excel">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26" height="26" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg>
                                </asp:LinkButton>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <asp:GridView ID="grdBank" runat="server"
                                CssClass="table table-bordered table-hover dataTable"
                                Width="100%" AutoGenerateColumns="false"
                                EmptyDataText="No direct associates found"
                                OnRowDataBound="grdBank_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserId" HeaderText="User ID" />
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                    <asp:BoundField DataField="PackageName" HeaderText="Package" />
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                    <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="imgExcel" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
