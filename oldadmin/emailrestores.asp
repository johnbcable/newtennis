<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Restoring saved email addresses");
var debugging = false;
var curpos, kount;
// Now for any variables local to this page
var lunique;
var lpin;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RS, RS2, RS3;
var SQL1, SQL2, SQL3, SQL4;
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
RS3=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
var endpos, endpoint;
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
			<h1>PIN Updates</h1>
			<p>
<%

// Set up loop on pinresets table and update member details 
// with new pin from this table.
// Log names etc while doing it Insert photo refs into their gallery 
SQL1 = new String("SELECT * FROM SafeEmails ORDER BY uniqueref").toString();
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
 SQL3 = new String("UPDATE members SET email = '"+RS("email")+"' WHERE uniqueref = "+RS("uniqueref")).toString();
 Response.Write("Updating email for "+RS("uniqueref")+" to "+RS("email")+"<br />");
 Response.Write(SQL3+"<br />");
 RS3 = ConnObj.Execute(SQL3);
 RS.MoveNext();
}
%>
		</p>
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



