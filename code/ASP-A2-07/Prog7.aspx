<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Prog7.aspx.vb" Inherits="Prog7" %>
<!DOCTYPE html>
<html><head runat="server"><title>Medicine Records</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Medicine Records</h2>
<div class="field"><label>Medicine name</label><asp:TextBox ID="txtMedicineName" runat="server" /></div>
<div class="field"><label>Category</label><asp:TextBox ID="txtCategory" runat="server" /></div>
<div class="field"><label>Price</label><asp:TextBox ID="txtPrice" runat="server" /></div>
<div class="field"><label>Quantity</label><asp:TextBox ID="txtQuantity" runat="server" /></div>
<div class="field"><label>Expiry date</label><asp:TextBox ID="txtExpiryDate" runat="server" TextMode="Date" /></div>
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
    DataKeyNames="MedicineID" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
  <Columns>
    <asp:BoundField DataField="MedicineID" HeaderText="ID" />
    <asp:BoundField DataField="MedicineName" HeaderText="Medicine name" />
    <asp:BoundField DataField="Category" HeaderText="Category" />
    <asp:BoundField DataField="Price" HeaderText="Price" />
    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
    <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry date" DataFormatString="{0:yyyy-MM-dd}" />
  </Columns>
</asp:GridView>

</div></form></body></html>
