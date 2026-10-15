<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Prog4.aspx.vb" Inherits="Prog4" %>
<!DOCTYPE html>
<html><head runat="server"><title>Employee Records</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Employee Records</h2>
<div class="field"><label>Employee name</label><asp:TextBox ID="txtEmployeeName" runat="server" /></div>
<div class="field"><label>Department</label><asp:TextBox ID="txtDepartment" runat="server" /></div>
<div class="field"><label>Salary</label><asp:TextBox ID="txtSalary" runat="server" /></div>
<div class="field"><label>Contact no.</label><asp:TextBox ID="txtContactNo" runat="server" /></div>
<asp:HiddenField ID="hfKey" runat="server" />
<asp:Button ID="btnAdd" runat="server" CssClass="action"
    Text="Insert" OnClick="btnAdd_Click" />
<asp:Button ID="btnUpdate" runat="server" CssClass="action"
    Text="Update" OnClick="btnUpdate_Click" />
<asp:Button ID="btnDelete" runat="server" CssClass="action"
    Text="Delete" OnClick="btnDelete_Click" />
<asp:Button ID="btnClear" runat="server" CssClass="action"
    Text="Clear" OnClick="btnClear_Click" />
<asp:Label ID="lblMessage" runat="server" CssClass="message" />
<asp:GridView ID="gvData" runat="server" CssClass="grid"
    AutoGenerateColumns="False" AutoGenerateSelectButton="True"
    DataKeyNames="EmployeeID" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
  <Columns>
    <asp:BoundField DataField="EmployeeID" HeaderText="ID" />
    <asp:BoundField DataField="EmployeeName" HeaderText="Employee name" />
    <asp:BoundField DataField="Department" HeaderText="Department" />
    <asp:BoundField DataField="Salary" HeaderText="Salary" />
    <asp:BoundField DataField="ContactNo" HeaderText="Contact no." />
  </Columns>
</asp:GridView>

</div></form></body></html>
