
<%@language="JScript" CODEPAGE="65001"%>
<%
Response.AddHeader("Access-Control-Allow-Origin", "http://hamptontennis.org.uk");
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
var pagetitle = new String("Annual Tournaments in 2015");
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
		<h1>Playing:&nbsp;<b>Tournaments - 2015</b></h1>
<!--
		<div id="finalsdaydraw" class="borderbottom">
			<img class="floatleft"  style="margin-right:20px;" src="images/new.jpg" width="71" height="43"  alt="New - important update">
			<p>
				IMPORTANT UPDATE - <a href="finalsday2010.asp">Finals Day order of play</a> and <a href="tours.asp?season=2010">results</a>
			</p>
		</div>
-->
		<p>
			Below are the rules for the 2015 annual tournaments. As in 2014, there will be two finals days - 4<sup>th</sup> July and 27<sup>th</sup> September.  
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
					http://hamptontennis.org.uk using your User ID and PIN.  Matches must not be booked during Tuesday/Friday 
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
			The draws for the second half of this year&apos;s tournaments are shown below as they become available. Any updates will be posted here as and when they occur.
		</p>

		<div id="2015draw" class="centered">
<!-- 
			<ul type="none">
				<li><a href="/documents/singlesdraw2015.pdf">Main Singles draws &raquo;</a></li>
			</ul>
 -->
			<ul type="none">
				<li><a href="/documents/tourdraw2015.pdf">Main Singles &amp; Doubles draws &raquo;</a></li>
			</ul>
		</div>

<!--
		<div id="2010draw" class="centered">
		
			<img src="images/msgldraw2013.gif" alt="Mens singles draw for the 2013 tournament">
			<br />
			<img src="images/lsgldraw2013.gif" alt="Ladies singles draw for the 2013 tournament">
			<br />
			<img src="images/mdbldraw2013.gif" alt="Mens doubles draw for the 2013 tournament">
			<br />
			<img src="images/ldbldraw2013.gif" alt="Ladies doubles draw for the 2013 tournament">
			<br />
			<img src="images/mixddraw2013.gif" alt="Mixed doubles draw for the 2013 tournament">
			<br />
			<img src="images/mixpdraw2013.gif" alt="Mixed doubles plate draw for the 2013 tournament">
			<br />
			<img src="images/mvddraw2013.gif" alt="Veteran mens doubles draw for the 2013 tournament">
			<br />
			<img src="images/lvddraw2013.gif" alt="Veteran ladies doubles draw for the 2013 tournament">
			<br />
			<img src="images/mpltdraw2013.gif" alt="Mens singles plate draw for the 2013 tournament">
			<br />
			<img src="images/lpltdraw2013.gif" alt="Ladies singles plate draw for the 2013 tournament">
			<br />
			<img src="images/mvddraw2013over55.gif" alt="Veteran mens over-55 Challenge Wayman draw for the 2013 tournament">
			<br />

		</div>		
-->
		<div class="seealso" style="clear: both;">
			<h3>See Also:</h3>
			<ul>
				<li><a href="finalsdays2015.asp">Finals day roundups</a></li>
				<li><a href="tours.asp?season=2015">Finals day results</a></li>
				<li><a href="juniors/results.html?season=2015">Junior tournament results</a></li>							
 				<li>
 					<a href="https://www.flickr.com/photos/103781054@N07/sets/72157655547638422">
 						Challenger Finals Day photos
 					</a>
 				</li>			
<!--
 				<li>
 					<a href="https://www.flickr.com/photos/103781054@N07/sets/72157655547638422">
 						September Finals Day photos
 					</a>
 				</li>			
			</ul>
-->
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
