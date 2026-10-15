<%@ Page Language="VB" AutoEventWireup="true" CodeFile="SetCookie.aspx.vb" Inherits="SetCookie" %>
<!DOCTYPE html>
<html><head runat="server"><title>Store Name in Cookie</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Store Name in Cookie</h2>
<div class="field"><label>Name</label><asp:TextBox ID="txtName" runat="server" /></div>
<asp:Button ID="btnSave" runat="server" Text="Save cookie" CssClass="action" OnClick="btnSave_Click" />
<asp:Label ID="lblMessage" runat="server" CssClass="message" />
<p><a href="GetCookie.aspx">Open cookie read page</a></p>
</div></form></body></html>
