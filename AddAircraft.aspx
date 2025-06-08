<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddAircraft.aspx.vb" Inherits="AddAircraft" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Aircraft</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 480px;
            margin: 60px auto;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 50, 0.1);
            padding: 30px 40px;
            color: #333;
        }

        h2 {
            color: #1a3e72;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 700;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #1a3e72;
        }

        input[type="text"], 
        input[type="number"], 
        input[type="email"],
        textarea,
        .aspNetTextBox {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1.8px solid #9bb9d4;
            border-radius: 5px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            outline: none;
            border-color: #1a3e72;
            box-shadow: 0 0 8px rgba(26, 62, 114, 0.3);
        }

        .btnSave {
            background-color: #1a3e72;
            color: #fff;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        .btnSave:hover {
            background-color: #143056;
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
        <div class="container">
            <h2>Add New Aircraft</h2>

            <asp:Label ID="lblModel" runat="server" Text="Model:" AssociatedControlID="txtModel"></asp:Label>
            <asp:TextBox ID="txtModel" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Label ID="lblCapacity" runat="server" Text="Capacity:" AssociatedControlID="txtCapacity"></asp:Label>
            <asp:TextBox ID="txtCapacity" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer:" AssociatedControlID="txtManufacturer"></asp:Label>
            <asp:TextBox ID="txtManufacturer" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Label ID="lblStatus" runat="server" Text="Maintenance Status:" AssociatedControlID="txtStatus"></asp:Label>
            <asp:TextBox ID="txtStatus" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Button ID="btnSaveAircraft" runat="server" Text="Save Aircraft" CssClass="btnSave" OnClick="btnSaveAircraft_Click" />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
