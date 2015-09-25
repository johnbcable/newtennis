<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("<page_title>");
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

p.lead {
	line-height:1.4;
	margin-top:10px;
	font-size: 110%;
}
.centered {
	text-align: center;
}

-->
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/HamptonBadge.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Page <b>heading</b></h1>
<!-- 
		<div id="finalsday2012collage" class="collage">
			 <img alt="Finals Day 2012" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>

 --> 
		<div id="bannerarea" class="collage">
			 <img alt="Banner title" src="http://placehold.it/601x368">
			 <h2>Sub-heading</h2>
			 <p>
			 	Text relating to banner
			 </p>
		</div>

 		<div class="promobox" style="clear: both; padding: 20px 0; margin-bottom: 20px; border-bottom: 1px solid black; ">
			 <div class="promobutton">
			 			<a href="#">Button text</a>
			 </div>
			<div class="promotexttext">
				<p>
					Paragraph of info relating to the button
				</p>
			</div>
		</div>
			
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
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
