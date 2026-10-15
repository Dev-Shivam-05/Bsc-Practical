Public Class StudentRecord
    Inherits PersonBase
    Public Property Course As String
    Public Overrides Function Describe() As String
        Return "Student: " & FullName & " / " & Course
    End Function
End Class
