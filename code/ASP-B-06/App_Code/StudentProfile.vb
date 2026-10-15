Public Class StudentProfile
    Private _name As String
    Public Property RollNo As Integer

    Public Property Name As String
        Get
            Return _name
        End Get
        Set(value As String)
            If String.IsNullOrWhiteSpace(value) Then
                Throw New ArgumentException("Name is required")
            End If
            _name = value.Trim()
        End Set
    End Property

    Public Function Describe() As String
        Return "Roll " & RollNo & " : " & Name
    End Function
End Class
