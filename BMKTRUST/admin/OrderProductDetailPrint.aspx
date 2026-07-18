<%@ Page Title="Withdrawl Request Report" Language="C#" AutoEventWireup="true" CodeFile="OrderProductDetailPrint.aspx.cs" Inherits="OrderProductDetailPrint" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
<title>Order Reciept</title>
<linK rel="stylesheet" type="text/css" href="bootstrap.css"/>
</head>
<body onload="window.print();">
    <form id="form1" runat="server">


            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                       

                        <div class="box-body">

                      
                            <div class="row" style="display:none">

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
                    

                    </div>
                </div>
                <div class="col-md-12">

                    <div class="box box-primary">
                        
                        <style>
                            .myLabel {
                                font-weight: bold;
                            }
                        </style>
                        <div class="box-body">



           <div class="row">
               <div id="bbb" style="margin-left:10px; margin-top:10px;">

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
                          
                            <div class="row" style="display:none">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
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

     
          </form>
</body>
</html>
   

