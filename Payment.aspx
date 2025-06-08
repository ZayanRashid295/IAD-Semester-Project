<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Payment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 400px; margin: auto; padding: 20px; border: 1px solid #ccc;">
        <h2>Make Payment</h2>

        <asp:Label ID="lblBookingID" runat="server" Text=""></asp:Label><br /><br />

        <asp:Label ID="lblAmount" runat="server" Text="Amount: "></asp:Label><br /><br />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />

        <asp:Label ID="lblCardNumber" runat="server" Text="Card Number:"></asp:Label><br />
        <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16"></asp:TextBox><br /><br />

        <asp:Label ID="lblExpiry" runat="server" Text="Expiry Date (MM/YY):"></asp:Label><br />
        <asp:TextBox ID="txtExpiry" runat="server" MaxLength="5" placeholder="MM/YY"></asp:TextBox><br /><br />

        <asp:Label ID="lblCVV" runat="server" Text="CVV:"></asp:Label><br />
        <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" TextMode="Password"></asp:TextBox><br /><br />

        <asp:Button ID="btnPay" runat="server" Text="Pay Now" OnClick="btnPay_Click" />

    </div>
    </form>
</body>
</html>
