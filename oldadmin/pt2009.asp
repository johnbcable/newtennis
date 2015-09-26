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
var reslink = new String("jtour2009.asp").toString();
if (signedin())
	reslink = new String("juniors/results.html?season=2009").toString();
displaydate = dateasstring(Date());
var debugging = false;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Sports Club Open Day 16 May 2009</title>
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
	<h1>Tennis, Cricket and Mini-Squash Open Afternoon</h1>
	<h2>From 1.00 pm, Saturday May 16, 2008 at our club</h2>
	<img alt="Play Tennis promotional image" class="floatleft" src="Images/pt140x140.jpg" width="140" height="140">
	<p>
		Play Tennis, Cricket and Mini-Squash For Free here at Hampton In Arden Sports Club on Saturday May 16, 2009.
	</p>
	<p>
		You are warmly invited to our annual open day!  There will TENNIS for adults and juniors of all abilities with our 
		head tennis coach, Ian Poole.  Also, juniors aged 10 and over can have a go at CRICKET on the green and children 
		aged 5 to 12 can try MINI SQUASH on our two top quality squash courts.  There will be other attractions including 
		face painting plus tea and cakes.  Members and non-members welcomed.
	</p>
	<h2 style="clear:both;">Outline Timetable</h2>
	<p>
		The outline timetable for the day is currently as follows:
	<p>
	<ul>
		<li>
			<h3>Tennis</h3>
			<ol>
				<li><p><span>1.00 pm to 2.00 pm</span>&nbsp;-&nbsp;Junior tennis demonstration</p></li>
				<li><p><span>2.00 pm to 2.45 pm</span>&nbsp;-&nbsp;Junior tennis coaching fun zone</p></li>
				<li><p><span>2.45 pm to 3.00 pm</span>&nbsp;-&nbsp;Freeplay</p></li>
				</li><p><span>3.00 pm to 4.00 pm</span>&nbsp;-&nbsp;Adult tennis coaching</p></li>
				<li><p><span>4.00 pm to 5.00 pm</span>&nbsp;-&nbsp;Freeplay</p></li>
			</ol>
		</li>
		<li>
			<h3>Cricket</h3>
			<ol>
				<li><p><span>2.00 pm to 3.00 pm</span>&nbsp;-&nbsp;Cricket for boys and girls aged 10 and over</p></li>
			</ol>
		</li>
		<li>
			<h3>Mini-Squash</h3>
			<ol>
				<li><p><span>3.00 pm to 4.00 pm</span>&nbsp;-&nbsp;Mini-Squash for boys and girls aged between 5 and 12</p></li>
			</ol>
		</li>
	</ul>
	<h2>Further Information</h2>
	<p>
		For more information please contact:
		<ul>
			<li>Rosalia Eccleston (01675 442913) or</li>
			<li>Jayne Barnes (01675 443572)</li>
		</ul>
	</p>
	<p>
		Get a copy of the original flyer <a href="pt2009.pdf">here</a>&nbsp;(in PDF format).
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
