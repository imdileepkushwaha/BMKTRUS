<%@ Page Title="Transfer E-Pin" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EPinTransfer.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
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
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">E-Pin Management</span>
                <h1>E-Pin Transfer</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; E-Pin &nbsp;/&nbsp; Transfer</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="PinRequestAdd.aspx">Request</a>
                <a class="btn-ghost" href="EPinReport.aspx">Report</a>
                <a class="btn-ghost" href="EPinTransfer.aspx">Transfer</a>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Transfer E-Pin</h3>
                </div>
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
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>

