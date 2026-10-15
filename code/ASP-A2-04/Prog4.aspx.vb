Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class Prog4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then BindGrid()
    End Sub

    Private Sub BindGrid()
        gvData.DataSource = Db.ReadTable(
            "SELECT * FROM Employee ORDER BY EmployeeID")
        gvData.DataBind()
    End Sub

    Private Function FormParams() As SqlParameter()
        If String.IsNullOrWhiteSpace(txtEmployeeName.Text) Then
            Throw New ArgumentException("Employee name is required.")
        End If
        If String.IsNullOrWhiteSpace(txtDepartment.Text) Then
            Throw New ArgumentException("Department is required.")
        End If
        If String.IsNullOrWhiteSpace(txtSalary.Text) Then
            Throw New ArgumentException("Salary is required.")
        End If
        If String.IsNullOrWhiteSpace(txtContactNo.Text) Then
            Throw New ArgumentException("Contact no. is required.")
        End If
        Return New SqlParameter() {
            New SqlParameter("@EmployeeName", txtEmployeeName.Text.Trim()),
            New SqlParameter("@Department", txtDepartment.Text.Trim()),
            New SqlParameter("@Salary", Decimal.Parse(txtSalary.Text, CultureInfo.InvariantCulture)),
            New SqlParameter("@ContactNo", txtContactNo.Text.Trim())
        }
    End Function

    Private Sub ResetForm()
        txtEmployeeName.Text = ""
        txtDepartment.Text = ""
        txtSalary.Text = ""
        txtContactNo.Text = ""
        hfKey.Value = ""
        gvData.SelectedIndex = -1
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Try
            Db.Execute("INSERT INTO Employee (EmployeeName,Department,Salary,ContactNo) " &
                "VALUES (@EmployeeName,@Department,@Salary,@ContactNo)", FormParams())
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
            Db.Execute("UPDATE Employee SET EmployeeName=@EmployeeName,Department=@Department,Salary=@Salary,ContactNo=@ContactNo WHERE EmployeeID=@Key", ps.ToArray())
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
        Db.Execute("DELETE FROM Employee WHERE EmployeeID=@Key",
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
            "SELECT * FROM Employee WHERE EmployeeID=@Key",
            New SqlParameter("@Key", key))
        If data.Rows.Count = 0 Then Return
        Dim row As DataRow = data.Rows(0)
        hfKey.Value = key.ToString()
        txtEmployeeName.Text = row("EmployeeName").ToString()
        txtDepartment.Text = row("Department").ToString()
        txtSalary.Text = row("Salary").ToString()
        txtContactNo.Text = row("ContactNo").ToString()
    End Sub
End Class
