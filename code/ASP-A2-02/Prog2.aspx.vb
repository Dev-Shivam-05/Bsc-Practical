Partial Class Prog2
    Inherits System.Web.UI.Page
    Protected Sub btnValidate_Click(sender As Object, e As EventArgs)
        If Page.IsValid Then
            lblMessage.Text = "Validation successful for " &
                Server.HtmlEncode(txtUser.Text) & "."
        End If
    End Sub
End Class
