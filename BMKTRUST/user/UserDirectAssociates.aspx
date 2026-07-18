<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="UserDirectAssociates.aspx.cs" EnableEventValidation="false"  Inherits="user_UserDirectAssociates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
   <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">Direct</h6>
            <ul class="d-flex align-items-center gap-2">
                <li class="fw-medium">
                    <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                        Dashboard
                    </a>
                </li>
                <li>/</li>
                <li class="fw-medium">Reports </li>
                <li>/</li>
                <li class="fw-medium">User Direct Report</li>
            </ul>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row" style="color:white">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>

     
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
                                   <label> Total Direct : </label> <asp:Label ID="LblLeftDirect" runat="server" Text="Label"></asp:Label> 

                                 </div></div>

                            
                                  <div class="col-md-6" style="display:none">


                             <div class="form-group">
                                     <label> Right Team : </label> <asp:Label ID="LblRightDirect" runat="server" Text="Label"></asp:Label>

                                 </div></div>
  </div>
                            <div class="row">
                                   <div class="col-md-4">
                                         <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/img/excel-img.png" ToolTip="Download Excel" CssClass="pull-right" Width="40px" OnClick="imgExcel_Click" />

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
                            <div class="row" style="color:white">
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
     
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>