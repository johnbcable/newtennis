<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Coaching team at Hampton-In-Arden Tennis Club");
// Now for any variables local to this page
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
<style type="text/css">
.question { font-weight: bold; }
.answer { margin-left: 10px; }
</style>
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
		<h1>Coaching:&nbsp;<b>Say Hi to coach - Sam Peace</b></h1>
		<div id="coachimage">
			<a href="show_jpic.asp?photo=sampeace&caption=Our performance and tournament tennis coach is ..... Sam Peace!">
				<img class="floatleft" src="images/sampeace.jpg" width="200" alt="Our performance and tournament tennis coach is ..... Sam Peace" />
			</a>
			<p class="caption"></p>
			<h5>
				Sam Peace<br />
				Lead Performance Coach and Competition Organiser<br />
				Fully qualified LTA tennis coach<br />
			</h5>
		</div>
		<p style="clear: both;">
			We welcome Sam to Hampton.  Sam is a fully qualified LTA tennis coach and a valued member of Ian's coaching team!
		</p>
		<p>
			Sam began playing tennis at the age of four with his grandfather.  A talented player, Sam progressed as he grew up and represented his county, Avon. 
			Sam eventually got to the qualifying rounds of Junior Wimbledon.
		</p>
		<p>
			Sam then became a LTA licensed coach, and has been coaching for six and a half years.  He has worked in a number of places including Bristol, Kent 
			plus Kos, working for Mark Warner Holidays. He is a DCA Level 3 Coach. A former club champion at all disciplines, he has played the qulaifying rounds 
			for junior Wimbledon
		</p>
		<p>
			Sam's outside sporting interests include tennis (again!) and especially Leeds United football club. 
		</p>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="juniors/coaching_schedule.html">Current junior coaching schedule</a></li>
				<li><a href="ianpoole.asp">Profile: Ian Poole - head coach</a></li>
				<li><a href="juniors/coaching.html">Coaching overview</a></li>
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