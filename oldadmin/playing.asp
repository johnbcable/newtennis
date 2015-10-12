<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Home Page");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Playing</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
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
<body id="ws_playing">
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
			<li id="nav_playing"><a href="#">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Playing:&nbsp;<b>Tennis at the Club</b></h1>
		<p>
		There are many ways for club members to enjoy competitive tennis at our club. You may be involved in 
		matches with other clubs or you may also take part in the various internal tournaments 
		and leagues run throughout the year at the club. We can neatly divide the types of playing into 4 main 
		categories:
		</p>
		<ul>
			<li><a href="#coachingsection">Coaching</a></li>
			<li><a href="#socialtennis">Social Tennis</a></li>
			<li><a href="#tournamentsection">Tournaments</a></li>
			<li><a href="#leaguetennis">League Tennis</a></li>
		</ul>
		<a id="coachingsection" name="coachingsection" />
		<h2>Coaching</h2>
		<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
		<p>
			As part of the new coaching programme re-introduced in October 2008, coaching staff at 
			Hampton-In-Arden Tennis Club are providing further opportunities for adult club members to 
			improve their game. The club's main coaching focus has been (and will remain) its junior members 
			but its adult members will also have the chance, if they wish, to improve their technique and their 
			overall standard. You can check out <a href="adult_juniors/coaching.html">current adult coaching</a> provision 
			on this web site but also keep watching the emails for news of any further developments to the adult 
			coaching programme at the club.
		</p>
		<a id="socialtennis" name="socialtennis" />
		<h2>Social Tennis</h2>
		<p>
			Hampton is a friendly club with lots of opportunities for playing social tennis. There are 3 designated 
			club sessions for adult members at present:  Tuesday evenings from 7.00pm to 10.00pm; Friday evenings 
			from 8.00pm to 10.00 pm; and Sunday mornings from 10.00am to 1.00pm. All standards of play are welcomed 
			so don't be shy - turn up and play!
		</p>
		<p>
			In addition to the club sessions, we often have "friendly" matches (to social tennis standard) with other local 
			clubs, most often taking place in the summer months on Saturday afternoons. This is a very good way of meeting 
			players from other clubs either at your home ground or at their clubs and is a wonderful way of spending a 
			Saturday afternoon in the summer - with the bonus (usually) of a nice tea at the end of it! Keep an eye on our 
			<a href="friendly.asp">"Friendlies"</a> page for up to the minute information.
		</p>
		<p>
			Finally, for a few years now, Hampton has been running its MAXI-Tennis initiative in the early spring. Usually 
			timed to conicide with the 6-Nations Rugby championship, the club members are divided between 6 teams (named after 
			the countries involved in the rugby) who play each other once over the spring school term leading up to a final 
			between the top two teams towards the end of March. These matches are very social occasions and involve all grades 
			of member from children right up to adult.<br />
			<span class="morelink"><a href="maxitennis.asp">More details .....</a></span>
		</p>
		<a id="tournamentsection" name="tournamentsection" />
		<h2>Tournaments</h2>
		<p>
			Hampton runs one internal adult tournament each season. Commencing in late April/early May. Entry forms for the tournament 
			initially go out with the subscription renewal requests during March each year. Any member can participate. Several titles 
			are contested namely:
		</p>
		<ul>
			<li>Mens:      Singles, Doubles, Singles Plate, Veterans Doubles</li>
			<li>Ladies:    Singles, Doubles, Singles Plate, Veterans Doubles</li>
			<li>Mixed:     Doubles, Doubles Plate</li>
		</ul>
		<p>
			Finals have usually been held on a Saturday in July but, in a break with recent tradition, the finals day for 2007 was 
			held at the end of September!<br />
			<span class="morelink"><a href="tournaments.asp">More details .....</a></span>
		</p>
		<h3>Junior Tournaments</h3>
		<img src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="boxleft">
		<p>
			Junior members at Hampton are not forgotten with regard to tournaments. They have their own one-day annual tournament usually run 
			sometime in June and also have external initiatives such as the Road to Wimbledon annual one-day event.<br />
			<span class="morelink"><a href="juniors/tournaments.html">More details .....</a></span>
		</p>
		<a id="leaguetennis" name="leaguetennis" />
		<h2>League Tennis</h2>
		<p>
			Hampton-In-Arden Tennis Club enters 6 teams into the Coventry and District Lawn Tennis League each year - 3 ladies teams and 3 mens teams. 
			Competition is keen for places as captains pick team members on playing merit. Each team will consist of two single-sex doubles pairs. 
			Each fixture will consist of each Hampton pair playing each of two opposing pairs in a best-of-three-sets match. Fixtures normally run 
			once per week from approx. 6.00pm to anywhere between 9.00 and 10.00 pm. Matches are played at Hampton and at the opposing club's 
			grounds. The hosting club provides tea/supper for after the fixture.
		</p>
		<p>
			If you are interested in trying-out for any particular league team at Hampton Tennis Club, contact its captain (in the first instance) for 
				an informal chat. The current league team captains are:
<%
					var captainlist = getTeamCaptains("ADULT");
					Response.Write(captainlist);
%>
		</p>
		<h3>Adult Winter Leagues</h3>
		<p>
			For 2009 we are also introducing winter internal and external competitive play opportunities for club members.
		</p>
		<a href="wintercompetitions.asp">More information on our winter competitions</a>
		<h3>Junior External Competitions</h3>
		<img src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="boxleft">
		<p>
			Once again junior members are not left out in the cold with regard to external competition. All juniors capable of full-court rallying are 
			eligible for inclusion into the <a href="nwdoublesinfo.asp">North Warwickshire Doubles League</a> at their wish and the coach' discretion. 
			In addition, older juniors who are ready for inclusion in the Coventry League teams are often registered and given outings in the adult 
			league teams.
		<p>
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
