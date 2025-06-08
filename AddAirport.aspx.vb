Imports System.Data.SqlClient

Partial Class AddAirport
    Inherits System.Web.UI.Page

    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub btnAddAirport_Click(sender As Object, e As EventArgs)
        Try
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("INSERT INTO Airport (Name, City, Country, Code) VALUES (@name, @city, @country, @code)", conn)
                cmd.Parameters.AddWithValue("@name", txtName.Text.Trim())
                cmd.Parameters.AddWithValue("@city", txtCity.Text.Trim())
                cmd.Parameters.AddWithValue("@country", txtCountry.Text.Trim())
                cmd.Parameters.AddWithValue("@code", txtCode.Text.Trim())

                conn.Open()
                cmd.ExecuteNonQuery()
            End Using

            ' Clear input fields
            txtName.Text = ""
            txtCity.Text = ""
            txtCountry.Text = ""
            txtCode.Text = ""

            lblMessage.Text = "Airport successfully added!"
        Catch ex As Exception
            lblMessage.ForeColor = Drawing.Color.Red
            lblMessage.Text = "Error adding airport: " & ex.Message
        End Try
    End Sub
End Class
