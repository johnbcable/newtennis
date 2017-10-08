<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Box Leagues");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
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
#currentmembers {
				 position: relative;
				 margin: 10px auto 10px auto;
}
#membersbutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#membertext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#membertext p {
			 padding-left: 30px;
}						

#membersbutton a, #membersbutton a:visited {
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

#membersbutton a:hover { 
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
		<h1>Playing:&nbsp;<b>Box Leagues</b></h1>
		<a href="#">
			<img id="singlesboxleague" class="floatleft" src="images/SinglesBoxLeagueIcon.gif" border="0" width="100" height="100" ALT="Get playing! Singles and Doubles Box Leagues now in operation." />
			</a>
		<p>
			Singles Box Leagues were first introduced for 2013 to encourage more members to play more tennis. Catering for a variety of playing standards over 8 leagues, these leagues generally run over a period of 2 months - the current one runs from <span style="font-weight: bold;">15 <sup>th</sup>June to 13<sup>th</sup> September 2015</span>.
		</p>
		<p>
			Additionally, the new daytime doubles box league (started in the autumn of 2014) will also be in progress. This runs over the same period as the above singles box leagues. Enjoy!
		</p>
		<p>
			The draw for the current singles box league is available below. Each league generally consists of 6 or 7 players which means 5 or 6 matches to play over the next two months. Each match should take about one hour. If you are not in either of the <span style="font-weight: bold;">15 <sup>th</sup>June to 13<sup>th</sup> September 2015</span> box leagues and want to be included in subsequent box leagues, just write your name on the appropriate sheet in the clubhouse before the end of this league. Please don't forget that all playing standards are welcome and encouraged to enter so we will try to put new players into the leagues at the right ability level.
		</p>
		<P>
			<span style="font-weight:bold;">Recording Results</span>: All scores for singles or doubles box leagues are to be recorded via the <span style="font-weight: bold;">Leagues</span> option of the Online Booking System (that you use to book courts). Please do NOT write your results onto the paper copy of the leagues shown in the clubhouse - results recorded here will NOT be entered into the online system.
		<p>
			<span style="font-weight:bold;">Rules</span>: Each match consists of 12 games. So, for example, if the score is 10-2, the score to record online would be 10-2 (the online system adds the additrional 2 points per player so you dont have to). Please record your score online next to your name in your opponent's column and vice versa. At the end of this league (13<up>th</sup> September 2015) we will add up the total scores to determine a ranking for each league. The two highest ranked players will move up a league, and the two lowest ranked players down a league and the next set of box leagues will then be set up.
		</p>
		<p>
			<span style="font-weight:bold;">Telephone Numbers</span>: 
<%
if ( signedin())
{
%>
 		<div id="currentmembers" style="clear: both; padding: 10px 0;">
			 <div id="membersbutton">
			 			<a href="printmemberlist.asp">Member Directory</a>
			 </div>
			<div id="membertext">
				<p>
					The current complete 18 and over members directory is now available on the site. Click on the Member Directory button to view it.
				</p>
			</div>
		</div>
<%
}	else {
%>
		<p>
			You can find all adult telephone numbers in the members area of the website.
		</p>
		<ul type="none">
			<li>Go to <a href="login.asp">the login page</a></li>
			<li>Sign in using the same ID and password which you use for booking courts</li>
			<li>Select "Directory" (currently from the menu on the left-hand side)</li>
			<li>then click the large "Members Directory" button</li>
			<li>You should now see summary contact details for all adult members.</li>
		</ul>
<%
}
%>
		<p style="padding-top:10px;margin-top:10px;clear:both;">
			<span style="font-weight:bold;">N.B.</span>&nbsp;We do not display telephone numbers for juniors on the site. Therefore, would juniors involved in the leagues please take responsibility for organising their matches against adults?
		</p>

<!--
 		<h2>Junior Box Leagues</h2>
		<p>
			The junior box leagues (first piloted in autumn 2014) return for spring 2015. This junior box league for our younger juniors is run along similar lines to the main singles box league. The link below will take you to the current draw for this league.
			<br />
			<br />
			<span style="font-weight: bold;">Please note:</span>&nbsp; As not all younger juniors are issued with a User Id and PIN to book courts, juniors involved in this box league will record their match results onto the printed junior box league sheet in the clubhouse.
		</p>
 -->
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="./documents/currentsinglesboxleague.pdf">Current singles box leagues</a></li>
<!-- 
				<li><a href="DoublesBoxLeagueAprMay2015.pdf">Current daytime doubles box leagues</a></li>

				<li><a href="JuniorBoxLeagueSpring2015.pdf">Current junior box leagues</a></li>
 -->
			</ul>
		</div>		
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


