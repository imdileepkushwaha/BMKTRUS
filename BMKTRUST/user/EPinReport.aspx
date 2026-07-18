<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EPinReport.aspx.cs" Inherits="admin_EPinReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">E-Pin Management</span>
                <h1>E-Pin Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; E-Pin &nbsp;/&nbsp; Report</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="PinRequestAdd.aspx">Request</a>
                <a class="btn-ghost" href="EPinReport.aspx">Report</a>
                <a class="btn-ghost" href="EPinTransfer.aspx">Transfer</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">E-Pin Report</h3>
                        </div>
                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Generate User Id :</label>
                                        <asp:TextBox runat="server" CssClass="form-control" Enabled="false" ID="txtgenerateuserid"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Used User Id :</label>
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtuseduserid"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Status :</label>
                                        <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select E-Pin Status</asp:ListItem>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Used</asp:ListItem>
                                            <asp:ListItem>Cancelled</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>From date :</label>
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>To date :</label>
                                        <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                              
                            </div>

                        </div>
                        
                        <div class="box-footer">


                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">E-Pin Details</h3>
                        </div>
                        <div class="box-body">


                            <div class="row">

                                <div class="form-group table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="E-Pin No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblepinno" runat="server" Text='<%#Eval("EPinNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Generate User Id ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGenerateUserId" runat="server" Text='<%#Eval("GenerateUserId") %>'></asp:Label>
                                                </ItemTemplate>


                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblplanname" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>

                                                </ItemTemplate>


                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Used User Id ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUsedUserId" runat="server" Text='<%#Eval("UsedUserId") %>'></asp:Label>

                                                </ItemTemplate>


                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="E-Pin Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblEPinStatus" runat="server" Text='<%#Eval("EPinStatus") %>'></asp:Label>

                                                </ItemTemplate>


                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMentionDate" runat="server" Text='<%#Eval("MentionDate","{0:dd/MM/yyyy}") %>'></asp:Label>

                                                </ItemTemplate>


                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>


                            </div>


                        </div>
                    </div>
               

        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>

