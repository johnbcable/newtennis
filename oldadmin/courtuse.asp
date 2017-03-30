<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "Typical Court Usage";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
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
		<h1>Playing:<b>&nbsp;Typical Weekly Court Usage</b></h1>
		<p>
		There are many ways for adult members to enjoy competitive tennis at our club. You may be involved in 
		matches with other clubs or you may also take part in the various internal tournaments 
		and leagues run throughout the year at the club. Alternately, you may prefer to take part in our
		social tennis sessions.
		</p>
		<p>
		The picture below shows in outline a typical week's court usage. Time slots not allocated (coloured slots are allocated)  
		are available for members to book using the court booking sheets folder located in the clubhouse by the tennis 
		club noticeboard (or behind the bar). A printable copy of the typical court usage is available by clicking on 
		the picture below which will attempt to open an Adobe Acrobat document containing this picture (which you may then 
		save to your computer or print directly).
		</p>
		<a href="courtuse.pdf" alt="Adobe Acrobat document containing further details of the typical court usage at Hampton-In-Arden tennsi club">
			<img src="images/courtuse.gif" alt="Typical weekly court usage outside league season" width="601" height="412" />
		</a>
		<p style="clear: both;">
			<br />
			<b>N.B.</b>&nbsp;During the Coventry and District league season (late April to early August) home league matches 
			for Hampton's 7 league teams (3 ladies; 4 mens) are played on Monday, Wednesday and Thursday evenings on up to 4 of the courts. 
			These courts are typically used between 6.15 pm and 10.00 pm and are thus not available for member booking at these times.
		</p>
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
