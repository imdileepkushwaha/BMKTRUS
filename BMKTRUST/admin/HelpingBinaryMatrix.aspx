<%@ Page Title="Helping Level Matrix" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="HelpingBinaryMatrix.aspx.cs" Inherits="admin_HelpingBinaryMatrix" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
   <section class="content-header">
      <h1>
       Helping Level Matrix
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Network</a></li>
        <li class="active">Helping Level Matrix</li>
      </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>User ID</label>
                                         <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                             <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>

                    </div>
                </div>
            <div class="col-md-12">

                    <div class="box box-primary" style="border-top-color:#4cc9f0;">
                        <div class="box-header with-border">
                            <h3 class="box-title">Helping Level Matrix Tree</h3>
                        </div>
                        <div class="box-body" style="padding:0; background:#0d1728;">
                            <iframe id="f1" runat="server" style="height:980px;width:100%;border:0;display:block;"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
