<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddCrew.aspx.vb" Inherits="AddCrew" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Crew Member</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e7eef7;
            margin: 0; padding: 0;
        }
        .form-wrapper {
            max-width: 420px;
            margin: 50px auto;
            background: #f8fafc;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 60, 0.1);
            color: #33475b;
        }
        h2 {
            text-align: center;
            color: #1c3d72;
            margin-bottom: 22px;
            font-weight: 700;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #2a3f65;
        }
        input[type="text"], .aspNetTextBox {
            width: 100%;
            padding: 8px 10px;
            border: 1.6px solid #9bb9d4;
            border-radius: 5px;
            margin-bottom: 18px;
            font-size: 14px;
            transition: border-color 0.25s ease;
        }
        input[type="text"]:focus {
            outline: none;
            border-color: #1c3d72;
            box-shadow: 0 0 6px rgba(28, 61, 114, 0.3);
        }
        .btnSaveCrew {
            background-color: #1c3d72;
            border: none;
            color: white;
            font-weight: 600;
            font-size: 15px;
            width: 100%;
            padding: 12px 0;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btnSaveCrew:hover {
            background-color: #14305a;
        }
        #<%= lblMsgCrew.ClientID %> {
            text-align: center;
            margin-top: 15px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-wrapper">
            <h2>Register New Crew Member</h2>

            <asp:Label ID="lblCrewName" runat="server" AssociatedControlID="txtCrewName">Full Name:</asp:Label>
            <asp:TextBox ID="txtCrewName" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Label ID="lblCrewExp" runat="server" AssociatedControlID="txtCrewExp">Years of Experience:</asp:Label>
            <asp:TextBox ID="txtCrewExp" runat="server" CssClass="aspNetTextBox"></asp:TextBox>

            <asp:Button ID="btnSaveCrew" runat="server" Text="Add Crew Member" CssClass="btnSaveCrew" OnClick="btnSaveCrew_Click" />

            <asp:Label ID="lblMsgCrew" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
