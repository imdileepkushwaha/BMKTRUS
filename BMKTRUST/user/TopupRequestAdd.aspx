<%@ Page Title="Deposit Request" Language="C#" MasterPageFile="Masterpage.master" AutoEventWireup="true" CodeFile="TopupRequestAdd.aspx.cs" Inherits="user_TopupRequestAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">


        function validate() {

            if (document.getElementById("<%=RDBTNAdmin.ClientID%>").checked == true) {

                if (document.getElementById("<%=ddbankaccountno.ClientID%>").value == "0") {
                    alert('Select Account');
                    document.getElementById("<%=ddbankaccountno.ClientID%>").focus();
                    return false;
                }

                if (document.getElementById("<%=ddmode.ClientID%>").value == "Select") {

                    alert('Select Paymentmode');
                    document.getElementById("<%=ddmode.ClientID%>").focus();
                    return false;
                }
                if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {

                    alert('Select plan');
                    // alert("Enter Rank No"); 
                    document.getElementById("<%=ddplan.ClientID%>").focus();
                    return false;
                }
                if (document.getElementById("<%=TxtTransactionId.ClientID%>").value == "") {

                    alert('Enter TransactionID');
                    document.getElementById("<%=TxtTransactionId.ClientID%>").focus();
                    return false;
                }

            }
            if (document.getElementById("<%=RDBtnFranchisee.ClientID%>").checked == true) {

                if (document.getElementById("<%=TxtFranchiseeUserId.ClientID%>").value == "") {
                    alert('Enter franchisee ID');
                    document.getElementById("<%=TxtFranchiseeUserId.ClientID%>").focus();
                    return false;
                }

            }

            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {

                alert('Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }



        }
    </script>
    <link href="../css/radio/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">Topup Request</h6>
            <ul class="d-flex align-items-center gap-2">
                <li class="fw-medium">
                    <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                        Dashboard
                    </a>
                </li>
                <li>/</li>
                <li class="fw-medium">Topup Request </li>
                <li>/</li>
                <li class="fw-medium">Topup Request Add</li>
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

                        <div class="box-body">
                            <%--<h4> Request Type</h4>
                        <hr />--%>
                            <div class="row" style="display: none">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:RadioButton ID="RDBtnTRecharge" runat="server" Text="Main Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RDBtnTRecharge_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:RadioButton ID="RdBtnUtility" runat="server" Text="Cash Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnUtility_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                </div>
                            </div>

                            <%-- <h4> Request To</h4>                     
                        <hr />--%>
                            <div class="row" style="display: none">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:RadioButton ID="RDBTNAdmin" runat="server" Text="Admin" GroupName="B" AutoPostBack="true" OnCheckedChanged="RDBTNAdmin_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <asp:RadioButton ID="RDBtnFranchisee" runat="server" Text="Franchisee" GroupName="B" AutoPostBack="true" OnCheckedChanged="RDBtnFranchisee_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                </div>
                            </div>
                            <%-- <hr />--%>
                            <asp:Panel runat="server" Visible="false" ID="Pnlfranchisee">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Franchisee-ID :</label>
                                            <asp:TextBox ID="TxtFranchiseeUserId" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtFranchiseeUserId_TextChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Franchisee Name :</label>
                                            <asp:TextBox ID="TxtFranchiseename" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>




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
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Plan :</label>
                                        <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <span>
                                            <label>Amount :</label>&nbsp;<asp:Label ID="lblmssg" runat="server" Style="font-weight: bold; color: red"></asp:Label></span>
                                        <asp:TextBox ID="txtamount" ReadOnly="true" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <asp:Panel runat="server" Visible="false" ID="Pnladmin">
                                <div class="row">
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
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Bank Name :</label>
                                            <asp:TextBox ID="txtdepositbank" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>IFSC Code :</label>
                                            <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                </div>


                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <asp:Image ID="QR" runat="server" Width="200px" Height="200px" />

                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Account Holder Name :</label>
                                            <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                </div>

                                <div class="row">

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
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Image :</label>
                                            <asp:FileUpload ID="ImageUpload" runat="server" />
                                        </div>
                                    </div>

                                </div>

                                <div class="row" style="display: none">


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Remark :</label>
                                            <asp:TextBox ID="txt" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Branch Name :</label>
                                            <asp:TextBox ID="txtbranchname" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Deposit Mode :</label>
                                            <asp:DropDownList ID="ddmode" runat="server" CssClass="form-control">


                                                <asp:ListItem Value="IMPS">THIRD PARTY TRANSFER</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                </div>
                            </asp:Panel>

                            <div class="row" style="display: none;">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Account Balance :</label>
                                        <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
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

    <script type="text/javascript" language="javascript">
        function CopyToClipboard() {


            /* Get the text field */
            var copyText = document.getElementById('<%=txtaccountholdername.ClientID%>');

            /* Select the text field */
            copyText.select();

            /* Copy the text inside the text field */
            document.execCommand("Copy");

            /* Alert the copied text */
            alert("Copied the text: " + copyText.value);
        }
    </script>
</asp:Content>



