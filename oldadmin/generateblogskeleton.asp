<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Generating Team Blog Skeleton");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var teamid, theyear;
var teamObj = new Object();
var dummydate, dummy, venue;
var matchtext, matchnumber;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Get parameters from querystring or form
teamid = new String(Request.QueryString("id")).toString();
if (teamid == "" || teamid == "null" || teamid == "undefined")
{
 	 teamid = new String(Request.Form("id")).toString();
	 if (teamid == "" || teamid == "null" || teamid == "undefined")
	 		teamid = new String("-1").toString();
}
theyear = new String(Request.QueryString("year")).toString();
if (theyear == "" || theyear == "null" || theyear == "undefined")
{
 	 theyear = new String(Request.Form("year")).toString();
	 if (theyear == "" || theyear == "null" || theyear == "undefined")
	 		theyear = new String(currentYear()).toString();
}
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
		<h1>Admin:&nbsp;<b><%= pagetitle %></b></h1>
		<p style="margin-bottom: 50px;">
		This page generates a skeleton web page for a given team for a given season.
		</p>
		<blockquote>
		<ol id="blog" style="clear: both;">
<%
teamObj = getTeam(teamid);
SQL1 = new String("SELECT * from tennisfixtures WHERE teamname = '"+teamObj.teamname+"' and fixtureyear = "+theyear+" order by fixturedate asc");
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
RS = ConnObj.Execute(SQL1);
matchnumber = 0;
while (!RS.EOF)
{
 			dummy = new String(RS("homeoraway")).toString();
			matchnumber = matchnumber + 1;
			venue = new String("Home");
			if (dummy == "A")
				 venue = new String("Away");
			dummydate = dateasstring(RS("fixturedate"));
			matchtext= new String("match"+matchnumber.toString()).toString();
			
%>
			<li>
				<a name="<%= matchtext %>" id="<%= matchtext %>" />
				<h2><%= RS("opponents") %> (<%= venue %>) - <%= dummydate %></h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>
<%
			RS.MoveNext();
}
RS.Close();
%>		
			</ol>
		</blockquote>
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

