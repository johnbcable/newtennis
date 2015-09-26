<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Broadcasting Email to Members Personal Email Accounts");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	fcontents = new String(f.ReadAll()).toString();
	f.Close();
	return(fcontents);
}
var whichfile = new String(Request.QueryString("thefile")).toString();
var debugging = new String(Request.QueryString("debug")).toString();
var attachfile1 = new String(Request.QueryString("attach1")).toString();
var attachfile2 = new String(Request.QueryString("attach2")).toString();
var sSubject = new String(Request.QueryString("subject")).toString();
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sMessage;
var objNewMail;
var sTo;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (debugging == "null" || debugging == "undefined" || debugging == "")
	debugging = new String("N").toString();
if (attachfile1 == "null" || attachfile1 == "undefined" || attachfile1 == "")
	attachfile1 = new String("NONE").toString();
if (attachfile2 == "null" || attachfile2 == "undefined" || attachfile2 == "")
	attachfile2 = new String("NONE").toString();
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Tennis Club Email Circular");
// Now read in contents of HTML email message
sMessage = new String(GetEveryThing(whichfile));
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
  <tr>
    <td>
    	<br>Sending email to Chester and Jayne for testing<br><br>
    	Debugging: -> [<%= debugging %>]<br><br>
		<u>Subject</u><br><br>
		<%= sSubject %><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Attachment 1 is: <%= attachfile1 %><br>
		&nbsp;&nbsp;&nbsp;&nbsp;Attachment 2 is: <%= attachfile2 %><br><br>
    	<u>Message</u><br><br>
    	<%= sMessage %>
    	<hr width=650>
<%
Server.ScriptTimeout = 360;

	objNewMail = new ActiveXObject("CDONTS.NewMail");
	objNewMail.From=new String("support@hamptontennis.org.uk");
	objNewMail.Subject=new String(sSubject).toString();
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(sMessage).toString();
	// Next few lines deal with attachments
	if (attachfile1 != "NONE")
	{
		attachfile1 = Server.MapPath(attachfile1);
	    objNewMail.AttachFile(attachfile1);
	}
	if (attachfile2 != "NONE")
	{
		attachfile2 = Server.MapPath(attachfile2);
	    objNewMail.AttachFile(attachfile2);
	}
	// end of attachments
	objNewMail.To=new String("jcbarnes@tesco.net");
	if (debugging == "Y")
	{
		Response.Write("Recipient would be [jcbarnes@tesco.net]<br>");
	}
	else
	{		
		Response.Write("Mail sent to [jcbarnes@tesco.net]<br>");
		objNewMail.Send();
	}
	objNewMail=null;
	// Now for Chester at work
	objNewMail = new ActiveXObject("CDONTS.NewMail");
	objNewMail.From=new String("support@hamptontennis.org.uk");
	objNewMail.Subject=new String(sSubject).toString();
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(sMessage).toString();
	// Next few lines deal with attachments
	if (attachfile1 != "NONE")
	{
		attachfile1 = Server.MapPath(attachfile1);
	    objNewMail.AttachFile(attachfile1);
	}
	if (attachfile2 != "NONE")
	{
		attachfile2 = Server.MapPath(attachfile2);
	    objNewMail.AttachFile(attachfile2);
	}
	// end of attachments
	objNewMail.To=new String("cbarnes@lanner.co.uk");
	if (debugging == "Y")
	{
		Response.Write("Recipient would be [cbarnes@lanner.co.uk]<br>");
	}
	else
	{		
		Response.Write("Mail sent to [cbarnes@lanner.co.uk]<br>");
		objNewMail.Send();
	}
	objNewMail=null;	
%>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
