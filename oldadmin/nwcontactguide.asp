<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("North Warwickshire Doubles - Club Contact Guidance");
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
		<h1>Juniors:&nbsp;<b>Playing</b></h1>
	<div id="advice">
		<h2><%= pagetitle %></h2>
		<p>
			Here are a few notes which may help you, especially if you have not been involved before:
		</p>
			<ol type="disc">
				<li>Each junior in your team should have their own LTA Player Rating. The new ratings are available from 1 March 2008. To get a rating, please register by going to the LTA website: <a href="www.lta.org.uk/Membership/">www.lta.org.uk/Membership/</a> and pressing "Sign Up Here" (last bullet point in the red box). Alternatively, ring 0845 873 7202. There is no charge for this.<br /></li>
				<li>Contact the other player(s) in your team to find out whether the scheduled matches are convenient.<br /></li>
				<li>If you wish to change a fixture, please contact the opposition as soon as possible. If it's a home fixture, check court availability and book a court for a two hour slot. Please remember to cancel the original court booking that is no longer needed. This is particularly important in the main tennis season when demand for courts is at its highest.<br /></li>
				<li>At least 10 days before a scheduled match, contact the opponents to ensure they are going to turn up! This should be the responsibility of the away side, but if you have not heard by the 10 days, please phone the opposition.<br /></li>
				<li>New balls should be used for home matches. These are available, free of charge, from Jayne Barnes (01675 443572).<br /></li>
				<li>After the match has been played, please enter the result on the sheet which is displayed on the Tennis Section notice board in the Club House. If it is difficult for you to get to the Club House, please email the results to Jayne Barnes at: <a href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a><br /></li>
				<li>Results for home fixtures should be entered on the results sheet provided, signed and posted to Malcolm Sidwell. Alternatively you can email them directly to Malcolm on: <a href="mailto:M.Sidwell@btinternet.com">M.Sidwell@btinternet.com</a><br /></li>
			</ol>
		<p>
			Thank you for your time and trouble in providing the juniors with this tennis opportunity.
		</p>
		<p>Good luck!</p>
		<br />
		<div class="seealso">
			<h3>Other Resources:</h3>
			<ul>
				<li><a href="nwrules.asp">Rules of the North Warwickshire Doubles League</a></li>
				<li><a href="directions.asp">Directions to other clubs</a></li>
				<li><a href="nwwinners.asp">Past winners and runners up</a></li>
				<li><a href="nwdblsleague.asp">Current club contacts and provisional fixtures</a></li>
			</ul>
		</div>			
	</div>       <!-- advice  -->
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

