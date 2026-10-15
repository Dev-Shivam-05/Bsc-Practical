<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Prog2.aspx.vb" Inherits="Prog2" %>
<!DOCTYPE html>
<html><head runat="server"><title>Login Form Validation</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Login Form Validation</h2>
<div class="field"><label>Username</label>
  <asp:TextBox ID="txtUser" runat="server" /></div>
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser"
    ErrorMessage="Username is required" CssClass="error" Display="Dynamic" />
<div class="field"><label>Password</label>
  <asp:TextBox ID="txtPass" runat="server" TextMode="Password" /></div>
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass"
    ErrorMessage="Password is required" CssClass="error" Display="Dynamic" />
<div class="field"><label>Confirm password</label>
  <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" /></div>
<asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirm"
    ErrorMessage="Confirmation is required" CssClass="error" Display="Dynamic" />
<asp:CompareValidator runat="server" ControlToValidate="txtConfirm"
    ControlToCompare="txtPass" Operator="Equal" Type="String"
    ErrorMessage="Passwords do not match" CssClass="error" Display="Dynamic" />
<br /><asp:Button ID="btnValidate" runat="server" Text="Validate"
    CssClass="action" OnClick="btnValidate_Click" />
<asp:Label ID="lblMessage" runat="server" CssClass="message" />
</div></form></body></html>
