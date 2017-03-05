<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddItem.aspx.cs" Inherits="KYMBusinessSolutions.AddItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
     <link href="IMHome.css" rel="stylesheet" />
<title></title>
    <%--<style type="text/css">
        .auto-style2 {
            margin-left: 164px;
            width: 810px;
            height: 91px;
        }
        .auto-style3 {
            text-align: center;
            color: #003366;
        }
        .auto-style4 {
            text-align: justify;
            margin-left: 400px;
            width: 425px;
        }
        .auto-style5 {
            text-align: left;
            margin-left: 400px;
            width: 425px;
        }
        .auto-style6 {
            text-align: left;
            margin-left: 326px;
            width: 425px;
        }
    </style>--%>
    <style type="text/css">
        .auto-style4 {
            text-align: justify;
            margin-left: 241px;
        }
        .auto-style5 {
            margin-left: 48px;
        }
        .auto-style11 {
            margin-left: 86px;
            font-weight: bold;
        }
        .auto-style12 {
            background: #000000;
            height: 64px;
            width: 1433px;
            text-align: left;
            margin-left: 0px;
        }
        .auto-style14 {
            font-family: Calibri;
            font-size: 24px;
            display: block;
            text-align: left;
            margin-left: 397px;
        }
        .auto-style15 {
            width: 57px;
            height: 63px;
        }
        .auto-style16 {
            margin-left: 0px;
        }
        .auto-style17 {
            margin-left: 82px;
        }
        .auto-style18 {
            margin-left: 10px;
        }
        .auto-style19 {
            margin-left: 62px;
        }
        .auto-style20 {
            margin-left: 4px;
        }
    </style>
</head>
<body style="margin-left: 0px">

    <form id="form1" runat="server">
   <div class ="auto-style12">
         <img alt="" class="auto-style15" src="KYMNEW.PNG" /><strong><span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
       <div class="h1">
    <div class="m1">
            <ul>
                <li><a href ="ViewItems.aspx" class="auto-style16">View Items</a></li>
                <li><a href ="AddItem.aspx">Add Items</a></li>
                 <li><a href ="Buy.aspx">Buy Components</a></li>
                 <li><a href ="#">Order History</a>
                     <ul>
                         <li> <a href ="POHistory.aspx">Purchase Orders</a></li>
                         <li> <a href ="SOHistory.aspx">Sales Orders</a></li>
                     </ul>
                 </li>
                 <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
           </div>
            <br />
            <br />
         <br />
            <br />
         <br />
            <br />

 
        <div class="auto-style14">
            <strong>
  <asp:Label ID="Label1" runat="server" Text="Item Name : "></asp:Label>
            </strong>
<asp:TextBox ID="TextBox1" runat="server" Width="459px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="Label2" runat="server" Text="Item Description : "></asp:Label>
            </strong>
<asp:TextBox ID="TextBox2" runat="server" Height="51px" Width="459px" BorderColor="Black" CssClass="auto-style18"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="Label3" runat="server" Text="Item Cost : "></asp:Label>
            </strong>
<asp:TextBox ID="TextBox3" runat="server" BorderColor="Black" CssClass="auto-style17" Height="24px" Width="195px"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="Label4" runat="server" Text="OnHand Quantity : "></asp:Label>
            </strong>
<asp:TextBox ID="TextBox4" runat="server" BorderColor="Black" CssClass="auto-style20" Height="24px" Width="197px"></asp:TextBox><br /><br /><br />
            <strong>
    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="ADD ITEM" Width="139px" CssClass="auto-style11" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="45px" />
            </strong>
 </div>
</form>
</body>
</html>
