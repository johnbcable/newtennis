<HTML>
<BODY BGCOLOR="#FFFFFF">

<%
	Set Upload = Server.CreateObject("Persits.Upload.1")
	Count = Upload.SaveVirtual("/uploads")
%>

<% = Count %> files uploaded.

</BODY>
</HTML>