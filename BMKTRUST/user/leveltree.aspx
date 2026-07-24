<%@ Page Title="My Treeview" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="leveltree.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../site/css/profile.css" rel="stylesheet" />
    <style type="text/css">
        .bmk-tree .bmk-filter-row {
            display: flex;
            align-items: flex-end;
            gap: 14px;
            flex-wrap: wrap;
        }

        .bmk-tree .bmk-filter-row .field {
            flex: 1 1 220px;
            max-width: 320px;
        }

        .bmk-tree .bmk-filter-row .field label {
            display: block;
            margin-bottom: 6px;
            font-size: 0.8rem;
            font-weight: 700;
            letter-spacing: 0.04em;
            text-transform: uppercase;
            color: #5A6B7C;
        }

        .bmk-tree .bmk-filter-row .field .form-control {
            height: 42px;
            border-radius: 10px;
            border: 1px solid rgba(0, 43, 92, 0.14);
            font-weight: 600;
            color: #002B5C;
        }

        .bmk-tree .bmk-filter-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-wrap: wrap;
        }

        .bmk-tree .bmk-filter-actions .btn {
            min-height: 42px;
            padding: 0 18px;
            border-radius: 10px;
            font-weight: 700;
            border: 0;
        }

        .bmk-tree .bmk-filter-actions .btn-primary {
            background: linear-gradient(135deg, #001A3A, #003D7A);
            color: #fff;
        }

        .bmk-tree .bmk-filter-actions .btn-primary:hover {
            background: linear-gradient(135deg, #003D7A, #001A3A);
            color: #fff;
        }

        .bmk-tree .bmk-filter-actions .btn-danger {
            background: #fff;
            color: #B42318;
            border: 1px solid rgba(180, 35, 24, 0.35);
        }

        .bmk-tree .bmk-filter-actions .btn-danger:hover {
            background: rgba(180, 35, 24, 0.06);
            color: #B42318;
        }

        .bmk-tree .bmk-tree-frame-wrap {
            border-radius: 14px;
            overflow: hidden;
            border: 1px solid rgba(0, 43, 92, 0.1);
            background: linear-gradient(180deg, #F7F9FC, #FFFFFF);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.8);
        }

        .bmk-tree .bmk-tree-frame-wrap iframe {
            display: block;
            width: 100%;
            min-height: 560px;
            height: 70vh;
            border: 0;
            background: transparent;
        }

        @media (max-width: 767px) {
            .bmk-tree .bmk-filter-row .field {
                max-width: none;
                flex: 1 1 100%;
            }

            .bmk-tree .bmk-tree-frame-wrap iframe {
                min-height: 480px;
                height: 65vh;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="bmk-panel">
        <div class="bmk-profile-hero">
            <div class="bmk-profile-hero-text">
                <span class="eyebrow">My Team</span>
                <h1>My Treeview</h1>
                <p class="bmk-crumb"><a href="Dashboard.aspx">Dashboard</a> &nbsp;/&nbsp; My Team &nbsp;/&nbsp; Treeview</p>
            </div>
            <div class="bmk-profile-hero-actions">
                <a class="btn-ghost" href="UserDirectAssociates.aspx">My Direct</a>
                <a class="btn-ghost" href="DownlineReport.aspx">Downline</a>
                <a class="btn-gold" href="leveltree.aspx">Treeview</a>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="bmk-panel bmk-tree">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Search Member</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-filter-row">
                            <div class="field">
                                <label for="<%= txtuserid.ClientID %>">User Id</label>
                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Enter User Id"></asp:TextBox>
                            </div>
                            <div class="bmk-filter-actions">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Genealogy Report</h3>
                    </div>
                    <div class="box-body">
                        <div class="bmk-tree-frame-wrap">
                            <iframe id="f1" runat="server" title="Genealogy Tree"></iframe>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
