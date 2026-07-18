<%@ Page Title="Withdrawl Request" Language="C#" MasterPageFile="Masterpage.master" AutoEventWireup="true" CodeFile="PhotoUpload.aspx.cs" Inherits="PhotoUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {

            if (!confirm('You can update your photo only once.Are you sure want to update?')) {
                return false;
            }
        <%--    if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Old Password');
                document.getElementById("<%=txtoldpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter New Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                toastr.warning('Warning', 'Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }--%>

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-profile">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Profile</span>
                <h1>Photo Upload</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Profile &nbsp;/&nbsp; Photo Upload</p>
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

            <div class="row gy-4">
                <div class="col-xl-12">
                    <div class="box box-primary bmk-photo-card">
                        <div class="box-header with-border">
                            <h3 class="box-title">Upload Photo</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Name</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="bmk-photo-layout">
                                <div class="bmk-photo-current">
                                    <span class="bmk-photo-label">Current Photo</span>
                                    <div class="bmk-photo-avatar">
                                        <asp:ImageButton ID="ImageShow" runat="server" CssClass="bmk-photo-img" Width="160px" Height="160px" OnClick="ImageShow_Click" />
                                    </div>
                                    <p class="bmk-photo-hint">Click photo to view larger</p>
                                </div>

                                <div class="bmk-photo-upload">
                                    <span class="bmk-photo-label">Choose New Photo</span>
                                    <label class="bmk-dropzone">
                                        <span class="bmk-dropzone-icon">
                                            <iconify-icon icon="solar:camera-add-bold-duotone"></iconify-icon>
                                        </span>
                                        <span class="bmk-dropzone-title">Drop image here or browse</span>
                                        <span class="bmk-dropzone-sub">JPG, PNG &mdash; clear face photo works best</span>
                                        <span class="bmk-dropzone-btn">Browse File</span>
                                        <span id="bmkFileName" class="bmk-dropzone-file">No file selected</span>
                                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="bmk-file-input" accept="image/*" onchange="bmkPhotoPicked(this)" />
                                    </label>

                                    <div class="bmk-photo-local-preview" id="bmkLocalPreviewWrap" style="display:none;">
                                        <img id="bmkLocalPreview" alt="Selected preview" />
                                    </div>

                                    <div class="bmk-photo-actions box-footer" id="div_update" runat="server" visible="false">
                                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Upload Photo" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                    <div class="bmk-photo-actions box-footer" id="div_noupdate" runat="server" visible="false">
                                        <span>You cannot update photo. Please contact admin.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


                <div id="DivPhotolarge" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content" style="margin-top: 10%;">

                            <div class="modal-body">

                                <div class="form-group">

                                    <asp:Image ID="ImageLarge" runat="server" Width="570px" Height="400px" />
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
        function bmkPhotoPicked(input) {
            var nameEl = document.getElementById('bmkFileName');
            var wrap = document.getElementById('bmkLocalPreviewWrap');
            var img = document.getElementById('bmkLocalPreview');
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



