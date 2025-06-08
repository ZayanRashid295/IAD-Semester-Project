<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f4f8;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: #fff;
            width: 400px;
            margin: 60px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .form-button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #0056b3;
        }

        .message {
            text-align: center;
            margin-top: 10px;
        }

        .error {
            color: red;
        }

        .success {
            color: green;
        }

        .password-info {
            font-size: 12px;
            color: #666;
        }

        .login-link {
            text-align: center;
            margin-top: 10px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Register</h2>

            <div class="message">
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="error" Visible="False" />
                <asp:Label ID="lblMessage" runat="server" CssClass="success" />
            </div>

            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-input" Placeholder="Username" />
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" TextMode="Password" Placeholder="Password" />
            <div class="password-info">
                <p>Password must be at least 8 characters long, contain at least one uppercase letter, and one special character.</p>
            </div>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-input" Placeholder="Full Name" />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" TextMode="Email" Placeholder="Email" />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" Placeholder="Phone" />
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-input" Placeholder="Address" />

            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-input">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="M" />
                <asp:ListItem Text="Female" Value="F" />
                <asp:ListItem Text="Other" Value="O" />
            </asp:DropDownList>

            <asp:TextBox ID="txtDOB" runat="server" CssClass="form-input" TextMode="Date" />

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="form-button" OnClick="btnRegister_Click" />

            <div class="login-link">
                <p>Already registered? <a href="Login.aspx">Go to login</a></p>
            </div>
        </div>
    </form>
</body>
</html>
