<%@ Page Language="VB" AutoEventWireup="true" MasterPageFile="~/Student.master" CodeFile="Prog6.aspx.vb" Inherits="Prog6" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<h2>Students Records</h2>
<div class="field"><label>Roll no.</label><asp:TextBox ID="txtRollNo" runat="server" /></div>
<div class="field"><label>Student name</label><asp:TextBox ID="txtName" runat="server" /></div>
<div class="field"><label>Age</label><asp:TextBox ID="txtAge" runat="server" /></div>
<div class="field"><label>Gender</label><asp:DropDownList ID="txtGender" runat="server"><asp:ListItem>Male</asp:ListItem><asp:ListItem>Female</asp:ListItem><asp:ListItem>Other</asp:ListItem></asp:DropDownList></div>
<div class="field"><label>Course</label><asp:TextBox ID="txtCourse" runat="server" /></div>
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
    DataKeyNames="RollNo" OnSelectedIndexChanged="gvData_SelectedIndexChanged">
  <Columns>
    <asp:BoundField DataField="RollNo" HeaderText="ID" />
    <asp:BoundField DataField="Name" HeaderText="Student name" />
    <asp:BoundField DataField="Age" HeaderText="Age" />
    <asp:BoundField DataField="Gender" HeaderText="Gender" />
    <asp:BoundField DataField="Course" HeaderText="Course" />
  </Columns>
</asp:GridView>

</asp:Content>
