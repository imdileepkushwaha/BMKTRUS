<%@ Page Title="Add Gallery" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="WebsiteGallery.aspx.cs" Inherits="admin_WebsiteGallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validateGallery() {
            var title = document.getElementById('<%= txtTitle.ClientID %>').value.replace(/^\s+|\s+$/g, '');
            if (title === '') {
                alert('Enter gallery title');
                document.getElementById('<%= txtTitle.ClientID %>').focus();
                return false;
            }
            var id = document.getElementById('<%= hdnGalleryId.ClientID %>').value;
            var file = document.getElementById('<%= fuImage.ClientID %>');
            if ((!id || id === '') && file && file.files && file.files.length === 0) {
                alert('Please select an image');
                return false;
            }
            return true;
        }

        function previewGalleryImage(input) {
            var img = document.getElementById('<%= imgPreview.ClientID %>');
            var empty = document.getElementById('<%= litPreviewEmpty.ClientID %>');
            if (!img) return;
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    img.src = e.target.result;
                    img.style.display = 'block';
                    if (empty) empty.style.display = 'none';
                };
                reader.readAsDataURL(input.files[0]);
            }
        }

        function showGalleryPreview(url) {
            var img = document.getElementById('<%= imgPreview.ClientID %>');
            var empty = document.getElementById('<%= litPreviewEmpty.ClientID %>');
            if (!img) return;
            if (url && url !== '') {
                img.src = url;
                img.style.display = 'block';
                if (empty) empty.style.display = 'none';
            } else {
                img.removeAttribute('src');
                img.style.display = 'none';
                if (empty) empty.style.display = 'block';
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Add Gallery</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Website Management</a></li>
            <li class="active">Add Gallery</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">
                                    <asp:Literal ID="litFormTitle" runat="server" Text="Add Gallery Image"></asp:Literal>
                                </h3>
                            </div>
                            <div class="box-body">
                                <asp:HiddenField ID="hdnGalleryId" runat="server" Value="" />
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Title</label>
                                            <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" MaxLength="200" placeholder="e.g. About / FAQ / NGO"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Sort Order</label>
                                            <asp:TextBox ID="txtSortOrder" CssClass="form-control" runat="server" Text="1" onkeypress="return isNumber(event)"></asp:TextBox>
                                            <span class="adm-field-hint">Lower number shows first on homepage</span>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <asp:DropDownList ID="ddActive" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="1" Text="Active" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Gallery Image</label>
                                            <asp:FileUpload ID="fuImage" runat="server" onchange="previewGalleryImage(this);" />
                                            <span class="adm-field-hint">PNG / JPG. Required for new items. Preview shows after selection.</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Preview</label>
                                            <div class="adm-qr-preview">
                                                <asp:Image ID="imgPreview" runat="server" Width="100" Height="100" Style="display: none; object-fit: cover;" />
                                                <asp:Label ID="litPreviewEmpty" runat="server" CssClass="adm-field-hint" Text="No image selected" Style="margin: 0;"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validateGallery();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Gallery List</h3>
                                <span class="adm-code-pill">Homepage gallery</span>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        EmptyDataText="No gallery images yet." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("GalleryId") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgRow" runat="server" Width="56" Height="56" CssClass="img-rounded"
                                                        ImageUrl='<%# GalleryImageUrl(Eval("ImagePath")) %>'
                                                        Style="object-fit: cover;" />
                                                </ItemTemplate>
                                                <HeaderStyle Width="80px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Title">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sort">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSort" runat="server" Text='<%# Eval("SortOrder") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="70px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblActive" runat="server"
                                                        Text='<%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>'
                                                        CssClass='<%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Deactive" %>'></asp:Label>
                                                    <asp:Label ID="lblPath" runat="server" Visible="false" Text='<%# Eval("ImagePath") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn" ToolTip="Edit">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbDelete" CommandName="mydel"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn-danger" ToolTip="Delete"
                                                        OnClientClick="return confirm('Delete this gallery image?');">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Width="110px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
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
</asp:Content>
