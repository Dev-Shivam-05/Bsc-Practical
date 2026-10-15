Partial Class Prog1
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            gvStudents.DataSource = Db.ReadTable(
                "SELECT RollNo, Name, Age, Gender, Course FROM Students ORDER BY RollNo")
            gvStudents.DataBind()
        End If
    End Sub
End Class
