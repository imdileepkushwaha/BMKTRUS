<%@ Page Title="Deposit Request" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PinRequestAdd.aspx.cs" Inherits="user_PinRequestAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddbankaccountno.ClientID%>").value == "0") {
                alert('Select Bank Account');
                document.getElementById("<%=ddbankaccountno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {

                alert('Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtTransactionId.ClientID%>").value == "") {

                alert('Enter TransactionID');
                document.getElementById("<%=TxtTransactionId.ClientID%>").focus();
                return false;
            }
          //   if (document.getElementById("<%=ddmode.ClientID%>").value == "Select") {

            //   alert('Select Paymentmode');
               //  document.getElementById("<%=ddmode.ClientID%>").focus();
            // return false;
            //}

        }

        function gettotal() {

            var Epin = 0, EpinAmount = 1650, TotalAMount = 0;
            if (document.getElementById("<%=txtnoofepin.ClientID%>").value != "") {
                Epin = document.getElementById("<%=txtnoofepin.ClientID%>").value;
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value != "") {
                EpinAmount = document.getElementById("<%=txtamount.ClientID%>").value;
            }
            var TotalAMount = Epin * EpinAmount;
            document.getElementById("<%=txttotalamount.ClientID%>").value = TotalAMount;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">E-Pin Request</h6>
            <ul class="d-flex align-items-center gap-2">
                <li class="fw-medium">
                    <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                        Dashboard
                    </a>
                </li>
                <li>/</li>
                <li class="fw-medium">E-Pin Management </li>
                <li>/</li>
                <li class="fw-medium">E-Pin Request</li>
            </ul>
        </div>
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


            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Deposit Request</h3>
                </div>
                <div class="box-body">

                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Deposit Account :</label>
                                <asp:DropDownList ID="ddbankaccountno2" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Account No</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Deposit Account No :</label>
                                <asp:TextBox ID="txtdepositaccouaantno" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Deposit Bank :</label>
                                <asp:TextBox ID="txtdepositbanssk" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>IFSC Code :</label>
                                <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Holder Name :</label>
                                <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Branch Name :</label>
                                <asp:TextBox ID="txtbranchname" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Id :</label>
                                <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Name :</label>
                                <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row" style="display: none">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Balance :</label>
                                <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Enter Amount :</label>
                                <asp:TextBox ID="txtamountaaa" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>Deposit Mode :</label>
                                <asp:DropDownList ID="ddmode" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Select">Select </asp:ListItem>
                                    <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                                    <asp:ListItem Value="RTGS">RTGS</asp:ListItem>
                                    <asp:ListItem Value="NEFT">NEFT</asp:ListItem>
                                    <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Plan</label>
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>E-Pin Amount</label>
                                <asp:TextBox ID="txtamount" onkeypress="return isNumber(event)" Text="" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>No of E-Pin :</label>
                                <asp:TextBox ID="txtnoofepin" TextMode="Number" onchange="gettotal();" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Total Amount :</label>
                                <asp:TextBox ID="txttotalamount" onkeypress="return isNumber(event)" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>

                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Select Account Type :</label>
                                <asp:DropDownList ID="ddbankaccountno" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0">Select Account</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Number :</label>
                                <asp:TextBox ID="txtdepositaccountno" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Bank Name :</label>
                                <asp:TextBox ID="txtdepositbank" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>IFSC Code :</label>
                                <asp:TextBox ID="txtifsccode1" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>



                        <div class="col-md-6">
                            <div class="form-group">
                                <label>QR Code:</label>
                                <br>
                                <asp:Image ID="QR" runat="server" Width="200px" Height="200px" />

                            </div>

                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Account Holder Name:</label>

                                <asp:TextBox ID="txtaccountholdername1" runat="server" Enabled="false" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Transaction Id:</label>

                                <asp:TextBox ID="TxtTransactionId" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Narration :</label>
                                <asp:TextBox ID="TxtNarration" runat="server" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>Remark :</label>
                                <asp:TextBox ID="TextBox4" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="col-md-6" style="display: none">
                            <div class="form-group">
                                <label>TransactionId/ChequeNo :</label>
                                <asp:TextBox ID="TxtTransactionIdaa" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">

                                <label>Upload Receipt :</label>
                                <asp:FileUpload ID="ImageUpload" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">

                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />

                </div>
            </div>


        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>



