<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewSchedule.aspx.vb" Inherits="ViewSchedule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Schedule</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #ffffff;
            padding: 25px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .page-title {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .styled-grid {
            width: 100%;
            border-collapse: collapse;
        }

        .styled-grid th, .styled-grid td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .styled-grid th {
            background-color: #007bff;
            color: white;
        }

        .info-label {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="page-title">Your Schedule</h2>

            <asp:GridView ID="gvSchedule" runat="server" CssClass="styled-grid" AutoGenerateColumns="True">
            </asp:GridView>

            <asp:Label ID="lblMessage" runat="server" CssClass="info-label" />
        </div>
    </form>
</body>
</html>
