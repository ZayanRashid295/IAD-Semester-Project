<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddPilot.aspx.vb" Inherits="AddPilot" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Pilot</title>
    <style>
        body {
            background-color: #e6ebf5;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #2c3e50;
            margin: 0; 
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background: #f7f9fc;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(44, 62, 80, 0.15);
        }
        h2 {
            text-align: center;
            color: #34495e;
            font-weight: 700;
            margin-bottom: 30px;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #3b4a65;
        }
        input[type="text"], .aspNetTextBox {
            width: 100%;
            padding: 8px 12px;
            border: 1.5px solid #a3b1c6;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus {
            border-color: #2c3e50;
            outline: none;
            box-shadow: 0 0 8px rgba(44, 62, 80, 0.3);
        }
        .btnSavePilot {
            width: 100%;
            padding: 12px 0;
            background-color: #2c3e50;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btnSavePilot:hover {
            background-color: #1a2a3a;
        }
        #<%= lblMsgPilot.ClientID %> {
            display: block;
            margin-top: 20px;
            font-weight: 600;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Pilot</h2>

            <label for="txtName">Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="aspNetTextBox" />

            <label for="txtLicense">License Number:</label>
            <asp:TextBox ID="txtLicense" runat="server" CssClass="aspNetTextBox" />

            <label for="txtExp">Experience Years:</label>
            <asp:TextBox ID="txtExp" runat="server" CssClass="aspNetTextBox" />

            <asp:Button ID="btnSavePilot" runat="server" Text="Save Pilot" CssClass="btnSavePilot" OnClick="btnSavePilot_Click" />

            <asp:Label ID="lblMsgPilot" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
