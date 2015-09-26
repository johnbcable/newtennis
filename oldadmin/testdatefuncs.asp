<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="datefuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Date and Time functions Testing Page");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount;
var dummy, dummyObj, dt, today, msg;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// teamObj = getTeamByName(thisteam);
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
			<h1>Administration:<b>&nbsp;Testing Date and Time Functions</b></h1>
<!--
// timestring()
// datestring()
// timegreeting()
// dateasstring(adate)
// timeasstring(atime)
// today()
// sortabletoday()
// ddmmyyyy(Date)
// getMonthNumber(strMonth)
// getMonthAsString(monthno)
// currentYear()
// currentMonth()
// currentMonthAsString()
// currentDate()
// currentSeason()
// asSortableDate(Date)
// currentAge(strDOB)
// elapsedTime(startdate, enddate)
-->			
<%
	todaysdate = new Date();
	dt = new Date(2014, 2, 31, 0, 0, 0);
	dummyObj = new Object();
	dummy = timestring();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;timestring() ["+dummy+"]<br />");
	dummy = datestring();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;datestring() ["+dummy+"]<br />");
	dummy = timegreeting();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;timegreeting() ["+dummy+"]<br />");
	dummy = dateasstring(todaysdate);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dateasstring(today) ["+dummy+"]<br />");
	dummy = timeasstring(todaysdate);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;timeasstring(now) ["+dummy+"]<br />");
	dummy = today();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;today() ["+dummy+"]<br />");
	dummy = sortabletoday();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sortabletoday() ["+dummy+"]<br />");
	dummy = ddmmyyyy(todaysdate);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ddmmyyyy(today) ["+dummy+"]<br />");
	dummy = fulltextdate(todaysdate);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fulltextdate(today) ["+dummy+"]<br />");
	dummy = getMonthNumber("April");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;getMonthNumber('April') ["+dummy+"]<br />");
	dummy = getMonthAsString(4);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;getMonthAsString(4) ["+dummy+"]<br />");
	dummy = currentYear();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentYear() ["+dummy+"]<br />");
	dummy = currentMonth();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentMonth() ["+dummy+"]<br />");
	dummy = currentMonthAsString();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentMonthAsString() ["+dummy+"]<br />");
	dummy = currentDate();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentDate() ["+dummy+"]<br />");
	dummy = currentSeason();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentSeason() ["+dummy+"]<br />");
	dummy = asSortableDate(todaysdate);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;asSortableDate() ["+dummy+"]<br />");
	dummy = currentAge("29/04/1956");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;currentAge('29/04/1956') ["+dummy+"]<br />");
	dummyObj = daysBetween(todaysdate,dt);
	msg = "Total = " + dummyObj.days + " days, " + dummyObj.hours + " hours, " + dummyObj.minutes + 
      " minutes, and " + dummyObj.seconds + " seconds.";
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elapsedTime(today,endofseason) ["+msg+"]<br />");
	dt2 = new Date(1959, 8, 28, 0, 0, 0);
	dummyDate = nextBirthday(dt2);
	msg = new String("Next Birthday for someone born on "+dt+" is: "+dummyDate).toString();
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;nextBirthday(dob) ["+msg+"]<br />");
	dummyObj = daysBetween(todaysdate,dummyDate);
	msg = "Days between "+ddmmyyyy(todaysdate)+" and next birthday ("+ddmmyyyy(dummyDate)+") is "+dummyObj.days;
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Days to next birthday ["+msg+"]<br />");

%>		
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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


