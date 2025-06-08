Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Payment
    Inherits System.Web.UI.Page

    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString
    Dim bookingID As Integer
    Dim amount As Decimal

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Get bookingID from query string
            If Not String.IsNullOrEmpty(Request.QueryString("bookingID")) AndAlso Integer.TryParse(Request.QueryString("bookingID"), bookingID) Then
                lblBookingID.Text = "Booking ID: " & bookingID.ToString()
                LoadAmount()
            Else
                lblMessage.Text = "Invalid Booking ID."
                btnPay.Enabled = False
            End If
        End If
    End Sub

    Private Sub LoadAmount()
        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("SELECT Fare FROM Flights f JOIN Bookings b ON f.FlightID = b.FlightID WHERE b.BookingID = @BookingID", conn)
            cmd.Parameters.AddWithValue("@BookingID", bookingID)

            conn.Open()
            Dim result = cmd.ExecuteScalar()
            If result IsNot Nothing Then
                amount = Convert.ToDecimal(result)
                lblAmount.Text = "Amount to pay: ₹ " & amount.ToString("F2")
            Else
                lblMessage.Text = "Could not find booking amount."
                btnPay.Enabled = False
            End If
        End Using
    End Sub

    Protected Sub btnPay_Click(sender As Object, e As EventArgs)
        lblMessage.Text = ""

        ' Simple validations
        If String.IsNullOrEmpty(txtCardNumber.Text) OrElse txtCardNumber.Text.Length <> 16 Then
            lblMessage.Text = "Enter a valid 16-digit card number."
            Return
        End If

        If String.IsNullOrEmpty(txtExpiry.Text) OrElse Not System.Text.RegularExpressions.Regex.IsMatch(txtExpiry.Text, "^(0[1-9]|1[0-2])\/\d{2}$") Then
            lblMessage.Text = "Enter expiry in MM/YY format."
            Return
        End If

        If String.IsNullOrEmpty(txtCVV.Text) OrElse txtCVV.Text.Length <> 3 Then
            lblMessage.Text = "Enter a valid 3-digit CVV."
            Return
        End If

        ' Simulate payment processing
        ProcessPayment()
    End Sub

    Private Sub ProcessPayment()
        ' Here you would integrate real payment gateway APIs
        ' For demo, we assume payment succeeds

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("UPDATE Bookings SET PaymentStatus = @Status, PaymentDate = GETDATE() WHERE BookingID = @BookingID", conn)
            cmd.Parameters.AddWithValue("@Status", "Paid")
            cmd.Parameters.AddWithValue("@BookingID", bookingID)

            conn.Open()
            Dim rows = cmd.ExecuteNonQuery()
            If rows > 0 Then
                lblMessage.ForeColor = System.Drawing.Color.Green
                lblMessage.Text = "Payment successful! Thank you."
                btnPay.Enabled = False
            Else
                lblMessage.Text = "Error updating payment status."
            End If
        End Using
    End Sub

End Class
