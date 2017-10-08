<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Chicks!");
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
#easterchicks img {
	width: 100%;
}
/*    promotional boxes               */
.promo {
	background-color: #f7f7f7;
	border-color: #e6e6e6;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 1.2em;
	line-height: 150%;
	border-radius: 5px;
}

/*    pull quotes                     */
.pullquote {
	float: right;
	clear: right;
	width: 200px;
	border: 1px solid black;
	padding: 10px;
	// font-size: 20px;
	font-size: 1.5em;
	background-color: #feffed;
	// background-color: rgb(195,151,51);
	margin: 20px 0 10px 10px;
	font-style: italic;
	// color: rgb(255,255,255);
	color: #000;
	border-radius: 10px;
}
</style>

<script src="/js/jquery-1.9.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('span.pq').each(function() {
			var quote=$(this).clone();
			quote.removeClass('pq');
			quote.addClass('pullquote');
			$(this).before(quote);
		});  // end each
	});    // end ready
</script>
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
		<h1>Juniors <b>Tennis Chicks!</b></h1>
		<img id="tenniscamp1" src="images/tennis_chicks_logo.jpg" alt="Tennis chicks!" style="float:left; margin: 0 10px 10px 0" />
		<h3 class="blueheading">
			Hi <%= myname %>
		</h3>
		<p>
			Tennis chicks was launched in the summer of 2012 and was designed to create a girls only environment packed with fun and learning based around the game of tennis. 
		</p>
		<p>
			It is designed to be a high energy session aided by music and we encourage the girls to bring in iPods etc to play their favourite music which we believe sets the right atmosphere for the session. 
		</p>
		<p>
			We also include another sporting activity within the tennis session to act as a warm up or warm down which could be hockey/netball/ some form of an invasion game. <span class="pq">This helps to create a real team feel</span> and also allow the girls to participate in a sport they may be more familiar with. We aim to give the girls the right experience of tennis by letting them hit at the appropriate red, orange and green level: Red for the 8 and unders, orange for the 9 year olds and green for children aged 10 and over. We aim to teach some basic fundamental technical and tactical learning each term. 
		</p>
		<p>
			<span style="font-weight: bold;">You dont need any special equipment to participate - just come dressed in comfortable clothes and a pair of trainers. Oh, and your music if you are bringing any!</span> 
		</p>
		<p>
			Following on from tennis chicks we have found a lot of the girls moving into a more traditional tennis group suitable for their age and ability and its really great to see girls enter the journey within tennis chicks and continue their journey on the normal tennis program.
		</p>
		<p style="clear:both;"></p>
		<div id="easterchicks" class="promo">
			<h2>
				Easter 2013 - Tennis Chicks Afternoon
			</h2>
			<img id="chicksflickticket" src="images/chicksflickticket.jpg" alt="Your invitation!"  />			
			<p style="clear:both;">
				Here is your ticket for our Tennis Chicks session on Thursday 11<sup>th</sup> April (from 2.30pm to 5.00pm). This will include a fun chicks session for the first hour followed by a &quot;chicks flick&quot; with drinks and popcorn. The cost for the session will be &pound;3.
			</p>
		</div>	
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
