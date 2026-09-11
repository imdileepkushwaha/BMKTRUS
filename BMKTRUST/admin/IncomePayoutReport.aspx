<%@ Page Title="Income Payout Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="IncomePayoutReport.aspx.cs" Inherits="admin_IncomePayoutReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .myLabel { font-weight: bold; }
        .payout-all-box { margin-bottom: 12px; }
        .payout-all-box .form-control { display: inline-block; width: 220px; margin-right: 8px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Income Payout Report</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Accounts</a></li>
            <li class="active">Income Payout Report</li>
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
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>From date</label>
                                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>To date</label>
                                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>User Id</label>
                                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Leave blank for all"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="Pending" Selected="True">Pending</asp:ListItem>
                                                <asp:ListItem Value="Approved">Approved</asp:ListItem>
                                                <asp:ListItem Value="All">All</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Weekly Income Payout</h3>
                            </div>
                            <div class="box-body">
                                <div class="payout-all-box">
                                    <label>Transaction ID (for Approve All)</label>
                                    <asp:TextBox ID="txtAllTxnId" CssClass="form-control" runat="server" placeholder="Bank / UPI transaction ID"></asp:TextBox>
                                    <asp:Button ID="btnApproveAll" CssClass="btn btn-success" runat="server" Text="Approve All Pending"
                                        OnClick="btnApproveAll_Click" OnClientClick="return confirm('Approve all pending payouts with this Transaction ID?');" />
                                    <asp:Label ID="lblMsg" runat="server" ForeColor="Green" style="margin-left:10px;"></asp:Label>
                                </div>
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" EmptyDataText="No records found." GridLines="None"
                                        ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                                <FooterTemplate>Total</FooterTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Week">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("PayoutDateText") %>'></asp:Label>
                                                    <asp:Label ID="lblPayoutDateKey" runat="server" Text='<%# Eval("PayoutDateKey") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Username">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank / UPI">
                                                <ItemTemplate>
                                                    <div><span class="myLabel">A/c Holder - </span><asp:Label ID="lblholder" runat="server" Text='<%# Eval("AccountHolderName") %>'></asp:Label></div>
                                                    <div><span class="myLabel">Bank - </span><asp:Label ID="lblbank" runat="server" Text='<%# Eval("BankName") %>'></asp:Label></div>
                                                    <div><span class="myLabel">A/c No - </span><asp:Label ID="lblacc" runat="server" Text='<%# Eval("AccountNo") %>'></asp:Label></div>
                                                    <div><span class="myLabel">IFSC - </span><asp:Label ID="lblifsc" runat="server" Text='<%# Eval("IFSCCode") %>'></asp:Label></div>
                                                    <div><span class="myLabel">UPI - </span><asp:Label ID="lblupi" runat="server" Text='<%# Eval("UPINo") %>'></asp:Label></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Level Bonus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHelping" runat="server" Text='<%# Eval("HelpingIncome", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterHelping" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Referral Bonus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDirect" runat="server" Text='<%# Eval("DirectIncome", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterDirect" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("TotalIncome", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterTotal" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Paid">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaid" runat="server" Text='<%# Eval("PaidAmount", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterPaid" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pending">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPending" runat="server" Text='<%# Eval("PendingAmount", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblFooterPending" runat="server"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltransactionid" runat="server" Text='<%# Eval("OnlineTransactionId") %>'></asp:Label>
                                                    <asp:TextBox ID="txttransactionid" runat="server" CssClass="form-control" placeholder="Txn ID"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approve Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblapprovedate" runat="server" Text='<%# Eval("ApproveDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnApprove" runat="server" CssClass="btn btn-primary btn-xs" OnClick="btnApprove_Click">Approve</asp:LinkButton>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy'
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>
