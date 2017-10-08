<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("LTA Mini-Tennis Awards");
// Now for any variables local to this page
var greeting;
var RS, Conn, SQL1, dbconnect, uniqref;
var debugging = current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// if (!signedin())
//	Response.Redirect("login.asp");
// Get user details
// uniqref = getUserCode();
// uniqref = uniqref.toString();
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
// SQL1 = new String("SELECT teamname from tennisteams where uniqueref = "+uniqref).toString();
// RS = Conn.Execute(SQL1);
// if (! RS.EOF)
//	Response.Redirect("captains.asp");
greeting = "Welcome "+getUserName();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging = current_debug_status();
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
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo">
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
	<h1>Juniors:&nbsp;<b>LTA Mini-Tennis Awards</b></h1>
	<h2><%= greeting %></h2>
<!--	
	<div id="overlayboxquote"  class="boxright" style="margin-bottom:5px; margin-left:5px;">
		<div class="boxheader">
		    Well done!
		</div>
		<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
		<p>
			I would just like to take this opportunity to congratulate both the Ladies 1st Team, Mens 1st Team, 
			Mens 2nd Team and the Mens 3rd Team for being promoted this season (in the Coventry Lawn
			Tennis League). This is no small achievement on their part (third time in as many years for the Mens 1st Team,
			second time in 2 years for the Mens 2nd Team, first EVER promotion for the Mens 3rd Team and an emphatic return 
			upwards after disappointing relegation last season for the Ladies 1st Team) and everyone at the club should be 
			proud of them. I would also like to thank the many other members who turned out to play for our other league 
			teams - your effort and time is valued and I hope you enjoyed your playing.
		</p>
		<p class="boxsignature">Steve Ray</p>
	</div>
-->
	<p>
		We have decided to trial the new LTA Mini Tennis Awards as part of our junior coaching programme.  The Rally Awards will help you to see how your child is improving with stickers, badges, certificates and the Rally Awards Collector.  We will initially be trialling the awards with our Mini Red classes and if this is successful, the awards will be offered to other children on the programme.
	</p>
	<h2>Mini Tennis Red Awards</h2>
	<p>
		The LTA Mini Tennis Red Awards have been designed for players between the ages of 5 and 8 years old to help mini players take part in exciting exercises with regular rewards which encourage them to develop their tennis skills at a pace that suits them.  More information on the awards can be found on the 
		<a href="http://www.lta.org.uk/LTA-Mini-Tennis/Red/Rally-Awards/" target="_blank">LTA website</a>.
	</p>
	<h2>Autumn Term 2012 - Rally Awards</h2>
	<p>
		This term we will be focussing on the Rally Award.  Depending on their level of ability, children will be attempting either Red 5, Red 10, Red 15 or Red 20 rallying.  Full details of what is required at each level, including videos are available <a href="http://www.lta.org.uk/LTA-Mini-Tennis/Zone/Coaching-Videos/" target="_blank">here</a>.
		
	</p>
	<p>
		We have modified the scheme slightly and will be dividing the Red 5 and 10 section into Gold, Silver and Bronze.  
		<ul type="none">
			<li>Red 5 Bronze award - the player will achieve a rally of 5 with a coach with both players close to the net
			<li>Red 5 Silver award - the player will achieve a rally of 5 with a coach with the player at the baseline
			<li>Red 5 Gold award - the player will achieve a rally of 5 with a coach with both players at the baseline
			<li>Red 10 Bronze award - two players to achieve a rally of 10 close to the net
			<li>Red 10 Silver award - two players to achieve a rally of 10 from the service line
			<li>Red 10 Gold award - two players to achieve a rally of 10 from the base line</li>
		</ul>
	</p>
	<p>
		The coach of each group will decide at which level the group will be tested.  If a child achieves a particular award easily, they will be allowed to try for the next award.  Please be aware that some of the awards are challenging for the children and not all children will receive an award this time.
	</p>
	<h2>Timetable</h2>
	<p>
		Week beginning 26th November - mock test week for all children in mini red group classes
		Week beginning 3rd December - certificate week - all children will try out for awards and if successful will receive a certificate
		Week beginning 10th December - fun week
		<br /><br />
		There will be no charge for certificates during the trial period.
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
