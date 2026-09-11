<%@ Page Title="Growth Monthly Payout" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="PaidGrowthClosingMonthly.aspx.cs" Inherits="admin_PaidGrowthClosingMonthly" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .wp-wrap { padding: 0 4px 20px; }
        .wp-hero {
            background: linear-gradient(135deg, #0f766e 0%, #0891b2 55%, #4f46e5 100%);
            color: #fff; border-radius: 12px; padding: 18px 22px; margin-bottom: 16px;
            box-shadow: 0 8px 24px rgba(15, 118, 110, .28);
        }
        .wp-hero h1 { margin: 0 0 4px; font-size: 24px; font-weight: 700; }
        .wp-hero .breadcrumb { background: transparent; padding: 0; margin: 0; }
        .wp-hero .breadcrumb > li, .wp-hero .breadcrumb > li + li:before, .wp-hero .breadcrumb a { color: rgba(255,255,255,.9); }
        .wp-search.box { border-top: 3px solid #0d9488; border-radius: 10px; overflow: hidden; }
        .wp-list.box { border-top: 3px solid #4f46e5; border-radius: 10px; overflow: hidden; }
        .wp-search .box-header { background: #f0fdfa; }
        .wp-list .box-header { background: #eef2ff; }
        .wp-amt { font-weight: 700; color: #0f766e; }
        .wp-net { font-weight: 800; color: #1d4ed8; font-size: 14px; }
        .wp-badge { display: inline-block; padding: 4px 10px; border-radius: 999px; font-size: 11px; font-weight: 700; letter-spacing: .3px; }
        .wp-badge-unpaid { background: #fff7ed; color: #c2410c; border: 1px solid #fdba74; }
        .wp-badge-paid { background: #ecfdf5; color: #047857; border: 1px solid #6ee7b7; }
        .wp-row-unpaid td { background: #fffbeb !important; }
        .wp-row-paid td { background: #f0fdf4 !important; }
        .wp-userid { font-weight: 700; color: #1e3a8a; }
        .wp-bank { font-size: 12px; line-height: 1.5; }
        .wp-bank b { color: #334155; }
        .wp-grid { border-radius: 8px; overflow: hidden; }
        .wp-grid th { background: #0f766e !important; color: #fff !important; border-color: #0d9488 !important; white-space: nowrap; }
        .wp-grid thead th { background: #0f766e !important; color: #fff !important; border-color: #0d9488 !important; }
        .btn-wp-pay { background: #059669; border-color: #047857; }
        .btn-wp-pay:hover { background: #047857; }
        .wp-txn { min-width: 140px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="wp-hero">
        <h1>Growth Monthly Payout</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li>Closing</li>
            <li class="active">Growth Monthly Payout</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="wp-wrap">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary wp-search">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-filter"></i> Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>From Date</label>
                                            <asp:TextBox ID="TxtFromdate" runat="server" CssClass="form-control form_date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>To Date</label>
                                            <asp:TextBox ID="TxtTodate" runat="server" CssClass="form-control form_date"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="TxtUserId" runat="server" CssClass="form-control" placeholder="Leave blank for all"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <asp:DropDownList ID="ddstatus" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0" Selected="True">Unpaid</asp:ListItem>
                                                <asp:ListItem Value="1">Paid</asp:ListItem>
                                                <asp:ListItem Value="All">All</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                <div class="pull-right">
                                    <asp:Button ID="btnpay" CssClass="btn btn-success btn-wp-pay" runat="server" Text="Paid to Bank" OnClick="btnpay_Click" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="box box-primary wp-list">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-list-alt"></i> Growth Payout Details</h3>
                                <div style="float: right">
                                    <asp:LinkButton ID="ImageButton1" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn" OnClick="ExportToExcel" aria-label="Download Excel"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26" height="26" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg></asp:LinkButton>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable wp-grid" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No records found.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="chckchanged" runat="server" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chk" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="From date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate") %>'></asp:Label>
                                                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="LabMobile" runat="server" Text='<%#Eval("Mobile") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("Todate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="UserID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" CssClass="wp-userid" Text='<%#Eval("UserId") %>'></asp:Label>
                                                    <div><asp:Label ID="lblusername" runat="server" Text='<%#Eval("UserName") %>'></asp:Label></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Account">
                                                <ItemTemplate>
                                                    <div class="wp-bank">
                                                        <div><b>A/C</b> <asp:Label ID="lblaccountno" runat="server" Text='<%#Eval("accountno") %>'></asp:Label></div>
                                                        <div><b>IFSC</b> <asp:Label ID="Labelifsccode" runat="server" Text='<%#Eval("ifsccode") %>'></asp:Label></div>
                                                        <div><b>Holder</b> <asp:Label ID="LabelacHolder" runat="server" Text='<%#Eval("AccountHolderName") %>'></asp:Label></div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Other Detail">
                                                <ItemTemplate>
                                                    <label class="myLabel">PhonePay - </label>
                                                    <asp:Label ID="lblphonepay" runat="server" Text='<%#Eval("PhonePay") %>'></asp:Label>
                                                    <label class="myLabel">BHIM ID - </label>
                                                    <asp:Label ID="lblbhim" runat="server" Text='<%#Eval("BhimNo") %>'></asp:Label>
                                                    <label class="myLabel">UPI ID - </label>
                                                    <asp:Label ID="lblupi" runat="server" Text='<%#Eval("UPINo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Growth Income">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGrowth" runat="server" CssClass="wp-amt" Text='<%#Eval("GrowthIncome", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Income">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("TotalIncome", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Admin Charge">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdminCharge" runat="server" Text='<%#Eval("AdminCharge", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TDS Charge">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTDSCharge" runat="server" Text='<%#Eval("TDS", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Net Pay">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPaybleAmount" runat="server" CssClass="wp-net" Text='<%#Eval("PaybleAmount", "{0:0.00}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" CssClass="wp-badge wp-badge-unpaid" Text='<%#Eval("Status1") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction ID">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtTransaction" runat="server" CssClass="form-control wp-txn" placeholder="Txn ID"></asp:TextBox>
                                                    <asp:Label ID="lblTransaction" runat="server" CssClass="wp-userid" Text='<%#Eval("TransactionID") %>' Visible="false"></asp:Label>
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
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButton1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        function bindGrowthPayoutDates() {
            $('.form_date').datepicker({
                format: 'dd/M/yyyy',
                autoclose: true
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
                if (this.id && this.id.indexOf('TxtFromdate') >= 0 && ev.date) {
                    var last = new Date(ev.date.getFullYear(), ev.date.getMonth() + 1, 0);
                    var $to = $('.form_date').filter(function () { return this.id && this.id.indexOf('TxtTodate') >= 0; });
                    if ($to.length)
                        $to.datepicker('update', last);
                }
            });
        }
        bindGrowthPayoutDates();
        Sys.Application.add_load(bindGrowthPayoutDates);
    </script>
</asp:Content>
