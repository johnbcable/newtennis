<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Holiday Camps");
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
<!--
#campbooking {
				 position: relative;
				 margin: 20px auto;
}
#bookingbutton {
					 position: relative;
					 float: left;
					 width: 15%;
					 text-align: center;
}
#bookingtext {
			 position: relative;
			 float: right;
			 width: 82%;
			 text-align: left;
}
#bookingtext p {
			 padding-left: 30px;
}						

#bookingbutton a, #bookingbutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
  font-weight: bold;
	padding: 5px 10px 6px; 
	color: #fff; 
	text-decoration: none;
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer;
}

#bookingbutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Juniors <b>Summer Holiday Multi-Sport Camps</b></h1>
		<img id="tenniscamp1" src="images/tenniscamp1.gif" width="100" alt="Tennis and multi-sport camps" style="float:right;" />
		<h3 class="blueheading">
			Hi <%= myname %>
		</h3>
		<p>
		The coaching staff at Hampton regularly run tennis and multi-sport camps during the half-term school holidays and often at Christmas, Easter and during the school summer holidays. 
		</p>
		<p style="clear:both;"></p>
		<h2>
			Summer 2013 - Tennis and Multi-Sport Camps
		</h2>
		<p>
			This summer we will be running our popular tennis and multi-sport camps again. These are for children aged 6 or over and are open to both members and non-members. 
		</p>
		<p>
			Football and multi-skills camps in partnership with Anthony Lee&apos;s Football School will run on :-
			<ul type="none>">
				<li style="padding-left:20px;">Monday, 29<sup>th</sup> and Tuesday 30<sup>th</sup> and Wednesday 31<sup>st</sup> July</li>
				<li style="padding-left:20px;">Monday, 5<sup>th</sup> and Tuesday 6<sup>th</sup> and Wednesday 7<sup>th</sup> August</li>
			</ul>
		</p>
		<p>
			Tennis and multi-sport camps will run on :-
			<ul type="none>">
				<li style="padding-left:20px;">Monday, 19<sup>th</sup> and Tuesday 20<sup>th</sup> and Wednesday 21<sup>st</sup> August</li>
				<li style="padding-left:20px;">Tuesday 27<sup>th</sup> and Wednesday 28<sup>th</sup> August</li>
			</ul>
		</p>
		<p>
			Camps all run from 9.30am to 3.30pm and cost &pound;16 (reduced to &pound;14 if paid 
			before 20<sup>th</sup> July).<br /><br />
			** SPECIAL OFFER – Book all 3 days in the same week for the special price of &pound;37.50 **<br /><br />
			Early drop offs from 8.30 am, &pound;3 extra per day
		</p>
		<p>
			Please remember to bring a drink and a packed lunch.
		</p>
		<hr>
		<p>
			For bookings or any other information please contact Ian Poole on 07968 451956 or via email to <a href="mailto:ianpoole23@yahoo.co.uk">ianpoole23@yahoo.co.uk</a>. 
		</p>
		<p>
			For more information on the Anthony Lee football camps / school please contact them on 07759 161832 or via email to <a href="mailto:anthony.lee.coaching@hotmail.co.uk">mailto:anthony.lee.coaching@hotmail.co.uk</a>.  
		</p>
		<p>
			Booking is essential to ensure there are adequate staff on hand.
		</p>
		<div id="campbooking" style="clear: both; padding: 20px 0; margin-bottom: 20px; border-top: 1px solid black;">
			 <div id="bookingbutton">
			 			<a href="Summer2013BookingForm.pdf">Book Now</a>
			 </div>
			<div id="bookingtext">
				<p>
					Print the attached booking form, complete it and ensure it and your fee is returned to Ian as soon as possible in order to secure your place.
				</p>
			</div>
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
