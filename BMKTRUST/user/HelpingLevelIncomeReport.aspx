<%@ Page Title="Level Bonus Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="HelpingLevelIncomeReport.aspx.cs" Inherits="user_HelpingLevelIncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Income</span>
                <h1>Level Bonus Report</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Income &nbsp;/&nbsp; Level Bonus Report</p>
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
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>From date</label>
                                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>To date</label>
                                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Level</label>
                                            <asp:DropDownList ID="ddlLevel" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            <span class="adm-field-hint">Only your income is shown (All = Level 1 excluded)</span>
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
                                <h3 class="box-title">Income Details</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" EmptyDataText="No records found." GridLines="None"
                                        ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                                <FooterTemplate>Total</FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Username">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Helping Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHelpingId" runat="server" Text='<%# Eval("HelpingId") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Level No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLevelNo" runat="server" Text='<%# Eval("LevelNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    Income
                                                    <div><asp:Label ID="lblHeaderIncomeSum" runat="server"></asp:Label></div>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblIncome" runat="server" Text='<%# Eval("Income", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterIncomeSum" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("MentionDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
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
