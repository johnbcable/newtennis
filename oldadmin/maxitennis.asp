<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis Section");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
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
		<img src="images/maxilogo.gif" width="647" height="83" alt="Maxi-Tennis banner ad">
		<p style="clear: both;">&nbsp;</p>
		<!--#include file="maxitennismap.htm" -->
		<p>
			MAXI-tennis is run purely at Hampton-In-Arden Tennis Club - we cant point you in the direction
			of any national sets of information about it, but we're very approachable! C'mon in and talk to
			us and join us at our next event.			
		</p>
		<h2 style="clear:both;">MAXI-Tennis</h2>
		<p>
			Are you an adult member of our club or are you a junior member of 
			our club and pleased with your game so far? Do you like playing 
			tennis but think that nothing much is going on until the 'official' 
			start of the tennis season (in April)? Do you like feeling part of a 
			team when you play tennis?
		</p>
		<p>
			Fear not! Click on the 'think bubbles' in the picture above for information about the MAXI-Tennis 
			initiative at Hampton-In-Arden tennis club! 
			Find out what it's all about and come back out to the tennis club with other members and get involved!
		</p>
		<p>
			Look forward to seeing you soon!!
		</p>
		<p class="morelink">Chris Barnes (Secretary)</p>
		<h3>See Also:</h3>
		<ul>
			<li><a href="maxileague2011.asp">Current Maxi-Tennis league table</a></li>
			<li><a href="maxiresults2011.asp">Maxi-Tennis match results for current tournament</a></li>
			<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
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
