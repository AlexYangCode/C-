<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AMHome.aspx.cs" Inherits="KYMBusinessSolutions.AMHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="AMHome.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style10 {
            width: 100%;
            height: 40px;
            background-color: black;
        }
        .auto-style12 {
            font-family: Calibri;
            font-size: 24px;
            display: block;
            text-align: center;
            width: 1233px;
        }
        .auto-style13 {
            font-family: Calibri;
            font-size: 24px;
            display: block;
            text-align: center;
            margin-left: 200px;
        }
        .auto-style14 {
            font-family: Calibri;
            font-size: 24px;
            display: block;
            text-align: justify;
            width: 817px;
            margin-left: 240px;
        }
        .auto-style15 {
            margin-left: 120px;
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
   <div class="auto-style10">
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
        <br />

<p class="auto-style13">Welcome to the Account Manager Home Page</p>
            <p class="auto-style14">The Account Manager can manage purchase order payments and sales order payments.Functions within the application include:
        <br><br>View the sales order payment information
        <br>View the purchase order payment information
        <br>Add sales order payments
</p>
</form>
</body>
</html>