Partial Class GetCookie
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim item As HttpCookie = Request.Cookies("UserName")
        lblResult.Text = If(item Is Nothing,
            "No cookie found.",
            "Hello, " & Server.HtmlEncode(Server.UrlDecode(item.Value)))
    End Sub
End Class
