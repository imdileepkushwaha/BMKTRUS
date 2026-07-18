<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="user_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


    <meta property="og:title" content="Affiliate Link" />

    <meta property="og:url" content="http://arsenpay.in/user/Dashboard.aspx" />

    <style>
        .img-thumbnail {
            padding: 0;
        }

        .danger-table > tbody > tr > th {
            background: #f5d7d4;
            border: 1px solid #f5d7d4;
        }

        .danger-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }

        .sucess-table > tbody > tr > th {
            background: #bce9bb;
            border: 1px solid #bce9bb;
        }

        .sucess-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }

        .warning-table > tbody > tr > th {
            background: #f8ffbb;
            border: 1px solid #f8ffbb;
        }

        .warning-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }
    </style>




    <script type="text/javascript">
        function theFunction(liElem, aElem) {

            document.getElementById("limobile").className = "";
            $('#tab1').removeClass('active');
            document.getElementById("lidth").className = "";
            $('#tab2').removeClass('active');
            document.getElementById("lilandline").className = "";
            $('#tab3').removeClass('active');
            document.getElementById("lielectricity").className = "";
            $('#tab4').removeClass('active');
            // document.getElementById("liSettings").className = "";
            // $('#settings').removeClass('active');
            document.getElementById("ligas").className = "";
            $('#tab5').removeClass('active');
            // alert(liElem);
            document.getElementById(liElem).className = "active";
            document.getElementById(aElem).className += " active";
        }




    </script>


    <style type="text/css">
        .nav-tabs {
            border-bottom: 2px solid #456f28;
            background: #456f28;
        }

            .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
                border-width: 0;
            }

            .nav-tabs > li > a {
                border: none;
                color: #ffffff;
                background: #456f28;
                padding: 10px 20px;
            }

                .nav-tabs > li.active > a, .nav-tabs > li > a:hover {
                    border: none;
                    color: #5a4080 !important;
                    background: #fff;
                }

                .nav-tabs > li > a::after {
                    content: "";
                    background: #5a4080;
                    height: 2px;
                    position: absolute;
                    width: 100%;
                    left: 0px;
                    bottom: -1px;
                    transition: all 250ms ease 0s;
                    transform: scale(0);
                }

            .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after {
                transform: scale(1);
            }

        .tab-nav > li > a::after {
            background: #5a4080 none repeat scroll 0% 0%;
            color: #fff;
        }

        .tab-pane {
            padding: 15px 0;
        }

        .tab-content {
            padding: 20px;
        }

        .nav-tabs > li {
            width: auto;
            text-align: center;
        }



        .form-horizontal .form-control {
            height: 44px;
        }

        @media all and (max-width:724px) {
            .nav-tabs > li > a > span {
                display: none;
            }

            .nav-tabs > li > a {
                padding: 5px 5px;
            }
        }

        .input-group {
            margin-bottom: 30px;
        }

        .list-inline > li {
            display: inline-block;
            width: 47%;
            padding: 6px 30px;
        }

        .dashboardbox {
            border: 1px solid #b9d4ec;
            border-bottom: none;
            padding: 17px 0;
            background-color: #f2f2f2;
            background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(#f2f2f2));
            background-image: -webkit-linear-gradient(top, white, #f2f2f2);
            background-image: -moz-linear-gradient(top, white, #f2f2f2);
            background-image: -ms-linear-gradient(top, white, #f2f2f2);
            background-image: -o-linear-gradient(top, white, #f2f2f2);
            background-image: linear-gradient(top, white, #f2f2f2);
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            display: block;
            text-align: center;
            cursor: pointer;
            -webkit-transition: all 0.3s ease;
            -moz-transition: all 0.3s ease;
            -ms-transition: all 0.3s ease;
            -o-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }


        .footer {
            background: #02337f;
            padding: 15px;
            color: #fffdfd;
            font-weight: bold;
            font-size: 10px;
            border-radius: 20px;
            text-align: center;
        }


        .accordion .card-header:after {
            font-family: 'FontAwesome';
            content: "\f068";
            float: right;
        }

        .accordion .card-header.collapsed:after {
            /* symbol for "collapsed" panels */
            content: "\f067";
        }
    </style>


    <!--(Ends)-->
    <link href="../dist/css/user-profile.css" rel="stylesheet" />
    <link href="../site/css/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-dashboard">
        <div class="bmk-dash-hero">
            <div class="bmk-dash-hero-text">
                <span class="eyebrow">Member Panel</span>
                <h1>Welcome back</h1>
                <p>Bharat Manav Kalyan Trust &mdash; your account overview</p>
            </div>
            <div class="bmk-dash-hero-actions">
                <a class="btn-gold" href="UserProfile.aspx">My Profile</a>
                <a class="btn-ghost" href="WithdrawlRequstAdd.aspx">Withdrawal</a>
            </div>
        </div>
    </div>
    <section class="content-header" style="display:none;">
        <div class="ibox-title pull-left">
            <div style="display: none">
                <h5>Other Income Wallet:
                <asp:Label ID="lblwalletbalance123" runat="server" Text="Label" CssClass="label-success"></asp:Label>&nbsp;&nbsp;&nbsp;
              PFS Income Wallet:
                <asp:Label ID="lblUtilityBalance" runat="server" Text="Label" CssClass="label-success"></asp:Label></h5>
                <asp:TextBox ID="txtflag" Style="display: none" runat="server"></asp:TextBox>
                <span id="LblNo" runat="server"></span>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-dashboard">
    <div class="row gy-4">
        <!-- Personal Info -->
        <div class="col-lg-6">
            <div class="bmk-card">
                <div class="bmk-card-body">
                    <h6 class="bmk-card-title">Personal Info</h6>
                    <ul class="bmk-info-list">
                        <li>
                            <span class="label">Welcome</span>
                            <span class="value"><asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label></span>
                        </li>
                        <li>
                            <span class="label">User ID</span>
                            <span class="value"><asp:Label ID="lbluserid" runat="server" Text="Label"></asp:Label></span>
                        </li>
                        <li>
                            <span class="label">Mobile</span>
                            <span class="value"><asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></span>
                        </li>
                        <li>
                            <span class="label">Rank</span>
                            <span class="value"><asp:Label ID="lblrank" runat="server" Text=""></asp:Label></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Affiliate Link -->
        <div class="col-lg-6">
            <div class="bmk-card">
                <div class="bmk-card-body">
                    <h6 class="bmk-card-title">Affiliate Link</h6>
                    <div id="dvlink" runat="server" visible="True" class="bmk-affiliate">
                        <asp:Label class="form-label" ID="Label1" runat="server" Text="Share your referral link"></asp:Label>
                        <div class="input-group mb-0">
                            <asp:TextBox ID="TxtLeftLinkLink" runat="server" CssClass="form-control" />
                            <asp:Button ID="Button1" runat="server" Text="Copy" CssClass="btn btn-primary" OnClientClick="CopyToClipboard()" />
                        </div>
                    </div>
                    <div style="display:none">
                        <asp:Label class="form-label" ID="Label2" runat="server" Text="Affiliate Link (RIGHT)"></asp:Label>
                        <div class="input-group mb-0">
                            <asp:TextBox ID="TxtRightLink" runat="server" CssClass="form-control" />
                            <asp:Button ID="Button2" runat="server" Text="Copy" CssClass="btn btn-primary" OnClientClick="CopyToClipboard2()" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- News / bank alert (kept hidden as before) -->
        <div class="col-12 d-none">
            <div class="card h-100">
                <div class="card-body p-24">
                    <div class="d-flex align-items-center flex-wrap gap-2 justify-content-between">
                        <h6 class="mb-2 fw-bold text-lg">
                            <marquee direction="left" onmouseover="stop();" onmouseout="start();">
                                <asp:Literal ID="ltnews" runat="server"></asp:Literal></marquee>
                        </h6>
                    </div>
                    <div class="mt-32">
                        <asp:Panel ID="pnlnotification" runat="server">
                            <div class="alert alert-danger">
                                <strong>Error!</strong> Please Update your bank details  <a href="UserEdit.aspx">click here</a> to update.
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>

        <!-- Account status | Team -->
        <div class="col-xxl-6">
            <div class="bmk-card">
                <div class="bmk-card-body">
                    <h6 class="bmk-card-title">Account Status</h6>
                    <div class="bmk-status-row">
                        <div>
                            <h3>Rank</h3>
                        </div>
                        <div class="value">
                            <asp:Label ID="lblrank1" runat="server" Text="0.00"></asp:Label>
                            <asp:Label ID="lblrankreward" runat="server" Text="0.00" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="bmk-status-row">
                        <div>
                            <h3>Plan Amount</h3>
                        </div>
                        <div class="value">
                            <asp:Label ID="LblCurrentpackage" runat="server" Text="Category Name"></asp:Label>
                        </div>
                    </div>
                    <div class="bmk-status-row">
                        <div>
                            <h3>Status</h3>
                            <small><asp:Label ID="Lblactivatedate2" runat="server" Text="01/07/2024"></asp:Label></small>
                        </div>
                        <a href="javascript:void(0)" class="bmk-status-badge">
                            <asp:Label ID="lblstatus" runat="server" Text="Label"></asp:Label>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xxl-6">
            <div class="bmk-section-card" style="margin-top:0;">
                <div class="bmk-section-head">
                    <h6>Team Overview</h6>
                </div>
                <div class="bmk-section-body">
                    <div class="row gy-3">
                        <div class="col-12">
                            <div class="bmk-team-tile">
                                <div class="t-icon"><a href="UserDirectAssociates.aspx"><i class="ri-group-3-fill"></i></a></div>
                                <span class="t-label">Total Direct</span>
                                <p class="t-value"><asp:Label ID="LblDirect" runat="server" Text="Label"></asp:Label></p>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="bmk-team-tile green">
                                <div class="t-icon"><a href="UserDirectAssociates.aspx"><i class="ri-user-follow-fill"></i></a></div>
                                <span class="t-label">Active Direct</span>
                                <p class="t-value"><asp:Label ID="LblActiveDirect" runat="server" Text="Label"></asp:Label></p>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="bmk-team-tile gold">
                                <div class="t-icon"><a href="DownlineReport.aspx"><i class="ri-organization-chart"></i></a></div>
                                <span class="t-label">Total Team</span>
                                <p class="t-value"><asp:Label ID="LblTotalLeft" runat="server" Text="Label"></asp:Label></p>
                                <div class="t-meta">
                                    <a class="ok" href="DownlineReport.aspx"><asp:Label ID="Lblactiveleft" runat="server" Text="Label"></asp:Label> Active</a>
                                    <a class="bad" href="DownlineReport.aspx"><asp:Label ID="LblInactiveleft" runat="server" Text="Label"></asp:Label> Inactive</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12" style="display:none">
                            <div class="bmk-team-tile saffron">
                                <div class="t-icon"><i class="ri-group-3-fill"></i></div>
                                <span class="t-label">Total Right Team</span>
                                <p class="t-value"><asp:Label ID="LblTotalright" runat="server" Text="Label"></asp:Label></p>
                                <div class="t-meta">
                                    <span class="ok"><asp:Label ID="LblActiveRight" runat="server" Text="Label"></asp:Label> Active</span>
                                    <span class="bad"><asp:Label ID="LblInActiveRight" runat="server" Text="Label"></asp:Label> Inactive</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Wallet / Income / Performance: full-width rows (footer ke upar hi) -->
        <div class="col-12">
            <div class="bmk-section-card" style="margin-top:0;">
                <div class="bmk-section-head">
                    <h6>Wallet</h6>
                </div>
                <div class="bmk-section-body">
                    <div class="row gy-3">
                        <div class="col-md-4 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon gold"><iconify-icon icon="solar:wallet-money-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Credited</span>
                                    <span class="bmk-stat-value"><asp:Label ID="LblCredited" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon saffron"><iconify-icon icon="solar:card-send-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Debited</span>
                                    <span class="bmk-stat-value"><asp:Label ID="LblDebited" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon navy"><iconify-icon icon="solar:safe-square-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Balance</span>
                                    <span class="bmk-stat-value"><asp:Label ID="LblCurrentWallet" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="bmk-section-card">
                <div class="bmk-section-head">
                    <h6>Income</h6>
                </div>
                <div class="bmk-section-body">
                    <div class="row gy-3">
                        <div class="col-md-3 col-sm-6" style="display:none">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon navy"><iconify-icon icon="mingcute:user-follow-fill"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Direct Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblDirectincome" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon gold"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Left Team</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblleftteam" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon saffron"><iconify-icon icon="solar:chart-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Middle Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblmiddleteam" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon green"><iconify-icon icon="solar:graph-up-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Right Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblrightteam" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon navy"><iconify-icon icon="solar:layers-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Level Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lbllevelincome" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6" style="display:none">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon navy"><iconify-icon icon="mingcute:user-follow-fill"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Single Leg Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblsingleleg" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6" style="display:none">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon green"><iconify-icon icon="mingcute:user-follow-fill"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Franchise Income</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblfranchise" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6" style="display:none">
                            <div class="bmk-stat">
                                <span class="bmk-stat-icon green"><iconify-icon icon="mingcute:user-follow-fill"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Reward</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblreward" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="bmk-section-card">
                <div class="bmk-section-head">
                    <h6>Performance</h6>
                </div>
                <div class="bmk-section-body">
                    <div class="row gy-3">
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat bmk-stat-click" data-bs-toggle="modal" data-bs-target="#modal-today" role="button">
                                <span class="bmk-stat-icon navy"><iconify-icon icon="solar:calendar-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Today</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblTodayPerformance" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat bmk-stat-click" data-bs-toggle="modal" data-bs-target="#modal-week" role="button">
                                <span class="bmk-stat-icon gold"><iconify-icon icon="solar:calendar-mark-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Week</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblCurrentWeek" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat bmk-stat-click" data-bs-toggle="modal" data-bs-target="#modal-month" role="button">
                                <span class="bmk-stat-icon saffron"><iconify-icon icon="solar:calendar-minimalistic-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Month</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblCurrentMonth" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="bmk-stat bmk-stat-click" data-bs-toggle="modal" data-bs-target="#modal-total" role="button">
                                <span class="bmk-stat-icon green"><iconify-icon icon="solar:chart-2-bold"></iconify-icon></span>
                                <div>
                                    <span class="bmk-stat-label">Total</span>
                                    <span class="bmk-stat-value"><asp:Label ID="lblTotal" CssClass="heading" runat="server" Text="0"></asp:Label></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xxl-12 d-none">
            <div class="card h-100">

                <div class="card-body p-24">
                    <div class="table-responsive scroll-sm">
                        <asp:GridView ID="GrdPerformance" runat="server" CssClass="table table-hover table-bordered dataTable"
                            Width="100%" AutoGenerateColumns="False" Visible="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Performance">
                                    <ItemTemplate>

                                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("active") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Deactive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("deactive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                    </div>



                </div>
            </div>
        </div>
    </div>
    </div><!-- /.bmk-dashboard -->
    <div class="bmk-dash-legacy" style="display:none !important" aria-hidden="true">

    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Self-Purchase Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-black">
                                    <asp:Label ID="lblselfincome" runat="server" Text="Label"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"><a href="#">More Info</a></i>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Developer Bonus</p>
                            <br>
                            <div class="" style="display: none">
                                <h3 class="font-weight-semibold text-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="sssss" runat="server" Text="00.00" Visible="false"></asp:Label></h3>
                            </div>
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-black"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblMatching11" runat="server" Text="00.00" Visible="false"></asp:Label>
                                    <asp:Label ID="lblMatchinggg" runat="server" Text="00.00"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="Dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Team Development Income</p>
                            <br>
                            <div class="">

                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"
                                    style="display: none"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblDIrectorIncomeaa" runat="server" Text="Label"></asp:Label>

                                </h3>
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-black"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblMatching" runat="server" Text="Label"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Travel Fund Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"
                                    style="display: none"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lbldailyincome" runat="server" Text="0.00"></asp:Label>

                                </h3>
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblDIrectorIncome" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Elite Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblgoldirector" runat="server" Text="0"></asp:Label>
                                </h3>



                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Director Bonus</p>
                            <br />
                            <div class="">
                                <asp:Label ID="lblleadership" runat="server" Text="0.00"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Ruby Director Bonus</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblCurrentWalhhhlet" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i><a href="TransactionReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Crown Director Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-success">
                                    <asp:Label ID="Label6" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #FFA500 60%,#FFC55C 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">House Fund</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-success">
                                    <asp:Label ID="Label7" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Rank</p>
                            <br>
                            <div class="">
                                <h2 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="sdsdff" runat="server" Text="Label"></asp:Label></h2>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>








    </div>
    
    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #000075 60%,#0000D1 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-indian-rupee-sign text-white icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Consistency Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblCraaaedited" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>More Info
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #964B00 60%,#C46200 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Program Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblDebaaaited" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>More Info
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #FF4B2B 60%, #FF416C 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Car Fund</p>
                            <br>
                            <div class="">

                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblREpurchaseIncome" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-users text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">AutoPool Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblPooldownline" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="PoolBinaryReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Current Package</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblrank2" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br />
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Today Performance Pair</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblPerformance" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="Dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblDownline" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="DownlineReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Active Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblActiveDownline" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="DownlineReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>




    </div>


    <div class="row">


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Left SV (Bonanza 26 Sept) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftBonanzasv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (Bonanza 26-Spet) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblRightBonanzasv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblRleftbv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblcurrentleftbv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblRrightbv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Right SV
								  <asp:Label ID="lblcurrrentightbv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4 " style="display: none">
            <div class="card mb-0 gradient-10 gradient-10-shadow border1px-white card-summary gradient-10-hover">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-bubbles"></i>
                        </div>
                        <div class="text-right">
                            <h2 class="card-summary__price">
                                <asp:Label ID="Lblleftbv" runat="server" Text="Label"></asp:Label></h2>
                            <p class="card-summary__title">Total Left SV </p>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>Carry PV
								<asp:Label ID="Lblleftcarrypv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>


            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblTotalincome" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="UserDirectAssociates.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-users text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Left Directs</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblLeftDirect" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right Directs</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblRightDirect" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-wallet text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Cash Wallet</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="Totalbalance" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br />
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Cash Back Income</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LbllevelROiIncome" runat="server" Text="0"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="levelincomereport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV (First Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftjoiningsv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
                                    
								  <asp:Label ID="lblleftjoiningcarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (First Purchase) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblrightjoiningsv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblrightjoiningcarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Self SV (First Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lbltotalselfjoiningsv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

    </div>


    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV (Re-Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftrepurchasesv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
                                    
								  <asp:Label ID="lblleftrepurchasecarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (Re-Purchase) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblRightrepurchasesv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblRightrepurchasecarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Self SV (Re-Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lbltotalselfRepurchasesv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

    </div>



    <div class="row">




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="Lblrightbv" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">RIGHT PV </p>
                        </div>
                    </div>

                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>Left Carry PV
								<asp:Label ID="Lblrightcarrypv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>






    </div>

    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="LblRetailProfit" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">Self BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>






    </div>

    <div class="row" style="display: none">
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-10 gradient-10-shadow border1px-white card-summary gradient-10-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-bubbles"></i>
                        </div>
                        <div class="text-right">
                            <h2 class="card-summary__price"></h2>
                            <p class="card-summary__title">CURRENT LEFT BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price"></h2>
                            <p class="card-summary__title">CURRENT RIGHT BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="lblcurrentselfbv" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">CURRENT Self BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>






    </div>


    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Autopool Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success"><i class="fa fa-inr"></i>
                                    <asp:Label ID="LblPoolIncome" runat="server" Text="Label"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="AutoPoolIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Level Income</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lbl878" runat="server" Text="0"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="LevelIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Group Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LBlGroupIncome" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="LuckyDrawClosingReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-calendar text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Payment Date</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblpaydate" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br>
                    </p>
                </div>
            </div>
        </div>


    </div>

    <!--  <div class="row">
                        <div class="col-lg-4 col-xs-12" style="display:none;">
                            <div class="small-box bg-aqua" style="height: 130px; background-color: #28e8cf !important;">
                                <div class="col-md-6" style="background-color: #28e8cf !important">
                                    <div class="inner">
                                        <p class="text">Main Wallet</p>
                                        <h3 class="number count-to">
                                           </h3>
                                    </div>
                                </div>
                                <div class="col-md-6" style="background-color: #28e8cf !important">
                                    <div class="inner">
                                        <p class="text">Payout Wallet</p>
                                        <h3 class="number count-to">
                                          </h3>
                                    </div>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inr"></i>
                                </div>
                            </div>

                        </div>

						
						<div class="col-lg-4 col-xs-12" >
							
							 <div class="small-box bg-primary">
                                <div class="inner">
                                    <p class="text">Status &nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;
Profit Share Budget</p>
                                    <h3 class="number count-to">
                                        </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inr"></i>
                                </div>
                               
                            </div>
							
						</div>
                          	<div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Current Package</p>
                                    <h3 class="number count-to">
                                      
                                              </asp:Label>
                                    </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                              
                            </div>
                        </div>

                             <div class="col-lg-4 col-xs-12" style="display:none" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Current Group</p>
                                    <h3 class="number count-to">
                                      
                                          <asp:Label ID="LblGroup" runat="server" Text="Label"></asp:Label>
                                    </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                              
                            </div>
                        </div>
						   <div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Activation Date</p>
                                    <h3 class="number count-to">
                                      
                                           
                                    </h3>
                                </div>
                                <div class="icon">
                                       <i class="fa fa-calendar"></i>
                                </div>
                              
                            </div>
                        </div> -->

    <div class="row">

        <div class="col-lg-4 col-xs-12" style="display: none">
            <div class="small-box bg-primary">
                <div class="inner">
                    <p class="text">Main Wallet</p>
                    <h3 class="number count-to">
                        <asp:Label ID="lblwalletBalance" runat="server" Text="Label"></asp:Label></h3>
                </div>
                <div class="icon">
                    <i class="fa fa-inr"></i>
                </div>
                <a href="UserWallet.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-4 col-xs-12" style="display: none">
            <div class="small-box bg-primary">
                <div class="inner">
                    <p class="text">Payout Wallet</p>
                    <h3 class="number count-to">
                        <asp:Label ID="lblshoppingWallet" runat="server" Text="Label"></asp:Label></h3>
                </div>
                <div class="icon">
                    <i class="fa fa-inr"></i>
                </div>
                <a href="UserWallet.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>

        </div>
    </div>

                       <!--	<div class="row">

                       <div class="col-lg-4 col-xs-12" >	 
						 
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Team</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="DownlineReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
						
					</div>

                       <div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Active Team</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="DownlineReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
					</div>
				<div class="col-lg-4 col-xs-12" >
					
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Active Direct</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div>
						
					</div>	
				
					 <div class="col-lg-4 col-xs-12" >
				
						
		
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Direct</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="LblsalaryPoint" runat="server" Text="Label" Visible="false"></asp:Label>
                                       
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div> 


                   <div class="col-lg-4 col-xs-12" >
				
						
		
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Income</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div> 
					
					
				</div>
				<div class="row">
                        <div class="col-lg-4 col-xs-12">
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Level ROI Income</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="Lblsalary" runat="server" Text="0" Visible="false"></asp:Label>
                                          <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="GiftBalanceReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
						 
						 <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">ROI Income</p>
                                 
                                     
								 <h3 class="number count-to">
									 <asp:Label ID="LblBinaryPoint" runat="server" Text="0" Visible="false"></asp:Label>
                                          <font style="color:#fff">$</font>
								</h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="GiftBalanceReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

                       <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Autopool Income</p>
                                   <h3 class="number count-to">
                                      <%-- <asp:Label ID="LblBinaryIncome" runat="server" Text="Label" Visible="false"></asp:Label>--%>
                                        <asp:Label ID="asfr" runat="server" Text="0" Visible="false" ></asp:Label>
                                           <font style="color:#fff">$</font>
                                   </h3>
                                   
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="AutoPoolIncomeReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

                       <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Level Income</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="LblRechargewallet" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="LevelIncomeReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
					<div class="col-lg-4 col-xs-12" style="display:none;" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Level Achieved</p>
                                   <h3 class="number count-to">
                                     
                                        <asp:Label ID="LblLevelNo" runat="server" Text="Label" ></asp:Label>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
					<div class="col-lg-4 col-xs-12" >
<div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Group Income</p>
                                   <h3 class="number count-to">
                                     
                                        <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="LuckyDrawClosingReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
					</div>
					
					<div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Payment Date</p>
                                   <h3 class="number count-to">
                                     
                                               
                                   </h3><br>
                               </div>
                               <div class="icon">
                                  <i class="fa fa-calendar"></i>
                               </div>
                             
                           </div>
                       </div>
                     
                       <div class="col-lg-4 col-xs-12" style="display:none" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Group Income (commission)</p>
                                   <h3 class="number count-to">
                                     
                                               <asp:Label ID="lblincome" runat="server" Text="Label"></asp:Label> <font style="color:#fff">%</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="LuckyDrawClosingReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
                    
                     

                     

                  

                       <div class="col-lg-4 col-xs-12" style="display:none" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Boost Profit Share Status</p>
                                   <h3 class="number count-to">
                                     
                                        <asp:Label ID="LblBoostPFS" runat="server" Text="" ></asp:Label>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

				</div> -->

   




                    <div class="col-lg-4 col-xs-12" style="display: none;">
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <p class="text">Change Password</p>
                                <h3 class="number count-to">
                                    <span id="Span4" style="color: transparent">0.0</span></h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-key"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

               

                <div class="col-lg-4 col-xs-12" style="display: none;">
                    <div class="small-box bg-purple">
                        <div class="inner" style="min-height: 104px;">
                            <p class="text">Total Business</p>
                            <h3 class="number count-to" style="font-size: 16px;">
                                <asp:Label ID="labl1323" runat="server" Text="Label"></asp:Label>
                                <span style="color: white;">|</span>
                                <asp:Label ID="lblBVvalue" runat="server" Text="Label"></asp:Label>
                            </h3>
                        </div>
                        <div class="icon">
                            <i class="fa fa-inr"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>






        <!--Recharge Panel (Starts) pasted from Recharge.aspx-->


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate></ContentTemplate>
        </asp:UpdatePanel>



        <!--Recharge Panel (Ends)-->
        <div class="row" style="display: none">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Quick link
                                    <span id="spanprime" runat="server" visible="false" class="blinking spanprime" style="float: right; font-weight: bold; font-size: 16px;">Become a Prime Member Now&nbsp;<a href="#" id="a_prime" onclick="return primeclick();" style="color: yellow;">click here</a></span>

                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="useradd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-user fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-success" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">User add </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="Recharge.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-mobile fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-success" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Recharge & Bill </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="rechargereport.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-calendar fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-danger" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Recharge Detail </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="PurchaseItem.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-cart-plus fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-warning" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Purchase Product </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="WithdrawlRequstAdd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-primary" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Withdrawl Request</div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="DepositRequstAdd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-info" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Deposit Request </div>
                                        </div>
                                    </a>
                                </div>

                            </div>

                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel panel-default panel-white">
                                    <a href="UserWallet.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-primary" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Wallet Status </div>
                                        </div>
                                    </a>
                                </div>

                            </div>




                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row" style="display: none">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Current PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblCurrentPV" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Used PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUsedPV" runat="server" Text="Label"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Total PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTotalPV" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>








        </div>


        <div class="row" style="display: none;">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Current Recharge wallet</p>
                        <h3 class="number count-to">
                            <%-- <asp:Label ID="LblRechargewallet" runat="server" Text="Label"></asp:Label>--%></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Current Utility Wallet</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUtilityWallet" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>


            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Current Balance</p>
                        <h3 class="number count-to"></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>






            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-lime">
                    <div class="inner">
                        <p class="text">Monthly Business</p>
                        <h3 class="number count-to">
                            <asp:Label ID="Label3" runat="server" Text="0.00"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>







        </div>

        <div class="row" style="display: none;">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Today's Business</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTodayBuissness" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Recharge Wallet Purchase</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTodayWalletPurchase" runat="server" Text="Label"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Utility Wallet Purchase</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUtilitywalletPurchase" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>



            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-blue">
                    <div class="inner">
                        <p class="text">Today's Commission</p>
                        <h3 class="number count-to">
                            <asp:Label ID="Label4" runat="server" Text="0.00"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>



        </div>


        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Status Report</div>
                    <div class="panel-body">
                        <label>Awards & Rewards Current Qualification Status</label>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>

                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AWARD">
                                        <ItemTemplate>
                                            <asp:Label ID="labawardname" runat="server" Text='<%#Eval("awardname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="START DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="END DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("Todate1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET LEFT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetleft" runat="server" Text='<%#Eval("TargetLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET RIGHT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetright" runat="server" Text='<%#Eval("TargetRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentLeftBv" runat="server" Text='<%#Eval("CurrentLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentRightBv" runat="server" Text='<%#Eval("CurrentRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredLeftBv" runat="server" Text='<%#Eval("RequiredLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredRightBv" runat="server" Text='<%#Eval("RequiredRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <label>Dream Vacation Achievers Status Report</label>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>

                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VACATION">
                                        <ItemTemplate>
                                            <asp:Label ID="labawardname" runat="server" Text='<%#Eval("vacationname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="START DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate1") %>'></asp:Label>
                                            <asp:Label ID="lblfromdate1" runat="server" Text='<%#Eval("Fromdate") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="END DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("Todate1") %>'></asp:Label>
                                            <asp:Label ID="lbltodate1" runat="server" Text='<%#Eval("Todate") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET LEFT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetleft" runat="server" Text='<%#Eval("TargetLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET RIGHT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetright" runat="server" Text='<%#Eval("TargetRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentLeftBv" runat="server" Text='<%#Eval("CurrentLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentRightBv" runat="server" Text='<%#Eval("CurrentRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredLeftBv" runat="server" Text='<%#Eval("RequiredLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredRightBv" runat="server" Text='<%#Eval("RequiredRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>

            </div>

        </div>

        <div class="row" style="display: none;">
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                <div class="userbox">
                    <div class="box-icon">
                        <asp:Image ID="ImgMyPhoto" runat="server" class="img-responsive img-circle" />
                        <%-- <img src="img/pic.png" class="img-responsive img-circle"/>--%>
                    </div>
                    <div class="info">
                        <h4 class="text-center">User Details</h4>
                        <h6 class="text-center"><strong>Address :</strong>
                            <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></h6>
                        <ul class="list-inline">
                            <li><strong>Joining Date :</strong>
                                <asp:Label ID="lbljoiningdate" runat="server" Text=""></asp:Label></li>
                            <li><strong>Activate date :</strong>
                                <asp:Label ID="Lblactivatedate" runat="server" Text=""></asp:Label></li>
                            <li><strong>Sponser ID :</strong>
                                <asp:Label ID="LblSponserId" runat="server" Text=""></asp:Label></li>
                            <li><strong>Sponser Name :</strong>
                                <asp:Label ID="LblSponserName" runat="server" Text=""></asp:Label></li>
                            <li><strong>Parent ID :</strong>
                                <asp:Label ID="LblParentId" runat="server" Text=""></asp:Label></li>
                            <li><strong>Parent Name :</strong>
                                <asp:Label ID="LblParentName" runat="server" Text=""></asp:Label></li>
                            <li><strong>Mobile :</strong>

                            <li><strong>Email :</strong>
                                <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></li>
                        </ul>

                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display: none;">
                <div class="userbox">
                    <div class="info">
                        <h4 class="text-center">Bank Details</h4>
                        <p>
                            <strong>A/c Holder Name :</strong>
                            <asp:Label ID="lblaccountholdername" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>A/c No :</strong>
                            <asp:Label ID="lblaccountno" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>Bank :</strong>
                            <asp:Label ID="lblbank" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>IFSC Code :</strong>
                            <asp:Label ID="lblifsc" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>Pan No :</strong>
                            <asp:Label ID="lblpan" runat="server" Text=""></asp:Label>
                        </p>

                    </div>
                </div>
            </div>

        </div>


        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Award List</div>
                    <div class="panel-body">
                        <div class="">
                            <div class="col-md-12">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridView3" runat="server" CssClass="table table-hover table-bordered dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdBank_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("ulevel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Target">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("target") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Acheived">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("bv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Acheived Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status1" runat="server" Text='<%#Eval("ADate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PaymentStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="PaymentStatus" runat="server" Text='<%#Eval("PaymentStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PaymentDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="PaymentDate" runat="server" Text='<%#Eval("pdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView4" runat="server" CssClass="table table-hover dataTable danger-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Weekly Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridView5" runat="server" CssClass="table dataTable sucess-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fortnight Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView6" runat="server" CssClass="table table-hover dataTable warning-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Total Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">User Performance</div>
                    <div class="panel-body">
                        <div class="">
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridViewToday" runat="server" CssClass="table table-hover table-bordered dataTable" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Today Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrvVwWeek" runat="server" CssClass="table table-hover dataTable danger-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Weekly Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GrdVwMonth" runat="server" CssClass="table dataTable sucess-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fortnight Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrdVwTotal" runat="server" CssClass="table table-hover dataTable warning-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Total Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



   


    <style>
        .serviceBox .service-icon {
            display: inline-block;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 19px;
            position: relative;
        }

            .serviceBox .service-icon .heading {
                display: inline-block;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                line-height: 80px;
                background: #fff;
                box-shadow: -5px 5px 5px rgba(0,0,0,0.5);
                font-size: 35px;
                color: #0fb513;
                position: absolute;
                top: 0;
                left: 0;
                text-align: center;
            }

            .serviceBox .service-icon:before {
                content: "";
                background: #0fb513;
                border-radius: 50%;
                position: absolute;
                top: -10px;
                left: -10px;
                bottom: -10px;
                right: -10px;
            }

            .serviceBox .service-icon:after {
                content: "";
                width: 4px;
                height: 0;
                background: #0fb513;
                margin: 0 auto;
                position: absolute;
                bottom: -55px;
                left: 0;
                right: 0;
                transition: all 0.3s ease 0s;
            }

        .serviceBox .title {
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            color: #000;
            text-transform: uppercase;
            margin: 0 0 10px 0;
            position: relative;
        }

        .serviceBox.pink .service-icon:before, .serviceBox.pink .service-icon:after {
            background: #d41271;
        }

        .serviceBox.pink .service-icon:before, .serviceBox.pink .service-icon:after {
            background: #d41271;
        }

        .serviceBox.yellow .service-icon:before, .serviceBox.yellow .service-icon:after {
            background: #fba21a;
        }

        .serviceBox.yellow .service-icon:before, .serviceBox.yellow .service-icon:after {
            background: #fba21a;
        }

        .serviceBox.blue .service-icon:before, .serviceBox.blue .service-icon:after {
            background: #05b4b7;
        }

        .serviceBox.blue .service-icon:before, .serviceBox.blue .service-icon:after {
            background: #05b4b7;
        }
    </style>
    <!-- /.box-body -->
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div><!-- /.bmk-dash-legacy -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript" language="javascript">
        function CopyToClipboard() {


            /* Get the text field */
            var copyText = document.getElementById('<%=TxtLeftLinkLink.ClientID%>');

            /* Select the text field */
            copyText.select();

            /* Copy the text inside the text field */
            document.execCommand("Copy");

            /* Alert the copied text */
            alert("Copied the text: " + copyText.value);
        }
        function CopyToClipboard2() {


            /* Get the text field */
            var copyText1 = document.getElementById('<%=TxtRightLink.ClientID%>');

            /* Select the text field */
            copyText1.select();

            /* Copy the text inside the text field */
            document.execCommand("Copy");

            /* Alert the copied text */
            alert("Copied the text: " + copyText1.value);
        }

        function primeclick() {

            if (confirm("Are you sure want to become a prime member ?")) {
                $.ajax({
                    url: "Dashboard.aspx/BecomePrimeMember",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{}",
                    success: function (r) {
                        if (r.d == 1) {
                            alert('Congrats! Your request has been send');
                            $(".spanprime").hide();
                            location.href = "Dashboard.aspx";
                        }
                        else if (r.d == 2) {

                            alert('error! you are already prime member');
                        }
                        else if (r.d == 3) {

                            alert('error! your previous request is already pending');
                        }
                        else {
                            return false;
                        }
                    },
                    error: function (r) { }
                });

            }
            else {
                return false;
            }
        }


        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script>


    <!--(Starts) For User Performance-->

    <div class="modal fade" id="modal-today">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Today Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTodayActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTodayDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTodayTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-week">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Current Week Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeekActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWeekDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWeekTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-month">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Current Month Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMonthActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-total">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Total Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTotalActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTotalDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTotalTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->



</asp:Content>
