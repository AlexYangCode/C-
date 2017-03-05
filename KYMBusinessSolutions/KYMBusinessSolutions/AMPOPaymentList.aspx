<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AMPOPaymentList.aspx.cs" Inherits="KYMBusinessSolutions.AMPOPayment" %>

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
        <asp:GridView ID="POGridView" Runat="server"   
         
            DataKeyNames="PONumber" AutoGenerateColumns="False" 
             BorderWidth="1px" BackColor="White" 
             CellPadding="3" cellWidth="20px" BorderStyle="Solid" 
             BorderColor="#999999" GridLines="Vertical"  ForeColor="Black" 
            style="margin-left: 81px">
             <FooterStyle 
              BackColor="#CCCCCC"></FooterStyle>
            <PagerStyle ForeColor="Black" 
              HorizontalAlign="Center" BackColor="#999999"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
              BackColor="Black"></HeaderStyle>
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>          
                <asp:TemplateField HeaderText="Invoice Number" InsertVisible="False" SortExpression="POInvoiceNum">
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblPOInvoiceNum" runat="server" Text='<%# Bind("POInvoiceNum") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PO Number" InsertVisible="False" SortExpression="PONumber">
                    <ItemTemplate>
                        <div id="l1">
                        <asp:Label ID="lblPONumber" runat="server" Text='<%# Bind("PONumber") %>'> </asp:Label> </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="SupplierName" SortExpression="SupplierName">
                    <ItemTemplate>
                         <div id="l1"><asp:Label ID="lblSupplierName" runat="server" Text='<%# Bind("SupplierBusiness_Name") %>'></asp:Label></div>
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
                 <asp:HyperLinkField DataNavigateUrlFields="POInvoiceNum" DataNavigateUrlFormatString="AMPOPaymentEdit.aspx?POInvoiceNum={0}" HeaderText="" Text="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:HyperLinkField>
                 <asp:HyperLinkField DataNavigateUrlFields="POInvoiceNum" DataNavigateUrlFormatString="AMPOPaymentDel.aspx?POInvoiceNum={0}" HeaderText="" Text="Delete" >
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
        <br>
        <div class="auto-style10">
    </div>
    <div class="auto-style1">
        <br />
        <br />
        <asp:Button ID="ButtonLogin" runat="server" OnClick="Report_Click" 
                Text="Report" Width="160px" CssClass="auto-style11" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="45px"/>
    </div>
</form>
</body>
</html>
