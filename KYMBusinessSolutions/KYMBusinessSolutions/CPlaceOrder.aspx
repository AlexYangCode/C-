<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CPlaceOrder.aspx.cs" Inherits="KYMBusinessSolutions.CPlaceOrder" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="auto-style6">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
        <div class ="h1">
                <div class="m1">
            <ul>
                <li><a href ="CBuy.aspx">Create Sales Order</a></li>
                <li><a href ="CViewSalesOrders.aspx">View Sales Orders</a></li>
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
            </div>
        <br />
        <br />
        <br />


        <div class="auto-style2">
            <strong>
  <asp:Label ID="lblCustomerID" runat="server" Text="CustomerID : "></asp:Label>
            </strong>
            <asp:TextBox ID="tbxCustomerID" runat="server" backcolor="lightgray" Width="161px" ></asp:TextBox><br /><br />

            <strong>
  <asp:Label ID="lblItemID" runat="server" Text="ItemID : "></asp:Label>
            </strong>
            <asp:TextBox ID="txtboxItemID" runat="server" Width="161px" ></asp:TextBox><br /><br />
            <strong>
  <asp:Label ID="lblItemName" runat="server" Text="Item Name : "></asp:Label>
            </strong>
<asp:TextBox ID="txtboxItemName" runat="server" Width="161px" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblItemDesc" runat="server" Text="Item Description : "></asp:Label>
            </strong>
<asp:TextBox ID="TxtboxItemDesc" runat="server" Height="37px" Width="339px" ></asp:TextBox><br /><br />
            <strong>
            <asp:Label ID="LblUOM" runat="server" Text="UOM : "></asp:Label>
            </strong>
<asp:TextBox ID="TextBoxUOM" runat="server" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblCost" runat="server" Text="Item Cost : "></asp:Label>
            </strong>
<asp:TextBox ID="TxtBoxCost" runat="server" ></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblquantity" runat="server" Text="Quantity : "></asp:Label>
            </strong>
<asp:TextBox ID="TxtBoxQuantity" runat="server"></asp:TextBox><br /><br /><br />
    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonPlaceOrder_Click" Text="Place Order" Width="81px" />
 </div>
</form>
       </body>
</html>