<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Standard Forms");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
var debugging = false;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Standard Forms for Members</title>
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
			<h1>Members: <b>Standard Forms and Documents</b></h1>
			<p>
				In the table below, if the name of the form appears underlined you may click
				on the name of the form and go to a web-site version of this form to view it
				on-screen.
			</p>
			<p>
				If an entry appears in the <b><i>MS-Office</i></b> or <b><i>Acrobat</i></b>
				column alongside a form name, you may right-click on this link to save a
				copy of that form on your own computer in that format. We aim to 
				offer both Microsoft Office and Adobe Acrobat downloads for each form.
			</p>
			<p>
				Some forms may offer one or both of these ways for you to see them. If a
				form offers neither, it is not currently available via this web site.
			</p>
			<table>
				<caption>List of standard forms</caption>
				<thead>
					<tr>
						<th><i>Form/Document</i></th>
						<th><b><i>MS-Office</i></b></th>
						<th><b><i>Acrobat</i></b></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a name="200so">200 Club Standing Order form</a></td>
						<td><a href="200so.doc"><b><i>MS-Word</i></b></a><br>(26Kb)</td>
						<td><a href="200so.pdf"><b><i>Acrobat</i></b></a><br>(26Kb)</td>
					</tr>
					<tr>
						<td>Membership Application/Renewal Form</td>
						<td><a href="applicfrm.doc"><b><i>MS-Word</i></b></a><br>(55Kb)</td>
						<td><a href="applicfrm.pdf"><b><i>Acrobat</i></b></a><br>(64Kb)</td>
					</tr>
<!--					
					<tr>
						<td><a name="tournaments">Tennis Tournament Entry</td>
						<td><a href="tour2012.pdf"><b><i>&nbsp;</i></b></a><br>&nbsp;</td>
						<td><a href="tour2012.pdf"><b><i>Acrobat</i></b></a><br>(25Kb)</td>
					</tr>
-->					
					<tr>
						<td><a name="juniorcoaching">Junior Coaching Sessions - Booking Form</a></td>
						<td>&nbsp;</td>
						<td><a href="coaching_booking.pdf"><b><i>Acrobat</i></b></a><br>(51Kb)</td>
					</tr>
					<tr>
						<td><a name="leaguerules">Coventry Lawn Tennis League Rules</a></td>
						<td><a href="legrules.doc"><b><i>MS-Word</i></b></a><br>(12Kb)</td>
						<td><a href="legrules.pdf"><b><i>Acrobat</i></b></a><br>(12Kb)</td>
					</tr>
					<tr>
						<td><a name="accidentreport">Accident Report Form</a></td>
						<td>&nbsp;</td>
						<td><a href="Clubmark/pp2.7.pdf"><b><i>Acrobat</i></b></a><br>&nbsp;</td>
					</tr>
				</tbody>
				<tfoot>
					&nbsp;
				</tfoot>
			</table>
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

