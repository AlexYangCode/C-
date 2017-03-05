<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="KYMBusinessSolutions.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="IMHome.css" rel="stylesheet" />
    <title></title>

    <%--<%--<style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            font-size: large;
            width: 167px;
            height: 39px;
        }
        .auto-style6 {
            height: 45px;
        }
        .auto-style7 {
            font-size: large;
            width: 167px;
            height: 46px;
        }
    </style>--%>

    <style type="text/css">
        .auto-style14 {
            background: #000000;
            height: 64px;
            width: 1500px;
            text-align: left;
            margin-left: 0px;
        }
        .auto-style15 {
            text-align: center;
        }
        .auto-style16 {
            width: 136%;
            height: 40px;
            background-color: black;
            text-align: center;
        }
    </style>

</head>
<body style="margin-left: 0px">
    <form id="form1" runat="server">
        <div class ="auto-style14">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /> </span>
            <span class="auto-style7">
            KYM BUSINESS SOLUTIONS</span>
         </strong></div>
        <div class="auto-style16">
     <div class="m1">
            <ul class="auto-style8">
                <li><a href ="#">&nbsp;&nbsp; Home</a></li>
                <li><a href ="service.aspx">Services</a></li>
                 <li><a href ="About.aspx">About Us</a></li>
                 <li><a href ="Login.aspx">Login</a></li>
                 <li><a href ="contact.aspx">Contact</a></li>
            </ul>
            
        </div>
            <br />
            <br />
            <br />
            <div class="P">
                <strong><span class="p">
                <div class="auto-style15">
                PLEASE SELECT A ROLE</div>
                </span><span class="auto-style4"><br />
                <br />
                </span></strong>
            &nbsp;</div>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SUPPLIER" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="41px" Width="91px" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="INVENTORY MANAGER" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="43px" Width="178px" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="ACCOUNT MANAGER" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="42px" Width="171px" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="CUSTOMER" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="37px" Width="98px" />
        </div>
    </form>
</body>
</html>
