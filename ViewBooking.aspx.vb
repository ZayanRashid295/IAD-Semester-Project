Imports System.Data.SqlClient

Partial Class ViewBooking
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UserID") IsNot Nothing Then
                LoadBookings()
            Else
                Response.Redirect("Login.aspx")
            End If
        End If
    End Sub

    Private Sub LoadBookings()
        Try
            Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT BookingID, FlightID, SeatNumber, BookingDate, Status, Amount FROM Bookings WHERE UserID = @UserID", conn)
                cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                gvBookings.DataSource = reader
                gvBookings.DataBind()
            End Using
        Catch ex As Exception
            lblMessage.Text = "Error loading bookings."
        End Try
    End Sub
End Class
