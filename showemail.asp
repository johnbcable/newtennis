<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Viewing Circulated E-Mails");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	if (fso.FileExists(myfilename))
	{
		f = fso.OpenTextFile(myfilename, ForReading);
		fcontents = new String(f.ReadAll()).toString();
		f.Close();
	}
	else {
		fcontents = new String("File "+thefile+" does not exist").toString();
	}
	return(fcontents);
}
// Now for any variables local to this page
var debugging=false;
var Conn, RS, SQL1, SQL2, SQL3;
var whichemail = new String(Request.Form("email")).toString();
var themailid = new String(Request.QueryString("emailid")).toString();
var sMessage, emailnumber, maxemailnumber;
var datesent;
var nextlink, prevlink;
var emailobj;
var idnumber = 1;
var emailobj = new Object();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (whichemail == "null" || whichemail == "undefined" || whichemail == "")
{
    whichemail = new String(Request.QueryString("email")).toString();
    if (whichemail == "null" || whichemail == "undefined" || whichemail == "")
		whichemail = new String("").toString();
}
if (themailid == "null" || themailid == "undefined" || themailid == "")
{
    themailid = new String(Request.Form("emailid")).toString();
    if (themailid == "null" || themailid == "undefined" || themailid == "")
		themailid = new String("1").toString();
}
idnumber = new Number(themailid);
idnumber = idnumber.valueOf();
if (whichemail == "")
{
	// Need to get email details by ID
	emailobj = getEmailByID(idnumber);
	if (emailobj.subject == "NOT FOUND")
		 Response.Redirect("noemail.asp");
	whichemail = new String(emailobj.emailfile).toString();
	Response.Redirect("http://hamptontennis.org.uk/emails/"+emailobj.emailfile);
}
else
{
	// Get email by file ref
	emailobj = getEmailByFile(whichemail);
	if (emailobj.subject == "NOT FOUND")
		 Response.Redirect("noemail.asp");
	idnumber = new Number(emailobj.emailid);
	idnumber = idnumber.valueOf();
}
// At this point we have a current emailid and a current emailfile
// Go and get emailfile contents
sMessage = new String("").toString();
sMessage = new String(GetEveryThing("emails/"+whichemail));
var priornumber = idnumber - 1;
var nextnumber = idnumber + 1;
nextlink = new String("Next").toString();
prevlink = new String("Previous").toString();
SQL1 = new String("SELECT Max(emailid) as biggest from sentemails").toString();
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
maxemailnumber = 999;
RS = Conn.Execute(SQL1);
while (! RS.EOF)
{
	maxemailnumber = new Number(RS("biggest"));
	maxemailnumber = maxemailnumber.valueOf();
	RS.MoveNext();
}
if (priornumber < 2)
{
	prevlink = new String("").toString();
	priornumber = 1;
}
if (nextnumber > maxemailnumber)
{
	nextlink = new String("");
	nextnumber = maxemailnumber;
}
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="tennis_email.css" />
</head>
<body>
<div id="container">
<div id="content">
<!--
	<div id="emailform" class="centered">
		<p class="centered">
			<form action="emailviewer.asp" method="post">
				E-Mail to View&nbsp;&nbsp;<input type="text" name="email" size="30" maxlength="30" value="<%= whichemail %>">&nbsp;&nbsp;&nbsp;
				<input type="submit" value="View">
			</form>
		</p>
	</div>
-->
<%
if (debugging)
{
%>		
		<p>
		<%= emailobj.subject %><br />
		<%= emailobj.senton %><br />
		<%= emailobj.attach1 %><br />
		<%= emailobj.attach2 %><br />
		<%= emailobj.attach3 %><br />
		<%= emailobj.circulation %><br />
		<%= emailobj.numbersent %><br />
		<%= emailobj.emailid %><br />
		[<%= nextlink %>]<br />
		[<%= prevlink %>]<br />
		<%= priornumber %> - <%= nextnumber %>&nbsp;&nbsp;&nbsp(max = <%= maxemailnumber %>)<br />
<%
}
%>
	<div id="mainContent">
		<div class="borderbottom" id="emailparams">
			<p class="leftindent">Subject: ------->  <%= emailobj.subject %></p>
			<p class="leftindent">Date sent: ----->  <%= emailobj.senton %></p>
			<p class="leftindent">Sent to: ------->  <%= emailobj.circulation %>&nbsp;(<%= emailobj.numbersent %>)</p>
		</div>
		<div class="centered" id="emailmessage" style="overflow: hidden;">
<%
			Response.Write(sMessage);
%>
		</div>
		<p class="centered" id="nextprev">
			<a href="showemail.asp?emailid=<%= priornumber %>"><%= prevlink %></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="showemail.asp?emailid=<%= nextnumber %>"><%= nextlink %></a>
		</p>
	</div>    <!-- mainContent -->
	<div id="footer">
		<p><a name="printthis" href="javascript:window.print();"><img src="images/printer.gif" width="20" height="14" alt="Print this page" border="0">Print</a></p>
		<br />
		<br />
		<a href="javascript:window.close();">Close this window</a>
	</div>
</div>  <!-- content -->
</div>
</body>
</html>
<%
%>
