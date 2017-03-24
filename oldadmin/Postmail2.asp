<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("ASP Email Confirmation");
// Now for any variables local to this page
var sTo, sFrom, sSubject, sMessage;
// sTo = new String(Request.Form("whoto"));
// sFrom = new String(Request.Form("whofrom"));
// sSubject = new String(Request.Form("thesubject"));
// sMessage = new String(Request.Form("themessage"));
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var Mailer = Server.CreateObject("SMTPsvg.Mailer");
var mailtext;
Mailer.FromName="Hampton In Arden Tennis Club Web Site";
Mailer.FromAddress="support@hamptonsports.org.uk";
Mailer.RemoteHost="mail.hamptonsports.org.uk";
Mailer.AddRecipient("John Cable","jcable@dial.pipex.com");
Mailer.Subject="HTML Mail Test"
Mailer.AddAttachment(Server.MapPath("cc6.htm"));
Mailer.BodyText="Attached is your copy of the latest Court Circular magazine (Issue 6 - April 2002). This should be viewable in exactly the same way as if you were on the site just by electing to open it from your email. If this doesnt work, the current issue (incl. any fixed typing or presentation gaffs!) is always available directly from our web site (http//hamptonsports.org.uk).";
if (Mailer.SendMail())
	mailtext="Mail sent ...";
else
	mailtext="Mail failure - "+Mailer.Response;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
	<font size="4" color="#000000" face="Verdana">
	<b>
		<%= mailtext %>
		Please click on a menu choice on the left to go elsewhere in the site.
	</b>
	</font>
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
%>
