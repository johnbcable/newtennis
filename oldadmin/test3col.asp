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
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
			<%= displaydate %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Welcome to <b>Hampton-in-Arden Tennis Club<b></h1>
		<img src="images/courts0.jpg" width="400" height="151" alt="Our outside tennis courts in use" />
		<h2>Club of the Year!</h2>
		<p>
			We are extremely excited and proud to announce that Hampton-in-Arden Tennis Club was 
			chosen as the Club of the Year in 2007 by the Warwickshire Lawn Tennis Association.&nbsp;&nbsp;&nbsp;<a href="aboutus.asp">read more ..</a> 
		</p>
		<div id="joinusoptions">
			<h2><a href="juniors/joinus.html">Join Us</a></h2>
			<p>
				Hampton-In-Arden Tennis Club welcomes players of all standards, for casual or match play - adult or junior. 
				We offer competitive subscription rates with special discounts for family memberships. Check out our 
				<a href="juniors/joinus.html">rates</a> and download an <a href="forms.asp">application form</a>.
			</p>
		</div>
		<div id="coachingoptions">
			<h2><a href="juniors/coaching.html">Coaching</a></h2>
			<p>
			Adult and junior members have access to the services of a professionally-qualified coach. Our  
			coaching team provide an extensive range of group coaching for both adults and juniors. Why 
			not check out what they currently do <a href="juniors/coaching.html">here</a>.
			</p>
		</div>		
		<div id="covleague" class="bordertop" style="clear:both;">
			<h2><a href="league.asp">League Tennis</a></h2>
			<a href="http://www.coventrytennisleague.co.uk/">
				<img id="covleagueimage" src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams" style="float:left; margin-right:20px;">
			</a>
			<p>
			During the tennis league season (late April to early August each year), you can keep up to date with the 
			detailed league tables and positions by visiting the Coventry League web site (click the logo to the left). 
			Or if you just need a quick summary, try <a href="leaguetab.asp">here</a> on our web site.
			</p>
		</div>		
		<h2 id="afterboxes">Coming Soon</h2>
<%
	var myevents = new String(getFutureEvents(7)).toString();
	Response.Write(myevents);
%>			
		<!--#include file="weatherpanel.asp" -->
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
