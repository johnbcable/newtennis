<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Coaching Team at Hampton-In-Arden Tennis Club");
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
	<meta http-equiv="expires" content="0" />
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
		<h1>Coaching:&nbsp;<b>Say Hi to coach - Matt Tew</b></h1>
		<div id="coachimage">
				<img class="floatleft" src="images/matt_tew.png" width="200" alt="Our new coaching team member is ..... Matt Tew" />
			<p class="caption"></p>
			<h5>
				Matt Tew<br />
				Additional Coach<br />
				Email : <a href="mailto:matttewtennis@gmail.com">matttewtennis@gmail.com</a><br />
				Mobile: 07738 115306<br />
			</h5>
		</div>
		<p style="clear: both;">
			We welcome Matt to the coaching team at Hampton.  Matt is a LTA Level 3 accredited coach. Here is what he has to say about himself:-
		</p>
		<p> 
			I started coaching at the age of 15 as a volunteer then progressed by obtaining Level 1,2 and 3 coaching qualifications. I am also qualified to deliver Cardio Tennis sessions and completed training on this. I am a qualified LTA Referee so I have plenty of experience of putting on a high standard of competition. I have also previously held the role of head of junior competition at a previous club which involved putting on junior competitions to help junior members develop skills further whilst competing. 
		</p>
		<p>
			I have played and coached at many centres across the Midlands and played for several clubs in the AEGON Team Tennis matches over the years. I have often played in county standard tournaments as a junior so know the demands of being a junior player.
		</p>
		<p>
			I am a big sports fan in general and interested in most sports but the main 3 sports I follow would be football (Aston Villa!), Formula 1 and American Football. 
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