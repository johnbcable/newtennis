<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Court Circular Magazines");
// Now for any variables local to this page
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h2>Court Circular Magazines</h2>
		<table width=750 border=0 cellspacing=0 cellpadding=0 cols="100,*,120" style="padding-bottom:20px;margin-bottom:20px;">
			<tr>
				<td>
					<table  width="100%" cellspacing="2" cellpadding="5" border="0">
						<tr>
							<td style="border:none;">
								<a href="cc2013.pdf">Current: Spring 2013</a>
								
							</td>
							<td style="border:none;">
									<b>Coventry and Inter-District League champions!
									Tenth annual June Arden 9 run;diary dates;league and tournament 
									tennis preparations; roundup from coaching team and FAQ updates</b>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width=750 border=0 cellspacing=0 cellpadding=0 cols="100,*,120" style="padding-bottom:20px;margin-bottom:20px;">
			<tr>
				<td>
					<table  width="100%" cellspacing="2" cellpadding="5" border="0">
						<tr>
							<td class="style1">
								<A HREF="cc2012.pdf">Spring 2012</A>
								
							</td>
							<td class="style1">
									New for 2012 - tennis club on Facebook and Twitter; new all-girl 
									&quot;Tennis Chicks&quot; sessions. Mens 1st Team promoted to the 
									Premnier Division; annual roundup from coaching team and FAQ updates
							</td>
						</tr>
						<tr>
							<td class="style1">
								<A HREF="cc2011.htm">Spring 2011</A>
								
							</td>
							<td class="style1">
									Court bookng goes online!
									Eighth annual June Arden 9 run;diary dates;league and tournament 
									tennis preparations; roundup from coaching team and FAQ updates
							</td>
						</tr>
						<tr>
							<td class="style1">
								<A HREF="cc17.htm">Issue 17 - Spring 2009</A>
								
							</td>
							<td class="style1">
									Work begins on new courts!
									Sixth annual June Arden 9 run;diary dates;league 
									tennis preparations; Junior Section achievement roundup from coaching team
							</td>
						</tr>
						<tr>
							<td class="style1">
								<A HREF="cc16.htm">Issue 16 - Spring 2008</A>
							</td>
							<td class="style1">
									Warwickshire LTA Club of the Year, 2007!, Progress on court refurbishment plans; Arden 9 - Fifth annual June run;diary dates;league 
									tennis preparations;Junior Section achievement roundup from new coaching team
							</td>
						</tr>
						<tr>
							<td class="style1">
								<A HREF="cc15.htm">Issue 15 - Spring 2007</A>
							</td>
							<td class="style1">
									Progress on court refurbishment plans; Arden 9 - fourth annual June run;diary dates;league tennis preparations;Junior Section achievement roundup
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc14.htm">Issue 14 - Spring 2006</A>
							</td>
							<td class="tdfont">
									More on court refurbishment plans;Arden 9 - third annual June run;diary dates;league tennis preparations incl. 3rd ladies team;Junior Section achievement roundup
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc13.htm">Issue 13 - Spring 2005</A>
							</td>
							<td class="tdfont">
									Current state of court refurbishment plans;Sports Club AGM summary;appointment of new coach;Arden 9 - June run;diary dates;league tennis preparations;Junior Section achievement roundup
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc12.htm">Issue 12 - March 2004</A>
							</td>
							<td class="tdfont" >
									Current state of court refurbishment plans;Sports Club AGM summary;Arden 9 - June run;diary dates;Mini-Tennis Awards scheme;No Smoking in the clubhouse and Junior Section achievement roundup
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc11.htm">Issue 11 - August 2003</A>
							</td>
							<td class="tdfont">
									Mini Court Circular! Dates for the diary; club tournament winners; track-suits; Mini Red Tennis; guest policy
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc10.htm">Issue 10 - March 2003</A>
							</td>
							<td class="tdfont">
									The 2003 season kicks off here! All the details about court refurbishment plans; new season league teams; dates for the diary; junior section progress
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<A HREF="cc9.htm">Issue 9 - August/September 2002</A>
							</td>
							<td class="tdfont">
									League teams results; juniors performances; autumn coaching programme; clubhouse redecoration; dates for the diary and complete finals day results round-up! Plus - Hampton Hockey join us on the web.
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<a href="cc8.htm">Issue 8 - June/July 2002</a>
							</td>
							<td class="tdfont">
									Finals Day appetiser, league teams performance round-up, holiday tennis arrangements, junior tennis tournament pictures for starters!
							</td>
						</tr>
						<tr>
							<td class="tdfont">
								<a href="cc7.htm">Issue 7 - May 2002</a>
							</td>
							<td class="tdfont">
									Profile on new coach Richard Perkins, Andy Williamson and the Duke of Edinburgh Award, Junior Tournament, Wine Tasting and much more!
							</td>
						</tr>
						<tr>
							<td class="tdfont" >
								<a href="cc6.htm">Issue 6 - April 2002</a>
							</td>
							<td class="tdfont" >
									Start of season splash! - Quiz Night, Play Tennis Day details, Awards For All grant, Wimbledon Ticket Draw.
							</td>
						</tr>
						<tr>
							<td class="tdfont" >
								<a href="cc5.htm">Issue 5 - March 2002</a>
							</td>
							<td class="tdfont" >
									Launch issue of web-based magazine (incl. typos!). Opening remarks from new chairman (Sarah Wells), subscriptions reminders and early warning of league and friendly fixtures
							</td>
						</tr>
					</table>
				</td>
				<!-- Column 3 reserved for internal and external advertising -->
			</tr>
		</table>
<br>
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