<%@ page title="" language="C#" masterpagefile="franchiseemaster.master" autoeventwireup="true" inherits="FranchiseeStockDetail, App_Web_xtf1omyu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
      <div class="header-breadcumb">
                            <h6 class="header-pretitle d-none d-md-block">Franchisee management <i class="dripicons-arrow-thin-right"></i>  Franchisee Stock Detail  </h6>
                            <h2 class="header-title">  Franchisee Stock Detail  </h2>
                        </div>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <div class="row">
                            <div class="col-xl-12">                               
                                        <div class="card">
                <div class="card-body">
          
                  
                          <div class="row">
                         
                               <div class="col-md-4">
                             <div class="form-group">
                                 <label>Franchisee :</label>
                             <asp:TextBox ID="txtuserid" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                             </div>
                         </div>
                               <div class="col-md-4">
                             <div class="form-group">
                                 <label>Product :</label>
                                <asp:DropDownList ID="DDLstProduct" CssClass="form-control"  runat="server"></asp:DropDownList>
                             </div>
                         </div>
                     </div>
                         
                          
                     
                          <div class="row">
                         
                               <div class="col-md-12">
                             <div class="form-group">
                           <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                         </div>

  </div>                  
              </div>
             

                             

                              
                   
           
                  
                          <div class="row">
                         <div class="col-md-12">
                             <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataKeyNames="ProductID">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Franchisee name">
                                        <ItemTemplate>
                                            
                                            <asp:Label ID="lbluseridUsername" runat="server" Text='<%#Eval("Username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Product Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid123" runat="server" Text='<%#Eval("ProductID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Product Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluseridEmailId" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Recieve">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRecieve" runat="server" Text='<%#Eval("Recieve") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Sale">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSales" runat="server" Text='<%#Eval("Sales") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Stock Left">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluseridContactNo" runat="server" Text='<%#Eval("StockLeft") %>'></asp:Label>
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
             </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    $("[src*=PLUS]").live("click", function () {
        $(this).closest("tr").after("<tr><td></td><td colspan = '999'>" + $(this).next().html() + "</td></tr>")
        $(this).attr("src", "img/Continue1.png");
    });
    $("[src*=Continue1]").live("click", function () {
        $(this).attr("src", "img/PLUS.jpg");
        $(this).closest("tr").next().remove();
    });

</script>
       <script type="text/javascript">
           $('.form_date').datepicker({
               format: 'dd/mm/yyyy',
           }).on('changeDate', function (ev) {
               $(this).datepicker('hide');
           });
     </script>
       <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
     </script>
</asp:Content>

