<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />

    <style type="text/css">
        .Paid {
            background-color: #006b0d;
            color: #fff;
            padding: 4px;
            border-radius: 5px;
        }

        .Unpaid {
            background-color: #bf0a0a;
            color: #fff;
            padding: 4px;
            border-radius: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Downline</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; My Downline</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-ghost" href="DownlineReport.aspx">Downline</a>
                <a class="btn-ghost" href="leveltree.aspx">Treeview</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row" >
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Filter</h3>
                        </div>
                        <div class="box-body">

                            <div class="row">
                         <div class="col-md-6" style="display:none">
                             <div class="form-group">
                                 <label>User Id :</label>
                                   <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                             </div>
                         </div>
                         <div class="col-md-6">
                            <div class="form-group">
                                         <label>Status</label>
                                        <asp:DropDownList ID="DDlstpoolNo" runat="server" CssClass="form-control">
                                              <asp:ListItem Value="0">select</asp:ListItem>
                                            <asp:ListItem Value="1">Active</asp:ListItem>
                                             <asp:ListItem Value="2">Deactive</asp:ListItem>
                                          
                                        </asp:DropDownList>
                                    
                                    </div>
                         </div>
                     </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                   
                                        
                                        
                                         </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Downline Details</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Total Team  : </label>
                                        <asp:Label ID="LblTotalLeft" runat="server" Text="Label"></asp:Label>

                                    </div>
                                </div>


                                <div class="col-md-6" style="display:none">
                                    <div class="form-group">
                                        <label>Right Team : </label>
                                        <asp:Label ID="LblTotalright" runat="server" Text="Label"></asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Total Team</label>
                                        <div class="table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsponsername1" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Parent ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("ParentUserId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--  <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6" style="display:none">
                                    <div class="form-group">
                                        <label>Right Team</label>
                                        <div class="table-responsive">
                                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="#">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsponsername1" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Parent ID">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("ParentUserId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mobile">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
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
                </div>
            </div>







        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
