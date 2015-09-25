<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Juniors Area");
// Now for any variables local to this page
var greeting;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
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
	<h1>Playing:&nbsp;<b>Playing Tennis as a Junior at Hampton</b></h1>
	<p>
		Hi <%= myname %>
	</p>
	<p>
		Hampton-In-Arden Tennis Club provides many opportunities for the junior member to play tennis and be 
		involved in more structured coaching and competitive play.
	</p>
	<div id="juniorsocialplay" class="bordertop">
		<h2>Social Tennis</h2>
		<p class="leftindent">
			Any junior member can book a court to play on by consulting the court booking sheets held at the clubhouse
			on the tennis noticeboard provided that alternate bookings are not in place. A schedule of typical court usage
			for the busiest time of the year is provided <a href="courtuse.asp">here</a> for your reference. There are free 
			times during a typical week when most courts will be available to use.
		</p>
	</div>
	<div id="jtournamentinfo" class="borderboth">
		<h2>Tournaments</h2>
		<p class="leftindent">
			Hampton-In-Arden Tennis Club runs several internal tournaments for all levels of junior
			members during each season. Our new head coach (Ian Poole) is trying to encourage more children 
			to take part in competitions during each term. Typically these include a Road to Wimbledon day 
			and the main Junior Tournament<br />
			<span class="morelink"><a href="juniors/tournaments.html">More details ....</a></span>
		</p>
	</div>
	<div id="coachinginfo" class="borderbottom">
		<h2>Junior Coaching</a></h2>
		<p class="leftindent">
			Our coaching staff currently provide coaching sessions for each age group in the National Competition Framework, 
			staring with Mini-Tennis (Red). The current coaching schedule is published on this site <a href="juniors/coaching_schedule.html">here</a>. 
			Also, please don't forget that the club has been involved in anumber of external competitions on a regular basis over the 
			years and some of these may be of benefit in this category, transitioning from Mini_tennis via teenage years to adult 
			player.<br />
			<span class="morelink"><a href="juniors/coaching.html">More details ....</a></span>
		</p>
	</div>
	<div id="nwdoublesinfo" class="borderbottom">
		<h2>North Warwickshire Doubles League</a></h2>
		<p>
			This competition is great fun, competitive, gets you noticed in the national arena and provides a good foundation for any 
			league play you may wish to consider for the Hampton league teams (the Coventry League is exclusively doubles match play 
			- no singles match play involved).<br />
			<span class="morelink"><a href="nwdoublesinfo.asp">More details ....</a></span>
		</p>	
	</div>
    <p>
		All events are hosted at the tennis club. For more details,  contact the
		<a href="committees.asp#junior">Junior Committee.</a> or check the club noticeboard nearer the date(s)
	</p>
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


