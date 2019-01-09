<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Sports Club - Captains List Administration");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var theseason;
var theid, theteam, thevenue;
var thenote, thefixturedate, myDate;
var venuetext, teamnote, teamtext;
var curcategory, prevcategory;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var RS, RS2, RS3;
var fixtureknt;
var teamnames = new Array(10);
var teamclause, venueclause;
var debugging = false;
var d, dummy, i, kount, thisyear;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("league.asp");
//
thisyear = new String("").toString();;
d = new Date();
thisyear += d.getYear();
// End of defaults - now construct SQL	
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from tennisteams order by teamcategory, teamname");
if (! isSupport())
	SQL1 = new String("SELECT * from tennisteams WHERE teamcategory = 'ADULT' order by teamcategory, teamname");
RS = ConnObj.Execute(SQL1);
prevcategory = new String("kshgkefshgblkesfj").toString();
curcategory = new String("dbkjfdbkjrn").toString();
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
			<h1>Site Administration:&nbsp;<b>Tennis Teams</b></h1>
			<table>
			<caption>List of Hampton's tennis teams and their captains</caption>
			<thead>
				<tr>
					<th>Team</th>
					<th>Current Captain</th>
					<th>Current Note</th>
					<th>Fixtureline</th>
					<th style="text-align:center;">Captain's<br />Member ID</th>
					<th>Captain's Email</th>
				</tr>
			</thead>
			<tbody>
<%
	while (! RS.EOF)
	{
		curcategory = new String(RS("teamcategory")).toString();
		// Now, put out heading line as appropriate
		if (curcategory != prevcategory)
		{
%>
				<tr>
					<td colspan="7" style="background-color:#c0c0c0;"><%= curcategory %>&nbsp;</td>
				</tr>
<%
			prevcategory = new String(curcategory).toString();
		}							
		theid=new String(RS("teamid"));
		thenote = new String(RS("teamnote"));
		if (thenote == "null" || thenote == "undefined")
				thenote = "";
%>
				<tr>
					<td class="leftindent"><a href="edit_team.asp?id=<%= theid %>"><%= RS("teamname") %></a></td>
					<td><%= RS("teamcaptain") %></td>
					<td><%= thenote %></td>
					<td><%= RS("fixtureline") %></td>
					<td style="text-align:center;"><%= RS("uniqueref") %></td>
					<td><%= RS("email") %></td>
				</tr>
<%
	RS.MoveNext();
	}
%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>	
		<p>
			<b>N.B.</b>&nbsp;Click on a team name in the table above to make changes to this teams information
		</p>
		<br />
<%
if ( isFixtureEditor() )	
{
%>
		<div id="fixtureadminarea" class="admin" style="clear:both;">
			<h3>Teams List Administration:</h3>
			<ul>
				<li style="padding-left: 20px;"><a href="new_team.asp">New team</a></li>
			</ul>
			</p>
		</div>		
		
<%
}
%>		
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
</html>
<%
%>

