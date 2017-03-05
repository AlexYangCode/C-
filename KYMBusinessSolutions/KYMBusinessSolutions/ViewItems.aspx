<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewItems.aspx.cs" Inherits="KYMBusinessSolutions.ViewItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style10 {
            text-align: center;
        }
        .auto-style11 {
            width: 108%;
            height: 40px;
            background-color: black;
        }
    </style>
</head>
<body style="margin-left: 0px">
    <form id="form1" runat="server">
        <div class ="auto-style6">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
   <div class="auto-style11">
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
        <div class="auto-style10">
    <asp:GridView ID="ViewItemsGridView1" Runat="server"   
         
            DataKeyNames="ItemID" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical" CssClass="auto-style1" Width="1069px" ForeColor="Black">
            <FooterStyle 
              BackColor="#CCCCCC"></FooterStyle>
            <PagerStyle ForeColor="Black" 
              HorizontalAlign="Center" BackColor="#999999"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
              BackColor="Black"></HeaderStyle>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
               
            <%--    <asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>
                <asp:TemplateField HeaderText="ItemID" InsertVisible="False" SortExpression="ItemID">
                    <%--<EditItemTemplate>
                        <asp:Label ID="lblItemID" runat="server" Text='<%# Bind("ItemID") %>'></asp:Label>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblItemID" runat="server" Text='<%# Bind("ItemID") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemName" SortExpression="ItemName">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="TextBoxItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemDesc" SortExpression="ItemDesc">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="txtboxItemDesc" runat="server" Text='<%# Bind("ItemDesc") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblItemDesc" runat="server" Text='<%# Bind("ItemDesc") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="UOM" SortExpression="UOM">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxaddres" runat="server" Text='<%# Bind("UOM") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblUOM" runat="server" Text='<%# Bind("UOM") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ItemCost" SortExpression="ItemCost">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxItemCost" runat="server" Text='<%# Bind("ItemCost") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblItemCost" runat="server" Text='<%# Eval("ItemCost", "${0}") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MaterialCode" SortExpression="MaterialCode">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="txtboxMaterialCode" runat="server" Text='<%# Bind("MaterialCode") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblMaterialCode" runat="server" Text='<%# Bind("MaterialCode") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="OnHandQuantity" SortExpression="OnHandQuantity">
                    <%--<EditItemTemplate>
                        <asp:TextBox ID="txtboxOnHandQuantity" runat="server" Text='<%# Bind("OnHandQuantity") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblOnHandQuantity" runat="server" Text='<%# Bind("OnHandQuantity") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="SupplierID" SortExpression="SupplierID">
                   <%-- <EditItemTemplate>
                        <asp:TextBox ID="txtboxSupplierID" runat="server" Text='<%# Bind("SupplierID") %>'></asp:TextBox>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <div id="l1"> <asp:Label ID="lblSupplierID" runat="server" Text='<%# Bind("SupplierID") %>'></asp:Label></div>
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
    </div>
    </form>
    <%--<style type="text/css">
    .l1
{
    margin-bottom: 10px;
    margin:10px;
    padding:5px;
    width:20%;
    height:auto;
    display:block;
}
        .auto-style1 {
            margin-left: 22px;
        }
    </style>--%>
</body>
</html>


