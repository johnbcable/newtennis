<%
if (signedin())
{
	var mymessages = new String(getRecentMessages(3)).toString();
	Response.Write(mymessages);
}
%>
