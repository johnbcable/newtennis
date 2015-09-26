<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-in-Arden Tennis Club");
var pagetitle = new String("Juniors Area");
// Now for any variables local to this page
var greeting;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-in-Arden Tennis Club logo" /></a>
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
	<h1>Hampton-in-Arden Tennis Club</h1>
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
		<h1>Welcome to the <b>Junior's</b> Area</h1>
		<img id="juniorsoncourt" src="images/juniors1.jpg" width="320" alt="Juniors on court" style="float:right;" />
		<h2 class="blueheading">
			Hi <%= myname %>
		</h2>
<!--
		<div id="overlayboxquote" class="boxright">
			<h4>Well done!</h4>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
			I would just like to take this opportunity to extend my appreciation to the many junior members 
			of our club for taking part in the various North Warwickshire Doubles competitions which have run during the
			summer. We're very pleased to say that Emily Hodge and Maria Barnes were runners-up in the finals of the 
			Under 14 Girls competition. Thanks must also go to the parents, guardians and
			helpers of these children to spend the time so that their charges can take part in this
			friendly, competitive competition. It is vital that our young talent take part in these types
			of events if the Hampton league teams are to maintain and improve their league positions in
			the years to come.
			</p>
			<p class="boxsignature">Steve Ray</p>
		</div>
-->
		<p>
		Our head coach, Ian Poole, has just published his coaching schedule for the autumn term. 
		This was sent out to all members via email in the recent past but you can also 
		review this online <a href="juniors/coaching_schedule.html">here</a>. If you need to discuss anything 
		with Ian, please give him a call on 07968 451956.
	</p>
<!--
	<div id="covleague">
		<a href="http://www.coventrytennisleague.co.uk/">
			<img id="covleagueimage" src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams">
		</a>
		<p>
			In case you didnt know, our league tennis teams had a very good season in 2008. The Mens 1st 
			and 2nd teams were both promoted - again! Well done to both of them! The Ladies 1st Team bounced 
			emphatically straight back up again (after being relegated last year) by topping their division. 
			The Mens 3rd Team also had their best season to date just missing out on promotion by coming third 
			in their division. For the remainder of the teams, 2008 was a difficult year with the Ladies 2nd 
			and 3rd teams finishing 5th and 6th in their respective divisions. 
			The&nbsp;<a href="http://www.coventrytennisleague.co.uk/">final league positions</a> for all teams
			can be checked out via the <a href="http://www.coventrytennisleague.co.uk/">Coventry league's web site</a>.
		</p>
	</div>
-->
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
