<%@ Page Title="Add News" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="NewsAdd.aspx.cs" Inherits="admin_NewsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtnews.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter News');
                document.getElementById("<%=txtnews.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>News Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">News</a></li>
            <li class="active">News Master</li>
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
                                    <asp:Literal ID="litFormTitle" runat="server" Text="Add News"></asp:Literal>
                                </h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblnewsid" Visible="false" runat="server" Text=""></asp:Label>
                                <div class="form-group">
                                    <label for="<%= txtnews.ClientID %>">News Content</label>
                                    <asp:TextBox ID="txtnews" TextMode="MultiLine" Rows="5" CssClass="form-control adm-news-text" runat="server"
                                        placeholder="Write the announcement or news update that members will see..."></asp:TextBox>
                                    <span class="adm-field-hint">This text appears on member dashboards and news sections</span>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">News List</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable"
                                        Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        EmptyDataText="No news items yet. Add your first announcement above." GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("newsid") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="60px" />
                                                <ItemStyle Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="News">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblnews" runat="server" Text='<%# Eval("newsdetail") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn" ToolTip="Edit news">
                                                        <i class="fa fa-pencil" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbDelete" CommandName="mydel"
                                                        CommandArgument="<%# ((GridViewRow)Container).RowIndex %>"
                                                        runat="server" CssClass="adm-action-btn-danger" ToolTip="Delete news"
                                                        OnClientClick="return confirm('Delete this news item?');">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle Width="110px" />
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
