<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Coventry and District Lawn Tennis League");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var kount, dummy1;
var teams = new Array(10);
var team_ids = new Array(10);
var teamlinks = new Array(10);
var curteam, thisteam, newteam;
var venuetext;
var theblogline, theblogtext;
var debugging = false;
var leaguetext = "is now under way";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
thisyear = "";
d = new Date();
thisyear += d.getYear();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// End of page start up coding
%>
<!--#include file="fixturehead.asp" -->
<div id="wrapper">
	<div id="content">
		<h1><%= pagetitle %>:<b>&nbsp;Fixtures</b></h1>
		<div id="championsphoto" class="collage">
			 <img alt="Mens 1st Team - Premier Division Champions 2012" src="Images/champions.jpg" />
		</div>
		<p>
			Hampton Mens 1st Team - Premier Division Champions 2012 and 2013 in the Coventry and District Lawn Tennis League.
		</p>
		<div id="leagueintro">
			<p>
				Hampton-In-Arden Tennis Club belongs to Coventry Lawn Tennis League. The club's
				league fixtures are arranged for participating tennis clubs by the Coventry
				Lawn Tennis League itself. The rules used by the league (in MS Word 6.0 format)
				are available <a href="forms.asp#leaguerules">here</a> for download and viewing.
			</p>
<!--
			<p>
				New in 2009, Hampton are participating in both ladies and mens winter leagues. 
				These are:
			</p>
			<ul>
				<li><a href="ladieswinterleague.asp?year=2009">the Helen Cole Ladies Winter Doubles League</a></li>
			</ul>
-->
			<h3>Notes</h3>
			<ul>
				<li>
					<p>
					If you are unsure of the address of another club that we play against, don't get
					lost! Why not check our list of <a href="directions.asp"> club addresses</a>.
					</p>
				</li>
<!--
				<li>
					<p>
					Dates shown in the Ladies Winter League fixtures are dates when the fixture must be played by and
					not necessarily the actual date of the match. Players should always consult with their captain 
					about dates/times for their winter leage fixtures.
					</p>
				</li>
-->
			</ul>
		</div>
		<div id="leagueheader">
			<p>
				The tennis section currently runs the following teams (whose arranged fixtures for the <%= thisyear %>
				season are listed via the [<span class="bluetext">View</span>] links below):
			</p>
		</div>
		<table class="borderless">
			<caption>Hampton's League Fixtures</caption>
			<thead>
				<tr>
					<th>Team Name</th>
					<th>Current Captain</th>
					<th>Fixtures</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
<%
SQLStmt = new String("SELECT * from tennisteams where (teamcategory = 'ADULT') order by teamname");
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	theblogtext = new String("Diary").toString();
	thefixtureline = RstObj("fixtureline");
	theblogline = new String(RstObj("blogline")).toString();
	if (theblogline == "" || theblogline == "null" || theblogline == "undefined" )
	{
		theblogline = new String("").toString();
		theblogtext = new String("").toString();
	}
	else
	{
		theblogline = new String('[<a href="'+theblogline+'">'+theblogtext+'</a>]').toString();
	}
%>
				<tr>
					<td width="40%">
						<span class="blueheading"><%= RstObj("teamname") %></span>
					</td>
					<td width="40%">
						Current captain is: <%= RstObj("teamcaptain") %><br /><%= RstObj("teamnote") %>
					</td>
					<td>
						<p class="centered">[<a href="<%= thefixtureline	%>">View</a>]
					</td>
					<td>
						<p class="centered"><%= theblogline %>
					</td>
				</tr>
<%
	RstObj.MoveNext();
}
RstObj=null;
%>
			
			</tbody>
			<tfoot>
				<td colspan="4">
					&nbsp;
				</td>
			</tfoot>
		</table>

<%
dummy = currentMonth();
if (dummy > 3 && dummy < 9)
{
	if (dummy == 4) {
		leaguetext = "will soon be under way";
	}
%>
		<div id="league" class="bordertop" style="clear:both;">
			<h2><a href="league.asp">League Tennis</a></h2>
			<a href="leagueresults.asp">
				<img id="leagueimage" src="images/league.gif" width="102" height="77" alt="League tables for Hampton's league teams" style="float:left; margin-right:20px;">
			</a>
			<p>
			The tennis league season (late April to early August each year) for 2014 <%= leaguetext %>. You can now view the detailed league tables and positions directly within our own website by clicking on the image to the left. If you want to go directly to the Coventry League web site itself, then click <a href="http://www.coventrytennisleague.co.uk/">
			here</a>. 
			</p>
		</div>		
<%
}
if ( isFixtureEditor() )	
{
%>
		<div id="fixtureadminarea" class="admin">
			<h2>Fixture Administration:</h2>
			<ul>
				<li><a href="new_fixture.asp">Set-up a brand new league fixture</a></li>
<%
if (isAdministrator())
{
%>
				<li><a href="lst_teams.asp">Maintain the Hampton teams list</a></li>
<%
}
%>				
			</ul>
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
