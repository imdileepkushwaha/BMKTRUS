<%@ Page Title="Transaction Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TransactionReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">Reports</span>
                <h1>Transaction Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; Reports &nbsp;/&nbsp; Transactions</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="TransactionReport.aspx">Transactions</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Criteria</h3>
                        </div>
                        <div class="box-body">

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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>User ID :</label>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <div class="box-footer">


                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />


                            <asp:LinkButton ID="imgExcel" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn pull-right" OnClick="imgExcel_Click" aria-label="Download Excel"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="28" height="28" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg></asp:LinkButton>

                        </div>



                    </div>


                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Transaction Details</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Total Income :</label>
                                        <asp:TextBox ID="LblCredited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Total Deduct :</label>
                                        <asp:TextBox ID="LblDebited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Balance :</label>
                                        <asp:TextBox ID="LblCurrentWallet" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-6">
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Page Size</label>
                                        <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged">
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="25" Selected="True">25</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="100">100</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>



                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%"
                                            AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                            AllowPaging="true" PageSize="25" OnPageIndexChanging="GridView1_PageIndexChanging"
                                            PagerStyle-CssClass="bmk-pager" PagerSettings-Mode="NumericFirstLast"
                                            PagerSettings-Position="Bottom" PagerSettings-PageButtonCount="5"
                                            PagerSettings-FirstPageText="«" PagerSettings-LastPageText="»"
                                            PagerSettings-PreviousPageText="‹" PagerSettings-NextPageText="›">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%# (GridView1.PageIndex * GridView1.PageSize) + Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="User Id" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Transaction Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("transactionid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Credit Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("cramount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Debit Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("dramount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltransactiontype" runat="server" Text='<%#Eval("transactiontype") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Remark") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>


                            </div>


                        </div>

                    </div>

                </div>
            </div>






        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>
    </asp:UpdatePanel>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/MM/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/MM/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>

