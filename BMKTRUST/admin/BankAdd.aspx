<%@ Page Title="Add Bank" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BankAdd.aspx.cs" Inherits="admin_BankAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtbankname.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtbankname.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Bank Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Utility management</a></li>
            <li class="active">Add Bank</li>
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
                                    <asp:Literal ID="litFormTitle" runat="server" Text="Add Bank"></asp:Literal>
                                </h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblbankid" Visible="false" runat="server" Text=""></asp:Label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtbankname.ClientID %>">Bank Name</label>
                                            <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server" placeholder="e.g. State Bank of India" MaxLength="150"></asp:TextBox>
                                            <span class="adm-field-hint">Full bank name used in deposits and reports</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Bank List</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        EmptyDataText="No banks found. Add your first bank using the form." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Bankid") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="60px" />
                                                <ItemStyle Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn" ToolTip="Edit bank">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Width="80px" />
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
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
