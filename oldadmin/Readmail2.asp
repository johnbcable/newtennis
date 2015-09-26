<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Reading Email");
// Now for any variables local to this page
var remotehost=new String("mail.hamptonsports.org.uk");
// just use the support account for testing
var emailuser=new String("z6524442");
var emailpassword=new String("barolo");
var Mailer;
var messtext;
var sFrom, sSubject, sBodyText;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Response.Redirect("http://webmail.hamptonsports.org.uk/");
Mailer=Server.CreateObject("POP3svg.Mailer");
Mailer.RemoteHost=remotehost;
Mailer.UserName=emailuser;
Mailer.Password=emailpassword;
Mailer.OpenPOP3();
if (Mailer.GetPopHeaders())
{
	toget=Mailer.MessageCount;
	if (toget > 0)
		messtext=new String("You have "+Mailer.MessageCount+" messages waiting");
	else
		messtext=new String("There are no messages waiting");	
}
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
<br>
	<h2>Reading My Email</h2>
<table  width="80%" border="1" cellspacing="2" cellpadding="5">
	<tr>
		<td>
			<h4><%= messtext %></h4>
			<hr width="95%" align=center>
<%
// if we have messages display summaries
if (toget > 0)
{
	Response.Write("<table>");
	for (i=1; i<=toget; i++)
	{
		Response.Write("<tr>");
		Mailer.Retrieve(i);
		// message has been retrieved - display stuff
		sFrom=new String(Mailer.FromName);
		sSubject=new String(Mailer.Subject);
		sBodyText=new String(Mailer.BodyText);
		Response.Write("<td width=120 wrap>"+sFrom+"<br><b>"+sSubject+"</b></td>");
		Response.Write("<td>"+sBodyText+"</td>");
		Response.Write("</tr>");
	}
}
%>
			This facility is currently being tested and we hope to release it onto this site in the near future.
		</td>
	</tr>
</table>
<br>
<div align="center">
<img src="images/Construc.gif" width="69" height="69" alt="We're working on it - check back later">
</div>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
Mailer.ClosePOP3();
Mailer=null;
%>



