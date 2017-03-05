<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KYMBusinessSolutions.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link href="IMHome.css" rel="stylesheet" />
    <title></title>
    <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
    <%--<style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            color: #0066FF;
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 394px;
        }
        .auto-style4 {
            width: 394px;
            text-align: right;
        }
        .auto-style5 {
            text-align: left;
        }
    </style>--%>
        <style type="text/css">
            .auto-style4 {
                width: 856px;
                margin-right: 0px;
            }
            /*.auto-style5 {
                width: 856px;
                margin-left: 171px;
                margin-right: 0px;
            }*/
            .auto-style6 {
                width: 550px;
                margin-left: 222px;
                margin-right: 0px;
            }
            /*.auto-style7 {
                margin-left: 47px;
            }*/
            .auto-style10 {
                height: 64px;
                width: 1416px;
                text-align: left;
                margin-left: 0px;
                margin-right: 0px;
                background: #000000;
            }
            .auto-style11 {
                width: 546px;
                margin-left: 361px;
                margin-right: 0px;
            }
            .auto-style12 {
                width: 15px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
          <div class ="auto-style10">
         <strong>
            <span class="auto-style4">
            <img alt="" class="auto-style5" src="KYMNEW.PNG" /></span><span class="auto-style7"> KYM BUSINESS SOLUTIONS</span>
         </strong></div>
   <div class="h1">
            <div class="m1">
            <ul>
                <li><a href ="HomePage.aspx">&nbsp;&nbsp; Home</a></li>
                <li><a href ="service.aspx">Services</a></li>
                 <li><a href ="About.aspx">About Us</a></li>
                 <li><a href ="Login.aspx">Login</a></li>
                 <li><a href ="contact.aspx">Contact</a></li>
            </ul>
            </div>
       </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <table class="auto-style11">
            <tr>
                <td><strong>USERNAME:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxUserName" runat="server" Width="189px" BorderColor="Black" Height="22px"></asp:TextBox>
                    <em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="  Please enter a Username!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </em>
                </td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td><strong>PASSWORD:</strong></td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="191px" BorderColor="Black" Height="23px"></asp:TextBox>
                    <em>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="     Please enter a Password!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </em>
                </td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td >&nbsp;</td>
                <td>
                    <asp:Button ID="ButtonLogin" runat="server" OnClick="ButtonLogin_Click" Text="LOGIN" Width="123px" BackColor="Black" BorderColor="Red" BorderWidth="3px" ForeColor="White" Height="30px" />
                </td>
                <td class="auto-style12" >&nbsp;</td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
