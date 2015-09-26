<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "Tournaments";
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
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
			<h1>Playing:&nbsp;<b>Tournaments</b></h1>
			<h2>Annual Adult Tournament</h2>
			<p>
				Hampton runs one internal adult tournament each season. Usually commencing in late April/early May. Entry forms for the tournament 
				initially go out with the subscription renewal requests during March each year. Any member can participate. Several titles 
				are contested namely:
			</p>
			<ul>
				<li>Mens:      Singles, Doubles, Singles Plate, Veterans Doubles, Veterans Doubles Over 55</li>
				<li>Ladies:    Singles, Doubles, Singles Plate, Veterans Doubles</li>
				<li>Mixed:     Doubles, Doubles Plate</li>
			</ul>
			<p>
				Finals have usually been held on a Saturday in July but have, in the past where circumstances warranted it, been held in the early autumn 
				for example: the finals day for 2007 was held at the end of September!<br />
				<span class="morelink"><a href="tours.asp?season=2011">More details .....</a></span>
			</p>
			<h3>MAXI-Tennis</h3>
			<p>
				At a less formal level, the MAXI-Tennis tournament usually run in the early spring is a great way of getting to know other 
				members at your club in the midst and hullabaloo of friendly competition. Look out for this event to restart when we have 
				accepted our new courts ...<br />
				<span class="morelink"><a href="maxitennis.asp">More details .....</a></span>
			</p>
			<h2 style="clear: both;">Junior Tournaments</h2>
			<img src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="boxleft">
			<p>
				Junior members at Hampton are not forgotten with regard to tournaments. They have their own one-day annual tournament usually run 
				sometime in June and also have external initiatives such as the Road to Wimbledon annual one-day event.<br />
				<span class="morelink"><a href="juniors/tournaments.html">More details .....</a></span>
			</p>
			<h2>See Also:</h2>
			<ul>
				<li><a href="winners.asp">Past tournament winners (adults + juniors)</a></li>
				<li><a href="maxitennis2010.asp">2010 Maxi-Tennis season information</a></li>
			</ul>
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

