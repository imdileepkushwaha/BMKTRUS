<%@ page title="" language="C#" masterpagefile="~/user/MasterPage.master" autoeventwireup="true" inherits="AwardReport, App_Web_xqtlfgzg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Level Wise Report</h1>
       
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Detials</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Level Number">
                                                    <ItemTemplate>

                                                        <asp:Label ID="lbllevelno" runat="server" Text='<%#Eval("LevelNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Total Member">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltotalmember" runat="server" Text='<%#Eval("Totalmember") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                         
                                                <asp:TemplateField HeaderText="Joined">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltotalactive" runat="server" Text='<%#Eval("Activemember") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Blankt">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltotalrequired" runat="server" Text='<%#Eval("blank") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>