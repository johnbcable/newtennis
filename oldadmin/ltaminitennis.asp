<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("LTA Mini-Tennis - Home Page");
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
greeting = "Hi "+getUserName();
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
	<h1>Juniors:&nbsp;<b>LTA Mini-Tennis</b></h1>
	<h2><%= greeting %></h2>
	<div id="ltaminitennisbanner" class="collage">
		 <img alt="LTA Mini Tennis Banner" src="Images/LTAMiniTennis.jpg" width="100%">
	</div>
	<p>
		Children between 3 and 10 years old can now get stuck into the world of tennis with an exciting programme from the LTA sponsored by Highland Spring.
	</p>
	<p>
		With smaller courts, nets and rackets and lower bouncing balls, LTA Mini Tennis offers the perfect introduction to the sport, with all the fun and energy of the real thing.
	</p>
	<p>
		There are four stages of LTA Mini Tennis; Tots, Red, Orange and Green, each with their own court size and type of ball. This tailored approach enables players to develop vital skills and techniques at an early age.
	</p>
	<p>
		There is also the <a href="ltaminitennisawards.asp">LTA Mini Tennis Rally Awards</a> scheme, designed to help mini players learn in stages and take part in exciting exercises with regular rewards which encourage them to develop their tennis skills at a pace that suits them.
	</p>
	<p>
		Many sports have a mini version including, football, rugby and cricket which are helping to develop young talent in appropriate learning environments.
	</p>
	<p>
		The <a href="http://www.lta.org.uk/fairplay">LTA Fair Play values</a> ( Enjoy.Respect ) have been created with the help of tennis people and are a reminder of how everyone should behave when on court, watching a match or coaching players. To help mini tennis players understand the values read and follow the <a href="http://www.lta.org.uk/NewWebsite/LTA/Documents/Players%20and%20Parents/Fair%20Play/Mini%20Player%20updated.pdf">mini tennis Fair Play pledge</a>.
	</p>
	<p>
		Get set for the mini game with the big attitude!
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
