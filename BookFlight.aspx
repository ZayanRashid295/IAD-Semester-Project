<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BookFlight.aspx.vb" Inherits="BookFlight" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book a Flight</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4fb;
            margin: 0;
            padding: 0;
            color: #2c3e50;
        }
        .container {
            max-width: 480px;
            background: #ffffff;
            margin: 50px auto;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(44, 62, 80, 0.1);
            text-align: left;
        }
        h2 {
            color: #34495e;
            font-weight: 700;
            margin-bottom: 25px;
            text-align: center;
        }
        label, asp\\:label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
            color: #34495e;
        }
        asp\\:dropDownList, select, input[type="text"], asp\\:label {
            width: 100%;
            padding: 8px 10px;
            font-size: 15px;
            margin-bottom: 20px;
            border: 1px solid #cbd6e2;
            border-radius: 6px;
            box-sizing: border-box;
        }
        asp\\:button, button {
            width: 100%;
            background-color: #2c3e50;
            color: white;
            font-weight: 600;
            border: none;
            padding: 12px 0;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        asp\\:button:hover, button:hover {
            background-color: #1a2a3a;
        }
        #<%= lblFare.ClientID %> {
            font-weight: 700;
            font-size: 18px;
            color: #2980b9;
            margin-bottom: 20px;
            display: block;
        }
        #<%= lblMessage.ClientID %> {
            font-weight: 600;
            font-size: 16px;
            color: green;
            margin-top: 20px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container">
        <h2>Book a Flight</h2>

        <asp:Label AssociatedControlID="ddlFlights" Text="Select a Flight:" runat="server" />
        <asp:DropDownList ID="ddlFlights" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFlights_SelectedIndexChanged" />

        <asp:Label AssociatedControlID="ddlSeats" Text="Select a Seat:" runat="server" />
        <asp:DropDownList ID="ddlSeats" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSeats_SelectedIndexChanged" />

        <asp:Label ID="lblFare" runat="server" Text="" />

        <asp:Button ID="btnBook" runat="server" Text="Book Flight" OnClick="btnBook_Click" />

        <asp:Label ID="lblMessage" runat="server" Text="" />
    </form>
</body>
</html>
