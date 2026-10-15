<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="ExceptionDemo" %>
<!DOCTYPE html>
<html><head runat="server"><title>Exception Handling</title>
<link href="style.css" rel="stylesheet" />
</head><body><form id="form1" runat="server">
<main><h1>Exception Handling</h1>
<label>Enter an integer</label>
<asp:TextBox ID="txtNumber" runat="server" />
<asp:Button ID="btnShow" runat="server" Text="Process" OnClick="btnShow_Click" />
<asp:Label ID="lblResult" runat="server" CssClass="message" />
</main></form></body></html>
