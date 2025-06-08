Imports System.Data.SqlClient

Partial Class AddPilot
    Inherits System.Web.UI.Page
    Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString
    Protected Sub btnSavePilot_Click(sender As Object, e As EventArgs)
        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("INSERT INTO Pilot (Name, LicenseNumber, ExperienceYears) VALUES (@Name, @License, @Exp)", conn)
            cmd.Parameters.AddWithValue("@Name", txtName.Text)
            cmd.Parameters.AddWithValue("@License", txtLicense.Text)
            cmd.Parameters.AddWithValue("@Exp", Integer.Parse(txtExp.Text))
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsgPilot.Text = "Pilot added successfully!"
        End Using
    End Sub
End Class