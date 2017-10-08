<%
if (signedin())
{
	var myemails = new String(getRecentEmails(3)).toString();
	Response.Write(myemails);
}
%>
