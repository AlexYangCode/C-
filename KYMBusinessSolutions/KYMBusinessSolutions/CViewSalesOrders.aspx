<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CViewSalesOrders.aspx.cs" Inherits="KYMBusinessSolutions.CViewSalesOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <link href="IMHome.css" rel="stylesheet" />
    <title>View Customer Sales Orders</title>
     <style type="text/css">
         .auto-style10 {
             margin-left: 22px;
             margin-top: 0px;
         }
     </style>
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
    <div class="auto-style1">
        <br />
        <strong>
  <asp:Label id="lblCustomerID" Text="Customer ID: " runat="server"></asp:Label>
            </strong>
  <asp:TextBox id="tbxCustomerID" runat="server" Width="128px"></asp:TextBox>
        <asp:Label ID="space" Text="    " runat="server"></asp:Label>
        <asp:Button id="getCustomerOrders" OnClick="getCustomerOrders_Click" runat="server" Text="Get Orders" CssClass="auto-style10" Height="29px" Width="159px" />
  <br/>
        <br />
        <asp:DataGrid id="customerSOdatagrid"
            AutoGenerateColumns="False" CellPadding="3"
            BorderWidth="1px" BorderColor="#999999"
             GridLines="Vertical" Width="100%"
             RunAt="server" BackColor="White" BorderStyle="Solid" ForeColor="Black">
            <Columns>
              <asp:BoundColumn HeaderText="SO Number" DataField="sonumber" />
              <asp:BoundColumn HeaderText="Customer ID" DataField="customerID" />
              <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" />
              <asp:BoundColumn HeaderText="Item" DataField="itemiD" />
                
              <asp:BoundColumn HeaderText="Unit Price" DataField="UnitPrice"  />
              <asp:BoundColumn HeaderText="Quantity" DataField="quantity" />
              <asp:BoundColumn HeaderText="Order Status" DataField="orderStatus" />
                       
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" ForeColor="white" Font-Bold="true" />
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataGrid>
    </div>
    </form>

</body>
</html>
