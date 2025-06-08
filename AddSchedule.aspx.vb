Imports System.Data.SqlClient

Partial Class AddSchedule
    Inherits System.Web.UI.Page
    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub btnSaveSchedule_Click(sender As Object, e As EventArgs)
        Dim departureTime As TimeSpan
        Dim arrivalTime As TimeSpan

        ' Validate and parse departure time
        If Not TimeSpan.TryParse(txtDepartureTime.Text, departureTime) Then
            lblMessage.Text = "Invalid departure time format. Please use HH:mm:ss."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If

        ' Validate and parse arrival time
        If Not TimeSpan.TryParse(txtArrivalTime.Text, arrivalTime) Then
            lblMessage.Text = "Invalid arrival time format. Please use HH:mm:ss."
            lblMessage.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If

        ' If valid, proceed with database insert
        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("INSERT INTO Schedule (FlightDate, DepartureTime, ArrivalTime) VALUES (@FlightDate, @DepartureTime, @ArrivalTime)", conn)
            cmd.Parameters.AddWithValue("@FlightDate", DateTime.Parse(txtFlightDate.Text))
            cmd.Parameters.AddWithValue("@DepartureTime", departureTime)
            cmd.Parameters.AddWithValue("@ArrivalTime", arrivalTime)
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMessage.Text = "Schedule added successfully!"
            lblMessage.ForeColor = System.Drawing.Color.Green
        End Using
    End Sub
End Class
