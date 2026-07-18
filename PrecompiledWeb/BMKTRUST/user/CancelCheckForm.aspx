<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="user_CancelCheckForm, App_Web_xqtlfgzg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .Approved {
            background-color: #127113;
            color: #fff;
            padding: 3px;
            border-radius: 3px;
        }

        .Pending {
            background-color: #1596ab;
            color: #fff;
            padding: 3px;
            border-radius: 3px;
        }

        .Rejected {
            background-color: #c91d1d;
            color: #fff;
            padding: 3px;
            border-radius: 3px;
        }
    </style>
    <script>

        function validate() {
            if (document.getElementById("<%=hdstatus.ClientID%>").value == "Active") {
                if (!confirm('You can upload your Cancel Cheque/Passbook once.Are you sure want to update?')) {
                    return false;
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">Cancel Cheque/Passbook</h6>
            <ul class="d-flex align-items-center gap-2">
                <li class="fw-medium">
                    <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                        Dashboard
                    </a>
                </li>
                <li>/</li>
                <li class="fw-medium">KYC</li>
                <li>/</li>
                <li class="fw-medium">Cancel Cheque/Passbook</li>
            </ul>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
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
            <asp:HiddenField ID="hdstatus" runat="server" />
            <div class="row" style="color: white">
                <div class="col-md-12">
                    <div class="box box-primary">

                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id :</label>
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Name :</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                <br />
                                <div class="col-md-6" id="divStatus" runat="server" visible="false">
                                    <div class="form-group">
                                        <label>Approval Status : </label>
                                        <asp:Label ID="lblApprovalStatus" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Cancel Cheque/Passbook :</label>
                                        <asp:FileUpload ID="ImageUpload" runat="server" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="box-footer" id="div_update" runat="server" visible="false">
                                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                        </div>
                                        <div class="box-footer" id="div_noupdate" runat="server" visible="false"><span style="float: right; font-size: 20px; color: red;"><i>You cannot upload  Cancel Cheque/Passbook.Please contact admin.</i></span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:ImageButton ID="ImageShow" runat="server" Width="100px" Height="100px" OnClick="ImageShow_Click" />
                                </div>
                            </div>
                        </div>

                    </div>
                    

                </div>
            </div>
            </div>


            <div id="DivPhotolarge" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-body">

                            <div class="form-group">

                                <asp:Image ID="ImageLarge" runat="server" Width="100%" Height="100%" />
                            </div>

                        </div>
                        <div class="modal-footer">

                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">


        function showModal1() {
            $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#DivPhotolarge').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();

        }
    </script>
</asp:Content>
