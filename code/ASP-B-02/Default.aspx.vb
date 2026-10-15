Partial Class CodeBehindDemo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            lblGreeting.Text = "Hello from the VB code-behind file."
        End If
    End Sub
End Class
