<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CancelCheckForm.aspx.cs" Inherits="user_CancelCheckForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />

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
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">KYC</span>
                <h1>Cancel Cheque / Passbook</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; KYC &nbsp;/&nbsp; Cancel Cheque</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="PanCardImage.aspx">PAN</a>
                <a class="btn-ghost" href="CancelCheckForm.aspx">Cheque</a>
                <a class="btn-ghost" href="AddressProof.aspx">Aadhar</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
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
            <div class="row" >
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Cancel Cheque / Passbook</h3>
                        </div>

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

                            <div class="bmk-kyc-layout">
                                <div class="bmk-kyc-doc">
                                    <span class="bmk-photo-label">Current Document</span>
                                    <div class="bmk-kyc-frame">
                                        <asp:ImageButton ID="ImageShow" runat="server" Width="168px" Height="108px" OnClick="ImageShow_Click" />
                                    </div>
                                    <p class="bmk-photo-hint">Click to view larger</p>
                                </div>
                                <div class="bmk-photo-upload">
                                    <span class="bmk-photo-label">Upload Cancel Cheque / Passbook</span>
                                    <label class="bmk-dropzone bmk-kyc-dropzone">
                                        <span class="bmk-dropzone-icon">
                                            <iconify-icon icon="solar:card-bold-duotone"></iconify-icon>
                                        </span>
                                        <span class="bmk-dropzone-title">Drop cheque image or browse</span>
                                        <span class="bmk-dropzone-sub">JPG, PNG &mdash; clear bank document</span>
                                        <span class="bmk-dropzone-btn">Browse File</span>
                                        <span id="bmkFileNameCheque" class="bmk-dropzone-file">No file selected</span>
                                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="bmk-file-input" accept="image/*" onchange="bmkKycPicked(this,'bmkFileNameCheque','bmkLocalPreviewCheque','bmkLocalWrapCheque')" />
                                    </label>
                                    <div class="bmk-photo-local-preview" id="bmkLocalWrapCheque" style="display:none;">
                                        <img id="bmkLocalPreviewCheque" alt="Selected cheque preview" />
                                    </div>
                                    <div class="bmk-photo-actions box-footer" id="div_update" runat="server" visible="false">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                    <div class="bmk-photo-actions box-footer" id="div_noupdate" runat="server" visible="false">
                                        <span>You cannot upload Cancel Cheque/Passbook. Please contact admin.</span>
                                    </div>
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
    </div>
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
        function bmkKycPicked(input, nameId, imgId, wrapId) {
            var nameEl = document.getElementById(nameId);
            var wrap = document.getElementById(wrapId);
            var img = document.getElementById(imgId);
            if (!input || !input.files || !input.files[0]) {
                if (nameEl) nameEl.textContent = 'No file selected';
                if (wrap) wrap.style.display = 'none';
                return;
            }
            var file = input.files[0];
            if (nameEl) nameEl.textContent = file.name;
            if (img && wrap && file.type.indexOf('image/') === 0) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                    wrap.style.display = 'block';
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
</asp:Content>
