<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminDashboard.aspx.vb" Inherits="AdminDashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administrator Control Panel</title>
    <style>
        body {
            background: linear-gradient(135deg, #d0e6f8, #f5f9fc);
            font-family: 'Calibri', Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #223344;
        }
        .dashboard-wrapper {
            max-width: 650px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 14px;
            box-shadow: 0 6px 20px rgba(34, 51, 68, 0.18);
            text-align: center;
        }
        h1 {
            font-weight: 800;
            color: #1a2b3c;
            margin-bottom: 35px;
            letter-spacing: 1.2px;
        }
        h2 {
            margin-top: 50px;
            font-weight: 700;
            color: #334455;
        }
        p {
            font-size: 17px;
            color: #556677;
        }
        .nav-btn {
            background-color: #1a2b3c;
            color: #fafafa;
            border: none;
            border-radius: 8px;
            padding: 14px 26px;
            margin: 12px 10px;
            font-size: 17px;
            font-weight: 700;
            cursor: pointer;
            width: 190px;
            transition: background-color 0.35s ease, transform 0.25s ease;
            box-shadow: 0 3px 8px rgba(26, 43, 60, 0.35);
        }
        .nav-btn:hover {
            background-color: #0e1a28;
            transform: scale(1.05);
            box-shadow: 0 6px 18px rgba(14, 26, 40, 0.5);
        }
        hr {
            margin: 45px 0 35px 0;
            border: none;
            border-top: 2px solid #b0becf;
            opacity: 0.6;
        }
        form {
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="dashboard-wrapper">
        <h1>Administrator Control Panel</h1>

        <!-- Navigation Buttons -->
        <asp:Button ID="btnAddAirport" runat="server" Text="Add Airport" PostBackUrl="~/AddAirport.aspx" CssClass="nav-btn" />
        <asp:Button ID="btnAddAircraft" runat="server" Text="Add Aircraft" PostBackUrl="~/AddAircraft.aspx" CssClass="nav-btn" />
        <asp:Button ID="btnAddCrew" runat="server" Text="Add Crew" PostBackUrl="~/AddCrew.aspx" CssClass="nav-btn" />
        <asp:Button ID="btnAddPilot" runat="server" Text="Add Pilot" PostBackUrl="~/AddPilot.aspx" CssClass="nav-btn" />
        <asp:Button ID="btnLogout" runat="server" Text="Sign Out" PostBackUrl="~/Logout_page.aspx" CssClass="nav-btn" />

        <hr />
        
    </form>
</body>
</html>
