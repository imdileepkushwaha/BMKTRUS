<%@ Page Title="Add User" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .dvRow {
            padding-left: 0 !important;
            padding-right: 2px !important;
        }
    </style>
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
            if (validatephonenumber(document.getElementById("<%=txtmobile.ClientID%>").value) == false) {
                alert('Invalid Mobile No');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddgender.ClientID%>").value == "0") {
                alert('Select Gender');
                document.getElementById("<%=ddgender.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtUserpassword.ClientID%>").value == "") {
                alert('Enter Password');
                document.getElementById("<%=txtUserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                alert('Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtUserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                alert('Password Not Match');
                document.getElementById("<%=txtUserpassword.ClientID%>").focus();
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

        function toggleAdmPassword(inputId, btn) {
            var input = document.getElementById(inputId);
            if (!input || !btn) return;
            var icon = btn.querySelector('i');
            var show = input.type === 'password';
            input.type = show ? 'text' : 'password';
            if (icon) {
                icon.className = show ? 'fa fa-eye-slash' : 'fa fa-eye';
            }
            btn.setAttribute('aria-label', show ? 'Hide password' : 'Show password');
            btn.setAttribute('title', show ? 'Hide password' : 'Show password');
        }
    </script>
    <link href="../css/radio/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Add User</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">My Network</a></li>
            <li class="active">Add User</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page has-sticky-actions">
                <div class="row">

                    <%-- 1. Sponsor --%>
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Sponsor Detail</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Sponsor ID</label>
                                            <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged"
                                                CssClass="form-control" runat="server" placeholder="Enter sponsor ID"></asp:TextBox>
                                            <span class="adm-field-hint">Leave field to auto-load sponsor name</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Sponsor Name</label>
                                            <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server" placeholder="Auto-filled"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Registration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Registration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-6"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 2. Pin (when epin mode) --%>
                    <asp:Panel ID="pnlpin" runat="server">
                        <div class="col-md-12">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title">Pin Detail</h3>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Select Plan</label>
                                                <asp:DropDownList ID="DDLstPlan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Select E-Pin</label>
                                                <asp:DropDownList ID="ddepin" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Amount</label>
                                                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server" placeholder="Auto"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="row" style="display: none">
                        <div class="col-md-3">
                            <div class="form-group">
                                <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <asp:RadioButton ID="RdBtnRight" runat="server" Text="Right" GroupName="B" />
                            </div>
                        </div>
                        <div class="col-md-6"></div>
                    </div>

                    <%-- 3. Personal --%>
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Personal Information</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Mobile</label>
                                            <asp:TextBox ID="txtmobile" MaxLength="10" placeholder="10-digit mobile (no +91 / 0)" CssClass="form-control" runat="server"></asp:TextBox>
                                            <span class="adm-field-hint">Enter only 10 digit number</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="email@example.com"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Gender</label>
                                            <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Date of Birth : Year-Month-Date</label>
                                            <fieldset>
                                                <div class="col-md-4 dvRow">
                                                    <asp:DropDownList ID="ddlYear" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-md-4 dvRow">
                                                    <asp:DropDownList ID="ddlMonth" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-md-4 dvRow">
                                                    <asp:DropDownList ID="ddlDay" CssClass="form-control" ToolTip="Day" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display: none;">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select Country</label>
                                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select State</label>
                                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select State</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select City</label>
                                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Area</label>
                                            <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel ID="otherPnl" runat="server" Visible="false">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Other City</label>
                                                <asp:TextBox ID="TxtOtherCity" CssClass="form-control" runat="server" placeholder="Enter other city"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pincode</label>
                                            <asp:TextBox ID="txtpincode" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 4. Password --%>
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Password Information</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Password</label>
                                            <div class="adm-pass-field">
                                                <asp:TextBox ID="txtUserpassword" TextMode="Password" CssClass="form-control" runat="server"
                                                    ClientIDMode="Static" placeholder="Login password" autocomplete="new-password"></asp:TextBox>
                                                <button type="button" class="adm-pass-toggle" onclick="toggleAdmPassword('txtUserpassword', this)" aria-label="Show password" title="Show password">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Confirm Password</label>
                                            <div class="adm-pass-field">
                                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server"
                                                    ClientIDMode="Static" placeholder="Re-enter password" autocomplete="new-password"></asp:TextBox>
                                                <button type="button" class="adm-pass-toggle" onclick="toggleAdmPassword('txtconfirmpassword', this)" aria-label="Show password" title="Show password">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- Hidden PAN (kept for code-behind) --%>
                    <div style="display: none;">
                        <asp:FileUpload ID="panUpload" runat="server" />
                        <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>

                <div class="adm-sticky-actions">
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>

                <div id="Div_FDetails" class="modal fade">
                    <div class="modal-dialog" style="margin-top: 60px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Verify User</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row" id="divmob" runat="server">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Enter OTP Sent On Mobile</label>
                                            <asp:TextBox ID="txtmobotp" CssClass="form-control" runat="server" placeholder="Enter mobile OTP"></asp:TextBox>
                                            <div style="margin-top: 10px;">
                                                <asp:Button ID="btnresendmobotp" CssClass="btn btn-primary" runat="server" Text="Resend OTP" OnClick="btnresendmobotp_Click" />
                                                <asp:Label ID="lblmobstatus" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>&nbsp;</label>
                                            <asp:Button ID="btnverifymob" CssClass="btn btn-success btn-block" runat="server" Text="Verify" OnClick="btnverifymob_Click" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="divemail" runat="server">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>Enter OTP Sent On Email</label>
                                            <asp:TextBox ID="txtemailotp" CssClass="form-control" runat="server" placeholder="Enter email OTP"></asp:TextBox>
                                            <div style="margin-top: 10px;">
                                                <asp:Button ID="btnresendemailotp" CssClass="btn btn-primary" runat="server" Text="Resend OTP" OnClick="btnresendemailotpClick" />
                                                <asp:Label ID="lblemailstatus" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>&nbsp;</label>
                                            <asp:Button ID="btnverifyemail" CssClass="btn btn-success btn-block" runat="server" Text="Verify" OnClick="btnverifyemail_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        function showFranchiseeModal() {
            $('#Div_FDetails').modal({ backdrop: 'static', keyboard: false })
        }
        function ClosesFranchiseepopup() {
            $('#Div_FDetails').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</asp:Content>
