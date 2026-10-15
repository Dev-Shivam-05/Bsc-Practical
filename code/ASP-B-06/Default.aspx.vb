Partial Class EncapsulationDemo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim student As New StudentProfile() With {.RollNo = 101}
        student.Name = "Aman"
        lblResult.Text = Server.HtmlEncode(student.Describe())
    End Sub
End Class
