Partial Class AdminDashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("UserRole") Is Nothing OrElse Session("UserRole").ToString() <> "Admin" Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
End Class
