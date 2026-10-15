Partial Class ExceptionDemo
    Inherits System.Web.UI.Page

    ' The CLR (Common Language Runtime) runs this compiled code: it JIT-compiles the IL,
    ' manages memory (garbage collection) and raises exceptions such as FormatException.
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        lblClr.Text = "Running on CLR version " & Environment.Version.ToString() &
            " | Memory used by CLR heap: " & (GC.GetTotalMemory(False) \ 1024).ToString() & " KB"
    End Sub

    Protected Sub btnShow_Click(sender As Object, e As EventArgs)
        Try
            Dim n As Integer = Integer.Parse(txtNumber.Text)
            lblResult.Text = "Square = " & (CLng(n) * n).ToString()
        Catch ex As FormatException
            lblResult.Text = "Please enter a valid integer. (CLR raised " & ex.GetType().Name & ")"
        Catch ex As OverflowException
            lblResult.Text = "Number is outside the allowed range. (CLR raised " & ex.GetType().Name & ")"
        Finally
            lblFinally.Text = "Finally block executed."
        End Try
    End Sub
End Class
