Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class BookFlight
    Inherits System.Web.UI.Page

    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("Login.aspx")
        End If

        If Not IsPostBack Then
            LoadAvailableFlights()
        End If
    End Sub

    Private Sub LoadAvailableFlights()
        ddlFlights.Items.Clear()
        ddlFlights.Items.Add(New ListItem("-- Select Flight --", ""))

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("SELECT FlightID, Origin + ' to ' + Destination + ' (' + CONVERT(VARCHAR, DepartureTime, 0) + ')' AS FlightInfo FROM Flights WHERE AvailableSeats > 0", conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                ddlFlights.Items.Add(New ListItem(reader("FlightInfo").ToString(), reader("FlightID").ToString()))
            End While
        End Using
    End Sub

    Protected Sub ddlFlights_SelectedIndexChanged(sender As Object, e As EventArgs)
        ddlSeats.Items.Clear()
        lblFare.Text = ""
        If ddlFlights.SelectedValue <> "" Then
            LoadAvailableSeats()
        End If
    End Sub

    Private Sub LoadAvailableSeats()
        ddlSeats.Items.Clear()
        ddlSeats.Items.Add(New ListItem("-- Select Seat --", ""))

        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' Get AircraftID for the selected FlightID
            Dim aircraftIDCmd As New SqlCommand("SELECT AircraftID FROM Flights WHERE FlightID = @FlightID", conn)
            aircraftIDCmd.Parameters.AddWithValue("@FlightID", ddlFlights.SelectedValue)
            Dim aircraftIDObj As Object = aircraftIDCmd.ExecuteScalar()

            If aircraftIDObj IsNot Nothing Then
                Dim aircraftID As Integer = Convert.ToInt32(aircraftIDObj)

                ' Get available seats for the AircraftID
                Dim seatCmd As New SqlCommand("SELECT SeatNumber FROM Seats WHERE AircraftID = @AircraftID AND IsAvailable = 1", conn)
                seatCmd.Parameters.AddWithValue("@AircraftID", aircraftID)

                Dim reader As SqlDataReader = seatCmd.ExecuteReader()
                While reader.Read()
                    ddlSeats.Items.Add(New ListItem(reader("SeatNumber").ToString(), reader("SeatNumber").ToString()))
                End While
                reader.Close()
            Else
                ' Optional: handle case when aircraftID not found
                lblMessage.Text = "No aircraft found for selected flight."
            End If
        End Using
    End Sub

    Protected Sub ddlSeats_SelectedIndexChanged(sender As Object, e As EventArgs)
        If ddlFlights.SelectedValue <> "" Then
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT Fare FROM Flights WHERE FlightID = @FlightID", conn)
                cmd.Parameters.AddWithValue("@FlightID", ddlFlights.SelectedValue)
                conn.Open()
                Dim fare = cmd.ExecuteScalar()
                If fare IsNot Nothing Then
                    lblFare.Text = "₹" & Convert.ToDecimal(fare).ToString("F2")
                Else
                    lblFare.Text = ""
                End If
            End Using
        End If
    End Sub

    Protected Sub btnBook_Click(sender As Object, e As EventArgs)
        If ddlFlights.SelectedValue = "" OrElse ddlSeats.SelectedValue = "" Then
            lblMessage.Text = "Please select a flight and seat."
            Return
        End If

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("BookFlight", conn)
            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@UserID", Session("UserID"))
            cmd.Parameters.AddWithValue("@FlightID", ddlFlights.SelectedValue)
            cmd.Parameters.AddWithValue("@SeatNumber", ddlSeats.SelectedValue)

            Dim outputBookingID As New SqlParameter("@BookingID", SqlDbType.Int)
            outputBookingID.Direction = ParameterDirection.Output
            cmd.Parameters.Add(outputBookingID)

            conn.Open()
            cmd.ExecuteNonQuery()

            Dim bookingID = Convert.ToInt32(outputBookingID.Value)

            ' Redirect to payment page with booking ID
            Response.Redirect("Payment.aspx?bookingID=" & bookingID)
        End Using
    End Sub
End Class
