<%@ page title="" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="AwardUserReport, App_Web_cpn3pybg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
            <h6 class="fw-semibold mb-0">My Reward</h6>
            <ul class="d-flex align-items-center gap-2">
                <li class="fw-medium">
                    <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                        <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                        Dashboard
                    </a>
                </li>
                <li>/</li>
                <li class="fw-medium">Reports </li>
                <li>/</li>
                <li class="fw-medium">My Reward</li>
            </ul>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Detials</h3>
                </div>

                <div class="box-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grdBank" runat="server" CssClass="table basic-border-table mb-0 dataTable" Width="100%" AutoGenerateColumns="false" EmptyDataText="No Data Found" OnRowDataBound="grdBank_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="#">
            <ItemTemplate>
                <%#Container.DataItemIndex+1 %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="LeftId" HeaderText="Left User Required" />
        <asp:BoundField DataField="RightId" HeaderText="Right User Required" />
        <asp:BoundField DataField="leftpoint" HeaderText="Left user Achieved" />
        <asp:BoundField DataField="rightpoint" HeaderText="Right user Achieved" />
        <asp:BoundField DataField="Leftbalance" HeaderText="Left user balance" />
        <asp:BoundField DataField="Rightbalance" HeaderText="Right user balance" />
        <asp:BoundField DataField="AwardName" HeaderText="Level" />
        <asp:BoundField DataField="Amount" HeaderText="Bonus Income" />
        <asp:BoundField DataField="Award" HeaderText="Reward" />
        <asp:BoundField DataField="EDUCATIONINCOME" HeaderText="Self Education" />
        <asp:BoundField DataField="CHILDEDUCATIONINCOME" HeaderText="Child Education" />
        <asp:BoundField DataField="achieved" HeaderText="Achieved" />
        <asp:BoundField DataField="Achievedate" HeaderText="Date of Achieved" />



    </Columns>
</asp:GridView>
                    </div>
                    <!-- /.box-body -->
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
