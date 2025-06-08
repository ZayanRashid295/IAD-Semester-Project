<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dash_cust.aspx.vb" Inherits="Dash_cust" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Dashboard</title>
    <style>
        /* Reset some default margins */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #2c3e50;
        }

        .container {
            background: #fff;
            width: 420px;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow:
                0 10px 20px rgba(38, 57, 77, 0.2),
                0 6px 6px rgba(0, 0, 0, 0.15);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .container:hover {
            transform: translateY(-5px);
            box-shadow:
                0 20px 40px rgba(38, 57, 77, 0.3),
                0 10px 10px rgba(0, 0, 0, 0.2);
        }

        .welcome-message {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            color: #34495e;
            letter-spacing: 1px;
        }

        .error-message {
            color: #e74c3c;
            font-weight: 600;
            margin-bottom: 25px;
            min-height: 24px; /* Keep space even if empty */
        }

        .btn {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            border: none;
            border-radius: 8px;
            color: #fff;
            cursor: pointer;
            font-size: 18px;
            font-weight: 600;
            margin: 12px 0;
            padding: 14px 0;
            width: 100%;
            box-shadow: 0 5px 15px rgba(38, 57, 77, 0.2);
            transition: background 0.4s ease, box-shadow 0.4s ease, transform 0.2s ease;
            user-select: none;
        }
        .btn:hover {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            box-shadow: 0 8px 25px rgba(38, 57, 77, 0.35);
            transform: scale(1.05);
        }
        .btn:active {
            transform: scale(0.97);
            box-shadow: 0 3px 10px rgba(38, 57, 77, 0.15);
        }

        .button-container {
            margin-top: 15px;
        }

        /* Responsive */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
            .welcome-message {
                font-size: 22px;
            }
            .btn {
                font-size: 16px;
                padding: 12px 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" role="main" aria-label="Customer Dashboard">
            <h2 class="welcome-message">Welcome, <%= Session("Username") %></h2>
            <asp:Label ID="lblRedirect" runat="server" ForeColor="Red" CssClass="error-message" /><br />

            <div class="button-container">
                <asp:Button ID="btnBookFlight" runat="server" Text="Book a Flight" OnClick="btnBookFlight_Click" CssClass="btn" />
                <asp:Button ID="btnViewBookings" runat="server" Text="View My Bookings" OnClick="btnViewBookings_Click" CssClass="btn" />
                <asp:Button ID="btnViewSchedule" runat="server" Text="View My Flight Schedule" OnClick="btnViewSchedule_Click" CssClass="btn" />
            </div>
        </div>
    </form>
</body>
</html>
