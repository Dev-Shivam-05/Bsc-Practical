Partial Class Prog3
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            lblName.Text = "Prince"
            lblRoll.Text = "101"
            lblCourse.Text = "TY BCA"
            lblSemester.Text = "5"
        End If
    End Sub
End Class
