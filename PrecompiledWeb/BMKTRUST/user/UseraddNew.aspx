<%@ page title="" language="C#" masterpagefile="~/user/MasterPage.master" autoeventwireup="true" inherits="user_UseraddNew, App_Web_54bxckj4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

	 <link href="../css/radio/style.css" rel="stylesheet" />
    <script type="text/javascript">
    function validate() {
        if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {

               alert('Enter Sponser Id');
               document.getElementById("<%=txtsponserid.ClientID%>").focus();
               return false;
           }
		
		
		     if (document.getElementById("<%=txtepin.ClientID%>").value == "") {

               alert('Enter Epin');
               document.getElementById("<%=txtepin.ClientID%>").focus();
               return false;
           }
			 
			 
			 
           if (document.getElementById("<%=txtname.ClientID%>").value == "") {

               alert('Enter First Name');
               document.getElementById("<%=txtname.ClientID%>").focus();
               return false;
           }
        if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {

            alert('Enter Mobile');
            document.getElementById("<%=txtmobile.ClientID%>").focus();
               return false;
           }
           
           // if (validatephonenumber(document.getElementById("<%=txtmobile.ClientID%>").value) == false) {
               //alert('Invalid Mobile No');
            // document.getElementById("<%=txtmobile.ClientID%>").focus();
             // return false;
           // }
           if (document.getElementById("<%=txtemail.ClientID%>").value == "") {

               alert('Enter Email');
               document.getElementById("<%=txtemail.ClientID%>").focus();
               return false;
           }

           if (validateemail(document.getElementById("<%=txtemail.ClientID%>").value) == false) {

               alert('Invalid Email ID');
               document.getElementById("<%=txtemail.ClientID%>").focus();
               return false;
           }
           if (document.getElementById("<%=ddgender.ClientID%>").value == "0") {


               if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {
                   alert('Select Country');
                   document.getElementById("<%=ddcountry.ClientID%>").focus();
                   return false;
               }

               if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {
                   alert('Select State');
                   document.getElementById("<%=ddstate.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=ddcity.ClientID%>").value == "0") {

                   alert('Select City');
                   document.getElementById("<%=ddcity.ClientID%>").focus();
                   return false;
               }
               //     if (document.getElementById("<%=ddcity.ClientID%>").value == "") {

               //          alert('Select City');
               //         document.getElementById("<%=ddcity.ClientID%>").focus();
               //         return false;
               // }
               //      if (document.getElementById("<%=txtareaname.ClientID%>").value == "") {

               //        alert('Enter Area');
               //      document.getElementById("<%=txtareaname.ClientID%>").focus();
               //           return false;
               //  }



               //      if (document.getElementById("<%=txtpincode.ClientID%>").value == "") {

               //         alert('Enter Pincode');
               //         document.getElementById("<%=txtpincode.ClientID%>").focus();
               //              return false;
               //     } 
               if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {

                   alert('Enter Password');
                   document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                   alert('Enter Confirm Password');
                   document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {

                   alert('Password Not Match');
                   document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                   return false;
               }
           }


           function validatephonenumber(inputtxt) {
               var phoneno = /^([6-9]{1})([0-9]{9})$/;
               if (inputtxt.match(phoneno)) {
                   return true;
               }
               else {
                   return false;
               }
           }

           function validateemail(inputtxt) {
               var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
               if (inputtxt.match(email)) {
                   return true;
               }
               else {
                   return false;
               }
           }
       }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
               
                     <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="../img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress><br><br>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                         <div class="row" style="color:white">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add User</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
				 <div class="box-body">
                        <div class="row">
                            <!--Body-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server" placeholder="Sponsor ID"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                                <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server" placeholder="Sponsor Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            	<div class="col-md-6" style="Display:none;">
        <div class="form-group">
						    <div class="input-group">
            <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
            <asp:TextBox ID="txtparentid" AutoPostBack="true" CssClass="form-control" runat="server" OnTextChanged="txtparentid_TextChanged" placeholder="Parental ID"></asp:TextBox>
        </div>
						 </div>
    </div>
							     <div class="col-md-6" style="Display:none;">
                                <div class="form-group">
									 <div class="input-group">
                                    <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                    <asp:TextBox ID="txtparentname" Enabled="false" CssClass="form-control" runat="server" placeholder="Parental Name"></asp:TextBox> </div>
                                </div>
                            </div>
						
                        
                        </div>

                       
                        <div class="form-row" style="display: none;">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>

                                                        <div class="row"  >
    <!--Body-->
    <div class="col-md-6">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon bg-light"><i class="fa fa-key text-primary"></i></div>
                <asp:TextBox ID="txtepin" CssClass="form-control" runat="server" placeholder="E-Pin" AutoPostBack="true" OnTextChanged="txtepin_TextChanged"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon bg-light"><i class="fa fa-inr text-primary"></i></div>
                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server" placeholder="Amount"></asp:TextBox>
            </div>
        </div>
</div>
</div>

                        <asp:Panel ID="pnlpin" Visible="false" runat="server">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Plan :</label>
                                        <asp:DropDownList ID="DDLstPlan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
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
                                        <label>Select E-Pin :</label>
                                        <asp:DropDownList ID="ddepin" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                             
                        </asp:Panel>
                       <div class="row">
                            <div class="col-md-1">
                                <div class="form-group custom-radio">
                                    <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group custom-radio">
                                    <asp:RadioButton ID="RdBtnRight" runat="server" Text="Middle" GroupName="B" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group custom-radio">
    <asp:RadioButton ID="RdbtnLast" runat="server" Text="Right" GroupName="B" />
</div>
                            </div>
                        </div> 

                        <div class="row">
                            <!--Body-->
							<div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            	<div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtLastname" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

             

                                    <div class="col-md-6" style="display:none">
                            <div class="form-group">
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>
                                 <div class="col-md-3" style="display:none">
                            <div class="form-group">
                                <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>

                              <div class="col-md-3" style="display:none">
                            <div class="form-group">
                                <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0"> Select City</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>
                            	<div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtage" CssClass="form-control" runat="server" placeholder="Age"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>


                             <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:DropDownList ID="DropDowncourse" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Course</asp:ListItem>
                                            <asp:ListItem Value="Vaidicmathsmarathi">Vaidik  Maths Marathi</asp:ListItem>
                                            <asp:ListItem Value="vaidicmathsenglish">Vaidik  Maths English</asp:ListItem>
                                             <asp:ListItem Value="fingerabacus">Finger Abacus</asp:ListItem>
                                             <asp:ListItem Value="aurachakra">Aura & Chakra report </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                                              <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                        <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Customer  Mobile No"></asp:TextBox>
                                    </div>
                                </div>
                            </div>  
                                  <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-envelope text-primary"></i></div>
                                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Customer Email"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                               <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-envelope text-primary"></i></div>
                                        <asp:TextBox ID="txttelegramnumber" CssClass="form-control" runat="server" placeholder="Telegram Number"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                               <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-envelope text-primary"></i></div>
                                        <asp:TextBox ID="txttelegramname" CssClass="form-control" runat="server" placeholder="Telegram Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                                  <div class="col-md-6" style="display:none;">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtaccountholdername" placeholder= "Account Holder Name" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div> <br>
                              <div class="col-md-6" style="display:none;">
                                     <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtaccountno" placeholder= "Account Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                             </div>
                                           <br>
                             <div class="row">
                                  <div class="col-md-6"  style="display:none;">
                                    <div class="input-group">
                                       <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                        <asp:TextBox ID="txtifsccode" Placeholder="IFSC Code" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div> 
                                               <div class="col-md-6"  style="display:none;">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"> 
                                             <asp:ListItem Value="0"> Select Bank</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                    
                        </div>

                        <div class="row" style="display:none">
                            <!--Body-->

                        </div>
                           <div class="row" style="display:none">
                             <div class="col-md-12" >
                            <div class="form-group">
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                            </div>

                        </div>
                                
                              </div>
                          <div class="row">
                               
                                
                             

                               <div class="col-md-6"  style="display:none;">
                                        <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                            <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control" placeholder="Pan Card Number"></asp:TextBox>
                                        </div>
                                    </div>
                              </div>
										   </div>
                        <div class="row">
                         
                          
                                  <div class="col-md-6"  style="display:none;">
                            <div class="form-group">
                                <asp:TextBox ID="txtadhar" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Placeholder="Area" Visible="false"></asp:TextBox>
                            </div>
                                     </div>
                        </div>      
                                           
                                                  
                         <div class="row"  style="display:none;">
                             <div class="col-md-6">
                                        <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                            <asp:TextBox ID="txtnomineename" placeholder= "Nominee Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div> 
                                    <div class="col-md-6">
                                     <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                            <asp:TextBox ID="txtnomineerelation" placeholder= "Nominee Relation" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                 <div class="col-md-6" style="display:none;">
                            <div class="form-group">
                                <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" Placeholder="Area" Visible="false"></asp:TextBox>
                            </div>
                                     </div>
                        </div>
                       
                                         
                        <div class="row">
                            <!--Body-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-eye text-primary"></i></div>
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-eye text-primary"></i></div>
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    

                        <div class="form-row" style="display: none;">
                            <div class="form-group col-md-6">
                            </div>
                            <div class="form-group col-md-6">
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlYear" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlMonth" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlDay" CssClass="form-control" ToolTip="Day" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12" style="margin-bottom: 0 !important;">
                            </div>
                        </div>
						
					<br><br><br>

                                            <div class="row" style=Display:none;">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        
                                    <p style="color:#fff">
                                        <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged"  runat="server"  /> 
                                        I agree to the<a href="termscondition.pdf" class="thembo text-primary" target="_blank">Terms & Condition</a></p>
                                        </div>
                                    </div>
                                 </div>
                        <div class="row">
							
							<div class="col-sm-5"></div>
                            <div class="col-sm-2">
                                <div class="text-center">

                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary btn-block rounded-0 py-2" runat="server" Text="Submit" OnClick="btnSubmit_Click"  Enabled="false"  />
                                </div>
                            </div>
							
							
							<div class="col-sm-5"></div>
                        </div>
    </div>
</div>
												 </div>
                            
                    </ContentTemplate>
                </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>

