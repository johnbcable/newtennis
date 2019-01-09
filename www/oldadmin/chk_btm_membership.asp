<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Checking British Tennis Membership");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var theid = new String("NONE").toString();
var mybtn, statustext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Get person id from querystring
theid=new String(Request.QueryString("id"));
if (theid=="undefined" || theid=="null" || theid=="")
{
	theid=new String(Request.Form("id"));
	if (theid=="undefined" || theid=="null" || theid=="")
		theid=new String("NONE").toString();
}
if (theid == "NONE" || theid == "ZZidZZ")
	Response.Redirect("members.asp");
mymember = getMember(theid);	
mybtm = new String(mymember.britishtennisno).toString();
statustext = new String("").toString();
if (mybtm == "PENDING")
{
	statustext += "You have already given us permission to register you on British Tennis and this process will be completed shortly.<br />You do not need to do anything else in the meantime, thank you.";
}
if (mybtm == "UNKNOWN")
{
	statustext += "We do not know whether you are already registered with British Tennis and you have not given us permission to register you on your behalf.<br />";
	statustext += "If you wish to register with British Tennis please drop us a line at <a href='mailto:secretary@hamptontennis.org.uk'>secretary@hamptontennis.org.uk</a> and we can do that for you.";
}
if (mybtm != "PENDING" && mybtm != "UNKNOWN")
{
	statustext += "Thank you for registering with British Tennis.<br />We do have a record of your British Tennis membership number as shown above.<br />There is nothing further you need to do, thank you.";
}

// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
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
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Members:&nbsp;<b>Checking BTM Membership Status</b></h1>
		<div id="btmstatusbox" style="background-color: white;">
			<p>
			The British Tennis membership number for <b><%= mymember.forename1 %>&nbsp;<%= mymember.surname %></b> is:
			</p>
			<h3 style="text-align: center;"><%= mymember.britishtennisno %></h3>
			<p style="text-align: center;">
<%
Response.Write(statustext);
%>
			</p>
		</div>
		<h2>Why should I register with British Tennis</h2>
		<ul type="number">
			<li>You can get a LTA tennis rating</li>
			<li>
				You can improve this rating by taking part in eligible competitions as are organised from time to time 
				by your coach (Ian) and as organised by the LTA.
			</li>
			<li>If you are over 7 years old, you will be eligible to enter the club Wimbledon Tickets draw each year, and (best of all)</li>
			<li> It's completely FREE to register</li>
		</ul>
		<h2>What benefit does the club get from my British Tennis membership</h2>
		<p>
			The club allocation of tickets for Wimbledon which are put into a draw each year is dependent on the amount of British Tennis
			members the club has by the end of November of the previous year. So, for example, the number of tickets the club had
			to put into the Wimbledon ticket draw in 2010 depended on on how many of our members were registered with British Tennis 
			on 30 November 2009.
		</p>
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

