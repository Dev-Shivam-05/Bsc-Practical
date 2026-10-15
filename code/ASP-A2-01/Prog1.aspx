<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Prog1.aspx.vb" Inherits="Prog1" %>
<!DOCTYPE html>
<html><head runat="server"><title>Student Records</title><link href="site.css" rel="stylesheet" /></head><body><form id="form1" runat="server">
<div class="wrapper"><h2>Student Records</h2>
<asp:GridView ID="gvStudents" runat="server" CssClass="grid"
    AutoGenerateColumns="true" />
</div></form></body></html>
