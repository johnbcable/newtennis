<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Members Area");
// Now for any variables local to this page
var greeting;
var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
var ConnObj, RstObj, SQLStmt;
var myteams = new Array(20);
var teamknt, theseason;
var debugging = current_debug_status();
var editline, emailline;
var venuetext, mydate, thefixturedate, thenote, theid;
var eventknt;
var leaguetext = "is now under way";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// Get user details
var topdog = isSupport();
greeting = "Welcome to the team captains area "+getUserName();
uniqref = getUserCode();
uniqref = uniqref.toString();
theseason = new String(currentYear()).toString();
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
SQL1 = new String("SELECT teamname from tennisteams where uniqueref = "+uniqref).toString();
//
RS = Conn.Execute(SQL1);
for (i=0; i<20; i++)
	myteams[i] = new String("").toString();
teamknt = -1;
while (! RS.EOF)
{
	teamknt++;
	myteams[teamknt] = new String(RS("teamname")).toString();
	RS.MoveNext();
}
if (teamknt < 0)
	Response.Redirect("members.asp");
theteam = new String(myteams[0]).toString();
RS2=Server.CreateObject("ADODB.Recordset");
SQL2 = new String("SELECT * from tennisfixtures where fixtureyear = "+theseason+" and teamname like '"+theteam+"' order by teamname,fixturedate");
RS2 = Conn.Execute(SQL2);
prevteam = new String("kshgkefshgblkesfj").toString();
curteam = new String("dbkjfdbkjrn").toString();
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
		<h1>Playing:&nbsp;<b>Captains Home Page</b></h1>
		<div id="captainsblurb" class="lefthalf">
			<h3><%= greeting %></h3>
			<p>
				<b>You currently captain:</b>&nbsp;&nbsp;<span class="blueheading"><b><%= myteams[0]%></b></span>
<!--
<%
for (i=0; i<(teamknt+1); i++)
	Response.Write('&nbsp;&nbsp;&nbsp<h4 class="leftindent"><span class="blueheading"><b>'+myteams[i]+'</b></span></h4>');
%>
-->
			</p>		
		</div>
		<div id="captainsoptions" class="softbox" style="width:47%; float: right; clear:both; margin-left: 10px; margin-right: 10px;">
			<div class="softbox">
				<h3>Captains Options</h3>
				<ul>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="profile.asp">Personal contact details</a></li>
<!--
					<li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="fixturelist.asp?team=<%= myteams[0] %>">Check <%= myteams[0] %> league record</a></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="lst_squad.asp?captain=<%= uniqref %>">Maintain the <%= myteams[0] %> squad</a></li>
-->
<%
if (topdog)
{
%>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="squademail.asp">Send email to the <%= myteams[0] %> squad</a></li>
<%
}
%>
					</ul>
			</div>
		</div>		

		<div id="covleague" class="borderboth" style="clear:both;">
			<h2><a href="league.asp">League Tennis</a></h2>
			<a href="http://www.coventrytennisleague.co.uk/">
				<img id="covleagueimage" src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams" style="float:left; margin-right:20px;">
			</a>
			<p>
			The tennis league season (late April to early August each year) for 2014 <%= leaguetext %>. You can now view the detailed league tables and positions directly within our own website <a href="leagueresults.asp">
			here</a>. 
			</p>
		</div>		
		<table>
			<caption>Current fixtures for the&nbsp;<%= myteams[0] %>:</caption>
			<thead>
				<tr>
					<th>Fixture<br />Date</th>
					<th class="centered">Venue</th>
					<th>Opponents</th>
					<th>First Pair<br />Second Pair</th>
					<th class="centered">Our<br />Score</th>
					<th class="centered">Their<br />Score</th>
					<th class="centered">Action</th>
				</tr>
			</thead>
			<tbody>
<%
	while (! RS2.EOF)
	{
		curteam = new String(RS2("teamname")).toString();
		theid=new String(RS2("fixtureid"));
		thenote = new String(RS2("fixturenote"));
		if (thenote == "null" || thenote == "undefined")
				thenote = "";
		venuetext = "Home"
		if (RS2("homeoraway")=="A")
			venuetext="Away";
		myDate = new Date(RS2("fixturedate"));
		// thefixturedate = ddmmyyyy(myDate);
		thefixturedate = dateasstring(myDate);
%>
				<tr>
					<td><%= thefixturedate %></td>
					<td class="centered"><%= venuetext %></td>
					<td><a href="lstteamresults.asp?theopposition=<%= RS2("opponents") %>&layout=Full"><%= RS2("opponents") %></a><br><b><%= thenote %></b></td>
					<td><%= RS2("pair1") %><br /><%= RS2("pair2") %></td>
					<td class="centered"><%= RS2("hamptonresult") %></td>
					<td class="centered"><%= RS2("opponentresult") %></td>
					<td class="centered">
							<a href="edit_fixture.asp?id=<%= theid %>" alt="Supply the results for this fixture">Result</a><br />
<%
		if (topdog)
		{
%>
							<a href="squademailfixture.asp?fixture=<%= theid %>" alt="Send an email about this fixture to the <%= curteam %> squad">Email</a>
<%
		}
%>
					</td>
				</tr>
<%
		
		RS2.MoveNext();
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
			<b>N.B.</b>&nbsp;Click on an opposing team name in the table above to see how Hampton have fared against this team over the years
		</p>
<!--		
		<div id="tournamentreminder">
			<b><h4>Don't forget</h4></b>
		<p>
		The club tournament draw has been published on the clubhouse 
		noticeboard and is also available <a href="tour2011.asp">here</a>. When you do play in the internal 
        club tournament(s) check which match(es) you need to play, arrange them in good time,&nbsp; complete them by 
        the due date and record the result(s) on the draw sheet in the clubhouse. Finals in 2011 are to be held on Saturday 2 July, 
		and we don't need any last minute rushes for courts thank you very much!
		</p>
			</p>
		</div>
-->		
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

