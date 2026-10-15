Partial Class InheritanceDemo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim student As New StudentRecord() With {
            .FullName = "Riya", .Course = "BSc.IT"
        }
        lblResult.Text = Server.HtmlEncode(student.Describe())
    End Sub
End Class
