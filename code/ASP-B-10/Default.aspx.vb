Partial Class StudentForm
    Inherits System.Web.UI.Page
    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        If Not Page.IsValid Then Return
        Dim roll As Integer
        If Not Integer.TryParse(txtRoll.Text, roll) OrElse roll <= 0 Then
            lblResult.Text = "Roll number must be a positive integer."
            Return
        End If
        lblResult.Text = "Student: " & Server.HtmlEncode(txtName.Text) &
            " | Roll: " & roll & " | Age: " & Server.HtmlEncode(txtAge.Text) &
            " | Course: " & Server.HtmlEncode(txtCourse.Text)
    End Sub
End Class
