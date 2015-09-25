<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Private One-to-One Coaching");
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
<style type="text/css">
td {
	border: 0;
	padding: 10px 10px 10px 0;
	border-bottom: 1px solid black;
}
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
<!--
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
-->
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
		<h1>Coaching: <b>One-to-one Coaching.</b></h1>
		<h3 class="blueheading">
			Hi <%= myname %>
		</h3>
		<p>
		The coaching staff at Hampton are available to coach people on a one-to-one basis. The current charges for one-to-one coaching are shown below: 
		</p>
		<p style="clear:both;"></p>
		<h2>
			Private Coaching - Charge Rates
		</h2>
		<table>
			<thead>
				<th width="40%">Coach</th>
				<th width="30%">1-hour</th>
				<th><i>1/2-hour</i></th>
			</thead>
			<tbody>
			<tr>
				<td>
					Ian Poole
				</td>
				</td>
				<td>
					&pound;25
				</td>
				<td>
					<i>&pound;15</i>
				</td>
			</tr>
			<tr>
				<td>
					Sam Peace
				</td>
				</td>
				<td>
					&pound;20
				</td>
				<td>
					<i>&pound;12.50</i>
				</td>
			</tr>
			<tr>
				<td>
					Bel Chefri
				</td>
				</td>
				<td>
					&pound;15
				</td>
				<td>
					<i>&pound;9</i>
				</td>
			</tr>
			<tr>
				<td>
					Emma Shalley
				</td>
				</td>
				<td>
					&pound;13
				</td>
				<td>
					<i>&pound;7.50</i>
				</td>
			</tr>
			<tr>
				<td>
					Matt Tew
				</td>
				<td>
					&pound;15
				</td>
				<td>
					<i>&pound;9</i>
				</td>
			</tr>
			<tr>
				<td>
					Nate Wiggin
				</td>
				</td>
				<td>
					&pound;14
				</td>
				<td>
					<i>&pound;9</i>
				</td>
			</tr>
			</tbody>
		</table>

		<hr>
		<p>
			Please note that over the winter months, if lights are required during a private lesson, these will be charged at &pound;2 per hour (or &pound;1 for half an hour) in addition to the above rates.
		</p>
		<p>
			Private lessons for small groups can also be arranged, please speak to Ian directly about rates.
		</p>
<!--
		<p style="background:#fff;width:80%;margin:10px auto;border:2px solid #000;text-align:center;font-weight:bold;font-size:110%;padding:5px;">
			As a special introductory offer, the new coaches, Bel, Tom and Emma are offering to do 5 hour-long sessions 
			for just &pound;50, a saving of at least &pound;15.  In order to qualify, the full &pound;50 must be paid up-front and the 5 
			sessions must be taken by the end of November 2012.
		</p>
-->
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="juniors/coaching.html">Current junior coaching overview</a></li>
				<li><a href="juniors/coaching_schedule.html">Current junior coaching schedule</a></li>
				<li><a href="crenewal.asp">Junior coaching booking form</a></li>
				<li><a href="adult_juniors/coaching.html">Adult coaching</a></li>
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
