Partial Class Login
    Inherits System.Web.UI.Page
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        If txtUser.Text = "Prince" AndAlso txtPass.Text = "prince123" Then
            Session("redirectUser") = txtUser.Text
            Response.Redirect("Welcome.aspx")
        Else
            lblMessage.Text = "Invalid username or password."
        End If
    End Sub
End Class
