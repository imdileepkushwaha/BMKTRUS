<%@ Page Title="My Downline" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-downline .bmk-stat-pill {
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

        .bmk-downline .bmk-stat-pill .ico {
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

        .bmk-downline .bmk-stat-pill label {
            display: block;
            margin: 0 0 2px;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-downline .bmk-stat-pill .count {
            display: block;
            font-size: 1.45rem;
            font-weight: 700;
            color: #002B5C;
            line-height: 1.2;
        }

        .bmk-downline .bmk-filter-row {
            display: flex;
            align-items: flex-end;
            gap: 14px;
            flex-wrap: wrap;
        }

        .bmk-downline .bmk-filter-row .field {
            flex: 1 1 220px;
            max-width: 320px;
        }

        .bmk-downline .bmk-filter-row .field label {
            display: block;
            margin-bottom: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-downline .bmk-filter-row .field .form-control {
            height: 42px;
            border-radius: 10px;
            border: 1px solid rgba(0, 43, 92, 0.14);
            font-weight: 600;
            color: #002B5C;
        }

        .bmk-downline .bmk-filter-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .bmk-downline .bmk-filter-actions .btn {
            min-height: 42px;
            padding: 0 18px;
            border-radius: 10px;
            font-weight: 700;
            border: 0;
        }

        .bmk-downline .bmk-filter-actions .btn-primary {
            background: linear-gradient(135deg, #001A3A, #003D7A);
            color: #fff;
        }

        .bmk-downline .bmk-filter-actions .btn-primary:hover {
            background: linear-gradient(135deg, #003D7A, #001A3A);
            color: #fff;
        }

        .bmk-downline .bmk-filter-actions .btn-danger {
            background: #fff;
            color: #B42318;
            border: 1px solid rgba(180, 35, 24, 0.35);
        }

        .bmk-downline .bmk-filter-actions .btn-danger:hover {
            background: rgba(180, 35, 24, 0.06);
            color: #B42318;
        }

        .bmk-downline .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 12px;
        }

        .bmk-downline .table > thead > tr > th {
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

        .bmk-downline .table > tbody > tr > td {
            padding: 12px 14px !important;
            vertical-align: middle !important;
            border-color: rgba(0, 43, 92, 0.08) !important;
            color: #1A2B3C;
            font-weight: 600;
            font-size: 0.9rem;
            background: #fff;
        }

        .bmk-downline .table > tbody > tr:nth-child(even) > td {
            background: #FAFBFD;
        }

        .bmk-downline .table > tbody > tr:hover > td {
            background: rgba(201, 162, 39, 0.08) !important;
        }

        .bmk-downline .table .Active,
        .bmk-downline .table .active,
        .bmk-downline .table .Paid {
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

        .bmk-downline .table .Deactive,
        .bmk-downline .table .deactive,
        .bmk-downline .table .Inactive,
        .bmk-downline .table .Unpaid {
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

        @media (max-width: 767px) {
            .bmk-downline .bmk-filter-row .field {
                max-width: none;
                flex: 1 1 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Downline</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; My Downline</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-gold" href="DownlineReport.aspx">Downline</a>
                <a class="btn-ghost" href="leveltree.aspx">Treeview</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-downline">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div style="display: none">
                    <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <!-- Filter -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Filter</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-filter-row">
                            <div class="field">
                                <label for="<%= DDlstpoolNo.ClientID %>">Status</label>
                                <asp:DropDownList ID="DDlstpoolNo" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="2">Deactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="bmk-filter-actions">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Summary -->
                <div class="row gy-3 mb-3">
                    <div class="col-sm-6 col-lg-4">
                        <div class="bmk-stat-pill">
                            <span class="ico"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                            <div>
                                <label>Total Team</label>
                                <span class="count"><asp:Label ID="LblTotalLeft" runat="server" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-4" style="display: none">
                        <div class="bmk-stat-pill">
                            <span class="ico"><iconify-icon icon="solar:user-bold"></iconify-icon></span>
                            <div>
                                <label>Right Team</label>
                                <span class="count"><asp:Label ID="LblTotalright" runat="server" Text="0"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Details -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Downline Details</h3>
                    </div>
                    <div class="box-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server"
                                CssClass="table table-bordered table-hover dataTable"
                                Width="100%" AutoGenerateColumns="False"
                                EmptyDataText="No downline members found">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername1" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parent ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("ParentUserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <!-- Hidden right team grid (kept for code-behind) -->
                        <div style="display: none">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername1" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parent ID">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("ParentUserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
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
