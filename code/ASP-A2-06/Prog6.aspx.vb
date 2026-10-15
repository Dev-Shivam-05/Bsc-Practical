Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class Prog6
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then BindGrid()
    End Sub

    Private Sub BindGrid()
        gvData.DataSource = Db.ReadTable(
            "SELECT * FROM Students ORDER BY RollNo")
        gvData.DataBind()
    End Sub

    Private Function FormParams() As SqlParameter()
        If String.IsNullOrWhiteSpace(txtRollNo.Text) Then
            Throw New ArgumentException("Roll no. is required.")
        End If
        If String.IsNullOrWhiteSpace(txtName.Text) Then
            Throw New ArgumentException("Student name is required.")
        End If
        If String.IsNullOrWhiteSpace(txtAge.Text) Then
            Throw New ArgumentException("Age is required.")
        End If
        If String.IsNullOrWhiteSpace(txtGender.SelectedValue) Then
            Throw New ArgumentException("Gender is required.")
        End If
        If String.IsNullOrWhiteSpace(txtCourse.Text) Then
            Throw New ArgumentException("Course is required.")
        End If
        Return New SqlParameter() {
            New SqlParameter("@RollNo", Integer.Parse(txtRollNo.Text, CultureInfo.InvariantCulture)),
            New SqlParameter("@Name", txtName.Text.Trim()),
            New SqlParameter("@Age", Integer.Parse(txtAge.Text, CultureInfo.InvariantCulture)),
            New SqlParameter("@Gender", txtGender.SelectedValue),
            New SqlParameter("@Course", txtCourse.Text.Trim())
        }
    End Function

    Private Sub ResetForm()
        txtRollNo.Text = ""
        txtName.Text = ""
        txtAge.Text = ""
        txtGender.SelectedIndex = 0
        txtCourse.Text = ""
        txtRollNo.ReadOnly = False
        hfKey.Value = ""
        gvData.SelectedIndex = -1
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Try
            Db.Execute("INSERT INTO Students (RollNo,Name,Age,Gender,Course) " &
                "VALUES (@RollNo,@Name,@Age,@Gender,@Course)", FormParams())
            lblMessage.Text = "Record inserted."
            ResetForm()
            BindGrid()
        Catch ex As Exception
            lblMessage.Text = "Insert failed: check all field values."
        End Try
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)
        If hfKey.Value = "" Then
            lblMessage.Text = "Select a record first."
            Return
        End If
        Try
            Dim ps As New List(Of SqlParameter)(FormParams())
            ps.Add(New SqlParameter("@Key", Integer.Parse(hfKey.Value)))
            Db.Execute("UPDATE Students SET Name=@Name,Age=@Age,Gender=@Gender,Course=@Course WHERE RollNo=@Key", ps.ToArray())
            lblMessage.Text = "Record updated."
            ResetForm()
            BindGrid()
        Catch ex As Exception
            lblMessage.Text = "Update failed: check all field values."
        End Try
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs)
        Dim key As Integer
        If Not Integer.TryParse(hfKey.Value, key) Then
            lblMessage.Text = "Select a record first."
            Return
        End If
        Db.Execute("DELETE FROM Students WHERE RollNo=@Key",
            New SqlParameter("@Key", key))
        lblMessage.Text = "Record deleted."
        ResetForm()
        BindGrid()
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs)
        ResetForm()
        lblMessage.Text = ""
    End Sub

    Protected Sub gvData_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim key As Integer = Convert.ToInt32(gvData.SelectedDataKey.Value)
        Dim data As DataTable = Db.ReadTable(
            "SELECT * FROM Students WHERE RollNo=@Key",
            New SqlParameter("@Key", key))
        If data.Rows.Count = 0 Then Return
        Dim row As DataRow = data.Rows(0)
        hfKey.Value = key.ToString()
        txtRollNo.Text = row("RollNo").ToString()
        txtName.Text = row("Name").ToString()
        txtAge.Text = row("Age").ToString()
        txtGender.SelectedValue = row("Gender").ToString()
        txtCourse.Text = row("Course").ToString()
        txtRollNo.ReadOnly = True
    End Sub
End Class
