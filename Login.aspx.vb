Imports System.Data.SqlClient
Imports System.Web.Security

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

        Dim username As String = txtUsername.Text.Trim()
        Dim password As String = txtPassword.Text.Trim()

        Using conn As New SqlConnection(connStr)
            Dim query As String = "SELECT U.UserID, U.Username, R.RoleName " &
                      "FROM Users U " &
                      "INNER JOIN Roles R ON U.RoleID = R.RoleID " &
                      "WHERE U.Username = @Username AND U.Password = @Password"


            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@Username", username)
            cmd.Parameters.AddWithValue("@Password", password)

            Try
                conn.Open()
                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.HasRows Then
                    reader.Read()

                    Session("UserID") = reader("UserID")
                    Session("Username") = reader("Username").ToString()
                    Session("UserRole") = reader("RoleName").ToString()
                    FormsAuthentication.SetAuthCookie(Session("Username").ToString(), False)

                    Select Case Session("UserRole").ToString()
                        Case "Admin"
                            Response.Redirect("AdminDashboard.aspx")
                        Case "Customer"
                            Response.Redirect("Dash_cust.aspx")
                        Case "Crew"
                            Response.Redirect("CrewDashboard.aspx")
                        Case "Technician"
                            Response.Redirect("TechnicianDashboard.aspx")
                        Case "Pilot"
                            Response.Redirect("PilotDashboard.aspx")
                        Case Else
                            lblMessage.Text = "Unrecognized role."
                    End Select
                Else
                    lblMessage.Text = "Invalid username or password."
                End If

                reader.Close()
            Catch ex As Exception
                lblMessage.Text = "Login error: " & ex.Message
            End Try
        End Using
    End Sub
End Class
