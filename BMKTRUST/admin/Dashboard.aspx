<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
         <h1>Dashboard</h1>
         <ol class="breadcrumb">
             <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
             <li class="active">Dashboard</li>
         </ol>
     </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <div class="adm-dash">
        <div class="adm-welcome">
            <div class="adm-welcome-copy">
                <span class="adm-welcome-badge"><i class="fa fa-shield"></i> Admin Control Panel</span>
                <h2>Welcome Back, Admin</h2>
                <!-- <p>Track members, business, deposits, and withdrawals from one place. Review pending requests and keep the network moving.</p> -->
                <div class="adm-welcome-meta">
                    <span><i class="fa fa-calendar"></i> <%= DateTime.Now.ToString("dddd, dd MMM yyyy") %></span>
                    <span><i class="fa fa-circle"></i> System Online</span>
                </div>
            </div>
            <div class="adm-welcome-actions">
                <a href="UserReport.aspx" class="btn-red"><i class="fa fa-users"></i> Users</a>
                <a href="TransactionReport.aspx" class="btn-outline"><i class="fa fa-exchange"></i> Transactions</a>
            </div>
            <div class="adm-welcome-art" aria-hidden="true">
                <span class="ring ring-1"></span>
                <span class="ring ring-2"></span>
                <span class="blob"></span>
            </div>
        </div>

        <div class="row adm-kpi-row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-red">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Users</p>
                        <span class="adm-kpi-icon"><i class="fa fa-users"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="LblUserCount" runat="server" Text="0"></asp:Label></div>
                    <a href="UserReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-blue">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Active Users</p>
                        <span class="adm-kpi-icon"><i class="fa fa-user"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbltotalteamactive" runat="server" Text="0"></asp:Label></div>
                    <a href="UserReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-green">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Today Active</p>
                        <span class="adm-kpi-icon"><i class="fa fa-bolt"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbltodayteamactive" runat="server" Text="0"></asp:Label></div>
                    <a href="UserReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-yellow">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Business</p>
                        <span class="adm-kpi-icon"><i class="fa fa-rupee"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbltotakbusiness" runat="server" Text="0"></asp:Label></div>
                    <a href="TransactionReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
        </div>

        <div class="row adm-kpi-row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-green">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Bonus</p>
                        <span class="adm-kpi-icon"><i class="fa fa-gift"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="lbltotalbonus" runat="server" Text="0"></asp:Label></div>
                    <a href="#" class="adm-kpi-link">Overview &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-blue">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Today Business</p>
                        <span class="adm-kpi-icon"><i class="fa fa-line-chart"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbltotakbusinesstoday" runat="server" Text="0"></asp:Label></div>
                    <a href="TransactionReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-red">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Withdrawal</p>
                        <span class="adm-kpi-icon"><i class="fa fa-share"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lblwithdrawal" runat="server" Text="0"></asp:Label></div>
                    <a href="WithdrawlRequestReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-yellow">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Today Withdrawal</p>
                        <span class="adm-kpi-icon"><i class="fa fa-calendar"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lblwithdrawaltoday" runat="server" Text="0"></asp:Label></div>
                    <a href="WithdrawlRequestReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
        </div>

        <div class="row adm-kpi-row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-red">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Pending Withdrawal</p>
                        <span class="adm-kpi-icon"><i class="fa fa-clock-o"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="lblpendingwithdraw" runat="server" Text="0"></asp:Label></div>
                    <a href="WithdrawlRequestReport.aspx" class="adm-kpi-link">Review now &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-green">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Deposit</p>
                        <span class="adm-kpi-icon"><i class="fa fa-mail-reply"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbldeposit" runat="server" Text="0"></asp:Label></div>
                    <a href="DepositRequestReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-blue">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Today Deposit</p>
                        <span class="adm-kpi-icon"><i class="fa fa-plus-circle"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="Lbldeposittoday" runat="server" Text="0"></asp:Label></div>
                    <a href="DepositRequestReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-yellow">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Total Payout</p>
                        <span class="adm-kpi-icon"><i class="fa fa-money"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="lbltotalpayout" runat="server" Text="0"></asp:Label></div>
                    <a href="Dailypayoutdetail.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
        </div>

        <div class="row adm-kpi-row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-green">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Today Payout</p>
                        <span class="adm-kpi-icon"><i class="fa fa-check-circle"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="lbltotalpayouttoday" runat="server" Text="0"></asp:Label></div>
                    <a href="Dailypayoutdetail.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-red">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Products</p>
                        <span class="adm-kpi-icon"><i class="fa fa-cube"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="LblActiveEpin" runat="server" Text="0"></asp:Label></div>
                    <a href="ProductDetails.aspx" class="adm-kpi-link">View products &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-blue">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">Award &amp; Reward</p>
                        <span class="adm-kpi-icon"><i class="fa fa-trophy"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="lable1" runat="server" Text="0"></asp:Label></div>
                    <a href="UsersRewardReport.aspx" class="adm-kpi-link">View report &rarr;</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="adm-kpi tone-yellow">
                    <div class="adm-kpi-top">
                        <p class="adm-kpi-label">News</p>
                        <span class="adm-kpi-icon"><i class="fa fa-envelope-o"></i></span>
                    </div>
                    <div class="adm-kpi-value"><asp:Label ID="LblNewsCount" runat="server" Text="0"></asp:Label></div>
                    <a href="NewsAdd.aspx" class="adm-kpi-link">Manage news &rarr;</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="adm-card">
                    <div class="adm-card-head">
                        <h3>Deposit Requests</h3>
                        <a href="DepositRequestReport.aspx" class="btn-view">View All</a>
                    </div>
                    <div class="adm-card-body">
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a1"><i class="fa fa-mail-reply"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Total Deposits</strong>
                                    <span>All deposit requests</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <strong><asp:Label ID="LblDepositlTotal" runat="server" Text="0"></asp:Label></strong>
                            </div>
                        </div>
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a2"><i class="fa fa-hourglass-half"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Pending</strong>
                                    <span>Awaiting approval</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <strong><asp:Label ID="LblDepositPending" runat="server" Text="0"></asp:Label></strong>
                                <a href="DepositRequestReport.aspx" class="link">Review</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="adm-card">
                    <div class="adm-card-head">
                        <h3>Withdrawal Requests</h3>
                        <a href="WithdrawlRequestReport.aspx" class="btn-view">View All</a>
                    </div>
                    <div class="adm-card-body">
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a3"><i class="fa fa-share"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Total Withdrawals</strong>
                                    <span>All withdrawal requests</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <strong><asp:Label ID="LblWithdrawlTotal" runat="server" Text="0"></asp:Label></strong>
                            </div>
                        </div>
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a4"><i class="fa fa-clock-o"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Pending</strong>
                                    <span>Awaiting approval</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <strong><asp:Label ID="LblWithdrawlPending" runat="server" Text="0"></asp:Label></strong>
                                <a href="WithdrawlRequestReport.aspx" class="link">Review</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="adm-card">
                    <div class="adm-card-head">
                        <h3>Quick Actions</h3>
                        <a href="UserAdd.aspx" class="btn-view">Add User</a>
                    </div>
                    <div class="adm-card-body">
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a1"><i class="fa fa-shopping-cart"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Purchase Pending</strong>
                                    <span>Pending product purchases</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <strong><asp:Label ID="LblPurchaseProductCount" runat="server" Text="0"></asp:Label></strong>
                            </div>
                        </div>
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a2"><i class="fa fa-key"></i></div>
                                <div class="adm-list-meta">
                                    <strong>E-Pin Tools</strong>
                                    <span>Generate &amp; transfer pins</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <a href="EPinAdd.aspx" class="link">Open</a>
                            </div>
                        </div>
                        <div class="adm-list-item">
                            <div class="adm-list-left">
                                <div class="adm-avatar a3"><i class="fa fa-sitemap"></i></div>
                                <div class="adm-list-meta">
                                    <strong>Network Tree</strong>
                                    <span>View genealogy</span>
                                </div>
                            </div>
                            <div class="adm-list-right">
                                <a href="treeview.aspx" class="link">Open</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hidden labels kept for code-behind compatibility -->
        <div style="display:none;">
            <asp:Label ID="LblProductCount" runat="server" Text=""></asp:Label>
            <asp:Label ID="LblPurchaseAmount" runat="server" Text=""></asp:Label>
            <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <div id="chart_div"></div>
            <div id="Div1"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
