
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Test Home Page");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
var leaguetext = "is now under way";
var ebookinguserid, ebookingpin;
var memberObj = new Object();
ebookinguserid= 0;
ebookingpin = 0;
// Establish online user Id and PIN if signed in
if (signedin) {
	var myUnique = getUserCode();
	if (! (myUnique == 0)) {
		memberObj = getMember(myUnique);
		ebookinguserid = memberObj.onlinebookingid;
		ebookingpin = memberObj.onlinebookingpin;
	}
}
// End of page start up coding  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="icon" type="image/gif" href="animated_favicon1.gif">    
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
.promobox {
				 position: relative;
				 margin: 20px auto;
				 padding: 20px;
				 height: 100px;
}
.promobutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
					 margin-right: 20px;
}
.promotext {
			 position: relative;
			 float: right;
			 width: 70%;
			 text-align: left;
}
.promotext p {
	padding-left: 30px;
	margin-bottom: 20px;
}						

.promobutton a, .promobutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  	font-size: 110%;
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

.promobutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.html" id="homelink"><img id="clublogo" src="images/HamptonBadge.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Welcome to <b>Hampton-in-Arden Tennis Club</b></h1>

<!-- 
		<div id="finalsday2012collage" class="collage">
			 <img alt="Finals Day 2015" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>


 		<div class="promobox" style="clear: both; padding: 20px; margin-bottom: 20px; background-color: #fff; border: 2px solid black; ">
			<div>
				<h3>Autumn Finals Day - Sunday 27<sup>th</sup> September</h3>
				 <div class="promobutton">
				 	<a href="https://hamptontennis.org.uk/finalsdays2015.asp">Order of Play &raquo;</a>
				 </div>
				<div class="promotext">
					<p>
				 		Finals day is here ... and the weather is looking good! Come along from 12:30 and watch our finalists strut their stuff. See who&apos;s on when &ndash; click on the Order of Play button
				 	</p>
				</div>
			</div>

		</div>


 		<div class="promobox" style="clear: both; padding: 20px; margin-bottom: 20px; background-color: #fff; border: 2px solid black; ">
			<div>
				<h3>Your web site will change ... <span style="font-size:110%;">TOMORROW Sunday 11<sup>th</sup> October!</span></h3>
				 <div class="promobutton">
				 	<a href="https://hamptontennis.org.uk/index.html">Preview &raquo;</a>
				 </div>
				<div class="promotext">
					<p>
				 		During Sunday 11<sup>th</sup> October, this tennis club web site will be unavailable while we change it to the newer layout. We hope to have the site back up and running before Monday - enjoy! See it now by clicking on the Preview button.
				 	</p>
				</div>
			</div>

		</div>

-->
		<div id="awards2014" class="collage">
			 <img alt="Coventry League awards night" src="images/InterDistrictAward2016.jpg" width="601">
			 <h2 style="clear:both;">Inter&ndash;District League play&ndash;off winners 2016</h2>
		</div>

 		<div class="promobox" style="clear: both; padding: 20px 0; margin-bottom: 20px; border-bottom: 1px solid black; ">
			 <div class="promobutton">
			 			<a href="/awards.html">More &raquo;</a>
			 </div>
			<div class="promotext">
				<p>
			 	Tony Eccleston receives the Inter District League play-off trophy from Sherrie Meaking, Chairman of Warwickshire LTA, along with fellow Hampton Mens 1st Team players Will Bramley, Josh-Crisp Jones and Richard Westman.
			 	</p>
			</div>

		</div>


<!-- 
 		<div class="promobox" style="clear: both; padding: 20px; margin-bottom: 20px; background-color: #fff; border: 2px solid black; ">
			<div>
				<h3>DON&apos;T DELAY!</h3>
				<p>
					Today (Monday 23<sup>rd</sup> March) is your final day to pay for <a href="/juniors/holidaycamps.html">Easter Holiday Clubs</a> at the discounted rate - book your place NOW!
				</p>
			</div>

		</div>
 -->

 
<%
 	dummy = currentMonth();
	if (dummy > 3 && dummy < 9)
	{
		if (dummy == 4) {
			leaguetext = "will soon be under way";
		}
%>
		<div id="league" class="bordertop" style="clear:both; position:relative;">
			<h2><a href="league.asp" alt="League tables for Hampton's league teams" title="League tables for Hampton's league teams">League Tennis</a></h2>
			 <div class="promobutton">
			 	<a href="leagueresults.asp">Summary League Tables</a>
			 </div>
			<div style="position: relative; float:left; width: 50%;">
				<p>
				The tennis league season (late April to early August each year) for 2014 <%= leaguetext %>. You can now view the detailed league tables and positions directly within our own website by clicking on the League Tables button to the left or, if you want to go directly to the Coventry League web site itself, then click on the image to the right. 
				</p>
			</div>
			<div style="position: relative; float: right; margin-left: 10px;">
				<a href="http://www.coventrytennisleague.co.uk/" >
				<img id="leagueimage" src="images/league.gif" style="width: 100%; margin-right:20px;">
				</a>
			</div>
		</div>		
<%
	}
%>
		<div id="joinusoptions">
			<h2><a href="juniors/joinus.html">Join Us</a></h2>
			<p>
				Hampton-In-Arden Tennis Club welcomes players of all standards, for casual or match play - adult or junior. We offer competitive subscription rates with special discounts for family memberships. Discover the benefits of joining us as a member and then don&apos;t delay - download an application form today and apply to join us.
			</p>
		</div>
		<div id="coachingoptions">
			<h2><a href="juniors/coaching.html">Coaching</a></h2>
			<p>
			Adult and junior members have access to the services of a professionally-qualified coach. Our coaching team provide an extensive range of group coaching for both adults and juniors. Why not check out what they currently do and see if we have something for you.
			</p>
		</div>	

		<p style="clear:both;">&nbsp;</p>

		<h2 id="afterboxes">Coming Soon</h2>
<%
	var myevents = new String(getFutureEvents(7)).toString();
	Response.Write(myevents);
%>			
		
			
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="bookingpanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
		<!--#include file="messagepanel.asp" -->
		<!--#include file="weatherpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>

