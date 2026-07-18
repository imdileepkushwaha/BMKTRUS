<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationNew.aspx.cs" Inherits="RegistrationNew" %>

<!DOCTYPE html>
<html lang="hi">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <title>Member Registration | Bharat Manav Kalyan Trust</title>
    <meta name="description" content="Register as a member of Bharat Manav Kalyan Trust." />
    <link rel="icon" type="image/png" href="<%= ResolveUrl("~/site/assets/images/logo.png") %>" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@600;700&family=Noto+Sans+Devanagari:wght@400;600;700&family=Source+Sans+3:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/bower_components/bootstrap/dist/css/bootstrap.min.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/bower_components/font-awesome/css/font-awesome.min.css") %>" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/site/css/register.css") %>" />

    <script type="text/javascript">
        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function validate() {
            if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {
                alert('Enter Sponser Id');
                document.getElementById("<%=txtsponserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtepin.ClientID%>").value == "") {
                alert('Enter EPin');
                document.getElementById("<%=txtepin.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtname.ClientID%>").value == "") {
                alert('Enter First Name');
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
            if (validateemail(document.getElementById("<%=txtemail.ClientID%>").value) == false) {
                alert('Invalid Email ID');
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddgender.ClientID%>").value == "0") {
                if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                    alert('Enter Password');
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

            function validatephonenumber(inputtxt) {
                var phoneno = /^([6-9]{1})([0-9]{9})$/;
                if (inputtxt.match(phoneno)) {
                    return true;
                }
                else {
                    return false;
                }
            }

            function validateemail(inputtxt) {
                var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (inputtxt.match(email)) {
                    return true;
                }
                else {
                    return false;
                }
            }
        }
    </script>
</head>
<body class="register-body">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background: rgba(0, 26, 58, 0.45);">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/site/assets/images/logo.png" AlternateText="Loading ..." ToolTip="Loading ..." Style="width: 64px; height: 64px; object-fit: contain; border-radius: 50%; background: #fff; padding: 8px; position: fixed; top: 42%; left: 50%; transform: translateX(-50%); box-shadow: 0 8px 28px rgba(0,0,0,0.25);" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <header class="register-topbar">
            <div class="register-topbar-inner">
                <a href="<%= ResolveUrl("~/index.aspx") %>" class="register-brand">
                    <img src="<%= ResolveUrl("~/site/assets/images/logo.png") %>" alt="Bharat Manav Kalyan Trust" />
                    <span class="register-brand-text">
                        <span class="hi">भारत मानव कल्याण ट्रस्ट</span>
                        <span class="en">Bharat Manav Kalyan Trust</span>
                        <span class="tag">सेवा &bull; समर्पण &bull; सशक्तिकरण</span>
                    </span>
                </a>
                <nav class="register-nav">
                    <a class="nav-home" href="<%= ResolveUrl("~/index.aspx") %>">Home</a>
                    <a class="nav-login" href="<%= ResolveUrl("~/user/index.aspx") %>">Login</a>
                </nav>
            </div>
        </header>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="register-wrap">
                    <div class="register-card">
                        <div class="register-tricolor"><span></span><span></span><span></span></div>
                        <div class="register-card-head">
                            <span class="eyebrow">Member Registration</span>
                            <h1>Create your account</h1>
                            <p>Fill in your details to join Bharat Manav Kalyan Trust.</p>
                        </div>

                        <div class="register-card-body">
                            <div class="register-section">
                                <h2 class="register-section-title">Sponsor &amp; E-Pin</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server" placeholder="Sponsor ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server" placeholder="Sponsor Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtparentid" AutoPostBack="true" CssClass="form-control" runat="server" OnTextChanged="txtparentid_TextChanged" placeholder="Parental ID"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtparentname" Enabled="false" CssClass="form-control" runat="server" placeholder="Parental Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row" style="display: none;">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-6"></div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-key"></i></div>
                                                <asp:TextBox ID="txtepin" CssClass="form-control" runat="server" placeholder="E-Pin" AutoPostBack="true" OnTextChanged="txtepin_TextChanged"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-inr"></i></div>
                                                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server" placeholder="Amount"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <asp:Panel ID="pnlpin" Visible="false" runat="server">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Select Plan :</label>
                                                <asp:DropDownList ID="DDLstPlan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Select E-Pin :</label>
                                                <asp:DropDownList ID="ddepin" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" CssClass="custom-radio" />
                                            <asp:RadioButton ID="RdBtnRight" runat="server" Text="Middle" GroupName="B" CssClass="custom-radio" />
                                            <asp:RadioButton ID="RdbtnLast" runat="server" Text="Right" GroupName="B" CssClass="custom-radio" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="register-section">
                                <h2 class="register-section-title">Personal Details</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                                <asp:TextBox ID="txtLastname" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6" style="display: none">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3" style="display: none">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select State</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3" style="display: none">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0"> Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                                <asp:TextBox ID="txtage" CssClass="form-control" runat="server" placeholder="Age"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-venus-mars"></i></div>
                                                <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-book"></i></div>
                                                <asp:DropDownList ID="DropDowncourse" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select Course</asp:ListItem>
                                                    <asp:ListItem Value="VaidicMathsMarathi">Vaidik  Maths Marathi</asp:ListItem>
                                                    <asp:ListItem Value="VaidicMathsEnglish">Vaidik  Maths English</asp:ListItem>
                                                    <asp:ListItem Value="FingerAbacus">Finger Abacus</asp:ListItem>
                                                    <asp:ListItem Value="Aurachakra">Aura &amp; Chakra report </asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Customer  Mobile No"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Customer Email"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-paper-plane"></i></div>
                                                <asp:TextBox ID="txttelegramnumber" CssClass="form-control" runat="server" placeholder="Telegram Number"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-paper-plane"></i></div>
                                                <asp:TextBox ID="txttelegramname" CssClass="form-control" runat="server" placeholder="Telegram Name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6" style="display: none;">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <asp:TextBox ID="txtaccountholdername" placeholder="Account Holder Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display: none;">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <asp:TextBox ID="txtaccountno" placeholder="Account Number" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6" style="display: none;">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-tag"></i></div>
                                            <asp:TextBox ID="txtifsccode" Placeholder="IFSC Code" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0"> Select Bank</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-tag"></i></div>
                                                <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control" placeholder="Pan Card Number"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtadhar" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Placeholder="Area" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <asp:TextBox ID="txtnomineename" placeholder="Nominee Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                            <asp:TextBox ID="txtnomineerelation" placeholder="Nominee Relation" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="display: none;">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                            <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" Placeholder="Area" Visible="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="register-section">
                                <h2 class="register-section-title">Account Security</h2>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                                <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon"><i class="fa fa-lock"></i></div>
                                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row" style="display: none;">
                                    <div class="form-group col-md-6"></div>
                                    <div class="form-group col-md-6">
                                        <div class="col-md-4 dvRow">
                                            <asp:DropDownList ID="ddlYear" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 dvRow">
                                            <asp:DropDownList ID="ddlMonth" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4 dvRow">
                                            <asp:DropDownList ID="ddlDay" CssClass="form-control" ToolTip="Day" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="register-section">
                                <div class="register-terms">
                                    <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" runat="server" />
                                    <span>I agree to the <a href="termscondition.pdf" class="thembo" target="_blank">Terms &amp; Conditions</a></span>
                                </div>

                                <div class="register-actions">
                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary btn-submit" runat="server" Text="Create Account" OnClick="btnSubmit_Click" Enabled="false" />
                                    <p class="register-footer-note">Already registered? <a href="<%= ResolveUrl("~/user/index.aspx") %>">Login here</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="<%= ResolveUrl("~/bower_components/jquery/dist/jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/bower_components/bootstrap/dist/js/bootstrap.min.js") %>"></script>
</body>
</html>
