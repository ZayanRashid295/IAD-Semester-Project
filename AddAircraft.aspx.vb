Imports System.Data.SqlClient

Partial Class AddAircraft
    Inherits System.Web.UI.Page

    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub btnSaveAircraft_Click(sender As Object, e As EventArgs)
        Try
            Using conn As New SqlConnection(connStr)
                conn.Open()

                ' Use an SQL query that returns the inserted AircraftID
                Dim cmd As New SqlCommand("INSERT INTO Aircraft (Model, Capacity, Manufacturer, MaintenanceStatus) OUTPUT INSERTED.AircraftID VALUES (@Model, @Capacity, @Manufacturer, @Status)", conn)

                ' Add parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@Model", txtModel.Text)
                cmd.Parameters.AddWithValue("@Capacity", Convert.ToInt32(txtCapacity.Text))
                cmd.Parameters.AddWithValue("@Manufacturer", txtManufacturer.Text)
                cmd.Parameters.AddWithValue("@Status", txtStatus.Text)

                ' Execute the query and retrieve the generated AircraftID
                Dim newAircraftId As Integer = Convert.ToInt32(cmd.ExecuteScalar())

                ' Display success message with the newly generated AircraftID
                lblMessage.ForeColor = System.Drawing.Color.Green
                lblMessage.Text = "Aircraft added successfully! New Aircraft ID: " & newAircraftId
            End Using
        Catch ex As Exception
            ' Log or display the error message
            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class
