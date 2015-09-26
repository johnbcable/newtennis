<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Coaching Staff at Hampton-In-Arden Tennis Club");
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
	<h1>Coaching:&nbsp;<b>Say Hi to our head tennis coach - Ian Poole</b></h1>
	<div id="coachimage">
		<a href="show_jpic.asp?photo=ian2&caption=Our head tennis coach is ..... Ian Poole!">
			<img class="floatleft" src="images/med_ianpoole.jpg" width="320" alt="Our head tennis coach is ... Ian Poole" />
		</a>
		<p class="caption"></p>
		<h5>
			Ian Poole<br />
			Head Coach and Tennis Manager<br />
			LTA Level 4 CCA Performance coach / LTA tutor<br />
			Fully Licensed<br />
			07968 451956<br />
			&pound;25 per session (1 hour)<br />
		</h5>
		<p>
			Ian graduated from Lancaster University with a BSc (Hons) degree in Sports Science.
		</p>
	</div>
	<div id="interviewwithian" style="clear: both;">
		<h2>Interview with Ian</h2>
		<img src="images/interview.gif" alt="Interview with the coach" width="80" height="56" />
		<p class="question">
			How old were you when you started playing tennis and how did you become interested in the sport?
		</p>
		<p class="answer">
			I was 9 and became interested when I played in Cliff Richard tournaments
		</p>
		<p class="question">
			Who has been your biggest sporting inspiration ?
		</p>
		<p class="answer">
			There have been several including Tim Henman, Roger Federer, David Beckham and Lewis Hamilton
		</p>
		<p class="question">
			Why did you decide to become a tennis coach?
		</p>
		<p class="answer">
			I had a real passion for tennis and I enjoy teaching
		</p>
		<p class="question">
			Would you recommend tennis coaching as a career ?
		</p>
		<p class="answer">
			Definitely!  It's very rewarding - I get huge job satisfaction
		</p>
		<p class="question">
			Should only naturally good tennis players bother with the sport?
		</p>
		<p class="answer">
			Not at all, there are huge opportunities for players at all levels and ages
		</p>
		<p class="question">
			What are your ambitions for Hampton-in-Arden Tennis Club?
		</p>
		<p class="answer">
			I want to produce a flexible programme for all ages and abilities, and I want the members to have fun!
		</p>
		<p class="boxsignature">Junior Committee</p>
	</div>
	<p>
	Ian Poole joined in late 2007 as head coach at Hampton-In-Arden Tennis Club. At the time, Ian was 27, lived in Olton and enjoyed
	football, golf and socialising when he is not coaching. He has the following tennis qualifications: DCA (Development Coach Award);  
	CCA (Club Coach Award) - Performance. We conducted a brief interview with him when he originally joined (see above).  
	</p>	
	<p>
		Ian is the current head coach here at Hampton Tennis Club. Prior to this he has worked at David Lloyd 
		Leisure Centre as a full time pro where he coached a wide range of players scaling all ages and abilities. Ian is 
		a former county coach and whilst at David Lloyd he has instructed a variety of junior players that have performed 
		well under his instruction (to county standard). Ian himself is a former county level player and played for 
		Staffordshire County as a junior. Ian is a fully qualified LTA Performance coach and has an active coaches licence. 
		Ian was nominated for Warwickshire Coach of the Year in 2010 and is a former singles, doubles and mixed doubles champion at Hampton.
	</p>
	<p>
		Ian left David Lloyd to look for a new challenge here at Hampton and he is very keen to expand the clubs 
		coaching programme with more groups and squads at all ages. He also prides himself on giving top quality tennis 
		lessons in a fun friendly environment for all his students. For any further information or to book a lesson 
		then call lan directly on the above number and he will be happy to speak to you.
	</p>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="juniors/coaching_schedule.html">Current junior coaching schedule</a></li>
				<li><a href="sampeace.asp">Profile: Sam Peace - additional coach</a></li>
				<li><a href="emmashalley.asp">Profile: Emma Shalley - additional coach</a></li>
				<li><a href="belkacemchefri.asp">Profile: Belkacem Chefri - additional coach</a></li>
				<li><a href="matttew.asp">Profile: Matt Tew - additional coach</a></li>
				<li><a href="nathanwiggin.asp">Profile: Nate Wiggin - additional coach</a></li>
				<li><a href="bethstarkey.asp">Profile: Beth Starkey - additional coach</a></li>
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
