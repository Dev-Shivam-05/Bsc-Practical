Partial Class ExceptionDemo
    Inherits System.Web.UI.Page
    Protected Sub btnShow_Click(sender As Object, e As EventArgs)
        Try
            Dim n As Integer = Integer.Parse(txtNumber.Text)
            lblResult.Text = "Square = " & (CLng(n) * n).ToString()
        Catch ex As FormatException
            lblResult.Text = "Please enter a valid integer."
        Catch ex As OverflowException
            lblResult.Text = "Number is outside the allowed range."
        End Try
    End Sub
End Class
