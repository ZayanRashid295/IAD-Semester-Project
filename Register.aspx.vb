Imports System.Data.SqlClient
Imports System.Text.RegularExpressions

Partial Class Register
    Inherits System.Web.UI.Page

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
        Dim password As String = txtPassword.Text
        Dim passwordPattern As String = "^(?=.*[A-Z])(?=.*[!@#$%^&*])[A-Za-z\d@$!%*?&]{8,}$"

        If Not Regex.IsMatch(password, passwordPattern) Then
            lblErrorMessage.Text = "Password must be at least 8 characters long, include a capital letter, and a special character."
            lblErrorMessage.Visible = True
            Return
        End If

        Dim phone As String = txtPhone.Text
        Dim phonePattern As String = "^\d+$" ' Only digits are allowed

        If Not Regex.IsMatch(phone, phonePattern) Then
            lblErrorMessage.Text = "Please enter a valid phone number (only digits allowed)."
            lblErrorMessage.Visible = True
            Return
        End If

        ' Database Registration Logic
        Dim connStr As String = ConfigurationManager.ConnectionStrings("DBConn").ConnectionString
        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' Check if Username Exists
            Dim checkUsernameCmd As New SqlCommand("SELECT COUNT(*) FROM Users WHERE Username = @u", conn)
            checkUsernameCmd.Parameters.AddWithValue("@u", txtUsername.Text)
            Dim usernameExists As Integer = Convert.ToInt32(checkUsernameCmd.ExecuteScalar())

            If usernameExists > 0 Then
                lblErrorMessage.Text = "Username already exists. Please choose another one."
                lblErrorMessage.Visible = True
                Return
            End If

            ' Begin Database Transaction
            Dim transaction As SqlTransaction = conn.BeginTransaction()

            Try
                ' Insert New User
                Dim cmdUser As New SqlCommand("INSERT INTO Users (Username, Password, RoleID, Email) VALUES (@u, @p, 2, @e); SELECT SCOPE_IDENTITY()", conn, transaction)
                cmdUser.Parameters.AddWithValue("@u", txtUsername.Text)
                cmdUser.Parameters.AddWithValue("@p", txtPassword.Text)
                cmdUser.Parameters.AddWithValue("@e", txtEmail.Text)

                Dim userID As Integer = Convert.ToInt32(cmdUser.ExecuteScalar())

                ' Insert Customer Details
                Dim cmdCust As New SqlCommand("INSERT INTO Customers (UserID, Name, Email, Phone, Address, Gender, DOB) VALUES (@uid, @name, @e, @phone, @addr, @gender, @dob)", conn, transaction)
                cmdCust.Parameters.AddWithValue("@uid", userID)
                cmdCust.Parameters.AddWithValue("@name", txtName.Text)
                cmdCust.Parameters.AddWithValue("@e", txtEmail.Text)
                cmdCust.Parameters.AddWithValue("@phone", txtPhone.Text)
                cmdCust.Parameters.AddWithValue("@addr", txtAddress.Text)
                cmdCust.Parameters.AddWithValue("@gender", ddlGender.SelectedValue)
                cmdCust.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDOB.Text))

                cmdCust.ExecuteNonQuery()
                transaction.Commit()

                lblMessage.Text = "Registration successful. <a href='Login.aspx'>Click here to login</a>."
            Catch ex As Exception
                transaction.Rollback()
                lblErrorMessage.Text = "An error occurred during registration."
                lblErrorMessage.Visible = True
            End Try
        End Using
    End Sub
End Class
