<%@ page language="C#" autoeventwireup="true" inherits="admin_index, App_Web_jenbvmkc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <title> <%= clsUtility.ProjectName %> | Log in</title>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Description" content="Xino - Laravel Admin & Dashboard Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
    <meta name="Keywords" content="cryptocurrency, dashboard, admin, crypto, ico, bootstrap admin template, admin template, bootstrap dashboard template, crypto dashboard, cryptocurrency dashboard, ico dashboard, crypto admin, dashboard cryptocurrency, cryptocurrency trading dashboard, crypto dashboard template " />

    <!-- Title -->


    <!-- Favicon -->
    <link rel="icon" href="img/logo.png" type="image/x-icon" />


    <!-- remix icon font css  -->
    <link rel="stylesheet" href="../web-assets/css/remixicon.css" />
    <!-- BootStrap css -->
    <link rel="stylesheet" href="../web-assets/css/lib/bootstrap.min.css" />
    <!-- Apex Chart css -->
    <link rel="stylesheet" href="../web-assets/css/lib/apexcharts.css" />
    <!-- Data Table css -->
    <link rel="stylesheet" href="../web-assets/css/lib/dataTables.min.css" />
    <!-- Text Editor css -->
    <link rel="stylesheet" href="../web-assets/css/lib/editor-katex.min.css" />
    <link rel="stylesheet" href="../web-assets/css/lib/editor.atom-one-dark.min.css" />
    <link rel="stylesheet" href="../web-assets/css/lib/editor.quill.snow.css" />
    <!-- Date picker css -->
    <link rel="stylesheet" href="../web-assets/css/lib/flatpickr.min.css" />
    <!-- Calendar css -->
    <link rel="stylesheet" href="../web-assets/css/lib/full-calendar.css" />
    <!-- Vector Map css -->
    <link rel="stylesheet" href="../web-assets/css/lib/jquery-jvectormap-2.0.5.css" />
    <!-- Popup css -->
    <link rel="stylesheet" href="../web-assets/css/lib/magnific-popup.css" />
    <!-- Slick Slider css -->
    <link rel="stylesheet" href="../web-assets/css/lib/slick.css" />
    <!-- prism css -->
    <link rel="stylesheet" href="../web-assets/css/lib/prism.css" />
    <!-- main css -->
    <link rel="stylesheet" href="../web-assets/css/style.css" />
    <script>
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
    </script>


    <script>
        // Change the type of input to password or text
        function Toggle() {
            let temp = document.getElementById("<%=txtpassword.ClientID%>");

            if (temp.type === "password") {
                temp.type = "text";
            }
            else {
                temp.type = "password";
            }
        }
    </script>
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/loading.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="border-width: 0px; padding: 10px; position: fixed; top: 25%; left: 40%;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel runat="server" ID="uplMaster">
            <ContentTemplate>


                <section class="auth bg-base d-flex flex-wrap">
                    <div class="auth-left d-lg-block d-none">
                        <div class="d-flex align-items-center flex-column h-100 justify-content-center">
                            <img src="../web-assets/images/auth/auth-img.png" alt="">
                        </div>
                    </div>
                    <div class="auth-right py-32 px-24 d-flex flex-column justify-content-center">
                        <div class="max-w-464-px mx-auto w-100">
                            <div>
                                <a href="index.aspx" class="mb-40 max-w-290-px">
                                    <img src="../user/img/logo.png" alt="">
                                </a>
                                <h4 class="mb-12">Sign In to your Account</h4>
                                <p class="mb-32 text-secondary-light text-lg">Welcome back! please enter your detail</p>
                            </div>
                            <form action="#">
                                <div class="icon-field mb-16">
                                    <span class="icon top-50 translate-middle-y">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <g fill="none" stroke="currentColor" stroke-width="1.5">
                                                <rect width="18.5" height="17" x="2.682" y="3.5" rx="4"></rect>
                                                <path stroke-linecap="round" stroke-linejoin="round" d="m2.729 7.59l7.205 4.13a3.96 3.96 0 0 0 3.975 0l7.225-4.13"></path>
                                            </g></svg>
                                    </span>

                                    <asp:TextBox ID="txtusername" class="form-control h-56-px bg-neutral-50 radius-12" runat="server" placeholder="Username"></asp:TextBox>

                                </div>
                                <div class="position-relative mb-20">
                                    <div class="icon-field">
                                        <span class="icon top-50 translate-middle-y">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                                <path fill="currentColor" d="M9 16a1 1 0 1 1-2 0a1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0a1 1 0 0 1 2 0m3 1a1 1 0 1 0 0-2a1 1 0 0 0 0 2"></path><path fill="currentColor" fill-rule="evenodd" d="M5.25 8v1.303q-.34.023-.642.064c-.9.12-1.658.38-2.26.981c-.602.602-.86 1.36-.981 2.26c-.117.867-.117 1.97-.117 3.337v.11c0 1.367 0 2.47.117 3.337c.12.9.38 1.658.981 2.26c.602.602 1.36.86 2.26.982c.867.116 1.97.116 3.337.116h8.11c1.367 0 2.47 0 3.337-.116c.9-.122 1.658-.38 2.26-.982s.86-1.36.982-2.26c.116-.867.116-1.97.116-3.337v-.11c0-1.367 0-2.47-.116-3.337c-.122-.9-.38-1.658-.982-2.26s-1.36-.86-2.26-.981a10 10 0 0 0-.642-.064V8a6.75 6.75 0 0 0-13.5 0M12 2.75A5.25 5.25 0 0 0 6.75 8v1.253q.56-.004 1.195-.003h8.11q.635 0 1.195.003V8c0-2.9-2.35-5.25-5.25-5.25m-7.192 8.103c-.734.099-1.122.28-1.399.556c-.277.277-.457.665-.556 1.4c-.101.755-.103 1.756-.103 3.191s.002 2.436.103 3.192c.099.734.28 1.122.556 1.399c.277.277.665.457 1.4.556c.754.101 1.756.103 3.191.103h8c1.435 0 2.436-.002 3.192-.103c.734-.099 1.122-.28 1.399-.556c.277-.277.457-.665.556-1.4c.101-.755.103-1.756.103-3.191s-.002-2.437-.103-3.192c-.099-.734-.28-1.122-.556-1.399c-.277-.277-.665-.457-1.4-.556c-.755-.101-1.756-.103-3.191-.103H8c-1.435 0-2.437.002-3.192.103" clip-rule="evenodd"></path></svg>
                                        </span>
                                        <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control h-56-px bg-neutral-50 radius-12" placeholder="Password" runat="server"></asp:TextBox>

                                    </div>
                                    <span onclick="Toggle()" class="toggle-password ri-eye-line cursor-pointer position-absolute end-0 top-50 translate-middle-y me-16 text-secondary-light" data-toggle="#your-password"></span>
                                </div>
                                <div class="">
                                    <div class="d-flex justify-content-between gap-2">
                                        <div class="form-check style-check d-flex align-items-center">
                                            <input class="form-check-input border border-neutral-300" type="checkbox" value="" id="remeber">
                                            <label class="form-check-label" for="remeber">Remember me </label>
                                        </div>
                                        <a onclick="showModal();" class="text-primary-600 fw-medium">Forgot Password?</a>
                                    </div>
                                </div>


                                <asp:Button runat="server" ID="btnLogin" Text="Sign In" class="btn btn-primary text-sm btn-sm px-12 py-16 w-100 radius-12 mt-32" OnClick="btnLogin_Click" />


                                <div class="mt-32 text-center text-sm">
                                    <p class="mb-0">Don’t have an account? <a href="Register.aspx" class="text-primary-600 fw-semibold">Sign Up</a></p>
                                </div>

                            </form>
                        </div>
                    </div>
                </section>

                <div id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Forgot Password</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    User Id                           
                                <asp:TextBox runat="server" class="form-control" ID="txtuserid"></asp:TextBox>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSend" runat="server" Text="Submit" OnClientClick="return validate3();" CssClass="btn green" OnClick="btnSend_Click" />
                                <button type="button" class="btn red" data-dismiss="modal">Close</button>
                            </div>
                            <div class="row" id="divsuccess" runat="server" visible="false">
                                <div class="col-md-12">
                                    <div class="alert alert-success"><strong>Success!</strong>
                                        <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>. </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div id="Divotp" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">OTP Confirmation</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    OTP                           
                                <asp:TextBox runat="server" class="form-control" ID="TxtOtp"></asp:TextBox>
                                    <asp:Label ID="LblMessages" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bg-red-active" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="BtnConfirm" runat="server" Text="Submit OTP" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="BtnConfirm_Click" />
                                <asp:Button ID="BtnResend" runat="server" Text="Resend OTP" CssClass="btn btn-info" OnClick="BtnResend_Click" />
                                <button type="button" class="btn red" data-dismiss="modal">Close</button>
                            </div>
                            <div class="row" id="div2" runat="server" visible="false">
                                <div class="col-md-12">
                                    <div class="alert alert-success"><strong>Success!</strong>
                                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>. </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>


    <!-- jQuery 2.1.3 -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../plugins/iCheck/icheck.min.js"></script>

    <script>
        // ================== Password Show Hide Js Start ==========
        function initializePasswordToggle(toggleSelector) {
            $(toggleSelector).on('click', function () {
                $(this).toggleClass("ri-eye-off-line");
                var input = $($(this).attr("data-toggle"));
                if (input.attr("type") === "password") {
                    input.attr("type", "text");
                } else {
                    input.attr("type", "password");
                }
            });
        }
        // Call the function
        initializePasswordToggle('.toggle-password');
        // ========================= Password Show Hide Js End ===========================
    </script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
    <script type="text/javascript">
        function showModal() {
            $('#myModal').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
        function showModal12() {
            $('#Divotp').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup1() {
            $('#Divotp').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>

    <script src="assets/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Bundle js -->
    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Ionicons js -->
    <script src="assets/plugins/ionicons/ionicons.js"></script>

    <!-- Moment js -->
    <script src="assets/plugins/moment/moment.js"></script>

    <!-- eva-icons js -->
    <script src="assets/js/eva-icons.min.js"></script>

    <!-- Rating js-->
    <script src="assets/plugins/rating/jquery.rating-stars.js"></script>
    <script src="assets/plugins/rating/jquery.barrating.js"></script>


    <!-- Custom js -->
    <script src="assets/js/custom.js"></script>

    <!-- Switcher js -->
    <script src="assets/switcher/js/switcher.js"></script>
</body>
</html>
