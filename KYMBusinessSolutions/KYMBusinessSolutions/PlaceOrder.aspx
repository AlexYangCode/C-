<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="KYMBusinessSolutions.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 611px;
            margin-left: 370px;
        }
        .auto-style2 {
            margin-left: 121px;
        }
        .auto-style10 {
            font-size: large;
        }
        .auto-style11 {
            background: #000000;
            height: 64px;
            width: 1429px;
            text-align: left;
        }
        .auto-style12 {
            margin-left: 72px;
        }
        .auto-style13 {
            margin-left: 43px;
        }
        .auto-style14 {
            margin-left: 54px;
        }
        .auto-style15 {
            margin-left: 67px;
        }
        .auto-style16 {
            margin-left: 65px;
        }
    </style>
</head>
<body style="margin-left: 0px">
    <form id="form1" runat="server">
        <div class ="auto-style11">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
   <div class="h1">
        <div class="m1">
            <ul>
                <li><a href ="ViewItems.aspx">View Items</a></li>
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
        <BR />
        <br />
        <br />
        <br />

        <div class="auto-style1">
            <strong>
  <asp:Label ID="lblItemID" runat="server" Text="ItemID : " CssClass="auto-style10"></asp:Label>
            </strong>
            <asp:TextBox ID="txtboxItemID" runat="server" Width="168px" Text ="ItemID" BorderColor="Black" BorderWidth="2px" Height="18px" CssClass="auto-style12"></asp:TextBox><br /><br />
            <strong>
  <asp:Label ID="lblItemName" runat="server" Text="Item Name : " CssClass="auto-style10"></asp:Label>
            </strong>
<asp:TextBox ID="txtboxItemName" runat="server" Width="343px" BorderColor="Black" BorderWidth="2px" Height="18px" CssClass="auto-style13" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblItemDesc" runat="server" Text="Item Description : " CssClass="auto-style10"></asp:Label>
            </strong>
<asp:TextBox ID="TxtboxItemDesc" runat="server" Height="41px" Width="343px" BorderColor="Black" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblCost" runat="server" Text="Item Cost : " CssClass="auto-style10"></asp:Label>
            </strong>
<asp:TextBox ID="TxtBoxCost" runat="server" BorderColor="Black" Height="17px" Width="267px" CssClass="auto-style14" ></asp:TextBox><br /><br />
               <strong>
<asp:Label ID="lblSupplier" runat="server" Text="Supplier : " CssClass="auto-style10"></asp:Label>
            </strong>
<asp:TextBox ID="TxtBoxSupplier" runat="server" BorderColor="Black" Height="18px" Width="268px" CssClass="auto-style15" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblquantity" runat="server" Text="Quantity : " CssClass="auto-style10"></asp:Label>
            </strong>
<asp:TextBox ID="TxtBoxQuantity" runat="server" BorderColor="Black" Height="18px" Width="267px" CssClass="auto-style16"></asp:TextBox><br /><br /><br />
    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonPlaceOrder_Click" Text="PLACE ORDER" Width="174px" CssClass="auto-style2" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="38px" />
 </div>
</form>
</body>
</html>
