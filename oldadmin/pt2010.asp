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
var reslink = new String("jtour2010.asp").toString();
if (signedin())
	reslink = new String("juniors/results.html?season=2010").toString();
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
	<div id="pt2010collage" class="collage">
			 <img alt="Play Tennis Day 2010" src="Images/pt_2010_collage.jpg" width="800" height="200">
	</div>
	<div id="courtopening" style="clear: both; width: 80%; margin: 10px auto; background-color:#FFFFCC; padding: 10px; text-align: center; border: 5px solid black;">
		<h2 style="color: blue;">&laquo;&nbsp;Our new tennis courts are officially OPEN!&nbsp;&raquo;</h2>
		<p>
			The Deputy Mayor and Mayoress of Solihull took time away from their busy official schedules to come and 
			formally open our new Euro-clay tennis courts.
		</p>
	</div>
	<p>
		May 1st dawned brightly and things got off to a good start promptly at 10:00am, with the tuck shop coming online 
		with very welcome bacon sandwiches by 11:00am (<i>I'll make sure and order mine next time!</i>).
	</p>
	<p>
		Tennis coaching got briskly under way with older children first up followed later by the younger children - well, they had 
		to have their faces painted first: a question of priorities. All sessions were very well attended. Then we had the speeches 
		and thank you's from the Deputy Mayor and our new Tennis Club Chairman, Geoff Redfern, before moving on to the  
		ribbon cutting to signify the official opening of our new Euro-clay courts.
	</p>
	<p>
		 A welcome buffet lunch was provided free of charge to everyone by the court construction contractors and the inevitable 
		 photos for club and external dignatories seemed less daunting after a glass of champagne!
	</p> 
	<p>
		 Samples of the new club sportswear were available for inspection and orders were being taken. Other tennis kit was also 
		 available to purchase on-the-day with very generous discounts. Staff from the The Hampton Gym were also on hand to discuss 
		 sporting injuries and to provide sample massage sessions for those in need (<i>and before you ask, No, there were no photos 
		 taken - people have a right to their privacy even amongst friends!</i>).
	</p>
	<h2>Thank you's</h2>
	<p>
		Our chairman, Geoff Redfern, did most of the (serious) thank you's in his official speech but here are some more:
		<ul>
			<li>Thanks to Sally-Ann Salmon for taking such good photographs and making them available for us all to see (check out the photo gallery below)</li>
			<li>Thanks to the tuck shop for the bacon sandwiches - more please next time!</li>
			<li>Thanks to everyone who brought cakes - they were a real treat.</li>
			<li>Thanks to everyone from squash/racketball and hockey for making it a whole club day</li>
			<li>Thanks to everyone who helped put up (and take down) the tents and marquees</li>
			<li>Thanks to all the coaching staff from all the sports who gave up loads of their own time to make the day what it was.</li>		
<!--
			<li><span>Tennis - </span>Rosalia Eccleston (01675 442913) or</li>
			<li>Jayne Barnes (01675 443572)</li>
-->
	 		<li>Finally, thanks to you for attending (if you did) and for reading (which you are) - C U next time!</li>
		</ul>
	</p>
	<p style="margin-top: 20px;">
		Get a copy of the original promotional flyer <a href="pt2010.pdf">here</a>&nbsp;(in PDF format) or <a href="pt2010.doc">here</a> in MS-Word format.
	</p>
	<div class="seealso">
		<h3>See Also:</h3>
		<ul>
			<li><a href="thumbnails.asp?gallery=6">Photo gallery from the day</a></li>
			<li><a href="clubsportswear.asp">New range of club sportswear available to order NOW</a></li>
			<li><a href="pt2010_preview.asp">Outline timetable for the day</a></li>
		</ul>
	</div>
	
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
