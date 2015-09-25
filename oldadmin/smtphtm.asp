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
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String("News Circular");
var sMessage;
var objNewMail;
var sTo;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (current_debug_status() == "null" || current_debug_status() == "undefined" || current_debug_status() == "")
	current_debug_status() = "N";
sMessage = new String(GetEveryThing(whichfile));
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT email from members where surname like 'CABLE' and email is not null");
if (current_debug_status() == "N")
	SQLStmt = new String("SELECT distinct(email) from members where email is not null");
RstObj = ConnObj.Execute(SQLStmt);
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
  <tr>
    <td>
    	<br>Sending email to members ..<br><br>
    	<u>Message</u><br><br>
    	<%= sMessage %>
    	<hr>
<%
Server.ScriptTimeout = 360;
while (! RstObj.EOF)
{
	objNewMail = new ActiveXObject("SMTPsvg.Mailer");
	objNewMail.FromName=new String("Hampton-In-Arden Tennis Club");
	objNewMail.FromAddress=new String("secretary@hamptontennis.org.uk");
	objNewMail.RemoteHost = "mail.hamptontennis.org.uk";
	objNewMail.AddRecipient("Tennis Club Member",(new String(RstObj("email"))));
	objNewMail.ContentType = "text/html";
	objNewMail.Subject=new String("News");
	objNewMail.BodyText=new String(sMessage);
	dummy=new String("["+RstObj("email")+"]");
	if (! (dummy=="[]"))
	{
		if (objNewMail.SendMail())
		{
			Response.Write("Mail sent to ["+RstObj("email")+"]<br>");
		}
		else
		{
			Response.Write("Failed to send mail to ["+RstObj("email")+"]<br>");
			Response.Write("<br><br>Mail error was: "+objNewMail.Response+"<br><br>");
		}
	}
	RstObj.MoveNext();
	objNewMail=null;
}
%>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
RstObj=null;
ConnObj.Close();
ConnObj=null;
%>






























