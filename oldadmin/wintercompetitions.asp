<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Winter Competitions");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
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
		<h1>Playing:&nbsp;<b>Winter Competitions</b></h1>
		<p>
		2009/2010 sees the introduction of a number of opportunities to play tennis for members
		both within the club and in competition with other clubs:
		</p>
		<ul>
			<li><p><a href="#winterinternalcompetition">Winter Mixed Doubles Plate</a></p></li>
			<li><p><a href="#helencole">Helen Cole Ladies Doubles Winter League</a></p></li>
			<li><p><a href="#menswinterleague">Mens Winter League</a></p></li>
		</ul>
		<a name="winterinternalcompetition" id="winterinternalcompetition">
		<div id="winterinternal">
			<h2>Winter Mixed Doubles Plate</h2>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				Arranged on every other Wednesday evening during October and November from 7pm. 
				There will generally be 60-90 minutes of play involved. All standards of tennis 
				are welcome, just get out there and enjoy yourself!
				Equal ability pairings have been drawn. Open to adult members and invited junior members
				Fixtures commence on Wednesday 14 October
			</p>
			<ul>
				<li><a href="#">Fixture list</a></li>
			</ul>
		</div>
		<div id="helencole">
			<h2>Helen Cole Ladies Doubles Winter League</h2>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				Run by Megan Cole based in Bournville, this ladies doubles leage involves a wide range 
				of clubs (set up in 3 leagues, totalling 19 teams) who play a range of fixtures against 
				each other between now and the end of March 2010. 19 teams will compete in 3 leagues with 
				the winner of each league and the best runner-up of the 3 leagues competing in semi-finals 
				to be played by 19 April 2010 and the final on SUNDAY 25 APRIL 2010  at the Billesley Centre.
			</p>
			<p>
				<a href="hcdoublesinfo.asp">More information about this league</a>
			</p>
		</div>
		<div id="menswinterleague">
			<h2>Mens Winter League</h2>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				First team captain Mark Joannides is trying to set up some similar league fixtures for 
				mens team players. We will publish further information when it is available.
			</p>
		</div>
				
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

