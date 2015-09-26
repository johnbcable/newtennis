<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Hampton-In-Arden Tennis Club - Open Day - Saturday 1st June, 2013";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var reslink = new String("juniors/results.html?season=2013").toString();
displaydate = dateasstring(Date());
var debugging = false;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Tennis Summer Fun Day - Saturday June 1st, 2013</title>
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
#timetable ol li span {
	width: 30%;
	padding: 5px;
}
</style>
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
	<h1>Open Day</h1>
	<h2>From 10.00am, Saturday 1st June, 2013 at our club</h2>
	<div id="pt2010collage" class="collage">
			 <img alt="Play Tennis Day 2012" src="Images/pt_2010_collage.jpg" width="800" height="200">
	</div>
	<p>
		All members and their friends and family are invited to our tennis summer fun day on Saturday 1st June to coincide with the Hampton Festival weekend.
	</p>
	<p>
		We will kick off around midday with the finals of the junior club tournaments, and the mens and ladies doubles plate finals. This will be followed in the afternoon by family tennis and high energy drills.
	</p>
	<p>
		We will end with a family barbecue around 5pm.
	</p>
	<p>
		More detailed information will follow nearer the time, for now, please put the date in your diary and pass this on to anyone else you think may be interested.
	</p>
<!--
	<p style="margin-top: 20px;">
		Get a copy of the original promotional flyer <a href="pt2010.pdf">here</a>&nbsp;(in PDF format) or <a href="pt2010.doc">here</a> in MS-Word format.
	</p>
	<div class="seealso">
		<h3>See Also:</h3>
		<ul>
			<li><a href="thumbnails.asp?gallery=6">Photo gallery from the day</a></li>
			<li><a href="clubsportswear.asp">New range of club sportswear available to order NOW</a></li>
			<li><a href="pt2010_preview.asp">Outline timetable for the day</a></li>
		</ul>
	</div>
-->	
	</div> <!-- content -->
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
%>
