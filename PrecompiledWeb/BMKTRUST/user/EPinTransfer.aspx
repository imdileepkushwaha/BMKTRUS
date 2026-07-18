<%@ page title="Transfer E-Pin" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="admin_EPinAdd, App_Web_xqtlfgzg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function validate() {

            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {

                alert('Enter User Id');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtuserid.Text%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {

                alert('Enter User Name');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {

                alert('Select Plan');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtavailablepins.ClientID%>").value == "") {

                alert('Select Plan');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtavailablepins.ClientID%>").focus();
                return false;
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">E-Pin Tranfer</h6>
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
                <li class="fw-medium">E-Pin Tranfer</li>
            </ul>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="box box-primary">

                <div class="box-body">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>User Id :</label>
                                <asp:TextBox ID="txtuserid" Enabled="false" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
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
                                <label>Select Amount :</label>
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Available E-Pin :</label>
                                <asp:TextBox ID="txtavailablepins" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" Enabled="False" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>No of E-Pin :</label>
                                <asp:TextBox ID="txtnoofepin" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Transfer User ID :</label>
                                <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Transfer User Name :</label>
                                <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">



                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />

                </div>



            </div>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>

