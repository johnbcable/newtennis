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
var whichfile = new String(Request.Form("thefile")).toString();
var debugging = new String(Request.Form("debug")).toString();
var queryname = new String(Request.Form("query")).toString();
var whofrom = new String(Request.Form("whofrom")).toString();
var title1 = new String(Request.Form("title1")).toString();
var title2 = new String(Request.Form("title2")).toString();
var title3 = new String(Request.Form("title3")).toString();
var para1 = new String(Request.Form("para1")).toString();
var para2 = new String(Request.Form("para2")).toString();
var para3 = new String(Request.Form("para3")).toString();
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String(Request.Form("thesubject"));
var sPersonal = new String(Request.Form("whotopersonal"));
var sMessage, fullmessage;
var objNewMail;
var sTo;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
// set the following variable to Y  if actually sending email
var sending = new String("N").toString();      
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// if (!signedin())
// 	Response.Redirect("login.asp");
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	whichfile = new String("messtemp.htm");
if (debugging == "null" || debugging == "undefined" || debugging == "")
	debugging = new String("N").toString();
if (queryname == "null" || queryname == "undefined" || queryname == "")
	queryname = new String("members").toString();
// Process message title area
if (title1 == "null" || title1 == "undefined" || title1 == "")
	title1 = new String(" ").toString();
else
	title1 = new String("<p align=center><b>"+title1+"</b></p>");
if (title2 == "null" || title2 == "undefined" || title2 == "")
	title2 = new String(" ").toString();
else
	title2 = new String(title2);
if (title3 == "null" || title3 == "undefined" || title3 == "")
	title3= new String(" ").toString();
else
	title3 = new String(title3);
// Process message text area inserts
if (para1 == "null" || para1 == "undefined" || para1 == "")
	para1 = new String(" ").toString();
else
	para1 = new String("<p align=center><b>"+para1+"</b></p>");
if (para2 == "null" || para2 == "undefined" || para2 == "")
	para2 = new String(" ").toString();
else
	para2 = new String("<br>GG"+para2+"GG<br>");
if (para3 == "null" || para3 == "undefined" || para3 == "")
	para3= new String(" ").toString();
else
	para3 = new String("<br>"+para3+"<br>");
// Now get template text from nominated file
sMessage = new String(GetEveryThing(whichfile));
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT email, forename1 from " + queryname + " where uniqueref=11");
if (debugging == "N")
	SQLStmt = new String("SELECT distinct(email), forename1 from " + queryname + " where email is not null");
// End of page start up coding
Server.ScriptTimeout = 360;
// Now, do any non-personal text substitutions
sMessage = new String(sMessage.replace("ZZtitle1ZZ",title1)).toString();
sMessage = new String(sMessage.replace("ZZtitle2ZZ",title2)).toString();
sMessage = new String(sMessage.replace("ZZtitle3ZZ",title3)).toString();
sMessage = new String(sMessage.replace("ZZpara1ZZ",para1)).toString();
sMessage = new String(sMessage.replace("ZZpara2ZZ",para2)).toString();
sMessage = new String(sMessage.replace("ZZpara3ZZ",para3)).toString();
%>
<!--#include file="pagehead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
  <tr>
    <td>
    	<br>Sending email to members ..<br><br>
    	<b>Subject: <%= sSubject %></b><br><br>
    	<u>Message</u><br><br>
<%
    	Response.Write(sMessage);
%>
    	<hr>
<%
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	sForename = new String(RstObj("forename1")).toString();
	// fullmessage = new String(sMessage).toString();
	fullmessage = new String(sMessage.replace("ZZforenameZZ",sForename)).toString();
	if (sending=="Y")
	{
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













