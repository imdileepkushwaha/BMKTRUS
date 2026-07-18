<%@ page title="Withdrawl Request Report" language="C#" masterpagefile="adminmaster.master" autoeventwireup="true" inherits="OrderProductDetail, App_Web_oae4yzc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Order Report   
        </h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Order Report  </a></li>
            <li class="active">Order Report   </li>
        </ol>
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

            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Criteria</h3>
                        </div>

                        <div class="box-body">

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>From date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txtfromdate"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>To date</label>
                                        <asp:TextBox runat="server" CssClass="form-control form_date" ID="txttodate"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

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
                        <div class="box-footer">



                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                        </div>

                    </div>
                </div>
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                        </div>
                        <style>
                            .myLabel {
                                font-weight: bold;
                            }
                        </style>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand">
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
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnApprove" CommandName="approve" OnClick="btnApprove_click" runat="server"> Approve |</asp:LinkButton>
                                                        <asp:LinkButton ID="btnReject" CommandName="reject" OnClick="btnReject_click" runat="server">Reject</asp:LinkButton>
                                                    </ItemTemplate>
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

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
    <script type="text/javascript">


        function showModal1() {
            $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#DivPhotolarge').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();

        }
    </script>
</asp:Content>

