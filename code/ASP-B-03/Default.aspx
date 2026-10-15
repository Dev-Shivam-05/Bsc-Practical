<%@ Page Language="VB" %>
<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            lblTime.Text = "Inline server-side code executed."
        End If
    End Sub
</script>
<!DOCTYPE html>
<html><head runat="server"><title>Inline VB</title>
<link href="style.css" rel="stylesheet" /></head>
<body><form id="form1" runat="server"><main>
<h1>Inline Code Demonstration</h1>
<asp:Label ID="lblTime" runat="server" CssClass="message" />
</main></form></body></html>
