<%@ Page Title="KYC Upload" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="UploadKYC.aspx.cs" Inherits="UploadKYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>KYC Upload</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">KYC</a></li>
            <li class="active">KYC Upload</li>
        </ol>
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
            <div class="adm-util-page adm-kyc-page">

                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">User Details</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtchange" Enabled="false" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Signup Form</h3>
                                <div id="divStatus" runat="server" visible="false" class="adm-kyc-status">
                                    <asp:Label ID="lblApprovalStatus" runat="server">Pending</asp:Label>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="adm-kyc-upload">
                                    <div class="adm-kyc-upload__preview">
                                        <asp:ImageButton ID="ImageShow" runat="server" CssClass="img IMageForm adm-kyc-preview" AlternateText="Signup form preview" />
                                        <span class="adm-kyc-upload__hint">Click image to enlarge</span>
                                    </div>
                                    <div class="adm-kyc-upload__fields">
                                        <div class="form-group">
                                            <label>Upload Signup Form</label>
                                            <asp:FileUpload ID="ImageUpload" runat="server" CssClass="ImageUpload form-control" />
                                        </div>
                                        <div id="div_update" runat="server">
                                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">PAN Card</h3>
                                <div id="divpanstatus" runat="server" visible="false" class="adm-kyc-status">
                                    <asp:Label ID="lblpanstatus" runat="server">Pending</asp:Label>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="adm-kyc-upload">
                                    <div class="adm-kyc-upload__preview">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="img IMageFormPan adm-kyc-preview" AlternateText="PAN card preview" />
                                        <span class="adm-kyc-upload__hint">Click image to enlarge</span>
                                    </div>
                                    <div class="adm-kyc-upload__fields">
                                        <div class="form-group">
                                            <label>PAN Number</label>
                                            <asp:TextBox ID="txtpanno" runat="server" CssClass="form-control" placeholder="Enter PAN number"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label>Upload PAN Card</label>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="ImageUploadPan form-control" />
                                        </div>
                                        <div id="div1" runat="server">
                                            <asp:Button ID="Button1" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmitPan_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Cancel Cheque / Passbook</h3>
                                <div id="divchequestatus" runat="server" visible="false" class="adm-kyc-status">
                                    <asp:Label ID="lblchequestatus" runat="server">Pending</asp:Label>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="adm-kyc-upload">
                                    <div class="adm-kyc-upload__preview">
                                        <asp:ImageButton ID="ImageButton2" runat="server" CssClass="img IMageFormCheque adm-kyc-preview" AlternateText="Cheque preview" />
                                        <span class="adm-kyc-upload__hint">Click image to enlarge</span>
                                    </div>
                                    <div class="adm-kyc-upload__fields">
                                        <div class="form-group">
                                            <label>Upload Cancel Cheque / Passbook</label>
                                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="ImageUploadCheque form-control" />
                                        </div>
                                        <div id="div4" runat="server">
                                            <asp:Button ID="Button2" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmitCheque_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Aadhaar / Address Proof</h3>
                                <div id="divaadharstatus" runat="server" visible="false" class="adm-kyc-status">
                                    <asp:Label ID="lblaadharstatus" runat="server">Pending</asp:Label>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Aadhaar Number</label>
                                    <asp:TextBox ID="txtaadharno" runat="server" CssClass="form-control" placeholder="Enter Aadhaar number"></asp:TextBox>
                                </div>
                                <div class="adm-kyc-dual">
                                    <div class="adm-kyc-upload adm-kyc-upload--stack">
                                        <div class="adm-kyc-upload__preview">
                                            <asp:ImageButton ID="ImageButton3" runat="server" CssClass="img IMageFormAadhar adm-kyc-preview" AlternateText="Aadhaar front" />
                                            <span class="adm-kyc-upload__hint">Front side</span>
                                        </div>
                                        <div class="form-group" style="margin-bottom:0;">
                                            <label>Upload Front</label>
                                            <asp:FileUpload ID="FileUpload3" runat="server" CssClass="ImageUploadAadhar form-control" />
                                        </div>
                                    </div>
                                    <div class="adm-kyc-upload adm-kyc-upload--stack">
                                        <div class="adm-kyc-upload__preview">
                                            <asp:ImageButton ID="ImageButton4" runat="server" CssClass="img IMageFormAadharBack adm-kyc-preview" AlternateText="Aadhaar back" />
                                            <span class="adm-kyc-upload__hint">Back side</span>
                                        </div>
                                        <div class="form-group" style="margin-bottom:0;">
                                            <label>Upload Back</label>
                                            <asp:FileUpload ID="FileUpload4" runat="server" CssClass="ImageUploadAadharBack form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div id="div3" runat="server" class="adm-kyc-aadhaar-actions">
                                    <asp:Button ID="Button3" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmitAadhar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="DivPhotolarge" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Document Preview</h4>
                            </div>
                            <div class="modal-body">
                                <div class="adm-kyc-modal-preview">
                                    <img id="img1" runat="server" class="img1" src="" alt="KYC document" />
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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="Button1" />
            <asp:PostBackTrigger ControlID="Button2" />
            <asp:PostBackTrigger ControlID="Button3" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function bindKycUploadPreviews() {
            function bindPreview(inputSel, imgSel) {
                $(document).off("change.kyc", inputSel).on("change.kyc", inputSel, function () {
                    var input = this;
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $(imgSel).attr("src", e.target.result);
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                });
            }

            bindPreview(".ImageUpload", ".IMageForm");
            bindPreview(".ImageUploadPan", ".IMageFormPan");
            bindPreview(".ImageUploadCheque", ".IMageFormCheque");
            bindPreview(".ImageUploadAadhar", ".IMageFormAadhar");
            bindPreview(".ImageUploadAadharBack", ".IMageFormAadharBack");

            $(document).off("click.kycimg", ".img").on("click.kycimg", ".img", function () {
                $(".img1").attr("src", $(this).attr("src"));
                showModal1();
                return false;
            });
        }

        function showModal1() {
            $("#DivPhotolarge").modal({ backdrop: "static", keyboard: false });
        }

        function Closepopup() {
            $("#DivPhotolarge").modal("hide");
            $("body").removeClass("modal-open");
            $("body").css("padding-right", "0");
            $(".modal-backdrop").remove();
        }

        Sys.Application.add_load(bindKycUploadPreviews);
    </script>
</asp:Content>
