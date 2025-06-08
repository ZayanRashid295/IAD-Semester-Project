Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class AddFlight
    Inherits System.Web.UI.Page

    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDropdowns()
        End If
    End Sub

    Private Sub LoadDropdowns()
        ' Aircraft ID
        Using conn As New SqlConnection(connStr)
            conn.Open()

            Dim cmdAircraft As New SqlCommand("SELECT AircraftID FROM Aircraft", conn)
            ddlAircraftID.DataSource = cmdAircraft.ExecuteReader()
            ddlAircraftID.DataTextField = "AircraftID"
            ddlAircraftID.DataValueField = "AircraftID"
            ddlAircraftID.DataBind()
            ddlAircraftID.Items.Insert(0, New ListItem("-- Select Aircraft --", ""))
        End Using

        ' Origin and Destination Cities
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmdCity As New SqlCommand("SELECT DISTINCT City FROM Airport", conn)
            Dim dt As New DataTable()
            dt.Load(cmdCity.ExecuteReader())

            ddlOrigin.DataSource = dt
            ddlOrigin.DataTextField = "City"
            ddlOrigin.DataValueField = "City"
            ddlOrigin.DataBind()
            ddlOrigin.Items.Insert(0, New ListItem("-- Select Origin --", ""))

            ddlDestination.DataSource = dt
            ddlDestination.DataTextField = "City"
            ddlDestination.DataValueField = "City"
            ddlDestination.DataBind()
            ddlDestination.Items.Insert(0, New ListItem("-- Select Destination --", ""))
        End Using

        ' Schedule ID
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmdSchedule As New SqlCommand("SELECT ScheduleID FROM Schedule", conn)
            ddlScheduleID.DataSource = cmdSchedule.ExecuteReader()
            ddlScheduleID.DataTextField = "ScheduleID"
            ddlScheduleID.DataValueField = "ScheduleID"
            ddlScheduleID.DataBind()
            ddlScheduleID.Items.Insert(0, New ListItem("-- Select Schedule --", ""))
        End Using

        ' Crew ID
        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim cmdCrew As New SqlCommand("SELECT CrewID FROM Crew", conn)
            ddlCrewID.DataSource = cmdCrew.ExecuteReader()
            ddlCrewID.DataTextField = "CrewID"
            ddlCrewID.DataValueField = "CrewID"
            ddlCrewID.DataBind()
            ddlCrewID.Items.Insert(0, New ListItem("-- Select Crew --", ""))
        End Using
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If ddlAircraftID.SelectedValue = "" Or ddlOrigin.SelectedValue = "" Or ddlDestination.SelectedValue = "" Or ddlScheduleID.SelectedValue = "" Or ddlCrewID.SelectedValue = "" Then
            lblMessage.Text = "Please fill all dropdowns and fields."
            Return
        End If

        If ddlOrigin.SelectedValue = ddlDestination.SelectedValue Then
            lblMessage.Text = "Origin and Destination cannot be the same."
            Return
        End If

        Try
            Using conn As New SqlConnection(connStr)
                conn.Open()

                ' Get Aircraft Capacity
                Dim capCmd As New SqlCommand("SELECT Capacity FROM Aircraft WHERE AircraftID = @AircraftID", conn)
                capCmd.Parameters.AddWithValue("@AircraftID", ddlAircraftID.SelectedValue)
                Dim totalSeats As Integer = Convert.ToInt32(capCmd.ExecuteScalar())

                ' Get DepartureTime and ArrivalTime from Schedule
                Dim schedCmd As New SqlCommand("SELECT DepartureTime, ArrivalTime FROM Schedule WHERE ScheduleID = @ScheduleID", conn)
                schedCmd.Parameters.AddWithValue("@ScheduleID", ddlScheduleID.SelectedValue)
                Dim reader As SqlDataReader = schedCmd.ExecuteReader()

                Dim departureTime As DateTime
                Dim arrivalTime As DateTime

                If reader.Read() Then
                    departureTime = Date.Today.Add(CType(reader("DepartureTime"), TimeSpan))
                    arrivalTime = Date.Today.Add(CType(reader("ArrivalTime"), TimeSpan))
                Else
                    lblMessage.Text = "Schedule not found."
                    Return
                End If
                reader.Close()

                ' Insert Flight with CrewID
                Dim insertCmd As New SqlCommand("INSERT INTO Flights (FlightNumber, AircraftID, Origin, Destination, ScheduleID, DepartureTime, ArrivalTime, TotalSeats, AvailableSeats, Price, CrewID) VALUES (@FlightNumber, @AircraftID, @Origin, @Destination, @ScheduleID, @DepartureTime, @ArrivalTime, @TotalSeats, @AvailableSeats, @Price, @CrewID)", conn)

                insertCmd.Parameters.AddWithValue("@FlightNumber", txtFlightNumber.Text.Trim())
                insertCmd.Parameters.AddWithValue("@AircraftID", ddlAircraftID.SelectedValue)
                insertCmd.Parameters.AddWithValue("@Origin", ddlOrigin.SelectedValue)
                insertCmd.Parameters.AddWithValue("@Destination", ddlDestination.SelectedValue)
                insertCmd.Parameters.AddWithValue("@ScheduleID", ddlScheduleID.SelectedValue)
                insertCmd.Parameters.AddWithValue("@DepartureTime", departureTime)
                insertCmd.Parameters.AddWithValue("@ArrivalTime", arrivalTime)
                insertCmd.Parameters.AddWithValue("@TotalSeats", totalSeats)
                insertCmd.Parameters.AddWithValue("@AvailableSeats", totalSeats)
                insertCmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()))
                insertCmd.Parameters.AddWithValue("@CrewID", ddlCrewID.SelectedValue)

                insertCmd.ExecuteNonQuery()

                lblMessage.ForeColor = Drawing.Color.Green
                lblMessage.Text = "Flight added successfully."
            End Using
        Catch ex As Exception
            lblMessage.ForeColor = Drawing.Color.Red
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class
