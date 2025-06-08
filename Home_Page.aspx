<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home_Page.aspx.vb" Inherits="Home_Page" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Airline Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e6e8e6;
            margin: 0;
            padding: 0;
        }

        .home-container {
            width: 500px;
            margin: 100px auto;
            background-color: #f7f9fc;
            padding: 40px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0px 0px 10px #bbb;
        }

        .header {
            font-size: 24px;
            color: #16223a;
            margin-bottom: 10px;
        }

        .subtext {
            font-size: 16px;
            color: #444;
            margin-bottom: 30px;
        }

        .btn {
            background-color: #16223a;
            color: white;
            border: none;
            padding: 12px 25px;
            margin: 10px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1d2a4d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="home-container">
            <div class="header">Welcome to Airline Management System</div>
            <div class="subtext">We’re glad to have you onboard. Please choose an option to continue:</div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
        </div>
    </form>
</body>
</html>
