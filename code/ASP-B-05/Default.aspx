<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="ExceptionDemo" %>
<!DOCTYPE html>
<html><head runat="server"><title>CLR and Exception Handling</title>
<link href="style.css" rel="stylesheet" />
</head><body><form id="form1" runat="server">
<main><h1>CLR and Exception Handling</h1>
<asp:Label ID="lblClr" runat="server" CssClass="message" />
<label>Enter an integer</label>
<asp:TextBox ID="txtNumber" runat="server" />
<asp:Button ID="btnShow" runat="server" Text="Process" OnClick="btnShow_Click" />
<asp:Label ID="lblResult" runat="server" CssClass="message" />
<asp:Label ID="lblFinally" runat="server" CssClass="message" />
</main></form></body></html>
