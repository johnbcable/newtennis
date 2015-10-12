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
		<h1>Coaching:&nbsp;<b>Say Hi to coach - Belkacem Chefri</b></h1>
		<div id="coachimage">
			<a href="show_jpic.asp?photo=belkacem&caption=Our new tennis coaching team member is ..... Belkacem Chefri!">
				<img class="floatleft" src="images/med_belkacem.jpg" width="200" alt="Our new tennis coaching team member is ..... Belkacem Chefri" />
			</a>
			<p class="caption"></p>
			<h5>
				Belkacem Chefri<br />
				Additional Coach<br />
			</h5>
		</div>
		<p style="clear: both;">
			We welcome Belkacem to the coaching team at Hampton.  Bel's coaching qualifications include:  LTA Level 1 and 2. 
		</p>
		<p>
			Sports Experience: Belkacem used to be an African champion in tennis! He was Arab champion in 1992 and was selected for Algeria 
			to play Davis cup in 1993, the year he left home to come to the UK. 
		</p>
		<p>
			Belkacem loves both playing and coaching tennis. Born in 1974, Bel is married.
		</p>
		<p>
			In addition to assisting with the junior coaching programme, Bel is available for private 1:1 lessons at the following rates:
		</p>
		<ul>
			<li></li>
			<li></li>
		</ul>
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