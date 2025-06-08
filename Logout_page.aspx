<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Logout_page.aspx.vb" Inherits="Logout_page" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logged Out</title>
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #34495e;
        }
        .logout-container {
            background: #ffffff;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(52, 73, 94, 0.15);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: 700;
        }
        a {
            display: inline-block;
            margin-top: 15px;
            padding: 12px 28px;
            background-color: #2c3e50;
            color: white;
            text-decoration: none;
            font-weight: 600;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #1a2a3a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logout-container">
            <h2>You have successfully logged out.</h2>
            <a href="Login.aspx">Login Again</a>
        </div>
    </form>
</body>
</html>
