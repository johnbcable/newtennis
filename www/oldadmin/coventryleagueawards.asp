<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Coventry League - AGM and Awards");
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/HamptonBadge.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Coventry League - AGM and Awards</b></h1>
		<div id="awards2014" class="collage">
			 <img alt="Coventry League awards night" src="img/Awards2014.jpg" width="601">
		</div>

		<div id="awardarticle">
			<h2>Success for Hampton-in-Arden Tennis</h2>
			<p class="lead">
				The Coventry &amp; District Lawn Tennis League AGM and presentation ceremony was held on 12<sup>th</sup> November at Coventry &amp; North Warwicks Tennis &amp; Sports Club, Binley Road, Coventry and Hampton-in-Arden Tennis Club celebrated another exceptional year.
			</p>
			<p>
				In 2012 the men&apos;s first team won the Premier Division trophy for the first time in its history and then retained the trophy in 2013. The hat-trick of titles was completed in 2014, as they successfully defended the trophy, winning the league title by a massive 15 points from their nearest rivals. 
			</p>
			<p>
				The first team then completed their season by representing the Coventry &amp; District League in the Inter League Final against Streetly Tennis Club, who were the winners of the Birmingham League. Hampton, represented by Josh Crisp-Jones, Richard Allen, Tony Eccleston and Daniel Eccleston, were victorious winning 3-1.
			</p>
			<p>
				To crown a fantastic year for the first team, Josh Crisp-Jones was named Coventry &amp; District 2014 Player of the Year. 
			</p>
			<p>
				Supporting this success, Hampton men&apos;s 3rd team were champions of Division 4, with the title being decided on the last day of the season with a 3-1 away victory at Warwick Tennis Club.
			</p>
			<p>
				This means that the men run five teams in total, and will enter the 2015 season with a team in each of the Premier Division, Division 1, Division 3, Division 5 and Division 7. 
			</p>
			<p>
				The fifth team has provided a tremendous opportunity for younger players and those without much experience of playing competitive league tennis a chance to participate. During the season, several of the fifth team members have progressed through to represent the club at higher levels.  
			</p>
			<p>
				Not to be outdone, the ladies teams have also had a great season. The first team, captained by Terri Mason, secured their second successive promotion and will now be in the top division in 2015.
			</p>
			<p>
				The ladies second and third teams also had good years but both narrowly missed out on promotion. The second team were particularly unlucky to miss out by set percentages (the tennis equivalent of goal difference) having finished level on points with Warwick Boat Club.
			</p>
			<p>
				Chairman Chris Barnes enthused &quot;2014 has been a fantastic year at Hampton-in-Arden Tennis Club with 3 of our teams finishing as league winners or gaining promotion and we will be looking to repeat a similar level of success next season.&quot;
			</p>
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
