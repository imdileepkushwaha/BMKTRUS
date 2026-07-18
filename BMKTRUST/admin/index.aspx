<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>
<html lang="hi">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Admin Login | Bharat Manav Kalyan Trust</title>
    <meta name="description" content="Secure admin sign-in for Bharat Manav Kalyan Trust." />
    <link rel="icon" type="image/png" href="<%= ResolveUrl("~/site/assets/images/logo.png") %>" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans:wght@400;500;600;700&family=Libre+Baskerville:wght@700&family=Noto+Sans+Devanagari:wght@600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/bower_components/bootstrap/dist/css/bootstrap.min.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/site/css/admin-login.css") %>" />
    <script type="text/javascript">
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
        function validateAdminLogin() {
            var u = document.getElementById("<%=txtusername.ClientID%>");
            var p = document.getElementById("<%=txtpassword.ClientID%>");
            if (!u || u.value.replace(/^\s+|\s+$/g, "") === "") {
                alert("Enter Username");
                if (u) u.focus();
                return false;
            }
            if (!p || p.value === "") {
                alert("Enter Password");
                if (p) p.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="adm-body">
    <form id="form1" runat="server">
        <div class="adm-stage">
            <header class="adm-top">
                <a href="<%= ResolveUrl("~/index.aspx") %>" class="adm-home">&larr; Website</a>
                <span class="adm-badge">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                    </svg>
                    Restricted
                </span>
            </header>

            <main class="adm-main">
                <div class="adm-brand">
                    <img src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" class="adm-logo" />
                    <span class="adm-brand-hi">भारत मानव कल्याण ट्रस्ट</span>
                    <span class="adm-brand-en">Bharat Manav Kalyan Trust</span>
                    <p class="adm-brand-sub">Administrator access</p>
                </div>

                <div class="adm-panel">
                    <div class="adm-panel-head">
                        <h1>Admin Login</h1>
                        <p>Use your authorized credentials to enter the control panel.</p>
                    </div>

                    <div class="adm-field">
                        <label for="<%= txtusername.ClientID %>">Username</label>
                        <div class="adm-input">
                            <svg class="adm-ico" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" placeholder="Admin username" autocomplete="username"></asp:TextBox>
                        </div>
                    </div>

                    <div class="adm-field">
                        <label for="<%= txtpassword.ClientID %>">Password</label>
                        <div class="adm-input">
                            <svg class="adm-ico" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                                <rect x="3" y="11" width="18" height="11" rx="2"></rect>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                            </svg>
                            <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control" placeholder="Password" runat="server" autocomplete="current-password"></asp:TextBox>
                            <button type="button" id="btnTogglePassword" class="adm-eye" onclick="Toggle()" aria-label="Show password">
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

                    <asp:Button runat="server" ID="btnLogin" Text="Enter Panel" CssClass="adm-submit" OnClientClick="return validateAdminLogin();" OnClick="btnLogin_Click" />
                    <p class="adm-note">Authorized administrators only</p>
                </div>
            </main>

            <footer class="adm-foot">
                <strong>BMKT</strong> &nbsp;·&nbsp; Secure administration console
            </footer>
        </div>
    </form>
</body>
</html>
