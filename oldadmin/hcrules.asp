<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "The Helen Cole Ladies Winter Doubles League";
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
		<h1>Playing:&nbsp;<b><%= pagetitle %></b></h1>
		<h2>Rules 2009/2010</h2>
		<ol>
			<li>
				<p>
					There shall be two leagues of 6 and 1 league of 7 teams.
				</p>
			</li>
			<li>
				<p>
					Matches to be arranged over a set period with leagues completed by 29 MARCH 2010, SEMI-FINALS BY 19 
					APRIL 2010 & FINAL competing for the Helen Cole Cup to be held at the BILLESLEY CENTRE on SUNDAY     
					25 APRIL 2010
				</p>
			</li>
			<li>
				<p>
					Each match to consist of 4 rubbers, each of two sets.  Tie-break shall operate at 6-6 in each set
				</p>
			</li>
			<li>
				<p>
					Each team shall consist of  two pairs
				</p>
			</li>
			<li>
				<p>
					No player is eligible who has been awarded senior county colours for any county within the preceding 10 years or played for GREAT BRITAIN at any age level.
				</p>
			</li>
			<li>
				<p>
					No player may play for more than 1 club in any 1 season
				</p>
			</li>
			<li>
				<p>
					One point to be scored for each RUBBER WON.  Each set won will attract half a point. Final league positioning to be decided:<br />
					a)  On points total<br />
					b)  Where equal on points:<br />
					&nbsp;&nbsp;&nbsp;i)  on total games won<br />
					&nbsp;&nbsp;&nbsp;ii) where equal on (i) on least total games against
				</p>
				<p>
					Semi-finalists shall be Winners of each league plus highest runner-up from the 3 leagues.
				</p>
			</li>
			<li>
				<h5>SEMI-FINAL & FINAL ONLY:</h5>
				<p>
					a) Only players who have played in at least 1 league match shall be eligible to play in the semi-final and/or final.<br />
					b) In the event of rubbers/sets &amp; games being equal after the completion of 4 rubbers a tie-break shall be played - 
					the pairing to be nominated PRIOR TO COMMENCEMENT OF THE MATCH.<br />
				</p>
			</li>
			<li>
				<p>
					Teams with a Home draw are responsible for initial contact with opponents and wherever possible for the staging of the match. 
					If circumstances do not	permit, eg unfit courts, the venue may be altered by mutual agreement of the Captains. Public courts may 
					be used if so required.
				</p>
			</li>
			<li>
				<p>
					Balls to be supplied by the team drawn at home.
				</p>
			</li>
			<li>
				<p>
					Captain of team drawn at home is responsible for telephoning/Emailing/posting full results(including PLAYERS NAMES, sets 
					and games) PROMPTLY
				</p>
			</li>
			<li>
				<p>
					Provision of refreshments is discretionary
				</p>
			</li>
		</ol>
		<p>
			If you wish to enter, please inititially discuss this with Carol Grant (01675 443610)
		</p>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="hcrules.asp">Helen Cole Ladies Winter Doubles League Overview</a></li>
				<li><a href="hccontactguide.asp">Guide for club contacts for this league</a></li>
				<li><a href="hcfixtures.asp">Fixture timetable for this season</a></li>
			</ul>
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
