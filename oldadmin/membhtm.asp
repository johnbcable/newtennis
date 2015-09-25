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
var queryname = new String(Request.QueryString("query")).toString();
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String("Junior Parents Social Evening");
var sMessage, fullmessage;
var objNewMail;
var sTo;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// if (!signedin())
// 	Response.Redirect("login.asp");
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (current_debug_status() == "null" || current_debug_status() == "undefined" || current_debug_status() == "")
	current_debug_status() = new String("N").toString();
if (queryname == "null" || queryname == "undefined" || queryname == "")
	queryname = new String("members").toString();
sMessage = new String(GetEveryThing(whichfile));
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT email, forename1 from " + queryname + " where uniqueref=11");
if (current_debug_status() == "N")
	SQLStmt = new String("SELECT distinct(email), forename1 from " + queryname + " where email is not null");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
  <tr>
    <td>
    	<br>Sending email to members ..<br><br>
    	Subject: <%= 
    	<u>Message</u><br><br>
    	<%= sMessage %>
    	<hr>
<%
if (current_debug_status() == "Y")
	Response.Write("<br>"+SQLStmt+"<br>");
Server.ScriptTimeout = 360;
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	sForename = new String(RstObj("forename1")).toString();
	fullmessage = new String(sMessage).toString();
	fullmessage = new String(sMessage.replace("ZZforenameZZ",sForename)).toString();
	objNewMail = new ActiveXObject("CDONTS.NewMail");
	objNewMail.From=new String("secretary@hamptontennis.org.uk");
	objNewMail.Subject=new String(sSubject).toString();
	objNewMail.BodyFormat=0;
	objNewMail.MailFormat=0;
	objNewMail.Body=new String(fullmessage);
	objNewMail.To=new String(RstObj("email"));
	dummy=new String("["+RstObj("email")+"]");
	if (! (dummy=="[]"))
	{
		Response.Write("Recipient is ["+RstObj("email")+"]<br>");
		objNewMail.Send();
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













