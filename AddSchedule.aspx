<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddSchedule.aspx.vb" Inherits="AddSchedule" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Schedule</title>
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
        .btnSaveSchedule {
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
        .btnSaveSchedule:hover {
            background-color: #1a2a3a;
        }
        #<%= lblMessage.ClientID %> {
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
            <h2>Add New Schedule</h2>

            <label for="txtFlightDate">Flight Date:</label>
            <asp:TextBox ID="txtFlightDate" runat="server" CssClass="aspNetTextBox" />

            <label for="txtDepartureTime">Departure Time:</label>
            <asp:TextBox ID="txtDepartureTime" runat="server" CssClass="aspNetTextBox" />

            <label for="txtArrivalTime">Arrival Time:</label>
            <asp:TextBox ID="txtArrivalTime" runat="server" CssClass="aspNetTextBox" />

            <asp:Button ID="btnSaveSchedule" runat="server" Text="Save Schedule" CssClass="btnSaveSchedule" OnClick="btnSaveSchedule_Click" />

            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
