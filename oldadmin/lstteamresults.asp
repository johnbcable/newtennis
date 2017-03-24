<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Performance against this team");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var theseason, thelayout;
var theid, theopposition, thevenue;
var thenote, thefixturedate, myDate;
var venuetext, teamnote, teamtext;
var curteam, prevteam;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQL1, SQLStmt;
var fixtureknt;
var teamclause, venueclause;
var ourscore, theirscore;
var totalthem, totalus, unknown, uswin, uslose, usdraw;
var debugging = false;
var thecomments = new String("").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
totalthem = 0;
totalus = 0;
uswin = 0;
uslose = 0;
usdraw = 0;
unknown = 0;
fixtureknt=0;
thelayout = new String("Full").toString();
theseason = new String(Request.Form("season")).toString();
theseason = theseason.toUpperCase();
thelayout = new String(Request.QueryString("layout")).toString();
thelayout = thelayout.toUpperCase();
thevenue = new String(Request.Form("venue")).toString();
thevenue = thevenue.toUpperCase();
theopposition = new String(Request.QueryString("theopposition")).toString();
// theopposition=theopposition.toUpperCase();
// Now cope with default situations
if (thelayout == "" || thelayout == "NULL" || thelayout == "UNDEFINED")
	thelayout = new String("FULL").toString();
if (thevenue == "" || thevenue == "NULL" || thevenue == "UNDEFINED" || thevenue == "BOTH")
	thevenue = new String("BOTH").toString();
if (thevenue == "BOTH")
	venuetext = new String("Home and Away");
if (thevenue == "A")
	venuetext = new String("Away");
if (thevenue == "H")
	venuetext = new String("Home");
if (theopposition == "" || theopposition == "null" || theopposition == "undefined" || theopposition == "All")
	Response.Redirect("fixtures.asp");
teamtext = new String(theopposition).toString();
if (theopposition == "*")
	teamtext = new String("All Teams");
teamclause = new String("");
if (theopposition != "All Teams")
	teamclause = "opponents like '"+theopposition+"'";
// End of defaults - now construct SQL	
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// Firstly get opposing team info from the otherteams table
SQL1 = new String("SELECT * from  otherteams where teamname like '"+theopposition+"'").toString();
RS=ConnObj.Execute(SQL1);
if (! RS.EOF)
{
	thecomments = new String(RS("comments")).toString();
	if (thecomments == "null" || thecomments == "undefined")
		thecomments = new String("").toString();
}
RS.Close();
if (thevenue == "BOTH")
	SQLStmt = new String("SELECT * from tennisfixtures where "+teamclause+" order by fixturedate, teamname");
else
	SQLStmt = new String("SELECT * from tennisfixtures where "+teamclause+" order by fixturedate, teamname");
RstObj = ConnObj.Execute(SQLStmt);
prevteam = new String("kshgkefshgblkesfj").toString();
curteam = new String("dbkjfdbkjrn").toString();
displaydate = dateasstring(Date());
var debugging = current_debug_status();
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
		<h1>Playing:<b>League results analysis</b></h1>
<%
	if (debugging)
	{
		Response.Write("<br />");
		Response.Write("SQL = ["+SQLStmt+"]<br />");
		Response.Write("thelayout = ["+thelayout+"]<br />");
		Response.Write("<br />");
	}
	if (thelayout == "FULL")
	{
%>
		<table style="border: 0;">
			<caption>Opponents: <%= teamtext %></caption>
			<thead>
				<tr>
					<th>Fixture<br />Date</th>
					<th style="text-align: center;">Venue</th>
					<th>Hampton Team</th>
					<th>First Pair<br />Second Pair</th>
					<th style="text-align: center;">Our<br />Score</th>
					<th style="text-align: center;">Their<br />Score</th>
				</tr>
			</thead>
			<tbody>
<%
	}
	while (! RstObj.EOF)
	{
		curteam = new String(RstObj("teamname")).toString();
		// Now, put out heading line as appropriate
		if (curteam != prevteam)
		{
			if (theopposition == "All")
			{
				if (thelayout == "FULL")
				{
%>
				<tr>
					<td colspan="6" bgcolor="#c0c0c0"><%= curteam %>&nbsp;</td>
				</tr>
<%
				}
			}
			prevteam = new String(curteam).toString();
		}							
		theid=new String(RstObj("fixtureid"));
		thenote = new String(RstObj("fixturenote"));
		if (thenote == "null" || thenote == "undefined")
				thenote = "";
		venuetext = "Home"
		if (RstObj("homeoraway")=="A")
			venuetext="Away";
		myDate = new Date(RstObj("fixturedate"));
		thefixturedate = ddmmyyyy(myDate);
		theirscore = new String(RstObj("opponentresult")).toString();
		ourscore = new String(RstObj("hamptonresult")).toString();
		if (ourscore == "" || ourscore == "null" || ourscore == "undefined")
		        ourscore = new String("0").toString();
		if (theirscore == "" || theirscore == "null" || theirscore == "undefined")
		        theirscore = new String("0").toString();
		dummy1 = parseInt(ourscore)
		dummy2 = parseInt(theirscore)
		totalus += dummy1;
		totalthem += dummy2;
		if (dummy1 == dummy2)
		{
		        if (dummy1 < 1)
		        	unknown += 1;
			else
				usdraw += 1;
		}
		if (dummy1 > dummy2)
		        uswin += 1;
		if (dummy1 < dummy2)
		        uslose += 1;
		if (thelayout == "FULL")
		{
%>
				<tr>
					<td><%= thefixturedate %></td>
					<td style="text-align: center;"><%= venuetext %></td>
					<td><%= curteam %></td>
					<td><%= RstObj("pair1") %><br /><%= RstObj("pair2") %></td>
					<td style="text-align: center;"><%= RstObj("hamptonresult") %></td>
					<td style="text-align: center;"><%= RstObj("opponentresult") %></td>
				</tr>
<%
		}
		RstObj.MoveNext();
	}
%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
		<br />
<%
if (! (thecomments == ""))
{
%>		
		<div id="overlayboxquote" class="boxright" style="margin-left:20px;">
			<div class="boxheader">
				Notes for <%= teamtext %>
			</div>
			<p>
				<%= thecomments %>
			</p>
			<p class="boxsignature">&nbsp;</p>
		</div>
<%
}
%>		
		<div>
		<p style="text-align: center;" style="width:50%;">
		<table>
			<caption>Summary results</caption>
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><b>Matches won by Hampton</b></td>
					<td style="text-align: center;"><%= uswin %></td>
				</tr>
				<tr>
					<td><b>Matches lost by Hampton</b></td>
					<td style="text-align: center;"><%= uslose %></td>
				</tr>
				<tr>
					<td><b>Matches drawn by Hampton</b></td>
					<td style="text-align: center;"><%= usdraw %></td>
				</tr>
				<tr>
					<td><b>Rubbers won by Hampton</b></td>
					<td style="text-align: center;"><%= totalus %></td>
				</tr>
				<tr>
					<td><b>Rubbers lost by Hampton</b></td>
					<td style="text-align: center;"><%= totalthem %></td>
				</tr>
				<tr>
					<td><b>Unknown results</b></td>
					<td style="text-align: center;"><%= unknown %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>		
		</p>
		</div>
		<div style="text-align: center;" id="returnlinks">
			<p><a href="lstfixtures.asp?team=<%= curteam %>">Return to fixture list</a></p>
		</div>
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
