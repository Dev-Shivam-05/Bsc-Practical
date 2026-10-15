<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Login" %>
<!DOCTYPE html>
<html><head runat="server"><title>Login and Redirect</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Login and Redirect</h2>
<div class="field"><label>Username</label><asp:TextBox ID="txtUser" runat="server" /></div>
<div class="field"><label>Password</label><asp:TextBox ID="txtPass" runat="server" TextMode="Password" /></div>
<asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="action" OnClick="btnLogin_Click" />
<asp:Label ID="lblMessage" runat="server" CssClass="error" />
</div></form></body></html>
