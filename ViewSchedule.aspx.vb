Imports System.Data.SqlClient

Partial Class ViewSchedule
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadSchedule()
        End If
    End Sub

    Private Sub LoadSchedule()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString

        Try
            Using conn As New SqlConnection(connStr)
                Dim cmd As New SqlCommand("SELECT ScheduleID, FlightDate, DepartureTime, ArrivalTime FROM Schedule", conn)
                conn.Open()

                Using reader As SqlDataReader = cmd.ExecuteReader()
                    gvSchedule.DataSource = reader
                    gvSchedule.DataBind()
                End Using
            End Using

        Catch ex As Exception
            lblMessage.Text = "Unable to retrieve schedule data at the moment."
        End Try
    End Sub
End Class
