<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Committee");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
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
<style type="text/css">
td {
	border: 0;
	padding: 10px 10px 10px 0;
	border-bottom: 1px solid black;
}
</style>
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
	<h1>Our Club:&nbsp;<b>Tennis Committee and Other Officers</b></h1>
	<p>
		Tennis at Hampton in Arden tennis club is looked after by a committee 
		composed of elected and co-opted members..
	</p>
	<p>
		The committee looks after the administration of funds, runs the mens
		and ladies tennis teams, sets league and friendly fixtures, makes changes to
		rules as required, runs ad-hoc tournaments and organises social events at the
		club. The committee also looks after all tennis development activities for junior
		members including coaching provision, open days and integration of club
		activities with national tennis initiatives e.g. National Competition Framework, 
		MiniTennis etc.
	</p>
	<p>
		If you would like to ask either our committee members a question, you can email
		them at the following address:
		<br /><br />
			<a href="mailto:thecommittee@hamptontennis.org.uk">thecommittee@hamptontennis.org.uk</a>
	</p>
	<h2>Committee Members</h2>
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Chris Barnes</td>
				<td>Chairman</td>
				<td>01675 443572</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>Secretary</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Ian Poole</td>
				<td>Head Coach, Co-opted Committee Member</td>
				<td>07968 451956</td>
			</tr>
			<tr>
				<td>Jo Oswald</td>
				<td>Treasurer</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="33%">Steve Ray</td>
				<td width="33%">Committee Member</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="33%">Carol Grant</td>
				<td width="33%">Committee Member</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td width="33%">Wayman Morris</td>
				<td width="33%">Committee Member</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Savio Gapsar</td>
				<td>Committee Member</td>
				<td>&nbsp;</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					&nbsp;
				</td>
			</tr>
		</tfoot>
	</table>
	<h2>Other Officers</h2>
	<table>
		<thead>
			<tr>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="33%">Jo Oswald</td>
				<td width="33%">Child Protection Officer</td>
				<td>01675 443559</td>
			</tr>	
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					&nbsp;
				</td>
			</tr>
		</tfoot>
	</table>
	<br />
	<p>
		You can e-mail the club on <a href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a> or visit the web site
		at <a href="http://hamptontennis.org.uk">http://hamptontennis.org.uk</a> for any further information.
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
