<%@ Page Title="Withdrawl Request Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="OrderProductDetailNew.aspx.cs" Inherits="OrderProductDetailNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">  
 
    function printPartOfPage(elementId) {
        var printContent = document.getElementById(elementId);
        var windowUrl = 'about:blank';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');
        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }
   
</script>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Order Report   
        </h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Order Report  </a></li>
            <li class="active">Order Report   </li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Criteria</h3>
                        </div>

                        <div class="box-body">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>From date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txtfromdate"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>To date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txttodate"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Status</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Deliver</asp:ListItem>
                                              <asp:ListItem>Cancel</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>


                        </div>
                        <div class="box-footer">



                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                             <asp:LinkButton ID="LinkButtonSearchClient" runat="server" 
    NavigateUrl='<%# String.Format("OrderProductDetailPrint.aspx?PurchaseId={0}", Eval("PurchaseID"))%>' 
    Text=''></asp:LinkButton>
          <a href="#" target="_blank" class="btn btn-default" id="rt" runat="server"  ><i class="fa fa-print"  style="color:white;"></i> Print</a>

                        </div>

                    </div>
                </div>
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                        </div>
                        <style>
                            .myLabel {
                                font-weight: bold;
                            }
                        </style>
                        <div class="box-body">



           <div class="row">
               <div id="bbb">

                   <asp:Repeater ID="dlCustomers" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                    <ItemTemplate>
                                        <div class="col-md-6" style="border: 1px solid">
                                            <div class="col-item">
                                               
                                          <p>
                                             <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label><br />
                                           <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label><br />
                                              <asp:Label ID="lblUserName" runat="server" Text='<%#Eval("UserName") %>'></asp:Label><br />
                                             <b> Father's Name : </b><asp:Label ID="Label3" runat="server" Text='<%#Eval("FatherName") %>'></asp:Label><br />
                                             <b> Sur Name : </b><asp:Label ID="lblsurname" runat="server" Text='<%#Eval("surname") %>'></asp:Label><br />
                                           <b> Shipping Address :  </b>  <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("ShippingAddress") %>'></asp:Label><br />
                                              <b> State Name :  </b>  <asp:Label ID="lblstatename" runat="server" Text='<%#Eval("statename") %>'></asp:Label><br />
                                              <b> City Name :  </b>  <asp:Label ID="lblcityname" runat="server" Text='<%#Eval("cityname") %>'></asp:Label><br />
                                              <b> Area :  </b>  <asp:Label ID="lblShippingArea" runat="server" Text='<%#Eval("shippingArea") %>'></asp:Label><br />
                                             <b> Pin Code :  </b>   <asp:Label ID="lblshippingpincode" runat="server" Text='<%#Eval("shippingpincode") %>'></asp:Label><br />
                                                <b> Mobile No. :  </b>  <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>,   <asp:Label ID="lblMobile2" runat="server" Text='<%#Eval("MobileSecond") %>'></asp:Label><br />


                                          </p>

                                                <p> From</p>

                                                <p>GROW STAR SMART MARKETING PVT LTD <br />
                                                    HUBLI<br />
                                                 <b> Mobile No.</b>   9113094314<br />

                                                    <h4>APPROVE ORDER</h4>
                                                </p>
                                            </div>


                                            <%-- <asp:Image ID="Image1" runat="server" ImageUrl= Height="200px" Width="200px"  /><br />--%>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                   </div>
           </div>

                            <div class="box-footer">
                               
                           
                        
                        </div>

                            
                            <div class="row" style="display:none">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                        <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                                      
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Date of Request">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcreatingdate" runat="server" Text='<%#Eval("entrydate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Product">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblproductname" runat="server" Text='<%#Eval("productname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="User Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                      
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="User Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Mobile">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("mobile") %>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile second">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblmobiles" runat="server" Text='<%#Eval("MobileSecond") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Father name">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblfathername" runat="server" Text='<%#Eval("fathername") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Surname">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblSurname" runat="server" Text='<%#Eval("Surname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                               <asp:TemplateField HeaderText="Address Detail">
                                                    <ItemTemplate>
                                                        <label class="myLabel">Address - </label>
                                                        <asp:Label ID="lblbankname" runat="server" Text='<%#Eval("ShippingAddress") %>'></asp:Label><br />
                                                        <label class="myLabel">Area. - </label>
                                                        <asp:Label ID="lblaccountno" runat="server" Text='<%#Eval("ShippingArea") %>'></asp:Label><br />
                                                        <label class="myLabel">Pincode - </label>
                                                        <asp:Label ID="lblShippingPincode" runat="server" Text='<%#Eval("ShippingPincode") %>'></asp:Label><br />
                                                          <label class="myLabel">City - </label>
                                                        <asp:Label ID="LabelShippingCity" runat="server" Text='<%#Eval("ShippingCity") %>'></asp:Label><br />
                                                          <label class="myLabel">State - </label>
                                                        <asp:Label ID="Labelstate" runat="server" Text='<%#Eval("Statename") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="Approve Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblreleasedate" runat="server" Text='<%#Eval("approvedate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                             
                                              
                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               
                                                <asp:TemplateField HeaderText="Comment">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltransactionid" runat="server" Text='<%#Eval("TransactionID") %>'></asp:Label>
                                                        <asp:TextBox ID="txttransactionid" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnApprove" CommandName="approve" OnClick="btnApprove_click" runat="server"> Approve |</asp:LinkButton>
                                                        <asp:LinkButton ID="btnReject" CommandName="reject" OnClick="btnReject_click" runat="server">Reject</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                        </div>
                    </div>
                </div>
                <div id="DivPhotolarge" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-body">

                                <div class="form-group">

                                    <asp:Image ID="ImageLarge" runat="server" Width="570px" Height="400px" />
                                </div>

                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
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
    <script type="text/javascript">


        function showModal1() {
            $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#DivPhotolarge').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();

        }
    </script>
</asp:Content>

