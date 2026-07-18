<%@ Page Title="Change Password" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CHangePassword.aspx.cs" Inherits="admin_CHangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {
                alert('Enter Old Password');
                document.getElementById("<%=txtoldpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                alert('Enter New Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                alert('Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                alert('Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
        }

        function togglePassword(inputId, btn) {
            var input = document.getElementById(inputId);
            if (!input || !btn) return;
            if (input.type === "password") {
                input.type = "text";
                btn.classList.add("is-visible");
                btn.setAttribute("aria-label", "Hide password");
            } else {
                input.type = "password";
                btn.classList.remove("is-visible");
                btn.setAttribute("aria-label", "Show password");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-profile">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Profile</span>
                <h1>Change Password</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Profile &nbsp;/&nbsp; Change Password</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserProfile.aspx">View Profile</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-profile">
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
                <div class="row">
                    <div class="col-lg-7 col-xl-6">
                        <div class="box box-primary bmk-pass-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Update Password</h3>
                            </div>
                            <div class="box-body">
                                <p class="bmk-pass-intro">Use a strong password you don&rsquo;t use elsewhere. You can show or hide each field with the eye icon.</p>

                                <div class="bmk-pass-field">
                                    <label for="<%= txtoldpassword.ClientID %>">Old Password</label>
                                    <div class="bmk-pass-wrap">
                                        <span class="bmk-pass-icon" aria-hidden="true">
                                            <iconify-icon icon="solar:lock-password-bold"></iconify-icon>
                                        </span>
                                        <asp:TextBox ID="txtoldpassword" TextMode="Password" CssClass="form-control" placeholder="Enter old password" runat="server"></asp:TextBox>
                                        <button type="button" class="bmk-pass-toggle" onclick="togglePassword('<%= txtoldpassword.ClientID %>', this)" aria-label="Show password">
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

                                <div class="bmk-pass-field">
                                    <label for="<%= txtuserpassword.ClientID %>">New Password</label>
                                    <div class="bmk-pass-wrap">
                                        <span class="bmk-pass-icon" aria-hidden="true">
                                            <iconify-icon icon="solar:key-bold"></iconify-icon>
                                        </span>
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" placeholder="Enter new password" runat="server"></asp:TextBox>
                                        <button type="button" class="bmk-pass-toggle" onclick="togglePassword('<%= txtuserpassword.ClientID %>', this)" aria-label="Show password">
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

                                <div class="bmk-pass-field">
                                    <label for="<%= txtconfirmpassword.ClientID %>">Confirm Password</label>
                                    <div class="bmk-pass-wrap">
                                        <span class="bmk-pass-icon" aria-hidden="true">
                                            <iconify-icon icon="solar:shield-check-bold"></iconify-icon>
                                        </span>
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" placeholder="Re-enter new password" runat="server"></asp:TextBox>
                                        <button type="button" class="bmk-pass-toggle" onclick="togglePassword('<%= txtconfirmpassword.ClientID %>', this)" aria-label="Show password">
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

                                <div class="bmk-pass-actions">
                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Update Password" OnClick="btnSubmit_Click" />
                                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>

                            <div class="box-footer bmk-otp-box" id="divOTP" runat="server" visible="false">
                                <div class="bmk-otp-head">
                                    <h4>Verify OTP</h4>
                                    <span id="msg" runat="server"></span>
                                </div>
                                <div class="row align-items-end">
                                    <div class="col-md-7">
                                        <div class="form-group mb-0">
                                            <label>OTP</label>
                                            <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Button ID="btnVerify" runat="server" CssClass="btn btn-success w-100" OnClick="btnVerify_Click" Text="Verify OTP" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
                <asp:PostBackTrigger ControlID="btnVerify" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
