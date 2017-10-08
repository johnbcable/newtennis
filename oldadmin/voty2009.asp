<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Volunteer of the Year, 2009");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - About Us</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
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
<body id="ws_ourclub">
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="#">Our Club</a></li>
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
		<h1><%= pagetitle %>&nbsp;<b>John Eccleston</b></h1>
		<div id="volunteeroftheyear">
			<h2>Volunteer of the Year, 2009!</h2>
			<img id="voty" src="images/med_johneccleston1.jpg" alt="He did it!" width="200" style="float: left; margin: 0 20px 20px 0;" />
			<p>
				We are delighted to announce that John Eccleston won the 2009 Warwickshire 
				LTA Volunteer of the Year award presented at the awards evening held at the 
				Botanical Gardens in January.  This success follows the award two years ago 
				of the Warwickshire 2007 LTA Club of the Year award and keeps Hampton as one 
				of the higher profile clubs of the 70 odd in Warwickshire.
			</p>
			<p>
				As many of you will know, John project managed the new court development 
				at Hampton.  Many, many hours were devoted firstly in the areas of project 
				specification, project estimates, raising funding and finally selection of the 
				relevant contractor.  During the project build phase, John was working on the 
				project seemingly full time with some excellent support from Lee West (the LTA 
				advisor).  As ever in these complex projects, a number of issues arose that 
				John dealt with in his stride with his normal, assured no-nonsense fashion.
			</p>
			<p>
				The new courts were delivered on time and, most importantly, on budget - a 
				phenomenal achievement when you consider the number of new-build projects that 
				considerably exceed budget!
			</p>
			<p>
				In addition to the above, John has been Chairman of the wider Sports Club at 
				Hampton for several years.  Where does he find the time!
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
