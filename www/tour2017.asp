
<%@language="JScript" CODEPAGE="65001"%>
<%
Response.AddHeader("Access-Control-Allow-Origin", "*");
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Annual Tournaments in 2017");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Supporting variables and lists
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
		<h1>Playing:&nbsp;<b>Tournaments - 2017</b></h1>
<!--
		<div id="finalsdaydraw" class="borderbottom">
			<img class="floatleft"  style="margin-right:20px;" src="images/new.jpg" width="71" height="43"  alt="New - important update">
			<p>
				IMPORTANT UPDATE - <a href="finalsday2010.asp">Finals Day order of play</a> and <a href="tours.asp?season=2010">results</a>
			</p>
		</div>
-->
		<p>
			In 2017, there will be two finals days - 2<sup>nd</sup> July and 7<sup>th</sup> October.  
			Please make sure you all arrange and play your matches promptly to allow the draw to progress.
		</p>
		<h2>Challenger Tournament Draw</h2>
		<p>
			The draws for the first half of this year&apos;s tournaments are shown below as they become available. Any updates will be posted here as and when they occur.
		</p>

		<ul type="none">
			<li><a href="Tournament2015ChallengerSinglesDraw.pdf">Challenger Singles draws &raquo;</a></li>
		</ul>

		<div class="borderboth">
			<h2><span class="blueheading">Rules</span></h2>
			<ol type="disc">
				<li>
					<p>
					1) <strong>Problems in agreeing a date</strong>.  In the event of problems in agreeing a date where 3 alternate 
					dates have been offered please refer the matter to the Tournament Committee (Savio Gaspar &amp; 
					Carol Grant) for a decision.		
					</p>
				</li>
				<li>
					<p>
					2) <strong>Booking courts</strong>.  Court booking can be made by clicking on the "Book a Court" link at 
					http://d ..hamptontennis.org.uk using your User ID and PIN.  Matches must not be booked during Tuesday/Friday 
					social tennis except in the week before finals day when court 4 may be booked if essential.  Court 4 
					(but not 1,2 or 3) may be booked during any Sunday morning social tennis.  			
					</p>
				</li>
				<li>
					<p>
					3) <strong>Playing the match</strong>.  If you have not played your match by the Friday following the deadline date shown, 
					the Tournament Committee reserve the right to automatically progress the first named player or pair in 
					the draw to the next round.			
					</p>
				</li>
			</ol>
		</div>

		<h2>Main Tournament Draw</h2>
		<p>
			The draws for the second half of this year&apos;s tournaments are shown on the ClubSpark web site as they become available. Any updates will be posted there as and when they occur.
		</p>

		<div class="seealso" style="clear: both;">
			<h3>See Also:</h3>
			<ul>
				<li><a href="finalsdays2017.asp">Finals day roundups</a></li>
				<li><a href="tours.asp?season=2017">Finals day results</a></li>
				<li><a href="juniors/results.html?season=2017">Junior tournament results</a></li>
			</ul>
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
%>
