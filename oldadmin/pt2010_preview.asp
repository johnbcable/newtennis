<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Hampton-In-Arden Tennis Club - Sports Club Open Afternoon";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var reslink = new String("jtour2008.asp").toString();
if (signedin())
	reslink = new String("juniors/results.html?season=2008").toString();
displaydate = dateasstring(Date());
var debugging = false;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club &quot;Play Tennis&quot; Day 1 May 2010</title>
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
#timetable ol li span {
	width: 30%;
	padding: 5px;
}
</style>
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
	<h1>Tennis, Hockey, Squash and Fitness Open Day</h1>
	<h2>From 10.00am, Saturday May 1, 2010 at our club</h2>
	<img alt="Play Tennis promotional image" class="floatleft" src="Images/pt140x140.jpg" width="140" height="140">
	<p>
		Tennis, Hockey and Squash For Free here at Hampton In Arden Sports Club on Saturday May 1, 2010 (with free taster fitness 
		sessions (provided by The Hampton Gym)), plus
	</p>
	<div id="courtopening" style="clear: both; width: 80%; margin: 10px auto; background-color:#FFFFCC; padding: 10px; text-align: center; border: 5px solid black;">
		<h2 style="color: blue;">&laquo;&nbsp;The Official Opening of our New Tennis Courts!&nbsp;&raquo;</h2>
		<p>
			This will happen between <strong>1.00pm and 2.00pm</strong> and will include some exhibition tennis by 
			juniors &amp; adults. We do hope you can join us for this special event.
		</p>
	</div>
	<p>
		You are warmly invited to our open day to try out a number of sports, without charge.  Also we will be officially 
		opening our 4 new Euro-clay tennis courts and mini-red court. There will be other attractions too, including boules and 
		face painting.  Refreshments will be available
	</p>
	<p>
		Both members and non-members are welcome.
	</p>
	<h2 style="clear:both;">Outline Timetable</h2>
	<p>
		The outline timetable for the day is currently as follows:
	<p>
	<ul id="timetable">
		<li>
			<h3>Tennis</h3>
			<ol>
				<li><p><span>10.00am to 10.40am</span>&nbsp;-&nbsp;Juniors - senior school age 11+</p></li>
				<li><p><span>11.00am to 11.40am</span>&nbsp;-&nbsp;Orange &amp; Green mini juniors</p></li>
				<li><p><span>12.00 mid-day to 12.40pm</span>&nbsp;-&nbsp;Tots &amp; Red mini juniors - ages 7 &amp; under, Plus Mums and Dads</p></li>
				</li><p><span>2.00 pm to 3.00 pm</span>&nbsp;-&nbsp;Adult tennis coaching - all standards</p></li>
				<li><p><span>3.00 pm onwards</span>&nbsp;-&nbsp;Mix-in</p></li>
			</ol>
		</li>
		<li>
			<h3>Hockey</h3>
			<ol>
				<li><p><span>10.15am to 10.45am</span>&nbsp;-&nbsp;Juniors aged 7 to 11</p></li>
				<li><p><span>10.45am to 11.15am</span>&nbsp;-&nbsp;Juniors - senior school age 11+</p></li>
			</ol>
		</li>
		<li>
			<h3>Squash &amp; Racketball</h3>
			<ol>
				<li><p><span>11.40am to 12.10pm</span>&nbsp;-&nbsp;Mini-squash for juniors aged 8 to 11</p></li>
				<li><p><span>12.40pm to 1.00pm</span>&nbsp;-&nbsp;Mini-squash for juniors aged 5 to 7</p></li>
				<li><p><span>3.00 pm to 4.30pm</span>&nbsp;-&nbsp;Adult squash &amp; racketball taster session</p></li>
			</ol>
		</li>
		<li>
			<h3>Fitness Sessions (provided by The Hampton Gym)</h3>
			<ol>
				<li><p><span>9.45am to 10.00am</span>&nbsp;-&nbsp;Morning warm-up</p></li>
				<li><p><span>9.45am onwards</span>&nbsp;-&nbsp;Complimentary sports injury clinic</p></li>
				<li><p><span>&nbsp;</span>&nbsp;-&nbsp;Other sessions during the day</p></li>
			</ol>
		</li>
	</ul>
	<h2>Further Information</h2>
	<p>
		For more information please contact:
		<ul>
			<li><span>Tennis - </span>Ian Poole 07968 451956</li>
			<li><span>Hockey - </span>Andy Woolford 07966 277012</li>
			<li><span>Mini-Squash - </span>Jane Hodge 01675 443197</li>
			<li><span>Adult Squash &amp; Racketball - </span>Jenny Roberts 01675 443648</li>
			<li><span>Fitness - </span>Gareth 01675 443464</li>
			<li><span>Sports Injury - </span>Ed  0777 0783954</li>		
<!--
			<li><span>Tennis - </span>Rosalia Eccleston (01675 442913) or</li>
			<li>Jayne Barnes (01675 443572)</li>
-->
		</ul>
	</p>
	<p style="margin-top: 20px;">
		Get a copy of the original flyer <a href="pt2010.pdf">here</a>&nbsp;(in PDF format) or <a href="pt2010.doc">here</a> in MS-Word format.
	</p>
	</div> <!-- content -->
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
%>
