Partial Class SetCookie
    Inherits System.Web.UI.Page
    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If String.IsNullOrWhiteSpace(txtName.Text) Then
            lblMessage.Text = "Please provide a name."
            Return
        End If
        Dim cookie As New HttpCookie("UserName", Server.UrlEncode(txtName.Text))
        cookie.Expires = DateTime.Now.AddDays(1)
        cookie.HttpOnly = True
        cookie.Secure = Request.IsSecureConnection
        Response.Cookies.Add(cookie)
        lblMessage.Text = "Name stored in cookie."
    End Sub
End Class
