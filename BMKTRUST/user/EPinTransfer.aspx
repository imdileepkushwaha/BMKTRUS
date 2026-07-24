<%@ Page Title="E-Pin Transfer" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EPinTransfer.aspx.cs" Inherits="admin_EPinAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-epin-transfer .bmk-section-title {
            margin: 0 0 14px;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-epin-transfer .bmk-form-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px 18px;
        }

        .bmk-epin-transfer .bmk-form-grid .form-group {
            margin-bottom: 0;
        }

        .bmk-epin-transfer .bmk-amount-highlight .form-control[disabled],
        .bmk-epin-transfer .bmk-amount-highlight .form-control:disabled {
            background: linear-gradient(180deg, #FFF9E8, #FBF9F4) !important;
            color: #002B5C !important;
            font-weight: 700;
            border-color: rgba(201, 162, 39, 0.35) !important;
        }

        .bmk-epin-transfer .box-footer {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
            padding: 18px 22px 24px !important;
            border-top: 1px solid rgba(0, 43, 92, 0.08) !important;
        }

        .bmk-epin-transfer .box-footer .btn {
            min-height: 42px;
            padding: 0 22px;
            border-radius: 10px;
            font-weight: 700;
            margin: 0;
        }

        .bmk-epin-transfer .box-footer .btn-primary {
            background: linear-gradient(135deg, #001A3A, #003D7A);
            border: 0;
            color: #fff;
        }

        .bmk-epin-transfer .box-footer .btn-primary:hover {
            background: linear-gradient(135deg, #003D7A, #001A3A);
            color: #fff;
        }

        .bmk-epin-transfer .box-footer .btn-danger {
            background: #fff;
            color: #B42318;
            border: 1px solid rgba(180, 35, 24, 0.35);
        }

        .bmk-epin-transfer .box-footer .btn-danger:hover {
            background: rgba(180, 35, 24, 0.06);
            color: #B42318;
        }

        .bmk-epin-transfer .bmk-divider {
            margin: 22px 0;
            border: 0;
            border-top: 1px solid rgba(0, 43, 92, 0.08);
        }

        @media (max-width: 767px) {
            .bmk-epin-transfer .bmk-form-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                alert('Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                alert('Enter User Name');
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddplan.ClientID%>").value == "0") {
                alert('Select Plan');
                document.getElementById("<%=ddplan.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtavailablepins.ClientID%>").value == "") {
                alert('Select Plan');
                document.getElementById("<%=txtavailablepins.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtnoofepin.ClientID%>").value == "" || parseInt(document.getElementById("<%=txtnoofepin.ClientID%>").value, 10) < 1) {
                alert('Enter No of E-Pin');
                document.getElementById("<%=txtnoofepin.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txttransferuserid.ClientID%>").value == "") {
                alert('Enter Transfer User ID');
                document.getElementById("<%=txttransferuserid.ClientID%>").focus();
                return false;
            }
            return true;
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
                <a class="btn-gold" href="EPinTransfer.aspx">Transfer</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-epin-transfer">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Transfer E-Pin</h3>
                    </div>
                    <div class="box-body">

                        <p class="bmk-section-title">From Member</p>
                        <div class="bmk-form-grid">
                            <div class="form-group">
                                <label>User Id</label>
                                <asp:TextBox ID="txtuserid" Enabled="false" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                            </div>
                            <div class="form-group">
                                <label>User Name</label>
                                <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <hr class="bmk-divider" />

                        <p class="bmk-section-title">E-Pin Details</p>
                        <div class="bmk-form-grid">
                            <div class="form-group">
                                <label>Select Amount</label>
                                <asp:DropDownList ID="ddplan" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddplan_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select Plan</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group bmk-amount-highlight">
                                <label>Available E-Pin</label>
                                <asp:TextBox ID="txtavailablepins" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" Enabled="False" />
                            </div>
                            <div class="form-group">
                                <label>No of E-Pin</label>
                                <asp:TextBox ID="txtnoofepin" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" placeholder="Enter quantity to transfer" />
                            </div>
                        </div>

                        <hr class="bmk-divider" />

                        <p class="bmk-section-title">Transfer To</p>
                        <div class="bmk-form-grid">
                            <div class="form-group">
                                <label>Transfer User ID</label>
                                <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" placeholder="Enter receiver user id" />
                            </div>
                            <div class="form-group">
                                <label>Transfer User Name</label>
                                <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" Enabled="false" />
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
