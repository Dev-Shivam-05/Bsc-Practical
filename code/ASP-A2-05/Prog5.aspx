<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Prog5.aspx.vb" Inherits="Prog5" %>
<!DOCTYPE html>
<html><head runat="server"><title>Customer Records</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Customer Records</h2>
<div class="field"><label>Customer name</label><asp:TextBox ID="txtCustomerName" runat="server" /></div>
<div class="field"><label>Email</label><asp:TextBox ID="txtEmail" runat="server" /></div>
<div class="field"><label>Phone</label><asp:TextBox ID="txtPhone" runat="server" /></div>
<div class="field"><label>Address</label><asp:TextBox ID="txtAddress" runat="server" /></div>
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
    DataKeyNames="CustomerID" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
  <Columns>
    <asp:BoundField DataField="CustomerID" HeaderText="ID" />
    <asp:BoundField DataField="CustomerName" HeaderText="Customer name" />
    <asp:BoundField DataField="Email" HeaderText="Email" />
    <asp:BoundField DataField="Phone" HeaderText="Phone" />
    <asp:BoundField DataField="Address" HeaderText="Address" />
  </Columns>
</asp:GridView>

</div></form></body></html>
