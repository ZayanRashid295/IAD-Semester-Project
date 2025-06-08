<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddAirport.aspx.vb" Inherits="AddAirport" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Airport</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e1e7ee; /* light grey background */
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 450px;
            background-color: #f9fbfd; /* almost white */
            margin: 60px auto;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            color: #2a3f66; /* dark blue text */
        }

        h2 {
            text-align: center;
            color: #1a2e59; /* deeper blue */
            margin-bottom: 25px;
            font-weight: 700;
        }

        label, span {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2a3f66;
        }

        input[type="text"], 
        .aspNetTextBox {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.5px solid #a8b9d6;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #1a2e59;
            outline: none;
            box-shadow: 0 0 8px rgba(26, 46, 89, 0.3);
        }

        .btnAddAirport {
            background-color: #1a2e59;
            color: #fff;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btnAddAirport:hover {
            background-color: #0f1b38;
        }

        #<%= lblMessage.ClientID %> {
            display: block;
            text-align: center;
            font-weight: 600;
            margin-top: 15px;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Add New Airport</h2>
        
        <label for="txtName">Name:</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="aspNetTextBox" />
        
        <label for="txtCity">City:</label>
        <asp:TextBox ID="txtCity" runat="server" CssClass="aspNetTextBox" />
        
        <label for="txtCountry">Country:</label>
        <asp:TextBox ID="txtCountry" runat="server" CssClass="aspNetTextBox" />
        
        <label for="txtCode">Code:</label>
        <asp:TextBox ID="txtCode" runat="server" CssClass="aspNetTextBox" />
        
        <asp:Button ID="btnAddAirport" runat="server" Text="Add Airport" CssClass="btnAddAirport" OnClick="btnAddAirport_Click" />
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
    </form>
</body>
</html>
