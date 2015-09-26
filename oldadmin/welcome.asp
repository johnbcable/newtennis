<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Welcome Letter");
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	return(f.ReadAll());
}
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String("Welcome to Hampton-In-Arden Tennis Club");
var sMessage, sMessage2;;
var objCDOMail;
var sTo;
var doMailing;
// First, check for if we have something in the destination email address
var email = new String(Request.QueryString("email")).toString();
if (sForename=="null"||email=="undefined")
	email=new String("").toString();
if (email == "")
	Response.Redirect("chk_memb.asp");
//  OK, we have something in the email address, lets try and send the welcome mail	
var mailingCategory = new String(Request.QueryString("cat")).toString();
if (mailingCategory=="null"||mailingCategory=="undefined")
	mailingCategory="Adult";
var sForename = new String(Request.QueryString("name")).toString();
if (sForename=="null"||sForename=="undefined")
	sForename="";
var mailingFile = new String("awelcome.htm").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (mailingCategory=="Junior")
	mailingFile = new String("jwelcome.htm").toString();
sMessage = new String(GetEveryThing(mailingFile));
sMessage2 = new String(sMessage.replace("ZXNAMEXZ",sForename)).toString();
// Set doMailing = false for testing, true for live running
doMailing = true;
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
	<!-- Comment out the next style sheet if runniung in production -->
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
	<div id="content"> 
		<h1>Club Emails:<b>Sending welcome email to <%= email %></b></h1>

<%
if (debugging)
{
	Response.Write("<br />");
	Response.Write(printMember(objMember));
	Response.Write("<br />");
}
if (doMailing)
{
	
	// objCDOMail = new ActiveXObject("CDONTS.NewMail");

	objCDOMail = newMailObject();  // in emailfuncs.asp
	
	objCDOMail.From=new String("support@hamptontennis.org.uk");
	objCDOMail.To=new String(email).toString();
	objCDOMail.Subject=new String(sSubject).toString();
	objCDOMail.HTMLBody=new String(sMessage2).toString();
	objCDOMail.BodyPart.charset = "utf-8";
	objCDOMail.Send();
	objCDOMail=null;
	Response.Write("Welcome message in file "+mailingFile+" sent to "+email);
}
else
{
		Response.Write("The below test message in file "+mailingFile+" NOT mailed");
}
%>
	 <hr>
<%= sMessage2 %>
<br>
	 <hr>
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
