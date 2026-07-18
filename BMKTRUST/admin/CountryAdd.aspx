<%@ Page Title="Add Country" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CountryAdd.aspx.cs" Inherits="admin_CountryAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .adm-page-country .adm-field-hint {
            display: block;
            margin-top: 6px;
            font-size: 12px;
            color: #9CA3AF;
            font-weight: 500;
        }
        .adm-page-country .adm-action-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border-radius: 8px;
            background: rgba(227, 28, 35, 0.08);
            color: #E31C23 !important;
            text-decoration: none !important;
            transition: background 0.15s ease, transform 0.15s ease;
        }
        .adm-page-country .adm-action-btn:hover {
            background: rgba(227, 28, 35, 0.16);
            transform: translateY(-1px);
        }
        .adm-page-country .adm-code-pill {
            display: inline-flex;
            align-items: center;
            min-height: 28px;
            padding: 0 10px;
            border-radius: 999px;
            background: #F3F4F8;
            color: #4B5563;
            font-weight: 700;
            font-size: 12px;
            letter-spacing: 0.04em;
        }
    </style>
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtcountryname.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Country Name');
                document.getElementById("<%=txtcountryname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtcountrycode.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter Country Code');
                document.getElementById("<%=txtcountrycode.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Country Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Utility management</a></li>
            <li class="active">Add Country</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-page-country">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">
                                    <asp:Literal ID="litFormTitle" runat="server" Text="Add Country"></asp:Literal>
                                </h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblcountryid" Visible="false" runat="server" Text=""></asp:Label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtcountryname.ClientID %>">Country Name</label>
                                            <asp:TextBox ID="txtcountryname" CssClass="form-control" runat="server" placeholder="e.g. India" MaxLength="100"></asp:TextBox>
                                            <span class="adm-field-hint">Full official country name</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="<%= txtcountrycode.ClientID %>">Country Code</label>
                                            <asp:TextBox ID="txtcountrycode" CssClass="form-control" runat="server" placeholder="e.g. IN / +91" MaxLength="20"></asp:TextBox>
                                            <span class="adm-field-hint">Short code used in forms and reports</span>
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
                                <h3 class="box-title">Country List</h3>
                                <span class="adm-code-pill">
                                    <asp:Literal ID="litCount" runat="server" Text="0 countries"></asp:Literal>
                                </span>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        EmptyDataText="No countries found. Add your first country using the form." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Countryid") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="60px" />
                                                <ItemStyle Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Country Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCountryname" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Code">
                                                <ItemTemplate>
                                                    <span class="adm-code-pill">
                                                        <asp:Label ID="lblCountrycode" runat="server" Text='<%# Eval("CountryCode") %>'></asp:Label>
                                                    </span>
                                                </ItemTemplate>
                                                <HeaderStyle Width="120px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn" ToolTip="Edit country">
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
