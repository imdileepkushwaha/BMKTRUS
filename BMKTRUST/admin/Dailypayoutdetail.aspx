<%@ Page Title="Daily Closing Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="Dailypayoutdetail.aspx.cs" Inherits="Dailypayoutdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Daily Closing Report</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Accounts</a></li>
            <li class="active">Daily Closing Report</li>
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
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>User Id</label>
                                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Member user ID"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Select Date</label>
                                            <asp:DropDownList ID="DDlstFromdate" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="adm-field-hint">Choose closing date from the list</span>
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
                                <h3 class="box-title">Closing Details</h3>
                                <asp:LinkButton ID="ImageButton1" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn" OnClick="ExportToExcel" aria-label="Download Excel">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="26" height="26" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg>
                                </asp:LinkButton>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" GridLines="None"
                                        EmptyDataText="No closing records found.">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                                <HeaderStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="From date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblfromdate" runat="server" Text='<%# Eval("Fromdate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="To Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltodate" runat="server" Text='<%# Eval("ToDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Userid">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUserid" runat="server" Text='<%# Eval("Userid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pair">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmathingBv" runat="server" Text='<%# Eval("pair") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCommissionPer" runat="server" Text='<%# Eval("TotalLeft") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total right">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcommission" runat="server" Text='<%# Eval("TotalRight") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Left carry PV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblgeneratedate" runat="server" Text='<%# Eval("LeftcarryPv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Right carry PV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("RightCarryPv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Binary Income">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbinaryincome" runat="server" Text='<%# Eval("binaryincome") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TDS Charge">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltdscharge" runat="server" Text='<%# Eval("tdscharge") %>'></asp:Label><br />(
                                                    <asp:Label ID="Lbltds" runat="server" Text='<%# Eval("tdsper") %>'></asp:Label>%)
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Payable Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpaybleamount" runat="server" Text='<%# Eval("paybleamount") %>'></asp:Label>
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
</asp:Content>
