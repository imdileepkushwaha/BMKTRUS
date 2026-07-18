<%@ Page Title="Transfer E-Pin" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="EPinTransfer.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtusername.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('Enter User Name');
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {
                alert('select amount');
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtavailablepins.ClientID%>").value.replace(/^\s+|\s+$/g, "") === "") {
                alert('select amount');
                document.getElementById("<%=txtavailablepins.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Transfer E-Pin</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">E-Pin Management</a></li>
            <li class="active">Transfer E-Pin</li>
        </ol>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-util-page">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">Transfer E-Pin</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-section-title"><i class="fa fa-user"></i> From Member</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User ID</label>
                                            <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" placeholder="Sender user ID" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>User Name</label>
                                            <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="adm-section-title"><i class="fa fa-key"></i> Pin Quantity</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select Amount</label>
                                            <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select Amount</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Available E-Pins</label>
                                            <asp:TextBox ID="txtavailablepins" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" Enabled="False" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>No. of E-Pins to Transfer</label>
                                            <asp:TextBox ID="txtnoofepin" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" placeholder="Quantity" />
                                        </div>
                                    </div>
                                </div>
                                <div class="adm-section-title"><i class="fa fa-exchange"></i> To Member</div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Transfer User ID</label>
                                            <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" placeholder="Receiver user ID" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Transfer User Name</label>
                                            <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Transfer" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
