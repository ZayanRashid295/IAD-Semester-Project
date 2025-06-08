Imports System
Imports System.Web.UI

Partial Class Home_Page

    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
        Response.Redirect("Register.aspx")
    End Sub
End Class
