<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SAcceptRejectPO.aspx.cs" Inherits="KYMBusinessSolutions.SAcceptRejectPO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style10 {}
        .auto-style11 {
            width: 130%;
            height: 59px;
            background-color: black;
        }
        .auto-style12 {
            width: 194px;
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
        <div class ="auto-style11">
                <div class="m1">
            <ul>
                <li class="auto-style12"><a href ="SAcceptRejectPO.aspx">Accept or Reject Purchase Order</a></li>
                <li><a href ="SAddSupplyItems.aspx">Add New Supplier Items</a></li>
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
            </div>
        <br />
   
    
    <div class="auto-style1">
        <br />
        <asp:Label ID="space" Text="    " runat="server"></asp:Label>
  <br/>
        <br />
         <asp:GridView ID="OrdersGridView" Runat="server"           
            DataKeyNames="PONumber" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical" Width="768px" ForeColor="Black" >
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
       <%--<div id="l1"><asp:Label ID="lblItemCost" runat="server" Text='<%# Eval("ItemCost", "${0}") %>'></asp:Label></div>--%>  
                       
                 <asp:TemplateField HeaderText="UnitPrice ($)" SortExpression="UnitPrice">
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
                 <%--<asp:TemplateField HeaderText="OrderStatus" SortExpression="OrderStatus">
                   
                    <ItemTemplate>
                        <div id="l1"> <asp:Label ID="lblorderStatus" runat="server" Text='<%# Bind("orderStatus") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>--%>
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
          <asp:Button ID="ButtonAccept" runat="server" CssClass="auto-style10" OnClick="Button1_Click" Text="ACCEPT Purchase Order" Width="170px" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="29px" />

    </form>

</body>
</html>

