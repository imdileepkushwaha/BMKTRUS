<%@ Page Title="My Profile" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;600;700;800&display=swap" rel="stylesheet" />
    <link href="../site/css/profile.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {
                alert('Enter Sponser Id');
                document.getElementById("<%=txtsponserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtname.ClientID%>").value == "") {
                alert('Enter Name');
                document.getElementById("<%=txtname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {
                alert('Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID%>").value == "") {
                alert('Enter Email');
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaddress.ClientID%>").value == "") {
                alert('Enter Address');
                document.getElementById("<%=txtaddress.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {
                alert('Select Country');
                document.getElementById("<%=ddcountry.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {
                alert('Select State');
                document.getElementById("<%=ddstate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcity.ClientID%>").value == "0") {
                alert('Select City');
                document.getElementById("<%=ddcity.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtareaname.ClientID%>").value == "") {
                alert('Enter Area');
                document.getElementById("<%=txtareaname.ClientID%>").focus();
                return false;
            }
        }

        function copyProfileLink(inputId) {
            var el = document.getElementById(inputId);
            if (!el) return;
            el.select();
            el.setSelectionRange(0, 99999);
            try {
                navigator.clipboard.writeText(el.value);
                alert('Link copied');
            } catch (e) {
                document.execCommand('copy');
                alert('Link copied');
            }
        }

        function shareWhatsApp(inputId) {
            var el = document.getElementById(inputId);
            if (!el || !el.value) return;
            window.open('https://wa.me/?text=' + encodeURIComponent('Join Bharat Manav Kalyan Trust: ' + el.value), '_blank');
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-pcards">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="modal2">
                    <div class="center2">
                        <img alt="" src="loader.gif" />
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="bmk-pcards-layout">

                    <!-- LEFT -->
                    <aside class="bmk-pcards-side">

                        <article class="bmk-card bmk-card-member">
                            <div class="bmk-card-member-top">
                                <span class="bmk-member-id">@<asp:Literal ID="litUserIdBadge" runat="server" /></span>
                            </div>
                            <div class="bmk-card-member-body">
                                <div class="bmk-member-photo">
                                    <asp:Image ID="imgProfile" runat="server" AlternateText="Profile photo" />
                                </div>
                                <h2 class="bmk-member-name">
                                    <asp:Literal ID="litDisplayName" runat="server" />
                                </h2>
                                <p class="bmk-member-meta">
                                    <asp:Literal ID="litUserIdSub" runat="server" />
                                    <span>·</span>
                                    <asp:Literal ID="litPackage" runat="server" Text="Member" />
                                </p>
                                <div class="bmk-member-badges">
                                    <asp:Label ID="lblStatusBadge" runat="server" CssClass="bmk-badge bmk-badge-ok" Text="Active" />
                                    <asp:Label ID="lblKycBadge" runat="server" CssClass="bmk-badge bmk-badge-warn" Text="KYC Pending" />
                                </div>
                                <div class="bmk-member-stats">
                                    <div>
                                        <span>Direct</span>
                                        <strong><asp:Literal ID="litDirectCount" runat="server" Text="0" /></strong>
                                    </div>
                                    <div>
                                        <span>Team</span>
                                        <strong><asp:Literal ID="litTeamCount" runat="server" Text="0" /></strong>
                                    </div>
                                    <div>
                                        <span>Wallet</span>
                                        <strong>₹<asp:Literal ID="litWalletMini" runat="server" Text="0.00" /></strong>
                                    </div>
                                </div>
                                <div class="bmk-member-actions">
                                    <a href="PhotoUpload.aspx" class="bmk-act bmk-act-primary">
                                        <iconify-icon icon="solar:camera-bold"></iconify-icon> Photo
                                    </a>
                                    <a href="UserEdit.aspx" class="bmk-act bmk-act-soft">
                                        <iconify-icon icon="solar:pen-bold"></iconify-icon> Edit
                                    </a>
                                </div>
                            </div>
                        </article>

                        <article class="bmk-card bmk-card-form">
                            <header class="bmk-card-head bmk-head-gold">
                                <iconify-icon icon="solar:heart-bold"></iconify-icon>
                                Nominee Details
                            </header>
                            <div class="bmk-form-pad">
                                <div class="form-group">
                                    <label>Nominee Name</label>
                                    <asp:TextBox ID="txtnomineename" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Nominee Relation</label>
                                    <asp:TextBox ID="txtnomineerelation" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </article>

                        <article class="bmk-card" style="display:none">
                            <header class="bmk-card-head bmk-head-gold">
                                <iconify-icon icon="solar:link-circle-bold"></iconify-icon>
                                Referral Links
                            </header>
                            <div class="bmk-ref-wrap">
                                <div class="bmk-ref-block">
                                    <label>Left Leg</label>
                                    <div class="bmk-ref-line">
                                        <asp:TextBox ID="TxtLeftLinkLink" runat="server" CssClass="bmk-ref-field" ReadOnly="true" />
                                        <button type="button" class="bmk-ref-btn" title="Copy" onclick="copyProfileLink('<%=TxtLeftLinkLink.ClientID%>')">
                                            <iconify-icon icon="solar:copy-bold"></iconify-icon>
                                        </button>
                                        <button type="button" class="bmk-ref-btn bmk-ref-wa" title="WhatsApp" onclick="shareWhatsApp('<%=TxtLeftLinkLink.ClientID%>')">
                                            <iconify-icon icon="ic:baseline-whatsapp"></iconify-icon>
                                        </button>
                                    </div>
                                </div>
                                <div class="bmk-ref-block">
                                    <label>Right Leg</label>
                                    <div class="bmk-ref-line">
                                        <asp:TextBox ID="TxtRightLink" runat="server" CssClass="bmk-ref-field" ReadOnly="true" />
                                        <button type="button" class="bmk-ref-btn" title="Copy" onclick="copyProfileLink('<%=TxtRightLink.ClientID%>')">
                                            <iconify-icon icon="solar:copy-bold"></iconify-icon>
                                        </button>
                                        <button type="button" class="bmk-ref-btn bmk-ref-wa" title="WhatsApp" onclick="shareWhatsApp('<%=TxtRightLink.ClientID%>')">
                                            <iconify-icon icon="ic:baseline-whatsapp"></iconify-icon>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </article>
                    </aside>

                    <!-- RIGHT -->
                    <div class="bmk-pcards-main">

                        <div class="bmk-pcards-welcome">
                            <div>
                                <span class="bmk-welcome-label">Welcome back</span>
                                <h1>Hi, <asp:Literal ID="litFirstName" runat="server" />!</h1>
                            </div>
                            <div class="bmk-welcome-links">
                                <a href="DownlineReport.aspx"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon> Team Report</a>
                                <a href="UserDirectAssociates.aspx"><iconify-icon icon="solar:user-plus-bold"></iconify-icon> My Direct</a>
                                <a href="leveltree.aspx"><iconify-icon icon="solar:graph-up-bold"></iconify-icon> Tree View</a>
                            </div>
                        </div>

                        <div class="bmk-stat-cards" style="display:none">
                            <article class="bmk-stat-card bmk-stat-card-wide">
                                <span class="bmk-stat-ico bmk-stat-gold"><iconify-icon icon="solar:wallet-money-bold"></iconify-icon></span>
                                <div>
                                    <span>Total Earnings</span>
                                    <strong>₹<asp:Literal ID="litMetricEarnings" runat="server" Text="0.00" /></strong>
                                </div>
                            </article>
                        </div>

                        <div class="bmk-two-col">
                            <article class="bmk-card">
                                <header class="bmk-card-head bmk-head-dark">
                                    <iconify-icon icon="solar:share-circle-bold"></iconify-icon>
                                    Sponsor Network
                                </header>
                                <div class="bmk-net-grid">
                                    <div class="bmk-net-item">
                                        <span class="bmk-net-ico bmk-net-navy"><iconify-icon icon="solar:user-plus-bold"></iconify-icon></span>
                                        <div class="bmk-net-text">
                                            <em>Direct Members</em>
                                            <strong><asp:Literal ID="litDirectMembers" runat="server" Text="0" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-net-item">
                                        <span class="bmk-net-ico bmk-net-blue"><iconify-icon icon="solar:medal-ribbons-star-bold"></iconify-icon></span>
                                        <div class="bmk-net-text">
                                            <em>Rank</em>
                                            <strong><asp:Literal ID="litRank" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-net-item">
                                        <span class="bmk-net-ico bmk-net-teal"><iconify-icon icon="solar:users-group-rounded-bold"></iconify-icon></span>
                                        <div class="bmk-net-text">
                                            <em>Total Team</em>
                                            <strong><asp:Literal ID="litTeamNet" runat="server" Text="0" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-net-item">
                                        <span class="bmk-net-ico bmk-net-green"><iconify-icon icon="solar:hand-money-bold"></iconify-icon></span>
                                        <div class="bmk-net-text">
                                            <em>Referral Income</em>
                                            <strong>₹<asp:Literal ID="litReferralIncome" runat="server" Text="0.00" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-net-item">
                                        <span class="bmk-net-ico bmk-net-amber"><iconify-icon icon="solar:layers-minimalistic-bold"></iconify-icon></span>
                                        <div class="bmk-net-text">
                                            <em>Level Income</em>
                                            <strong>₹<asp:Literal ID="litLevelIncomeNet" runat="server" Text="0.00" /></strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="bmk-sponsor-bar">
                                    <span class="bmk-sponsor-av"><iconify-icon icon="solar:user-bold"></iconify-icon></span>
                                    <div class="bmk-sponsor-meta">
                                        <em>Your Sponsor</em>
                                        <strong><asp:Literal ID="litSponsorName" runat="server" Text="—" /></strong>
                                        <small>ID: <asp:Literal ID="litSponsorId" runat="server" /></small>
                                    </div>
                                    <span class="bmk-sponsor-tag">Upline</span>
                                </div>
                            </article>

                            <article class="bmk-card">
                                <header class="bmk-card-head bmk-head-navy">
                                    <iconify-icon icon="solar:widget-4-bold"></iconify-icon>
                                    Quick Links
                                </header>
                                <div class="bmk-qgrid">
                                    <a href="Dashboard.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-navy"><iconify-icon icon="solar:home-smile-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>Dashboard</strong><em>Home overview</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                    <a href="UserDirectAssociates.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-teal"><iconify-icon icon="solar:user-check-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>My Direct</strong><em>Direct associates</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                    <a href="GSTImage.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-gold"><iconify-icon icon="solar:shield-check-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>KYC</strong><em>Verify documents</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                    <a href="leveltree.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-blue"><iconify-icon icon="solar:graph-new-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>Level Tree</strong><em>Team structure</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                    <a href="TransactionReport.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-green"><iconify-icon icon="solar:wallet-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>Wallet</strong><em>Ledger &amp; balance</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                    <a href="IDCard.aspx" class="bmk-qlink">
                                        <span class="bmk-qlink-ico bmk-qlink-amber"><iconify-icon icon="solar:card-bold"></iconify-icon></span>
                                        <span class="bmk-qlink-text"><strong>ID Card</strong><em>Member card</em></span>
                                        <iconify-icon class="bmk-qlink-arrow" icon="solar:alt-arrow-right-linear"></iconify-icon>
                                    </a>
                                </div>
                            </article>
                        </div>

                        <!-- Hidden fields for code-behind (not shown — avoids repeating visible details) -->
                        <div class="bmk-hidden-fields" aria-hidden="true">
                            <asp:TextBox ID="txtsponserid" Enabled="false" runat="server" />
                            <asp:TextBox ID="txtsponsername" Enabled="false" runat="server" />
                            <asp:TextBox ID="txtname" Enabled="false" runat="server" />
                            <asp:TextBox ID="txtLastname" Enabled="false" runat="server" />
                            <asp:TextBox ID="txtmobile" Enabled="false" runat="server" />
                            <asp:TextBox ID="txtemail" Enabled="false" runat="server" />
                            <asp:DropDownList ID="ddgender" Enabled="false" runat="server">
                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtaddress" Enabled="false" TextMode="MultiLine" runat="server" />
                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                <asp:ListItem Value="0"> Select Country</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddstate" AutoPostBack="true" Enabled="false" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                <asp:ListItem Value="0"> Select State</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddcity" Enabled="false" runat="server">
                                <asp:ListItem Value="0"> Select City</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtareaname" runat="server" />
                            <asp:TextBox ID="txtpincode" runat="server" />
                            <asp:TextBox ID="txtdateofbirth" CssClass="form_date" runat="server" />
                        </div>

                        <div class="bmk-two-col">
                            <article class="bmk-card">
                                <header class="bmk-card-head bmk-head-navy">
                                    <iconify-icon icon="solar:user-id-bold"></iconify-icon>
                                    Account Details
                                </header>
                                <div class="bmk-info-list">
                                    <div class="bmk-info-row">
                                        <span class="bmk-info-ico bmk-ico-gold"><iconify-icon icon="solar:letter-bold"></iconify-icon></span>
                                        <div>
                                            <em>Email</em>
                                            <strong><asp:Literal ID="litEmail" runat="server" Text="—" /></strong>
                                        </div>
                                        <span class="bmk-chip-tag">Primary</span>
                                    </div>
                                    <div class="bmk-info-row">
                                        <span class="bmk-info-ico bmk-ico-navy"><iconify-icon icon="solar:phone-bold"></iconify-icon></span>
                                        <div>
                                            <em>Mobile</em>
                                            <strong><asp:Literal ID="litPhone" runat="server" Text="—" /></strong>
                                        </div>
                                        <span class="bmk-chip-tag">Phone</span>
                                    </div>
                                    <div class="bmk-info-row">
                                        <span class="bmk-info-ico bmk-ico-teal"><iconify-icon icon="solar:map-point-bold"></iconify-icon></span>
                                        <div>
                                            <em>City / State</em>
                                            <strong><asp:Literal ID="litLocation" runat="server" Text="India" /></strong>
                                        </div>
                                        <span class="bmk-chip-tag">Location</span>
                                    </div>
                                    <div class="bmk-info-row">
                                        <span class="bmk-info-ico bmk-ico-amber"><iconify-icon icon="solar:user-bold"></iconify-icon></span>
                                        <div>
                                            <em>Gender</em>
                                            <strong><asp:Literal ID="litGender" runat="server" Text="—" /></strong>
                                        </div>
                                        <span class="bmk-chip-tag">Profile</span>
                                    </div>
                                    <div class="bmk-info-row bmk-info-row-block">
                                        <span class="bmk-info-ico bmk-ico-navy"><iconify-icon icon="solar:map-bold"></iconify-icon></span>
                                        <div>
                                            <em>Address</em>
                                            <strong><asp:Literal ID="litAddress" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                </div>
                            </article>

                            <article class="bmk-card">
                                <header class="bmk-card-head bmk-head-dark">
                                    <iconify-icon icon="solar:card-2-bold"></iconify-icon>
                                    Bank Details
                                </header>
                                <div class="bmk-bank-list">
                                    <div class="bmk-bank-item">
                                        <span class="bmk-bank-ico bmk-bank-navy"><iconify-icon icon="solar:user-bold"></iconify-icon></span>
                                        <div class="bmk-bank-text">
                                            <em>A/c Holder Name</em>
                                            <strong><asp:Literal ID="litBankHolder" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-bank-item">
                                        <span class="bmk-bank-ico bmk-bank-teal"><iconify-icon icon="solar:wallet-bold"></iconify-icon></span>
                                        <div class="bmk-bank-text">
                                            <em>Withdrawal Wallet</em>
                                            <strong><asp:Literal ID="litBankAccount" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-bank-item">
                                        <span class="bmk-bank-ico bmk-bank-gold"><iconify-icon icon="solar:key-bold"></iconify-icon></span>
                                        <div class="bmk-bank-text">
                                            <em>IFSC Code</em>
                                            <strong><asp:Literal ID="litBankIfsc" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-bank-item">
                                        <span class="bmk-bank-ico bmk-bank-amber"><iconify-icon icon="solar:document-bold"></iconify-icon></span>
                                        <div class="bmk-bank-text">
                                            <em>PAN Number</em>
                                            <strong><asp:Literal ID="litBankPan" runat="server" Text="—" /></strong>
                                        </div>
                                    </div>
                                    <div class="bmk-bank-item bmk-bank-item-full">
                                        <span class="bmk-bank-ico bmk-bank-blue"><iconify-icon icon="solar:buildings-2-bold"></iconify-icon></span>
                                        <div class="bmk-bank-text">
                                            <em>Bank</em>
                                            <strong><asp:Literal ID="litBankName" runat="server" Text="—" /></strong>
                                        </div>
                                        <span class="bmk-chip-tag">Bank</span>
                                    </div>
                                </div>
                                <div class="bmk-hidden-fields" aria-hidden="true">
                                    <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" />
                                    <asp:TextBox ID="txtaccountno" Enabled="false" runat="server" />
                                    <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" />
                                    <asp:TextBox ID="txtpan" Enabled="false" runat="server" />
                                    <asp:DropDownList ID="ddbank" Enabled="false" runat="server"></asp:DropDownList>
                                    <asp:TextBox ID="txtbranchname" runat="server" />
                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" runat="server" Text="Submit" OnClick="btnSubmit_Click" Visible="false" />
                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" runat="server" Text="Cancel" Visible="false" />
                                </div>
                            </article>
                        </div>

                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({ format: 'dd/mm/yyyy' }).on('changeDate', function () {
            $(this).datepicker('hide');
        });
        Sys.Application.add_load(function () {
            $('.form_date').datepicker({ format: 'dd/mm/yyyy' }).on('changeDate', function () {
                $(this).datepicker('hide');
            });
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
</asp:Content>
