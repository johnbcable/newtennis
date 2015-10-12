<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Online Court Booking - Introduction");
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
	<!-- Comment out the next style sheet if running in production -->
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
li {
list-style-type: disc;
margin-bottom: 5px;
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
		<h1>Admin:&nbsp;<b>On-line booking system</b></h1>
		<div id="onlinebooking01" style="height: 450px; width: 610px; overflow:hidden;">
			<img src="http://hamptontennis.org.uk/images/onlinebooking01.jpg" width="601" height="386" ALT="View of the new online court booking - main screen" />
			<p style="clear:both; text-align: center; width: 80%; margin: 0 auto;">The main online-booking screen is presented as a calendar/diary page for quick and easy checking of what is available</p>
		</div>
		
                 <p style="padding-top: 5px; border-top: 1px solid black;">
                    The system is very simple to use. There will be no fee for booking courts as the court lighting
                    will remain separately charged for.
                </p>
                <p>
                    Have a look at the video tutorial <a href="http://www.ebookingonline.net/includes/docs/del3.swf">
                        www.ebookingonline.net/includes/docs/del3.swf</a></p>
                <p>
                    Or access the live system for a test run:
                    <ul>
                        <li>
														Logon by clicking <a href="https://www.ebookingonline.net/box/box3.php?id=29">here</a>.<br />
                        </li>
												<li>
														A UserID and Pin number is required to book courts. This will have been sent to you 
														via email. 
												</li>
                    </ul>
                </p>
				<h3>Notes</h3>
                <p>1.  If you do not recall your User Id and/or PIN:</p> 
													 <p>
														<ol type="number"  style="margin-left: 20px;">
																<li>select the "Forgotten ID or Pin" option from the sign-in panel on the right of the screen.</li>
																<li>
																		Enter the email address you have registered with the club and a link will be sent
																		to you which allows you to change your Pin number (remember that it may end up in
                            				your junk email!).
																</li> 
																<li>
																		If for some reason you cannot remember your email address that you registered with the club, email
                            				our <a href="mailto:support@hamptontennis.org.uk?subject=Request for UserID and Pin">Site
                                		Admin</a> and we will send you your UserID and (reset) Pin. 
																</li>
														</ol>
														</p>
								<p>2. Cancelling or amending a booking:</p>
								<p style="margin-left: 20px;">
												You cannot cancel or update a booking on the computer at the club. You must do this
												from a computer elsewhere by logging on as yourself on the main online booking site 
												( <a href="https://www.ebookingonline.net/box/box3.php?id=29">here</a> ) and electing to
												manage your bookings.
								</p>
									</ul>
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

