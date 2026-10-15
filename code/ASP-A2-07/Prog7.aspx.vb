Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization

Partial Class Prog7
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then BindGrid()
    End Sub

    Private Sub BindGrid()
        gvData.DataSource = Db.ReadTable(
            "SELECT * FROM Medicine ORDER BY MedicineID")
        gvData.DataBind()
    End Sub

    Private Function FormParams() As SqlParameter()
        If String.IsNullOrWhiteSpace(txtMedicineName.Text) Then
            Throw New ArgumentException("Medicine name is required.")
        End If
        If String.IsNullOrWhiteSpace(txtCategory.Text) Then
            Throw New ArgumentException("Category is required.")
        End If
        If String.IsNullOrWhiteSpace(txtPrice.Text) Then
            Throw New ArgumentException("Price is required.")
        End If
        If String.IsNullOrWhiteSpace(txtQuantity.Text) Then
            Throw New ArgumentException("Quantity is required.")
        End If
        If String.IsNullOrWhiteSpace(txtExpiryDate.Text) Then
            Throw New ArgumentException("Expiry date is required.")
        End If
        Return New SqlParameter() {
            New SqlParameter("@MedicineName", txtMedicineName.Text.Trim()),
            New SqlParameter("@Category", txtCategory.Text.Trim()),
            New SqlParameter("@Price", Decimal.Parse(txtPrice.Text, CultureInfo.InvariantCulture)),
            New SqlParameter("@Quantity", Integer.Parse(txtQuantity.Text, CultureInfo.InvariantCulture)),
            New SqlParameter("@ExpiryDate", DateTime.ParseExact(txtExpiryDate.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture))
        }
    End Function

    Private Sub ResetForm()
        txtMedicineName.Text = ""
        txtCategory.Text = ""
        txtPrice.Text = ""
        txtQuantity.Text = ""
        txtExpiryDate.Text = ""
        hfKey.Value = ""
        gvData.SelectedIndex = -1
    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As EventArgs)
        Try
            Db.Execute("INSERT INTO Medicine (MedicineName,Category,Price,Quantity,ExpiryDate) " &
                "VALUES (@MedicineName,@Category,@Price,@Quantity,@ExpiryDate)", FormParams())
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
            Db.Execute("UPDATE Medicine SET MedicineName=@MedicineName,Category=@Category,Price=@Price,Quantity=@Quantity,ExpiryDate=@ExpiryDate WHERE MedicineID=@Key", ps.ToArray())
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
        Db.Execute("DELETE FROM Medicine WHERE MedicineID=@Key",
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
            "SELECT * FROM Medicine WHERE MedicineID=@Key",
            New SqlParameter("@Key", key))
        If data.Rows.Count = 0 Then Return
        Dim row As DataRow = data.Rows(0)
        hfKey.Value = key.ToString()
        txtMedicineName.Text = row("MedicineName").ToString()
        txtCategory.Text = row("Category").ToString()
        txtPrice.Text = row("Price").ToString()
        txtQuantity.Text = row("Quantity").ToString()
        txtExpiryDate.Text = CDate(row("ExpiryDate")).ToString("yyyy-MM-dd")
    End Sub
End Class
