<%@ Page Title="Growth Monthly Closing" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CalculateHelpingGrowthClosingMonthly.aspx.cs" Inherits="admin_CalculateHelpingGrowthClosingMonthly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Growth Monthly Closing</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Closing</a></li>
            <li class="active">Growth Monthly Closing</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Generate Growth Monthly Closing</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>From Date</label>
                                        <asp:TextBox ID="TxtFromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>To Date</label>
                                        <asp:TextBox ID="TxtTodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <p class="text-muted">
                                Example: <strong>01/Aug/2026</strong> se <strong>31/Aug/2026</strong> — us month ki income milegi.
                                Process: <strong>sp_GenerateHelpingLevelIncomePool2Single</strong>
                                (user-wise TransactionDetail credit, 5% Admin + 5% TDS).
                            </p>
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Run Monthly Closing"
                                OnClientClick="return confirm('Is date range ka Growth Closing run karein?');" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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
        function bindGrowthDates() {
            $('.form_date').datepicker({
                format: 'dd/M/yyyy',
                autoclose: true
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
                if (this.id && this.id.indexOf('TxtFromdate') >= 0 && ev.date) {
                    var last = new Date(ev.date.getFullYear(), ev.date.getMonth() + 1, 0);
                    var $to = $('.form_date').filter(function () { return this.id && this.id.indexOf('TxtTodate') >= 0; });
                    if ($to.length) {
                        $to.datepicker('update', last);
                    }
                }
            });
        }
        bindGrowthDates();
        Sys.Application.add_load(bindGrowthDates);
    </script>
</asp:Content>
