<%@ Page Language="VB" AutoEventWireup="true" CodeFile="WelcomeSession.aspx.vb" Inherits="WelcomeSession" %>
<!DOCTYPE html>
<html><head runat="server"><title>Welcome - Session and Cookie</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Welcome - Session and Cookie</h2>
<p>From Session: <asp:Label ID="lblSession" runat="server" /></p>
<p>From Cookie: <asp:Label ID="lblCookie" runat="server" /></p>
<asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="action"
    OnClick="btnLogout_Click" />
</div></form></body></html>
