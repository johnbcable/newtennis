<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="coachingfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Testing Coaching Functions");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL34;
var groupObj = new Object();
var d, thisyear;
var i, kount, dummy, dummy1;
var canEdit = isSupport();
var numcols = "3";
var groupObj = new Object();
var scheduleObj = new Object();
var report;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thisyear = new String("").toString();
strtoday = new String("").toString();
d = new Date();
thisyear += d.getYear();
sortabletoday = sortabletoday();
strtoday = today();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging=current_debug_status();
debugging = true;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
<style type="text/css">
td {
	border: 0;
	padding: 10px 10px 10px 0;
	border-bottom: 1px solid black;
}
</style>
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
		<h1>Admin:&nbsp;<b>Testing Coaching Functions</b></h1>
		<h2>List of Coaching Groups</h2>
<%
if (debugging)
{
	report = new String("").toString();
	Response.Write("<table>");
	Response.Write("<caption>Coaching info for all coaching groups</caption>");
	Response.Write("<thead><tr><th>&nbsp;</th></tr></thead><tbody>");
	SQL1 = new String("SELECT group_id FROM coaching_groups ORDER BY display_order");
	RS = ConnObj.Execute(SQL1);
	while (! RS.EOF) {
		report = new String("").toString();
		Response.Write("<tr><td>");
		groupObj = getGroup(RS("group_id"));
		report = printGroup(groupObj);
		Response.Write(report);
		Response.Write("</td></tr>");
		RS.MoveNext();
	}
	Response.Write("</tbody>");
	Response.Write("<tfoot><tr><td>****    End of debug info    ****</td></tr></tfoot></table>");

	report = new String("").toString();
	Response.Write("<table>");
	Response.Write("<caption>Coaching info for all coaching schedules</caption>");
	Response.Write("<thead><tr><th>&nbsp;</th></tr></thead><tbody>");
	SQL1 = new String("SELECT schedule_id FROM coaching_schedules ORDER BY schedule_id asc").toString();
	RS = ConnObj.Execute(SQL1);
	while (! RS.EOF) {
		report = new String("").toString();
		Response.Write("<tr><td>");
		scheduleObj = getSchedule(RS("schedule_id"));
		report = printSchedule(scheduleObj);
		Response.Write(report);
		Response.Write("</td></tr>");
		RS.MoveNext();
	}
	Response.Write("</tbody>");
	Response.Write("<tfoot><tr><td>****    End of debug info    ****</td></tr></tfoot></table>");

	report = new String("").toString();
	Response.Write("<table>");
	Response.Write("<caption>Coaching info for all coaching lessons</caption>");
	Response.Write("<thead><tr><th>&nbsp;</th></tr></thead><tbody>");
	SQL1 = new String("SELECT lesson_id FROM coaching_lessons ORDER BY lesson_id asc").toString();
	RS = ConnObj.Execute(SQL1);
	while (! RS.EOF) {
		report = new String("").toString();
		Response.Write("<tr><td>");
		lessonObj = getLesson(RS("lesson_id"));
		report = printLesson(lessoneObj);
		Response.Write(report);
		Response.Write("</td></tr>");
		RS.MoveNext();
	}
	Response.Write("</tbody>");
	Response.Write("<tfoot><tr><td>****    End of debug info    ****</td></tr></tfoot></table>");
}
%>
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
