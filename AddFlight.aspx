<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddFlight.aspx.vb" Inherits="AddFlight" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Flight</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            margin: 0; padding: 0;
            color: #2e3e5c;
        }
        .container {
            max-width: 480px;
            margin: 40px auto;
            background-color: #f9fbfd;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(46, 62, 92, 0.15);
            padding: 30px 35px;
        }
        h2 {
            text-align: center;
            color: #1a2a5a;
            font-weight: 700;
            margin-bottom: 28px;
            letter-spacing: 1.1px;
        }
        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
            color: #3a4a6a;
        }
        input[type="text"], select, .aspNetTextBox, .aspNetDropDownList {
            width: 100%;
            padding: 8px 12px;
            margin-bottom: 20px;
            border: 1.5px solid #9bb9d4;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.25s ease;
        }
        input[type="text"]:focus, select:focus {
            border-color: #1a2a5a;
            outline: none;
            box-shadow: 0 0 7px rgba(26, 42, 90, 0.3);
        }
        .btnSave {
            width: 100%;
            background-color: #1a2a5a;
            border: none;
            padding: 12px 0;
            font-size: 16px;
            font-weight: 700;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btnSave:hover {
            background-color: #122046;
        }
        #<%= lblMessage.ClientID %> {
            margin-top: 20px;
            font-weight: 600;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Add New Flight</h2>

            <label for="txtFlightNumber">Flight Number</label>
            <asp:TextBox ID="txtFlightNumber" runat="server" CssClass="aspNetTextBox" />

            <label for="ddlAircraftID">Select Aircraft ID</label>
            <asp:DropDownList ID="ddlAircraftID" runat="server" CssClass="aspNetDropDownList" />

            <label for="ddlOrigin">Select Origin City</label>
            <asp:DropDownList ID="ddlOrigin" runat="server" CssClass="aspNetDropDownList" />

            <label for="ddlDestination">Select Destination City</label>
            <asp:DropDownList ID="ddlDestination" runat="server" CssClass="aspNetDropDownList" />

            <label for="ddlScheduleID">Select Schedule</label>
            <asp:DropDownList ID="ddlScheduleID" runat="server" CssClass="aspNetDropDownList" />

            <label for="ddlCrewID">Select Crew ID</label>
            <asp:DropDownList ID="ddlCrewID" runat="server" CssClass="aspNetDropDownList" />

            <label for="txtPrice">Price</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="aspNetTextBox" />

            <asp:Button ID="btnSave" runat="server" Text="Save Flight" CssClass="btnSave" OnClick="btnSave_Click" />

            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </form>
</body>
</html>
