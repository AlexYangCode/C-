<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AMSOPaymentEdit.aspx.cs" Inherits="KYMBusinessSolutions.AMSOPaymentEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="AMHome.css" rel="stylesheet" />
    <style type="text/css">
     
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
            font-family: Calibri;
            font-size: 24px;
            display: block;
            text-align: left;
            margin-left: 397px;
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
        <div class="auto-style14">
        <table style="BORDER-RIGHT: 0px solid; BORDER-TOP: 0px solid; BORDER-LEFT: 0px solid; BORDER-BOTTOM: 0px solid" cellSpacing=1 cellPadding=1 border=0 >
            <tr>
            <td style="width: 180px; height: 45px">
             <strong>
                <asp:Label ID="lblSONumber" runat="server" Text="SONumber : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:DropDownList ID="ddlSONumber" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="25px">
            </asp:DropDownList>
            </td>
            </tr>
            
            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblCustomerID" runat="server" Text="Customer: "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:DropDownList ID="ddlCustomer" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="25px">
            </asp:DropDownList>
            </td>
            </tr>
            


            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblAmount" runat="server" Text="Amount : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="Amount" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>
            

            
            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblDiscount" runat="server" Text="Discount : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="Discount" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>



            
            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblTerms" runat="server" Text="Terms : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="Terms" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>

            
            
            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblTaxRate" runat="server" Text="Tax Rate : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="TaxRate" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>


            <!--<tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblFinalAmount" runat="server" Text="Final Amount : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="FinalAmount" runat="server" Width="161px" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>-->


            <tr>
            <td style="width: 180px; height: 45px">
            <strong>
                <asp:Label ID="lblStatus" runat="server" Text="Status : "></asp:Label>
            </strong>
            </td>
            <td style="width: 180px">
            <asp:TextBox ID="Status" runat="server" Width="161px" Text="Unpaid" BorderColor="Black" CssClass="auto-style19" Height="23px"></asp:TextBox>
            </td>
            </tr>

            
            <tr>
            <td style="width: 180px; height: 50px"colspan=2>
            <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" 
                Text="Update SO Payments" Width="160px" CssClass="auto-style11" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="45px"/>
            </td>
            </tr>
        </table>
 </div>
</form>
</body>
</html>
