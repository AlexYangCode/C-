<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SHome.aspx.cs" Inherits="KYMBusinessSolutions.SHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <link href="IMHome.css" rel="stylesheet" />
    <title>Supplier Home</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style10 {
            width: 213px;
        }
        .auto-style11 {
            width: 130%;
            height: 59px;
            background-color: black;
        }
    </style>
</head>


<body>
    <form id="form2" runat="server">
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
                <li class="auto-style10"><a href ="SAcceptRejectPO.aspx">Accept or Reject Purchase Order</a></li>
                <li><a href ="SAddSupplyItems.aspx">Add New Supplier Items</a></li>
                <li><a href ="Login.aspx">Sign Out</a></li>
            </ul>
        </div>
            </div>
        <br />
        <br />
        <div class="auto-style1">
    
        <strong>Welcome to the Supplier Home Page</strong></div>
    </form>
</body>
</html>