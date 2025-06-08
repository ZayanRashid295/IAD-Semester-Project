<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewBooking.aspx.vb" Inherits="ViewBooking" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Bookings</title>
    <style>
        /* General Body Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; /* Light grey background */
            margin: 0;
            padding: 0;
        }

        /* Container for the page content */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: white; /* White background for content */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Shadow effect for the container */
        }

        /* Title */
        h2 {
            color: #2c3e50; /* Dark Blue */
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* GridView Styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #ccc; /* Light grey border */
            text-align: center;
        }

        .gridview th {
            background-color: #3498db; /* Blue */
            color: white;
        }

        /* Message Label */
        .message {
            color: #e74c3c; /* Red */
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Your Bookings</h2>
            
            <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="True" CssClass="gridview"></asp:GridView>
            
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
