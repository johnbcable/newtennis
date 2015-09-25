<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var prevmonth;
var dummy1, dummy2;
var kount, thetext, theparas;
var title, issueno, issueseq, author, articletext;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
		<h1>Our Club:<b>&nbsp;200 Club</b></h1>
		<img src="images/200_Club.gif" width="109" height="48" alt="This IS the 200 Club page!">
		<h2>200 Club Aims and Objectives</h2>
        <p>
			The 200 Club is a sports-club-wide initiative. Money raised via the 200 Club is applied to the maintenance and improvement of
			Hampton Sports Club facilities. The 200 Club aims to pay out a minimum of 50%
			of its income as prizes.
		</p>
		<h2>The Prizes</h2>
		<p>
			There are 12 monthly draws and one additional annual draw each year with prizes
			as follows (<u>with effect from February 2007</u>):
		</p>
		<div id="200clubprizes" class="borderboth">
			<table>
				<caption>Prizes from 200 Club Prize Draws</caption>
				<thead>
					<th>Prizes</th>
					<th>1st Prize</th>
					<th>2nd Prize</th>
					<th>3rd Prize</th>
					<th>4th Prize</th>
					<th>5th Prize</th>
					<th>6th Prize</th>
				</thead>
				<tbody>
					<tr>
						<td class="leftalign"><b>Monthly Draw</b></td>
						<td class="centered">&pound;50</td>
						<td class="centered">&pound;30</td>
						<td class="centered">&pound;20</td>
						<td class="centered">&pound;15</td>
						<td class="centered">&pound;10</td>
						<td class="centered">&pound;10</td>
					</tr>
					<tr>
						<td class="leftalign"><b>Annual Summer Draw</b></td>
						<td class="centered">&pound;300</td>
						<td class="centered">&pound;100</td>
						<td class="centered">&pound;50</td>
						<td style="background-color:#c0c0c0">&nbsp;</td>
						<td style="background-color:#c0c0c0">&nbsp;</td>
						<td style="background-color:#c0c0c0">&nbsp;</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							&nbsp;
						</td>
					</tr>				
				</tfoot>
			</table>
		</div>
		<h3>Please note:</h3>
		<p>Cheques or standing orders need to be received by the 15th of
			the month in order to qualify for that months draw.  Draws will normally be
			made during the first half of the month following the month to which they
			relate, although they may occasionally be delayed a short while in order to
			coincide with club social events. The Annual Draw normally takes place in June. 
		</p>
		<p>
			Additional prizes will be put into the draw as membership increases to ensure
			that we achieve the objective of paying out a minimum of 50% of our income in
			prizes.
		</p>
		<p>
			Winners this year <a href="200res.asp">are:</a>
		</p>
		<h2>Joining the 200 Club</h2>
		<p>
			If you would like to join, standing order forms are available <a href="forms.asp#200so">here</a> for you to download and use or from:
		</p>
		<p>
			<ul type="disc">
				<li style="padding-left: 2em;">behind the clubhouse bar </li>
				<li style="padding-left: 2em;">Karen Finch (<b>01675 443160</b>) </li>
			</ul>
		</p>
		<p>
			The cost is only &pound;2 per number per month via a standing order form or a cheque
			payable to "Hampton Sports Club 200 Club". 
		</p>
<%
if ( is200ClubEditor() )	
{
%>
		<h2>200 Club Administration:</h2>
		<ul>
			<li><a href="which200draw.asp">Record results of a draw</a></li>
		</ul>
<%
}
%>	
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
