<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="StudentForm" %>
<!DOCTYPE html>
<html><head runat="server"><title>Student Information Form</title>
<link href="style.css" rel="stylesheet" />
</head><body><form id="form1" runat="server">
<main><h1>Student Information Form</h1>
<label>Name</label><asp:TextBox ID="txtName" runat="server" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtName"
    ErrorMessage="Name required" CssClass="error" />
<label>Roll No</label><asp:TextBox ID="txtRoll" runat="server" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtRoll"
    ErrorMessage="Roll no. required" CssClass="error" />
<label>Age</label><asp:TextBox ID="txtAge" runat="server" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge"
    ErrorMessage="Age required" CssClass="error" Display="Dynamic" />
<asp:RangeValidator runat="server" ControlToValidate="txtAge"
    MinimumValue="1" MaximumValue="120" Type="Integer"
    ErrorMessage="Enter age 1-120" CssClass="error" />
<label>Course</label><asp:TextBox ID="txtCourse" runat="server" />
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtCourse"
    ErrorMessage="Course required" CssClass="error" />
<br /><asp:Button ID="btnSave" runat="server" Text="Show student"
    OnClick="btnSave_Click" />
<asp:Label ID="lblResult" runat="server" CssClass="message" />
</main></form></body></html>
