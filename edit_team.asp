<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="teamfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Sports Club - Amending a Team Setup");
// Now for any variables local to this page
var theid;
var myDay, myMonth, myYear, mFixtureDate;
var ConnObj;
var RstObj;
var dbconnect=Application("hamptonsportsdb");
var strmonth, stryear, strday, pair1, pair2;
var theteam = new Object();
// Set up default greeting strings
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("members.asp");
strdate = datestring();
strtime = timestring();
theid=new String(Request.Form("id"));
if (theid=="" || theid=="null" || theid == "undefined")
{
	theid=new String(Request.QueryString("id"));
	if (theid=="" || theid=="null" || theid == "undefined")
		Response.Redirect("members.asp");
}
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Get the team details back to edit
theteam = getTeam(theid);
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
		<script language="Javascript" src="js/datetimepicker.js"></script>
		<script language="Javascript" src="js/minmax.js"></script>
<!--#include file="dateval.asp" -->
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
		<h1>Site Administration:&nbsp;<b>Team Setup</b></h1>
		<form name="TeamForm" action="set_team.asp" method="post">
				<fieldset>
					<legend>Current setup information for <%= theteam.teamname %></legend>
					<div>
						<h4 class="blueheading">Teamname:&nbsp;&nbsp;<%= theteam.teamname %></h4>
					<div>
					<div>
						<label for="teamcaptain">Current captain:</label>
						<input tabindex="1" type="text" name="teamcaptain" id="teamcaptain" size="50" maxlength="50" value="<%= theteam.teamcaptain %>" />
					<div>
					<div>
						<label for="teamnote">Team note:</label>
						<input tabindex="2" type="text" name="teamnote" id="teamnote" size="60" maxlength="250" value="<%= theteam.teamnote %>" />
					<div>
				</fieldset>
<%
if (isSupport())
{
%>				
				<fieldset>
					<legend>Further support information for <%= theteam.teamname %></legend>
					<div>
						<label for="theteamcategory">Team category:</label>
						<input tabindex="3" type="text" name="theteamcategory" id="theteamcategory" size="20" maxlength="20" value="<%= theteam.teamcategory %>" />
					<div>
					<div>
						<label for="theteamfixtureline">URL to display fixture list:</label>
						<input tabindex="4" type="text" name="theteamfixtureline" id="theteamfixtureline" size="60" maxlength="149" value="<%= theteam.fixtureline %>" />
					<div>
					<div>
						<label for="thecaptainid">Captain's Member ID:</label>
						<input tabindex="5" type="text" name="thecaptainid" id="thecaptainid" size="4" maxlength="4" value="<%= theteam.uniqueref %>" />
					<div>			
					<div>
						<label for="theteamemail">Email:</label>
						<input tabindex="6" type="text" name="theteamemail" id="theteamemail" size="60" maxlength="100" value="<%= theteam.email %>" />
					<div>
				</fieldset>
<%
}
else
{
%>
					<div>
						<input type="hidden" name="theteamcategory" value="<%= theteam.teamcategory %>">
						<input type="hidden" name="theteamfixtureline" value="<%= theteam.fixtureline %>">
						<input type="hidden" name="thecaptainid" value="<%= theteam.uniqueref %>">
						<input type="hidden" name="theteamemail" value="<%= theteam.email %>">
					</div>
<%
}
%>
				<div>
					<input type="hidden" name="theteamname" value="<%= theteam.teamname %>">
					<input type="hidden" name="teamid" value="<%= theid %>">
					<br />
					<input type="submit" value="Save" name="submit" tabindex="9">
					<br />
				</div>
			</form>
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

