Partial Class Dash_cust
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserRole") Is Nothing Then
            Response.Redirect("Login.aspx")
        ElseIf Session("UserRole").ToString() <> "Customer" Then
            lblRedirect.Text = "Access Denied. Redirecting..."
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub btnBookFlight_Click(sender As Object, e As EventArgs)
        Response.Redirect("BookFlight.aspx")
    End Sub

    Protected Sub btnViewBookings_Click(sender As Object, e As EventArgs)
        Response.Redirect("ViewBooking.aspx")
    End Sub

    Protected Sub btnViewSchedule_Click(sender As Object, e As EventArgs)
        Response.Redirect("ViewSchedule.aspx")
    End Sub
End Class
