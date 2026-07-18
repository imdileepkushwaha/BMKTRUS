<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="UserDirectAssociates.aspx.cs" EnableEventValidation="false"  Inherits="user_UserDirectAssociates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Direct</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; My Direct</p>
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
                            <h3 class="box-title">Direct Associates</h3>

     
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->

                          <div class="row" style="display:none">
                                       <div class="col-md-6">
                                    <div class="form-group">
                                       <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                      
                                    </div>
                                </div>
                                      </div>
                        <div class="box-body">



                                   <div class="row">
                        <div class="col-md-6">
                             <div class="form-group">
                                   <div class="bmk-stat-pill">
                                   <label>Total Direct</label> <asp:Label ID="LblLeftDirect" runat="server" Text="Label"></asp:Label>
                                   </div>
                                 </div></div>

                            
                                  <div class="col-md-6" style="display:none">


                             <div class="form-group">
                                     <label> Right Team : </label> <asp:Label ID="LblRightDirect" runat="server" Text="Label"></asp:Label>

                                 </div></div>
  </div>
                            <div class="row">
                                   <div class="col-md-4">
                                         <asp:LinkButton ID="imgExcel" runat="server" ToolTip="Download Excel" CssClass="bmk-excel-btn pull-right" OnClick="imgExcel_Click" aria-label="Download Excel"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="28" height="28" fill="currentColor" aria-hidden="true"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6zm4 18H6V4h7v5h5v11zM8.89 17h1.61l.95-1.92L12.4 17h1.61l-1.72-3.05L14.1 11h-1.66l-.88 1.86L10.7 11H9.08l1.72 2.95L8.89 17z"/></svg></asp:LinkButton>

                                       </div>
                                 <div class="col-md-4">
                                       </div>
                                 <div class="col-md-4">
                                        <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control pull-right margin-left-10" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged" Width="80px">
                                       
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>100</asp:ListItem>
                                             <asp:ListItem>500</asp:ListItem>
                                             <asp:ListItem>All</asp:ListItem>      
                    </asp:DropDownList>
                                       </div>
                            </div>

                            <br />
                            <div class="row" >
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="grdBank" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Data Found" OnRowDataBound="grdBank_RowDataBound">                                            <Columns>
                                                <%--<asp:BoundField DataField="UserId" HeaderText="User ID" />
                                                <asp:BoundField DataField="UserName" HeaderText="User Name" />                                              
                                                <asp:BoundField DataField="Gender" HeaderText="Gender" />                                            
                                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                                                <asp:BoundField DataField="Address" HeaderText="Address" />
                                                <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />
                                             <asp:BoundField DataField="ParentUserID" HeaderText="Parent ID" />
                                             <asp:BoundField DataField="parentname" HeaderText="Parent Name" />
                                             
                                                <asp:BoundField DataField="Status" HeaderText="Status" />--%>
                                                
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="UserId" HeaderText="User ID" />
                                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                                <asp:BoundField DataField="PackageName" HeaderText="Package" />     
                                            
                                             <%-- <asp:BoundField DataField="StandingPosition" HeaderText="Standing Position" />   --%>
                                              
                                              <asp:BoundField DataField="Mobile" HeaderText="Mobile" />                                           
                                              
                                                <asp:BoundField DataField="RegDate" HeaderText="D. O. J." />                                             
                                          
                                               <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' CssClass='<%#Eval("Status") %>'></asp:Label>
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
     <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>

      
    </asp:UpdatePanel>
     
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>