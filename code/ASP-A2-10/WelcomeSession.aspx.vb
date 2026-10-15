Partial Class WelcomeSession
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Session("user") Is Nothing Then
            Response.Redirect("LoginSession.aspx")
            Return
        End If
        lblSession.Text = Server.HtmlEncode(Session("user").ToString())
        Dim cookie As HttpCookie = Request.Cookies("user")
        lblCookie.Text = If(cookie Is Nothing,
            "(not found)", Server.HtmlEncode(Server.UrlDecode(cookie.Value)))
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Session.Abandon()
        Dim expired As New HttpCookie("user", "")
        expired.Expires = DateTime.Now.AddDays(-1)
        expired.HttpOnly = True
        expired.Secure = Request.IsSecureConnection
        Response.Cookies.Add(expired)
        Response.Redirect("LoginSession.aspx")
    End Sub
End Class
