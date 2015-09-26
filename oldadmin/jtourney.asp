<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior Tennis Tournaments");
// Now for any variables local to this page
var greeting;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
		<h1>Juniors:&nbsp;<b>Tournaments</b></h1>
		<p>
			Hi <%= myname %>
		</p>
		<p>
			Hampton-In-Arden Tennis Club runs several internal tournaments for all levels of junior
			members during each season. Our head coach (Ian Poole) is trying to encourage more children 
			to take part in competitions during each term.
		</p>
		<h2>Junior Tournaments this season are:-</h2>
		<ul>
			<li>
				<ul>
					<li>Saturday 1<sup>st</sup> June - Finals day for Mini-tennis (red, orange and green)</li>
					<li>Saturday 1<sup>st</sup> June - Finals day for U12 boys and girls and U16 boys</li>
				</ul>
				<hr /><br />
				<p>
					The above finals were comnpleted in bright sunshine as part of our Open Day to coincide with the village fete.
				</p>
			</li>
			<li>
				<p>
					<strong>N.B.</strong>&nbsp;The girls U16 competition will be held later this year after school examinations etc have completed.
				</p>
			</li>		
		</ul>
		<div id="badweather" style="clear: both;">
			<img id="badweatherimage" border="0" src="Images/bad-weather.jpg">
			<p style="font-weight:bold;">Bad weather on tournament day?</p>
			<p>
				We do our very best to run scheduled tournaments despite the weather but as always our primary concern is safety for everyone using the courts. So, if it is raining heavily on the day of the tournament, the event will be cancelled or postponed. If the weather is uncertain, please phone Ian (07968 451956) to check if it is still going to take place.
			</p>
		</div>	
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="juniors/results.html">Junior tournament results</a></li>
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

