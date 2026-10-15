<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="ButtonDemo" %>
<!DOCTYPE html>
<html><head runat="server"><title>Button Click Event</title>
<link href="style.css" rel="stylesheet" />
</head><body><form id="form1" runat="server">
<main><h1>Button Click Event</h1>
<asp:Button ID="btnWelcome" runat="server" Text="Click me"
    OnClick="btnWelcome_Click" />
<asp:Label ID="lblResult" runat="server" CssClass="message" />
</main></form></body></html>
