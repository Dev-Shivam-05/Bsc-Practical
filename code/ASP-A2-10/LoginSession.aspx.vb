Partial Class LoginSession
    Inherits System.Web.UI.Page
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        If txtUser.Text <> "Prince" OrElse txtPass.Text <> "prince123" Then
            lblMessage.Text = "Invalid username or password."
            Return
        End If
        Session("user") = txtUser.Text
        Dim cookie As New HttpCookie("user", Server.UrlEncode(txtUser.Text))
        cookie.Expires = DateTime.Now.AddDays(1)
        cookie.HttpOnly = True
        cookie.Secure = Request.IsSecureConnection
        Response.Cookies.Add(cookie)
        Response.Redirect("WelcomeSession.aspx")
    End Sub
End Class
