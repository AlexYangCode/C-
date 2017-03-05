<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CBuy.aspx.cs" Inherits="KYMBusinessSolutions.CBuy" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style11 {
            width: 67px;
            height: 56px;
            margin-left: 0px;
        }
        .auto-style12 {
            background-color: #000000;
        }
        .auto-style13 {
            text-align: center;
        }
        .auto-style14 {
            margin-left: 55px;
        }
    </style>
</head>
<body style="margin-left: 0px">
  
    <form id="form2" runat="server" class="auto-style10">
        
        <div class ="auto-style12">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style11" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
        <div class="h1">
        <div class="m1">
        <div class="m1">
            <ul>
                <li><a href ="CcreateSalesOrder.aspx">Create Sales Order</a></li>
                <li><a href ="CViewSalesOrders.aspx">View Sales Orders</a></li>
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
         
                 
   
        </div>
            </div>
    
<%--<style type="text/css">
body {
    /*background-image: url();*/
    /*background-image: url('Resources/w4.jpg');*/
    background-repeat: no-repeat;
    background-attachment: fixed;
}
        

.h1 {
width:100%;
height: 40px;
background-color:black;
}
.m1
{
    /*background:url("erp1.jpg");*/
width:100%;
margin: auto;
}
.m1 ul
{
    padding: 0px;
    margin: 0px;
}
.m1 ul li
{
    width: 175px;
    /*float: left;*/
    display: inline-block; 
    text-align:center;
}
.m1 ul li a
{
font-family: Calibri;
font-size: 20px;
font-weight:bold;
color: white;
text-decoration:none;
padding: 5px 5px 10px 0px;
display:block;
}
.m1 ul li a:hover
{
    background-color:darkslategrey;
    color:white; 
    font-size:24px;
}
</style>--%>
        <br />
        <br />
    <div>
    </div> 

        <div class="auto-style13">
                
            <br /><br />
              

        <asp:GridView ID="BuyItemsGridView" Runat="server"   
         
            DataKeyNames="ItemID,ItemName,ItemDesc,UOM,ItemCost,MaterialCode,OnHandQuantity" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical" OnRowCommand="BuyItemsGridView_RowCommand" OnSelectedIndexChanged="BuyItemsGridView_SelectedIndexChanged" CssClass="auto-style14" ForeColor="Black" >
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
                <asp:TemplateField HeaderText="ItemCost$"  SortExpression="ItemCost">
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
                
                <%--<asp:CommandField ShowDeleteButton="True" ShowHeader="True" />--%>
                <asp:TemplateField ShowHeader="False"   >
                    <ItemTemplate>
                        <asp:LinkButton ID="LnkBtnBuy" runat="server" CausesValidation="False" CommandName="Select" Text="Buy"></asp:LinkButton>
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
          </div>
          </form>
    </body>
</html>
