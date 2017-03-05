<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IMHome.aspx.cs" Inherits="KYMBusinessSolutions.IMHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    
    <style type="text/css">
        .auto-style10 {
            margin-left: 1082px;
        }
        .auto-style11 {
            margin-left: 176px;
        }
        .auto-style12 {
            background: #000000;
            height: 64px;
            width: 1420px;
            text-align: left;
        }
    </style>
    
</head>
<body>
     

    <form id="form1" runat="server">
        <div class ="auto-style12">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
   <div class="h1">

        <div class="m1">
            <ul class="auto-style8">
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
        <br />
        <div>
        <asp:GridView ID="OrdersGridView" Runat="server"           
            DataKeyNames="SONumber" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical" Width="1021px" ForeColor="Black" CssClass="auto-style11" >
            <FooterStyle 
              BackColor="#CCCCCC"></FooterStyle>
            <PagerStyle ForeColor="Black" 
              HorizontalAlign="Center" BackColor="#999999"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
              BackColor="Black"></HeaderStyle>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
               
            <%--    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>
                <asp:TemplateField HeaderText="SONumber" InsertVisible="False" SortExpression="SONumber">
                    <%--<EditItemTemplate>
                        <asp:Label ID="lblItemID" runat="server" Text='<%# Bind("ItemID") %>'></asp:Label>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblSONumber" runat="server" Text='<%# Bind("SONumber") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerID">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="TextBoxItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblCustomerName" runat="server" Text='<%# Bind("CustomerBusiness_Name") %>'></asp:Label></div>
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
                <%--<asp:CommandField ShowDeleteButton="True" ShowHeader="True" />--%>
                <asp:TemplateField HeaderText="Accept">
                   
                    <ItemTemplate>
                        <asp:CheckBox ID ="ChkBoxAccept" runat="server"   Checked="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle ForeColor="White" Font-Bold="True" 
             BackColor="#000099"></SelectedRowStyle>
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
            <br />
            </div>
        <asp:Button ID="ButtonAccept" runat="server" CssClass="auto-style10" OnClick="Button1_Click" Text="ACCEPT" Width="120px" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="29px" />
    </form>
</body>
</html>
