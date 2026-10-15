Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class Prog5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then BindGrid()
    End Sub

    Private Sub BindGrid()
        gvData.DataSource = Db.ReadTable(
            "SELECT * FROM Customer ORDER BY CustomerID")
        gvData.DataBind()
    End Sub

    Private Function FormParams() As SqlParameter()
        If String.IsNullOrWhiteSpace(txtCustomerName.Text) Then
            Throw New ArgumentException("Customer name is required.")
        End If
        If String.IsNullOrWhiteSpace(txtEmail.Text) Then
            Throw New ArgumentException("Email is required.")
        End If
        If String.IsNullOrWhiteSpace(txtPhone.Text) Then
            Throw New ArgumentException("Phone is required.")
        End If
        If String.IsNullOrWhiteSpace(txtAddress.Text) Then
            Throw New ArgumentException("Address is required.")
        End If
        Return New SqlParameter() {
            New SqlParameter("@CustomerName", txtCustomerName.Text.Trim()),
            New SqlParameter("@Email", txtEmail.Text.Trim()),
            New SqlParameter("@Phone", txtPhone.Text.Trim()),
            New SqlParameter("@Address", txtAddress.Text.Trim())
        }
    End Function

    Private Sub ResetForm()
        txtCustomerName.Text = ""
        txtEmail.Text = ""
        txtPhone.Text = ""
        txtAddress.Text = ""
        hfKey.Value = ""
        gvData.SelectedIndex = -1
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Try
            Db.Execute("INSERT INTO Customer (CustomerName,Email,Phone,Address) " &
                "VALUES (@CustomerName,@Email,@Phone,@Address)", FormParams())
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
            Db.Execute("UPDATE Customer SET CustomerName=@CustomerName,Email=@Email,Phone=@Phone,Address=@Address WHERE CustomerID=@Key", ps.ToArray())
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
        Db.Execute("DELETE FROM Customer WHERE CustomerID=@Key",
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
            "SELECT * FROM Customer WHERE CustomerID=@Key",
            New SqlParameter("@Key", key))
        If data.Rows.Count = 0 Then Return
        Dim row As DataRow = data.Rows(0)
        hfKey.Value = key.ToString()
        txtCustomerName.Text = row("CustomerName").ToString()
        txtEmail.Text = row("Email").ToString()
        txtPhone.Text = row("Phone").ToString()
        txtAddress.Text = row("Address").ToString()
    End Sub
End Class
