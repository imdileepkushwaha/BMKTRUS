<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="fundTransferReceiveReport.aspx.cs" Inherits="admin_fundTransferReceiveReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
      <h1>
       Fund Transfer & Receive Report
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Fund Request</a></li>
        <li class="active">Fund Transfer & Receive Report</li>
      </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                
                <div class="col-md-12">

                    <div class="box box-primary">
                        
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Crteria</h3>
                        </div>

                        <div class="box-body">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Wallet Type</label>
                                        <asp:DropDownList ID="ddlWalletType" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Recharge Wallet</asp:ListItem>
                                            <asp:ListItem Value="2">Utility Wallet</asp:ListItem>
                                            <asp:ListItem Value="3">Franchisee Wallet</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>From Date</label>
                                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control form_date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>To Date</label>
                                        <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control form_date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="box-footer">

                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-info" OnClick="btnSearch_Click" />
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-default" OnClick="btnReset_Click" />
                                </div>
                            </div>

                        </div>

                    </div>

                </div>

                <div class="col-md-12">

                    <div class="box box-primary">
                        
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                            <asp:LinkButton ID="imgExcel" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn pull-right" OnClick="imgExcel_Click" aria-label="Download Excel"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="28" height="28" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg></asp:LinkButton>
                        </div>

                        <div class="box-body">

                            <div class="form-group table-responsive">

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
                                    CssClass="table table-bordered table-hover dataTable" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date & Time">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDateTime" runat="server" Text='<%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Transaction Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTransactionId" runat="server" Text='<%# Eval("transactionId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUserType" runat="server" Text='<%# Eval("userType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Debit Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDebitAmount" runat="server" Text='<%# Eval("dramount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreditAmount" runat="server" Text='<%# Eval("cramount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Current Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCurrentBalance" runat="server" Text='<%# Eval("Currentbalance") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Wallet Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblWalletType" runat="server" Text='<%# Eval("walletType") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApproveBy" runat="server" Text='<%# Eval("approvedBy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Invoice">
                                            <ItemTemplate>
                                                
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
        <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">

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

