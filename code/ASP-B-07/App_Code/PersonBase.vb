Public Class PersonBase
    Public Property FullName As String
    Public Overridable Function Describe() As String
        Return "Person: " & FullName
    End Function
End Class
