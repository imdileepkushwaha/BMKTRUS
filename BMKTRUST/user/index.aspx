<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>
<html lang="hi">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Member Login | Bharat Manav Kalyan Trust</title>
    <meta name="description" content="Sign in to your Bharat Manav Kalyan Trust member account." />
    <link rel="icon" type="image/png" href="<%= ResolveUrl("~/site/assets/images/logo.png") %>" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600;700&family=Noto+Sans+Devanagari:wght@400;600;700&family=Source+Sans+3:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/bower_components/bootstrap/dist/css/bootstrap.min.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/site/css/login.css") %>" />
    <script type="text/javascript">
        function validate2() {
            if (document.getElementById("<%=TxtOtp.ClientID%>").value == "") {
                alert('Enter OTP');
                document.getElementById("<%=TxtOtp.ClientID%>").focus();
                return false;
            }
        }
        function validate3() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                alert('Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
        }
        function Toggle() {
            var temp = document.getElementById("<%=txtpassword.ClientID%>");
            var btn = document.getElementById("btnTogglePassword");
            if (!temp || !btn) return;
            if (temp.type === "password") {
                temp.type = "text";
                btn.classList.add("is-visible");
                btn.setAttribute("aria-label", "Hide password");
            } else {
                temp.type = "password";
                btn.classList.remove("is-visible");
                btn.setAttribute("aria-label", "Show password");
            }
        }
    </script>
</head>
<body class="login-body">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background: rgba(0, 26, 58, 0.45);">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/site/assets/images/logo.png" AlternateText="Loading ..." ToolTip="Loading ..." Style="width: 64px; height: 64px; object-fit: contain; border-radius: 50%; background: #fff; padding: 8px; position: fixed; top: 42%; left: 50%; transform: translateX(-50%); box-shadow: 0 8px 28px rgba(0,0,0,0.25);" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel runat="server" ID="uplMaster">
            <ContentTemplate>
                <div class="login-shell">
                    <aside class="login-brand">
                        <div class="login-brand-top">
                            <a href="<%= ResolveUrl("~/index.aspx") %>" class="brand-home">&larr; Back to Home</a>
                        </div>
                        <div class="login-brand-mid">
                            <div class="login-logo-wrap">
                                <img src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" class="login-logo" />
                            </div>
                            <span class="login-brand-name-hi">भारत मानव कल्याण ट्रस्ट</span>
                            <span class="login-brand-name">Bharat Manav Kalyan Trust</span>
                            <p class="login-brand-tagline">सेवा &bull; समर्पण &bull; सशक्तिकरण</p>
                            <p class="login-brand-desc">
                                Sign in to access your member dashboard, reports, and trust services.
                            </p>
                            <div class="login-pillars">
                                <span>सेवा</span>
                                <span>समर्पण</span>
                                <span>सशक्तिकरण</span>
                            </div>
                        </div>
                        <div class="login-brand-bottom">
                            <div class="login-tricolor"><span></span><span></span><span></span></div>
                            <p>Service &bull; Dedication &bull; Empowerment</p>
                        </div>
                    </aside>

                    <section class="login-panel">
                        <div class="login-card">
                            <div class="login-mobile-brand">
                                <img src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                                <strong>Bharat Manav Kalyan Trust</strong>
                                <span>भारत मानव कल्याण ट्रस्ट</span>
                            </div>

                            <div class="login-card-header">
                                <span class="login-card-eyebrow">Member Portal</span>
                                <h1>Welcome back</h1>
                                <p>Enter your username and password to continue.</p>
                            </div>

                            <div class="login-field">
                                <label for="<%= txtusername.ClientID %>">Username</label>
                                <div class="login-input-wrap">
                                    <svg class="field-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                        <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" placeholder="Enter username"></asp:TextBox>
                                </div>
                            </div>

                            <div class="login-field">
                                <label for="<%= txtpassword.ClientID %>">Password</label>
                                <div class="login-input-wrap">
                                    <svg class="field-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                        <rect x="3" y="11" width="18" height="11" rx="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                    <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control" placeholder="Enter password" runat="server"></asp:TextBox>
                                    <button type="button" id="btnTogglePassword" class="password-toggle" onclick="Toggle()" aria-label="Show password">
                                        <svg class="eye-open" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                        <svg class="eye-closed" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                            <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"></path>
                                            <path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19"></path>
                                            <path d="M14.12 14.12a3 3 0 1 1-4.24-4.24"></path>
                                            <line x1="1" y1="1" x2="23" y2="23"></line>
                                        </svg>
                                    </button>
                                </div>
                            </div>

                            <div class="login-meta">
                                <label class="login-remember" for="remeber">
                                    <input type="checkbox" id="remeber" />
                                    Remember me
                                </label>
                                <button type="button" class="forgot-link" onclick="showModal();">Forgot Password?</button>
                            </div>

                            <asp:Button runat="server" ID="btnLogin" Text="Sign In" CssClass="btn-login" OnClick="btnLogin_Click" />

                            <div class="login-divider">or</div>

                            <div class="login-links">
                                <p>Don&#8217;t have an account? <a href="<%= ResolveUrl("~/RegistrationNew.aspx") %>">Register</a></p>
                                <!-- <p style="margin-top: 10px;"><a href="<%= ResolveUrl("~/index.aspx") %>">Back to website</a></p> -->
                            </div>
                        </div>
                    </section>
                </div>

                <div id="myModal" class="modal fade bmk-modal" tabindex="-1" role="dialog" aria-labelledby="forgotPasswordTitle">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content bmk-modal-content">
                            <div class="bmk-modal-accent"><span></span><span></span><span></span></div>
                            <div class="bmk-modal-header">
                                <div class="bmk-modal-icon" aria-hidden="true">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                        <rect x="3" y="11" width="18" height="11" rx="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h4 class="modal-title" id="forgotPasswordTitle">Forgot Password</h4>
                                    <p class="bmk-modal-subtitle">Enter your User ID and we will send your password to the registered mobile &amp; email.</p>
                                </div>
                                <button type="button" class="bmk-modal-close" data-dismiss="modal" aria-label="Close">&times;</button>
                            </div>
                            <div class="modal-body bmk-modal-body">
                                <div class="form-group bmk-field">
                                    <label for="<%= txtuserid.ClientID %>">User ID</label>
                                    <div class="bmk-input-wrap">
                                        <svg class="bmk-field-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtuserid" placeholder="Enter your User ID"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="divsuccess" runat="server" visible="false" class="bmk-alert bmk-alert-success">
                                    <strong>Success!</strong>
                                    <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer bmk-modal-footer">
                                <button type="button" class="btn bmk-btn-secondary" data-dismiss="modal">Cancel</button>
                                <asp:Button ID="btnSend" runat="server" Text="Send Password" OnClientClick="return validate3();" CssClass="btn bmk-btn-primary" OnClick="btnSend_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div id="Divotp" class="modal fade bmk-modal" tabindex="-1" role="dialog" aria-labelledby="otpTitle">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content bmk-modal-content">
                            <div class="bmk-modal-accent"><span></span><span></span><span></span></div>
                            <div class="bmk-modal-header">
                                <div class="bmk-modal-icon" aria-hidden="true">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                    </svg>
                                </div>
                                <div>
                                    <h4 class="modal-title" id="otpTitle">OTP Confirmation</h4>
                                    <p class="bmk-modal-subtitle">Enter the OTP sent to your registered mobile number.</p>
                                </div>
                                <button type="button" class="bmk-modal-close" data-dismiss="modal" aria-label="Close">&times;</button>
                            </div>
                            <div class="modal-body bmk-modal-body">
                                <div class="form-group bmk-field">
                                    <label for="<%= TxtOtp.ClientID %>">OTP</label>
                                    <div class="bmk-input-wrap">
                                        <svg class="bmk-field-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                            <rect x="3" y="11" width="18" height="11" rx="2"></rect>
                                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                        </svg>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtOtp" placeholder="Enter OTP"></asp:TextBox>
                                    </div>
                                    <asp:Label ID="LblMessages" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bmk-alert bmk-alert-error" Visible="false"></asp:Label>
                                </div>
                                <div id="div2" runat="server" visible="false" class="bmk-alert bmk-alert-success">
                                    <strong>Success!</strong>
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer bmk-modal-footer">
                                <button type="button" class="btn bmk-btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button ID="BtnResend" runat="server" Text="Resend OTP" CssClass="btn bmk-btn-outline" OnClick="BtnResend_Click" />
                                <asp:Button ID="BtnConfirm" runat="server" Text="Verify OTP" OnClientClick="return validate2();" CssClass="btn bmk-btn-primary" OnClick="BtnConfirm_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="<%= ResolveUrl("~/bower_components/jquery/dist/jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/bower_components/bootstrap/dist/js/bootstrap.min.js") %>"></script>
    <script type="text/javascript">
        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false });
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
        function showModal12() {
            $('#Divotp').modal({ backdrop: 'static', keyboard: false });
        }
        function Closepopup1() {
            $('#Divotp').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</body>
</html>
