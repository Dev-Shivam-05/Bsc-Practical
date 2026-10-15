Partial Class OverloadingDemo
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim calc As New Calculator()
        lblResult.Text = "Two numbers: " & calc.Add(2, 3) &
            "; three numbers: " & calc.Add(2, 3, 4)
    End Sub
End Class
