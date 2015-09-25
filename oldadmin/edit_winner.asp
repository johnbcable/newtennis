<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String(clubname+" - Editing a Title Winner");
// Now for any variables local to this page
var theid;
var winObj = new Object();
var ConnObj;
var RstObj;
var dbconnect=Application("hamptonsportsdb");
var theyear, thesection;
var curyear = new String(currentYear()).toString();
// Set up default greeting strings
if (!signedin())
	Response.Redirect("login.asp");
if (!isFixtureEditor())
	Response.Redirect("winners.asp");
strdate = datestring();
strtime = timestring();
theid=new String(Request.Querystring("id"));
winObj = getWinner(theid);
theyear = new String(winObj.year).toString();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
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
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<!--#include file="dateval.asp" -->
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
			<h1>Site Administration:&nbsp;<b>Tournament Title Winners</b></h3>
			<form name="WinnerForm" action="set_winner.asp" method="GET">
				<fieldset>
					<legend>Current title winner(s) details for <%= winObj.title %>,<%= winObj.year %></legend>
					<div>
						<br />
						<label for="winner">Winner(s):</label>
						<input tabindex="1" type="text" name="winner" id="winner" size="50" maxlength="50" value="<%= winObj.winners %>" />
					<div>
					<div>
						<br />
						<label for="runnerup">Runner(s) up:</label>
						<input tabindex="2" type="text" name="runnerup" id="runnerup" size="50" maxlength="50" value="<%= winObj.runnerup %>" />
					<div>
					<div style="text-align: right; padding-right: 10px;">
						<input type="hidden" name="id" value="<%= theid %>">
						<br />
						<input type="submit" value="Submit" name="submit" tabindex="9">
						<br />
					</div>
				</fieldset>
			</form>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.WinnerForm.winner.Focus
    Document.WinnerForm.winner.Select
End Sub
</SCRIPT>
</html>
<%
%>
