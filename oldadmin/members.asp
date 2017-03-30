<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Members Area");
// Now for any variables local to this page
var greeting;
var RS, Conn, SQL1, dbconnect, uniqref;
var debugging = current_debug_status();
var leaguetext = "is now under way";
var dummy, dummy2;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// Get user details
uniqref = getUserCode();
uniqref = uniqref.toString();
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
SQL1 = new String("SELECT teamname from tennisteams where uniqueref = "+uniqref).toString();
RS = Conn.Execute(SQL1);
if (! RS.EOF)
	Response.Redirect("captains.asp");
greeting = "Welcome to the Members Area "+getUserName();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging = current_debug_status();
var leaguetext = "is now under way";
// End of page start up coding
dummy = currentMonth();
dummy2 = currentYear();
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
	<h1>Members:&nbsp;<b>Home Page</b></h1>
	<h2><%= greeting %></h2>
<!--	
	<div id="overlayboxquote"  class="boxright" style="margin-bottom:5px; margin-left:5px;">
		<div class="boxheader">
		    Well done!
		</div>
		<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
		<p>
			I would just like to take this opportunity to congratulate both the Ladies 1st Team, Mens 1st Team, 
			Mens 2nd Team and the Mens 3rd Team for being promoted this season (in the Coventry Lawn
			Tennis League). This is no small achievement on their part (third time in as many years for the Mens 1st Team,
			second time in 2 years for the Mens 2nd Team, first EVER promotion for the Mens 3rd Team and an emphatic return 
			upwards after disappointing relegation last season for the Ladies 1st Team) and everyone at the club should be 
			proud of them. I would also like to thank the many other members who turned out to play for our other league 
			teams - your effort and time is valued and I hope you enjoyed your playing.
		</p>
		<p class="boxsignature">Steve Ray</p>
	</div>
-->
<%
	if (dummy > 3 && dummy < 9)
	{
		if (dummy == 4) {
			leaguetext = "will soon be under way";
		}
%>
	<p style="clear:left;">
		Hi, the <%= dummy2 %> Coventry Lawn Tennis League (that Hampton's teams play in) season <%= leaguetext %>. All the league fixtures for Hampton's 8 teams (5 Mens, 3 Ladies) can be found <a href="league.asp">here</a>
	</p>
		<div id="covleague" class="bordertop" style="clear:both;">
			<h2><a href="league.asp">League Tennis</a></h2>
			<a href="leagueresults.asp">
				<img id="covleagueimage" src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams" style="float:left; margin-right:20px;">
			</a>
			<p>
			The tennis league season (late April to early August each year) for 2014 <%= leaguetext %>. You can now view the detailed league tables and positions directly within our own website by clicking on the image to the left. If you want to go directly to the Coventry League web site itself, then click <a href="http://www.coventrytennisleague.co.uk/">
			here</a>. 
			</p>
		</div>		
<%
	}
%>
	<p>
		As a member of Hampton-In-Arden Tennis Club, this is your web site. Let us know if  you
		would like to see something on our web site that isn't there or if you would
		like to comment on its layout. Please feel free to contact us at 
		<a href="mailto:support@hamptontennis.org.uk">
		support@hamptontennis.org.uk
		</a>&nbsp;and we will do our best to reply and take your suggestions into account
	</p>
	<p>
		If you would like to sponsor our site, and have your organisation credited, we
		will be pleased to discuss this with you. Please contact us at 
		<a href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a>
		using the word "Sponsor" in the subject line.
	</p>
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
