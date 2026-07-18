<%@ page language="C#" autoeventwireup="true" inherits="user_idcard, App_Web_31wqkmxv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ID Card</title>

    <style>
        .card {
			width: 450px; /* set the width of the image */
			height: 700px; /* set the height of the image */
              position:relative;
              z-index:1;
		}
        .img {
			width: 220px; /* set the width of the image */
			height: 220px; /* set the height of the image */
			border-radius: 50%; /* add a border radius to make the image circular */
			 position:absolute; /* set the position to absolute */
			top: 70px; /* position the image above the card with some negative margin */
			left: 115px; /* center the image horizontally */
            z-index:2;
		}
        .text{
            font-family: Arial, sans-serif;
            position: absolute; /* set the position to absolute */
			top: 400px; /* position the image above the card with some negative margin */
			left: 50px; /* center the image horizontally */
            color: white;
			padding: 20px;
			font-size: 12px;
              z-index:2;
        }


        .text2{
            font-family: Arial, sans-serif;
            position: fixed; /* set the position to absolute */
			top: 530px; /* position the image above the card with some negative margin */
			left: 480px; /* center the image horizontally */
            color: purple;
			padding: 10px;
			font-size: 14px;
              z-index:2;
        }
        .name{
            position: absolute; /* set the position to absolute */
			top: 315px; /* position the image above the card with some negative margin */
			left: 35px; /* center the image horizontally */
            color: white;
			padding: 20px;
            font-size: 26px;
              z-index:2;
        }
        .post{
            position: absolute; /* set the position to absolute */
			top: 300px; /* position the image above the card with some negative margin */
			left: 150px; /* center the image horizontally */
            color: white;
			padding: 20px;
            font-size: 18px;
              z-index:2;
        }


        .logoo{
			width: 200px; /* set the width of the image */
			height: 100px; /* set the height of the image */
			border-radius: 0%; /* add a border radius to make the image circular */
			position: absolute; /* set the position to absolute */
			top: 70px; /* position the image above the card with some negative margin */
			left:600px; /* center the image horizontally */
              z-index:2;
		}
        .sign {
			width: 220px; /* set the width of the image */
			height: 50px; /* set the height of the image */
			border-radius: 10%; /* add a border radius to make the image circular */
			position: absolute; /* set the position to absolute */
			top: 430px; /* position the image above the card with some negative margin */
			left:550px; /* center the image horizontally */
              z-index:2;
		}
</style>
</head>
<body>

   <form id="form1" runat="server">
      <div class="col-md-6" style="display:none">

           <div class="col-md-6">
                             <div class="form-group">
                                 <label>Select Country :</label>
                                 <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                        </asp:DropDownList>
                             </div>
                         </div>
                             <div class="form-group">
                                 <label>Select State</label>
                                      <asp:DropDownList ID="lbl1" AutoPostBack="true" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0"> Select State</asp:ListItem>
                                        </asp:DropDownList>
                             </div>
                         </div>
                   
                          <div class="row" style="display:none">
                         <div class="col-md-6">
                             <div class="form-group">
                                 <label>Select City :</label>
                                  <asp:DropDownList ID="lbl2"  CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0"> Select City</asp:ListItem>
                                        </asp:DropDownList>
                             </div>
                         </div>
                         <div class="col-md-6" style="display:none">
                             <div class="form-group">
                                 <label>Area Name</label>
                                     <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                             </div>
                         </div>
                     </div>
    
    <asp:Image ID="ImgMyPhoto" runat="server" class="img"/>
           <img class="logoo" src="img/logo.png" alt="">
   
         <img class="card" src="img/idcardfrontNew.jpg" alt="">
        <img class="card" src="img/IDcardBackNew.jpg" alt="">
       
        <h2 class="post"> <asp:Label ID="lblusername" runat="server" Text="Label" ></asp:Label> </h2>
        <div class="text">
        <h3>User Id No. - <asp:Label ID="lbluserid" runat="server" Text="Label" ></asp:Label></h3> 
        <h3>DOJ - <asp:Label ID="lbljoiningdate" runat="server" Text="Label" ></asp:Label></h3>
        <h3>Contact No.: - <asp:Label ID="lblmobile" runat="server" Text="Label"></asp:Label></h3>
        <h3>Email Id:- <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label></h3>
       
    </div>


          <div class="text2">
      
       
    </div>

       <div style="display:none">
       <button class="btn btn-primary"> <a href="dashboard.aspx"> BACK </a></button>
           &nbsp;
           <asp:Button ID="btnprint" runat="server" Text="Print" class="btn btn-primary" OnClick="btnprint_Click" />
           </div>

    </form>
</body>
</html>
