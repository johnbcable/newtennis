<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "North Warwickshire Doubles League";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
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
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
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
		<h1>Juniors:&nbsp;<b><%= pagetitle %></b></h1>
		<div id="framework">
			<h5>National Competition Framework</h5>
<!--#include file="cfmap.htm" -->	
		</div>
		<p style="clear:both;">
			Many of the original external competitions the club has been involved in still have benefit and relevance under the new 
			National Competition Framework (see above). For many years now, Hampton has participated in the North Warwickshire Doubles League. The league is run and 
			administered by Malcom Sidwell based at the Edgbaston Archery tennis club (the oldest lawn tennis club in the world).
			It is strictly for juniors - under 17 being the oldest category.
		</p>
		<div id="nwgeneralinfo">
			<h2>General Information</h2>
			<p>
			Each year (usually sometime in January) a meeting is held at Edgbaston Archery where clubs who are interested in entering 
			teams into the North Warwickshire Doubles League send representatives to agree a set of fixtures for each team. Nominated 
			contact points for each team (usually parents of children taking part) are the responsible, in conjunction with their team members, 
			for contacting the other teams in their part of the league and arranging fixtures between them. Finalists and runners-up in each 
			age group then meet each other (again) in a final usually held at Edgbaston Archery in early September to decide who should 
			represent North Warwickshire in the doubles category. Champions then go forward to the North vs South Warwickshire county-wide 
			finals (held this year at Warwick Boat Club) to decide who are county champions for their age group.
 			</p>
			<p>
				If you would like to know more about how to get involved in the North Warwickshire Doubles for next time (2009) please 
				conatct your <a href="committees.asp#junior">Junior Committee</a> or have a chat with your coach, Ian Poole (07968 451956).
			</p>
		</div>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="nwrules.asp">Rules of the North Warwickshire Doubles League</a></li>
				<li><a href="nwcontactguide.asp">Guide for club contacts for this league</a></li>
				<li><a href="nwwinners.asp">Past winners and runners up</a></li>
				<li><a href="nwdblsleague.asp">Current club contacts and provisional fixtures</a></li>
			</ul>
		</div>	
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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
