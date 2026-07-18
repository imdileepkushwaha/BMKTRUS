<%@ page title="" language="C#" masterpagefile="adminmaster.master" autoeventwireup="true" inherits="BonanzaUserReport, App_Web_ct3rsggs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1> Bonanaza</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Closing</a></li>
            <li class="active">>Bonanza</li>
        </ol>
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
                            <h3 class="box-title">Search Crteria</h3>
                        </div>

                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                          <label>User Id :</label>
                                  <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                          <label>User Id :</label>
                                        <asp:DropDownList ID="DDLSTBonanza" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                              
                            
                            </div>
                            

                             

                        </div>
                        <div class="box-footer">
                               
                           
                             <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search"/>
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />


                        </div>

                    </div>
                </div>
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
                                        <asp:GridView ID="grdBank" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Data Found" OnRowDataBound="grdBank_RowDataBound">   
                                                                                  <Columns>
                                                                                       <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>     
                                                <asp:BoundField DataField="UserId" HeaderText="Userid" />
                                                <asp:BoundField DataField="UserName" HeaderText="User name" />         
                                           <asp:BoundField DataField="fromdate" HeaderText="from date" />                                                                                   
                                            <asp:BoundField DataField="todate" HeaderText="to date" />                                                                                   
                                                <asp:BoundField DataField="AwardName" HeaderText="Reward" />                                            
                                               <asp:BoundField DataField="targetleft" HeaderText="Required" />
                                                   <asp:BoundField DataField="targetright" HeaderText="Required" />
                                               <asp:BoundField DataField="leftid" HeaderText="Required" />
                                              <asp:BoundField DataField="leftid" HeaderText="Required" />
                                                <asp:BoundField DataField="RemainingLeft" HeaderText="RemainingLeft" />
                                            <asp:BoundField DataField="RemainingRight" HeaderText="RemainingRight" />
                                           
                                       
                                       
    <asp:BoundField DataField="achievedate" HeaderText="Achieve date" />
                                     <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                            
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