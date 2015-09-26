<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Easter Tennis and Multi-Sport Camps");
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
		<h1>Juniors <b>Tennis and Multi-Sport Camps</b></h1>
		<img id="tenniscamp1" src="images/tenniscamp1.gif" width="100" alt="Tennis and multi-sport camps" style="float:right;" />
		<h3 class="blueheading">
			Hi <%= myname %>
		</h3>
		<p>
		The coaching staff at Hampton regularly run tennis and multi-sport camps during the half-term school holidays and 
		often at Christmas, Easter and during the school summer holidays. 
		</p>
		<p style="clear:both;"></p>
		<h2>
			Easter 2013 - Tennis and Multi-Sport Camps
		</h2>
		<p>
			This Easter we will be running the popular tennis and multi-sport camps again. These are for children aged 6 or over and are open to both members and non-members. In addition, we will also be running a separate camp for children under 6.
		</p>
		<p>
			Camps will run on :-
			<ul type="none>">
				<li style="padding-left:20px;">Thursday, 28<sup>th</sup> March</li>
				<li style="padding-left:20px;">Tuesday 2<sup>nd</sup> and Wednesday 3<sup>rd</sup> April</li>
				<li style="padding-left:20px;">Monday 8<sup>th</sup>, Tuesday 9<sup>th</sup> and Wednesday 10<sup>th</sup> April</li>
			</ul>
		</p>
		<p>
			These camps all run from 9.30am to 3.30pm and cost &pound;15 (reduced to &pound;12.50 if paid 
			before 23<sup>rd</sup> March).<br /><br />
			Early drop offs from 8.30 am, &pound;3 extra per day
		</p>
		<p>
			Please remember to bring a drink and a packed lunch.
		</p>
		<h3>
			Tots camp
		</h3>
		<p>
			There will be a Tots Camp on Thursday 4<sup>th</sup> April and Thursday 11<sup>th</sup> April from 10am to 12pm (mid-day) costing &pound;7 for children aged under 6.
		</p>
		<hr>
		<p>
			For bookings or any other information please contact Ian Poole on 07968 451956 or ianpoole23@yahoo.co.uk.  
			It is essential that you pre-book a place on the camps so that we can ensure there are adequate staff on 
			hand.
		</p>
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
