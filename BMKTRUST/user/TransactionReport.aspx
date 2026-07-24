<%@ Page Title="Transaction Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TransactionReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-txn .bmk-filter-row {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px 18px;
            align-items: end;
        }

        .bmk-txn .bmk-filter-row .form-group {
            margin-bottom: 0;
        }

        .bmk-txn .bmk-filter-row label {
            display: block;
            margin-bottom: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-txn .bmk-filter-row .form-control {
            height: 42px;
            border-radius: 10px;
            border: 1px solid rgba(0, 43, 92, 0.14);
            font-weight: 600;
            color: #002B5C;
        }

        .bmk-txn .box-footer {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            padding: 18px 22px 24px !important;
            border-top: 1px solid rgba(0, 43, 92, 0.08) !important;
        }

        .bmk-txn .box-footer .btn {
            min-height: 42px;
            padding: 0 22px;
            border-radius: 10px;
            font-weight: 700;
            margin: 0;
        }

        .bmk-txn .box-footer .btn-primary {
            background: linear-gradient(135deg, #001A3A, #003D7A);
            border: 0;
            color: #fff;
        }

        .bmk-txn .box-footer .btn-danger {
            background: #fff;
            color: #B42318;
            border: 1px solid rgba(180, 35, 24, 0.35);
        }

        .bmk-txn .box-footer .bmk-excel-btn {
            margin-left: auto;
        }

        .bmk-txn .bmk-stat-pill {
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

        .bmk-txn .bmk-stat-pill .ico {
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

        .bmk-txn .bmk-stat-pill.credit .ico {
            background: linear-gradient(135deg, #0F6A08, #138808);
            color: #fff;
        }

        .bmk-txn .bmk-stat-pill.debit .ico {
            background: linear-gradient(135deg, #8B1A12, #B42318);
            color: #fff;
        }

        .bmk-txn .bmk-stat-pill.balance .ico {
            background: linear-gradient(135deg, #C9A227, #E8C547);
            color: #001A3A;
        }

        .bmk-txn .bmk-stat-pill label {
            display: block;
            margin: 0 0 2px;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-txn .bmk-stat-pill .count {
            display: block;
            font-size: 1.25rem;
            font-weight: 700;
            color: #002B5C;
            line-height: 1.2;
        }

        .bmk-txn .bmk-stat-pill .form-control {
            border: 0 !important;
            background: transparent !important;
            box-shadow: none !important;
            padding: 0 !important;
            height: auto !important;
            font-size: 1.25rem;
            font-weight: 700;
            color: #002B5C;
        }

        .bmk-txn-toolbar {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 10px;
            margin-bottom: 14px;
            flex-wrap: wrap;
        }

        .bmk-txn-toolbar .page-size {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            color: #5A6B7C;
        }

        .bmk-txn-toolbar .page-size select {
            width: 88px !important;
            height: 40px;
            border-radius: 10px !important;
            border: 1px solid rgba(0, 43, 92, 0.14);
            font-weight: 700;
            color: #002B5C;
            background: #fff;
        }

        .bmk-txn .table {
            margin-bottom: 0;
            border-collapse: separate;
            border-spacing: 0;
            overflow: hidden;
            border-radius: 12px;
        }

        .bmk-txn .table > thead > tr > th {
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

        .bmk-txn .table > tbody > tr > td {
            padding: 12px 14px !important;
            vertical-align: middle !important;
            border-color: rgba(0, 43, 92, 0.08) !important;
            color: #1A2B3C;
            font-weight: 600;
            font-size: 0.9rem;
            background: #fff;
        }

        .bmk-txn .table > tbody > tr:nth-child(even) > td {
            background: #FAFBFD;
        }

        .bmk-txn .table > tbody > tr:hover > td {
            background: rgba(201, 162, 39, 0.08) !important;
        }

        @media (max-width: 991px) {
            .bmk-txn .bmk-filter-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">Reports</span>
                <h1>Transaction Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; Reports &nbsp;/&nbsp; Transactions</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-gold" href="TransactionReport.aspx">Transactions</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-txn">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <!-- Search -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Search Criteria</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-filter-row">
                            <div class="form-group">
                                <label for="<%= txtfromdate.ClientID %>">From Date</label>
                                <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txttodate.ClientID %>">To Date</label>
                                <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="<%= txtuserid.ClientID %>">User ID</label>
                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:LinkButton ID="imgExcel" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn"
                            OnClick="imgExcel_Click" aria-label="Download Excel">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26" height="26" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg>
                        </asp:LinkButton>
                    </div>
                </div>

                <!-- Summary -->
                <div class="row gy-3 mb-3">
                    <div class="col-sm-4">
                        <div class="bmk-stat-pill credit">
                            <span class="ico"><iconify-icon icon="solar:arrow-down-bold"></iconify-icon></span>
                            <div>
                                <label>Total Income</label>
                                <span class="count">&#8377; <asp:TextBox ID="LblCredited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="bmk-stat-pill debit">
                            <span class="ico"><iconify-icon icon="solar:arrow-up-bold"></iconify-icon></span>
                            <div>
                                <label>Total Deduct</label>
                                <span class="count">&#8377; <asp:TextBox ID="LblDebited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="bmk-stat-pill balance">
                            <span class="ico"><iconify-icon icon="solar:wallet-money-bold"></iconify-icon></span>
                            <div>
                                <label>Balance</label>
                                <span class="count">&#8377; <asp:TextBox ID="LblCurrentWallet" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Details -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Transaction Details</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-txn-toolbar">
                            <span class="page-size">
                                Show
                                <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged">
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="25" Selected="True">25</asp:ListItem>
                                    <asp:ListItem Value="50">50</asp:ListItem>
                                    <asp:ListItem Value="100">100</asp:ListItem>
                                </asp:DropDownList>
                                records
                            </span>
                        </div>

                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%"
                                AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                AllowPaging="true" PageSize="25" OnPageIndexChanging="GridView1_PageIndexChanging"
                                EmptyDataText="No transactions found"
                                PagerStyle-CssClass="bmk-pager" PagerSettings-Mode="NumericFirstLast"
                                PagerSettings-Position="Bottom" PagerSettings-PageButtonCount="5"
                                PagerSettings-FirstPageText="«" PagerSettings-LastPageText="»"
                                PagerSettings-PreviousPageText="‹" PagerSettings-NextPageText="›">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# (GridView1.PageIndex * GridView1.PageSize) + Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("transactionid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("cramount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("dramount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltransactiontype" runat="server" Text='<%#Eval("transactiontype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Remark") %>'></asp:Label>
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
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/MM/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/MM/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>
