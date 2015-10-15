<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Viewing Circulated E-Mails");
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();
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
	else
	{
	 		fcontents = new String("File not found");
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
// Now read in contents of HTML email message
if (emaildir == "")
{
	 sMessage = new String(GetEveryThing(whichemail));
	 fullwhichfile = new String(whichemail).toString();
}
else
{
	 sMessage = new String(GetEveryThing(emaildir+"/"+whichemail));
	 fullwhichfile = new String(emaildir+"/"+whichemail).toString();
}	 
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
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->

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
		<%= priornumber %> - <%= nextnumber %>&nbsp;&nbsp;&nbsp;(max = <%= maxemailnumber %>)<br />
<%
}
%>
	<div id="content">
		<h1>Emails:<b>&nbsp;Displaying Circulated Emails</b></h1>
		<p style="text-align:center;" id="nextprevattop">
			<a href="emailviewer.asp?emailid=<%= priornumber %>"><%= prevlink %></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="emailviewer.asp?emailid=<%= nextnumber %>"><%= nextlink %></a>
		</p>
		<iframe 
			src="<%= fullwhichfile %>" 
			allowTransparency="true" 
			width="100%" 
			height="700" 
			frameborder="0"
			scrolling="yes">
			You must have a browser that supports iframes to view the club emails
		</iframe>
		<p style="text-align:center;" id="nextprevatbase">
			<a href="emailviewer.asp?emailid=<%= priornumber %>"><%= prevlink %></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="emailviewer.asp?emailid=<%= nextnumber %>"><%= nextlink %></a>
		</p>
		<div class="borderbottom" id="emailparams">
			<p class="leftindent">Subject: ------->  <%= emailobj.subject %></p>
			<p class="leftindent">Date sent: ----->  <%= emailobj.senton %></p>
			<p class="leftindent">Sent to: ------->  <%= emailobj.circulation %>&nbsp;(<%= emailobj.numbersent %>)</p>
			<p class="leftindent">Sent from: ----->  <%= emailobj.circulation %>&nbsp;(<%= emailobj.numbersent %>)</p>
			<p class="leftindent">Email file: ---->  <%= emailobj.emailfile %></p>
		</div>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>
