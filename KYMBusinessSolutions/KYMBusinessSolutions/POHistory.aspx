<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="POHistory.aspx.cs" Inherits="KYMBusinessSolutions.POHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style10 {
            background: #000000;
            height: 64px;
            width: 1430px;
            text-align: left;
        }
    </style>
</head>
<body style="margin-left: 0px">
    <form id="form1" runat="server">
        <div class ="auto-style10">
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
        <br />
        <br />
        <br />
        <br />
        <div>
    <asp:GridView ID="POGridView" Runat="server"   
         
            DataKeyNames="PONumber" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical" CssClass="auto-style2" Width="927px" ForeColor="Black" style="margin-left: 99px; margin-bottom: 0px">
            <FooterStyle 
              BackColor="#CCCCCC"></FooterStyle>
            <PagerStyle ForeColor="Black" 
              HorizontalAlign="Center" BackColor="#999999"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
              BackColor="Black"></HeaderStyle>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
               
            <%--    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>
                <asp:TemplateField HeaderText="PONumber" InsertVisible="False" SortExpression="PONumber">
                    <%--<EditItemTemplate>
                        <asp:Label ID="lblItemID" runat="server" Text='<%# Bind("ItemID") %>'></asp:Label>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblPONumber" runat="server" Text='<%# Bind("PONumber") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SupplierName" SortExpression="SupplierName">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="TextBoxItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblSupplierName" runat="server" Text='<%# Bind("SupplierBusiness_Name") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="OrderDate" SortExpression="OrderDate">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="txtboxItemDesc" runat="server" Text='<%# Bind("ItemDesc") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblOrderDate" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxaddres" runat="server" Text='<%# Bind("UOM") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UnitPrice" SortExpression="UnitPrice">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxItemCost" runat="server" Text='<%# Bind("ItemCost") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice", "${0}") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxOnHandQuantity" runat="server" Text='<%# Bind("OnHandQuantity") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="orderStatus" SortExpression="orderStatus">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="txtboxSupplierID" runat="server" Text='<%# Bind("SupplierID") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <div id="l1"> <asp:Label ID="lblorderStatus" runat="server" Text='<%# Bind("orderStatus") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:CommandField ShowDeleteButton="True" ShowHeader="True" />--%>
            </Columns>
            <SelectedRowStyle ForeColor="White" Font-Bold="True" 
             BackColor="#000099"></SelectedRowStyle>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        </div>
    </form>
   <%-- <style type="text/css">
    .l1
{
    margin-bottom: 10px;
    margin:10px;
    padding:5px;
    width:20%;
    height:auto;
    display:block;
}
    body {
    
    /*background-image: url();*/
    /*background-image: url('Resources/w4.jpg');*/
    background-repeat: no-repeat;
    background-attachment: fixed;
}

.m1
{
    /*background:url("erp1.jpg");*/
/*width:100%;*/
text-align:center;
margin: 0px;
}
.m1 ul
{
    padding: 0px;
    list-style:none;
    /*margin: 0px;*/
}
.m1 ul li
{
    width: 160px;
    float: left;
    /*display: inline-block;*/ 
    text-align:center;
    margin: 1px;
}
.m1 ul li a
{
font-family: Calibri;
/*font-size: 20px;*/
/*font-weight:bold;*/
color: white;
background: #b6ff00;
text-decoration:none;
padding: 10px;
/*padding: 5px 5px 10px 0px;*/
display:block;
}
.m1 ul li a:hover
{
    background-color: #4cff00;
    color: #808080; 
    /*font-size:24px;*/
}
.m1 ul li ul
{
    display:none;
}
.m1 ul li:hover ul
{
    display: block;
}
        .auto-style1 {
            text-align: justify;
        }
        .auto-style2 {
            margin-left: 102px;
            margin-right: 0px;
        }
    </style>--%>
</body>
</html>

