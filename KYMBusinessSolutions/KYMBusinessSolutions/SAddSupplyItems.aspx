<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SAddSupplyItems.aspx.cs" Inherits="KYMBusinessSolutions.SAddSupplyItems" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<head>
        <link href="IMHome.css" rel="stylesheet" />

<title></title>
    <style type="text/css">
        .auto-style2 {
            text-align:left;
            margin-left: 100px;
        }
        .auto-style3 {
            text-align: center;
            color: #003366;
        }
    </style>
</head>
<body>
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
                <li><a href ="SAcceptRejectPO.aspx">Accept or Reject Purchase Order</a></li>
                <li><a href ="SAddSupplyItems.aspx">Add New Supplier Items</a></li>
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
            </div>
  <h1 class="auto-style3">Add a Material Supply Item</h1>
    <form id="addsupplyitemform" runat="server">
        <div class="auto-style2">
            <strong>
  <asp:Label ID="lblSupplyItemNm" runat="server" Text="Supply Item Name : "></asp:Label>
            </strong>
<asp:TextBox ID="tbxSupplyItemNm" runat="server" Width="161px"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblSupplyItemDesc" runat="server" Text="Item Description : "></asp:Label>
            </strong>
<asp:TextBox ID="tbxSupplyItemDesc" runat="server" Height="37px" Width="339px"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblSupplyItemCost" runat="server" Text="Item Cost : "></asp:Label>
            </strong>
<asp:TextBox ID="tbxSupplyItemCost" runat="server"></asp:TextBox><br /><br />
            <strong>
<asp:Label ID="lblOnHdQty" runat="server" Text="Quantity : "></asp:Label>
            </strong>
<asp:TextBox ID="tbxOnHandQty" runat="server"></asp:TextBox><br /><br /><br />
    <asp:Button ID="btnAddItems" runat="server" OnClick="ButtonAddItems_Click" Text="Add Items" Width="81px" />
 </div>
</form>
</body>
</html>