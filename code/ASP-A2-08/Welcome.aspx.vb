Partial Class Welcome
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Session("redirectUser") Is Nothing Then
            Response.Redirect("Login.aspx")
            Return
        End If
        lblWelcome.Text = "Welcome, " &
            Server.HtmlEncode(Session("redirectUser").ToString()) & "!"
    End Sub
End Class
