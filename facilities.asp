<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String(clubname+" - Our Facilities");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring(); 
displaydate = dateasstring(Date());
var debugging = current_debug_status();
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
	<title>Hampton-In-Arden Tennis - <%= pagetitle %></title>
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
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Our Club: <b>Facilities</b></h1>
		<h2>Basic Facilities</h2>
		<p>
			Hampton-In-Arden Tennis Club is hosted in the grounds of <a href="juniors/contact.html">Hampton-In-Arden Sports Club.</a>
		</p>
		<p>
			The tennis club has 4 fenced, outdoor, all-weather, floodlit Euro-clay courts and a hard surface, floodlit &quot;KidZone&quot; 
		</p>
		<p>
			Tennis members have use of the facilities in the Hampton-In-Arden Sports Club clubhouse including changing facilties, toilets and a bar area. 
			The refurbished bar area now includes satellite television, ample seating and good beer! Our kitchen has recently been refurbished and is
			available to functions and to match-day catering. The bar televises important sporting events e.g. Six Nations Rugby, rugby World Cup, 
			test cricket, Wimbledon finals and so on including those on Sky.
		</p>
		<p>
			The bar is open to members as follows:
		</p>
		<ul>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;-at lunchtime from 12.00 noon on Saturdays (winter only) and from 12.30pm on Sundays</li><br>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;-in the evening from 6.00pm Mondays to Saturdays and from 7.00pm on Sundays.</li><br>
		</ul>
		<h2>Other Sports</h2>
		<p>
			The club also plays host to other sports sections e.g. the Hampton-In-Arden Sports Club squash and racketball section, the hockey club and the football 
			section and has recently hosted the revitalised and re-introduced cricket section into the village on the sports club grounds. During the summer, 
			the club also plays host to a local <a href="boules.asp">boules league</a>.
		</p>
		<h3 style="clear: both;">Squash and Racketball</h3>
		<img src="images/squashlogoV1.gif" width="100" height="123" alt="Hampton Squash Club" />
		<p>
			The squash and racketball section has 2 recently re-floored, indoor squash and racketball courts with lighting on a pay-as-you-go basis using cards obtainable 
			from behind the bar. The section has its own web site (<a href="http://www.hamptonsquash.org.uk/">click here</a>) which contains all you could ever 
			want to know about squash and racketball at Hampton-In-Arden Sports Club
		</p>
		<h3 style="clear: both;">Hampton-In-Arden Hockey Club</h3>
		<img src="images/hockeyphoto.jpg" width="214" height="87" alt="Hampton Hockey Club" />
		<p>
			The Hampton-In-Arden Hockey Club has its own web site (<a href="http://www.hamptonhockey.org.uk/">click here</a>) which contains loads of good information 
			about hockey teams and fixtures. The hockey team are currently enjoying playing their home fixtures on their purpose-built astro-turf playing surface (introduced in 2006).
		</p>
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
		<!--#include file="bookingpanel.asp" -->
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
