<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FranchiseeInvoice.aspx.cs" Inherits="FranchiseeInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Invoice</title>
    <style>
    td, th {
      border: 1px solid black;
      padding: 8px;
    }
    
    th {
      font-weight: bold;
    }
    .center{
        text-align: center;
    }
    .color{
        background-color: grey;
    }
    </style>
</head>
<body style="width: auto">
    <form id="form1" runat="server">
    <div style="background-color: red; color: white; text-align: center; padding: 10px; font-size: 24px;">
        RETAIL INVOICE
    </div>
    <div style="text-align: center; margin-bottom: 5px; overflow: auto; position: relative;">
        <img src="logo.png" alt="" style="height: 15%; width: 15%; display: inline-block; float:left;"/>
        <div style="display: inline-block; vertical-align: middle;">
          <h2>RAANMAT MARKETING PRIVATE LIMITED</h2>
          <b>AN ISO 9001:2015 CERTIFIED COMPANY</b>
        </div>
      </div>
      
    <div style="background-color: rgb(67, 118, 246);">
        .
    </div>
    <div style="text-align: center;">
        <h4>HEAD OFFICE - #00,SHEKHPUR,MITAWALI,AGRA,UTTAR PRADESH-283201, INDIA <br>
CONTACT – 9648484584 EMAIL- SUPPORT@RAANMAT.COM WEBSITE – RAANMAT.COM </h4>
    </div>
    <div style="background-color: rgb(67, 118, 246); margin-bottom: 5px;">
        .
    </div>
    <div style="background-color: grey; text-align: center; padding: 10px; font-size: 16px; margin-bottom: 5px; border: 1px; border-color: black; border-style:double;">
       <b style="text-align: left; margin-right: 50px;"> COMPANY GSTN - 09AAMCR1468G1Z1  </b>
       <b style="text-align: right;"> COMPANY CIN - U52399UP2022PTC169910 </b>
    </div>
    <div style="display: flex;">
        <table style="border-collapse: collapse; width: 50%; max-width: 1250px; margin-right: 10px; flex: 1;">
            <tr>
              <td class="center" rowspan="3"> <b style="font-size: 24px;">MEHNDILINK</b> <br>    
               <p> ( STORE FOR RAANMAT MARKTING PVT.LTD.) </p>
               <p>  ADDRESS </p>
               <p> CONTACT – 0988888 EMAIL- DEMO@GMAIL>COM WEBSITE – RAANMAT.COM </p> </td>
            </tr>
          </table> 
        <table style="border-collapse: collapse; width: 50%; max-width: 250px; flex: 1;">
          <tr>
            <th class="color" colspan="3">INVOICE DETAIL</th>
          </tr>
          <tr>
            <td class="center">Date</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LblInvoicedate" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td class="center">Time</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LblInvoiceTime" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td class="center">Invoice Number</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LblInvoiceNumber" runat="server" Text="Label"></asp:Label></td>
          </tr>
        </table>
      </div>  
      <div style="display: flex; margin-top: 5px;">
        <table style="border-collapse: collapse; width: 50%; max-width: 500px; flex: 1; margin-right: 5px;">
            <tr>
              <th class="color" colspan="3" >USER DETAILS</th>
            </tr>
            <tr>
              <td>NAME </td>
              <td><asp:Label ID="LblDistributername" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
              <td>USER ID</td>
              <td><asp:Label ID="LbDistributerlUserid" runat="server" Text="Label"></asp:Label></td>
            </tr>
           
           
              <tr>
                <td>REG.DATE</td>
                <td><asp:Label ID="LblDistributerRegdate" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td>EMAIL </td>
                <td><asp:Label ID="LblDistributerEmail" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td>MOBILE</td>
                <td><asp:Label ID="LblDistributerMobile" runat="server" Text="Label"></asp:Label></td>
              </tr>
          </table>
          <table style="border-collapse: collapse; width: 50%; max-width: 500px; flex: 1;margin-right: 5px;">
            <tr>
              <th class="color" colspan="3">BILLING DETAIL</th>
            </tr>
           
              <tr>
                <td>ADDRESS</td>
                <td><asp:Label ID="LblBillingAddress" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                <td>POST </td>
                <td><asp:Label ID="LblBillingPost" runat="server" Text="Label"></asp:Label></td>
              </tr>
              <tr>
                  <td>CITY </td>
                  <td><asp:Label ID="LblBillingCity" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                  <td>STATE</td>
                  <td><asp:Label ID="LblBillingState" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                  <td>PIN CODE</td>
                  <td><asp:Label ID="LblBillingPincode" runat="server" Text="Label"></asp:Label></td>
                </tr>
               
          </table>
   <%--     <table style="border-collapse: collapse; width: 50%; max-width: 500px; flex: 1;">
          <tr>
            <th class="color" colspan="3">SHIPPING DETAILS</th>
          </tr>
          <tr>
            <td>NAME </td>
            <td><asp:Label ID="LblShipppingName" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td>ADDRESS</td>
            <td><asp:Label ID="LblShippingAddress" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td>POST </td>
            <td><asp:Label ID="LblShippingPost" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
              <td>CITY </td>
              <td><asp:Label ID="LblShippingCity" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
              <td>STATE</td>
              <td><asp:Label ID="LblShippingState" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
              <td>PIN CODE</td>
              <td><asp:Label ID="LblShippingPincode" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
              <td>MOBILE</td>
              <td><asp:Label ID="LblShippingMobile" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>--%>
      </div> 
<div style="margin-top: 10px;">
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
          <Columns>
                                   <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="PRODUCT NAME">
                                        <ItemTemplate>
                                            <asp:Label ID="lblproduct" runat="server" Text='<%#Eval("ProductName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="QTY">
                                        <ItemTemplate>
                                            <asp:Label ID="lblquantity" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="HCN/SAC">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHSNCODE" runat="server" Text='<%#Eval("HSNCODE") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="DP/RATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDP" runat="server" Text='<%#Eval("DP") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="RMAP">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="BV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBV" runat="server" Text='<%#Eval("BV") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TOTAL TAXABLE">
                                        <ItemTemplate>
                                              <asp:Label ID="lblPurchaseAmount" runat="server" Text='<%#Eval("PurchaseAmount") %>'></asp:Label>
                                        
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="GST">
                                        <ItemTemplate>
                                           
                                            <asp:Label ID="lblGST" runat="server" Text='<%#Eval("GST") %>'></asp:Label>(
                                              <asp:Label ID="lblGSTper" runat="server" Text='<%#Eval("GSTper") %>'></asp:Label>)
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        <asp:TemplateField HeaderText="TOTAL">
                                        <ItemTemplate>
                                              <asp:Label ID="lblTotalDP" runat="server" Text='<%#Eval("TotalDP") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   </Columns>
    </asp:GridView>
    
</div> 
         <table style="border-collapse: collapse; width: 50%; max-width: 250px; flex: 1;">
          <tr>
            <th class="color" colspan="3">PAYMENT DETAIL</th>
          </tr>
          <tr>
            <td class="center">Total Amount</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LblTTamount" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td class="center">Discount</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LBlDiscount" runat="server" Text="Label"></asp:Label></td>
          </tr>
          <tr>
            <td class="center">Payble Amount</td>
            <td class="center" style="width: 10px;">:</td>
            <td class="center"><asp:Label ID="LblRestAmount" runat="server" Text="Label"></asp:Label></td>
          </tr>
        </table>
<div style="display: flex; margin-top: 10px;">
    <table style="border-collapse: collapse; width: 50%; max-width: 1000px; margin-right: 10px; flex: 1;">
        <tr>
            <td class="center color" > <b style="font-size: 18px;">TOTAL PAYABLE AMOUNT IN WORDS  </td>
          </tr>
          <tr>
              <td style="height: 50px;" class="center "><asp:Label ID="LblPaybleamountwords" runat="server" Text="Label"></asp:Label> ONLY </td>
            </tr>
      </table> 
    <table style="border-collapse: collapse; width: 50%; max-width: 500px; flex: 1;">
      <tr>
        <th class="color" colspan="3">TOTAL PAYBLE AMOUNT IN FIGURE (INR)</th>
      </tr>
      <tr>
        <td style="height: 50px;" class="center">₹ <asp:Label ID="LblPaybleamount" runat="server" Text="Label"></asp:Label></td>
      </tr>
    </table>
  </div> 
  <div style="display: flex; margin-top: 5px;">
    <table style="border-collapse: collapse; width: 50%; max-width: 1000px; margin-right: 10px; flex: 1;">
        <tr>
            <td class="center color" > <b style="font-size: 18px;">TERMS & CONDITIONS  </td>
          </tr>
          <tr>
              <td> 
                <ul>
                    <li>SUBJECT TO AGRA JURISDICTION</li>
                    <li>GST IS NOT REFUNDABLE</li>
                    <li>RETURN YOUR PRODUCT WITHIN 30DAYS FROM THE DATE OF ACTIVATION (T&C APPLY)</li>
                </ul> </td>
            </tr>
      </table> 
    <table style="border-collapse: collapse; max-width: 500px; flex: 1;">
      <tr>
        <th class="color">AUTHORISED SIGNATORY</th>
      </tr>
      <tr>
        <td style="height: 100px;" class="center"> <br> <br>  </br></br> <b>Raanmat Marketing Private Limited</b></td>
      </tr>
    </table>
  </div> 
  <div style="text-align: center; padding: 20px; font-size: 20px; font-weight: bold;">
    THIS IS A COMPUTER GENERATED INVOICE
  </div>
    </form>
</body>
</html>
