<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AMSOPaymentList.aspx.cs" Inherits="KYMBusinessSolutions.AMSOPaymentList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="AMHome.css" rel="stylesheet" />
    <style type="text/css">
     
         .auto-style10 {
            text-align: center;
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
        .auto-style13 {
             font-family: Calibri;
             font-size: 24px;
             display: block;
             text-align: justify;
             margin-left: 400px;
         }
        .auto-style14 {
            text-align: center;
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
<body>
<form id="form1" runat="server">
        <div class ="auto-style6">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong>
        </div>
        <div class ="h1">
        <div class="m1">
            <ul>
                <li><a href ="AMPOPaymentList.aspx">Purchase Payments</a></li>
                <li><a href ="AMPOPaymentAdd.aspx">Add PO Payments</a></li>
                <li><a href ="AMSOPaymentList.aspx">Sales Payments</a></li>
                <li><a href ="AMSOPaymentAdd.aspx">Add SO Payments</a></li>
                <!--<li><a href ="AMReport.aspx">Report</a></li>-->
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
        </div>
        
        <br />
        
        <br />
        <p class="auto-style13">
        <strong>Welcome to the Account Manager Page</strong>
        </p>
        <br>
        <div class="auto-style10">
    <asp:GridView ID="SOGridView" Runat="server"   
         
            DataKeyNames="SONumber" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical"  ForeColor="Black">
             <FooterStyle 
              BackColor="#CCCCCC"></FooterStyle>
            <PagerStyle ForeColor="Black" 
              HorizontalAlign="Center" BackColor="#999999"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
              BackColor="Black"></HeaderStyle>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>          
                <asp:TemplateField HeaderText="Invoice Number" InsertVisible="False" SortExpression="SOInvoiceNum">
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblSOInvoiceNum" runat="server" Text='<%# Bind("SOInvoiceNum") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SO Number" InsertVisible="False" SortExpression="SONumber">
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblSONumber" runat="server" Text='<%# Bind("SONumber") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CustomerName" SortExpression="CustomerName" ControlStyle-Width="180px">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblCustomerName" runat="server" Text='<%# Bind("CustomerBusiness_Name") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Amount ($)" SortExpression="Amount">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount", "${0}") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Discount (%)" SortExpression="Discount">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblDiscount" runat="server" Text='<%# Bind("Discount") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Terms" SortExpression="Terms">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblTerms" runat="server" Text='<%# Bind("Terms") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="TaxRate (%)" SortExpression="TaxRate">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblTaxRate" runat="server" Text='<%# Bind("TaxRate") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="FinalAmount ($)" SortExpression="finalAmount">
                    <ItemTemplate>
                        <div id="l1"> <asp:Label ID="lblfinalAmount" runat="server" Text='<%# Bind("FinalAmount", "${0}") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status " SortExpression="status">
                    <ItemTemplate>
                        <div id="l1"> <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label></div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="SOInvoiceNum" DataNavigateUrlFormatString="AMSOPaymentEdit.aspx?SOInvoiceNum={0}" HeaderText="" Text="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
                <asp:HyperLinkField DataNavigateUrlFields="SOInvoiceNum" DataNavigateUrlFormatString="AMSOPaymentDel.aspx?SOInvoiceNum={0}" HeaderText="" Text="Delete" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
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
