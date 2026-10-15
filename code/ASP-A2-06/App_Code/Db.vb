Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Public NotInheritable Class Db
    Private Sub New()
    End Sub

    Private Shared ReadOnly ConnectionText As String =
        ConfigurationManager.ConnectionStrings("con").ConnectionString

    Public Shared Function ReadTable(query As String,
                                     ParamArray args() As SqlParameter) As DataTable
        Dim result As New DataTable()
        Using con As New SqlConnection(ConnectionText)
            Using cmd As New SqlCommand(query, con)
                If args.Length > 0 Then cmd.Parameters.AddRange(args)
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(result)
                End Using
            End Using
        End Using
        Return result
    End Function

    Public Shared Function Execute(query As String,
                                   ParamArray args() As SqlParameter) As Integer
        Using con As New SqlConnection(ConnectionText)
            Using cmd As New SqlCommand(query, con)
                If args.Length > 0 Then cmd.Parameters.AddRange(args)
                con.Open()
                Return cmd.ExecuteNonQuery()
            End Using
        End Using
    End Function
End Class
