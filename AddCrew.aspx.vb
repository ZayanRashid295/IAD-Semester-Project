Imports System.Data.SqlClient

Partial Class AddCrew
    Inherits System.Web.UI.Page
    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

    Protected Sub btnSaveCrew_Click(sender As Object, e As EventArgs)
        Dim experienceYears As Integer

        ' Validate experience input
        If Not Integer.TryParse(txtCrewExp.Text, experienceYears) Then
            lblMsgCrew.Text = "Please enter a valid number for experience years."
            lblMsgCrew.ForeColor = System.Drawing.Color.Red
            Exit Sub
        End If

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("INSERT INTO Crew (Name, ExperienceYears) VALUES (@Name, @Exp)", conn)
            cmd.Parameters.AddWithValue("@Name", txtCrewName.Text)
            cmd.Parameters.AddWithValue("@Exp", experienceYears)
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsgCrew.Text = "Crew member added successfully!"
            lblMsgCrew.ForeColor = System.Drawing.Color.Green
        End Using
    End Sub
End Class
