<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("MAXI-Tennis League Fixtures");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var teamnames = new Array(10);
var teamids = new Array(10);
var curteam, curseason;
var teamcaptain, teamname;
var venuetext, teamnote;
var thefixturedate, strfixturedate;
var awayteam, myteam, opponents;
var resultpage;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thisyear = "";
d = new Date();
thisyear += d.getYear();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
curteam = new String(Request.QueryString("team")).toString();
if (curteam == "null" || curteam == "undefined")
	curteam = new String("FRIENDLY").toString();
curseason = new String(Request.QueryString("season")).toString();
if (curseason == "null" || curseason == "undefined")
	curseason = new String(thisyear).toString();
// End of page start up coding
resultpage = new String("maxiresults"+curseason+".asp").toString();
//
SQLStmt = new String("SELECT * from tennisteams where teamcategory = 'MAXITENNIS' order by teamid");
RstObj = ConnObj.Execute(SQLStmt);
kount=1; // team IDs start at 1
teamcaptain="";
teamname="";
teamnote="";
while (! RstObj.EOF)
{
		thisteam = new String(RstObj("teamname")).toString();
		teamnames[kount] = new String(RstObj("teamname")).toString();
		if (curteam==thisteam)
		{
			teamcaptain = new String(RstObj("teamcaptain")).toString();
			teamname=new String(teamnames[kount]).toString();
			teamnote = new String(RstObj("teamnote")).toString();
		}
		kount=kount+1;
    	RstObj.MoveNext();
}
if (teamnote == "null" || teamnote == "undefined")
	teamnote = "";
kount = kount -1 ;
RstObj=null;
pagetitle += " for "+teamname+": "+curseason;
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
	<br />
	<h3>MAXI-Tennis Fixtures</h3>
	<div id="maxifixform" class="borderboth">
		<p>
			Every effort is made to ensure that the following information is up-to-date.
			However, it cannot reflect last minute changes or cancellations. Please check
			the details with your captain before any match.
		</p>
		<form name="frmJump" action="maxifixtures.asp" method="GET">
			<fieldset>
				<legend>Maxi-Tennis Fixture Selection Criteria</legend>
				<div class="centered">
					<select name="team">
						<option>-- Select a Team --
<%
i=1;
while (i <= kount)
{
		dummy=new String(i).toString();
		if (dummy==curteam)
			Response.Write("<option selected>" + teamnames[i]+"\r\n");
		else
			Response.Write("<option>" + teamnames[i]+"\r\n");
		i = i + 1;
}
%>
					</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="season">
						<option>-- Choose a season --
						<option selected>2011
						<option>2010
						<option>2008
						<option>2007
						<option>2006
					</select>
					&nbsp;&nbsp;
					<input type="submit" value="Fetch">
				</div>
			</fieldset>
		</form>
	</div>
	<p>
		<b><%= curteam %></b>&nbsp;fixtures for the <b><%= curseason %></b> season.<br />
		Current Captain(s):&nbsp;<b><%= teamcaptain %></b><br />
<%
if (! (teamnote == ""))
{
%>
		<i><b><br /><%= teamnote %><br /></b></i>
		<br />
<%
}
%>
	</p>
		<table>
			<caption>Fixture Table for <%= curteam %> for the <%= curseason %> season.</caption>
			<thead>
				<tr>
					<th>Fixture Date</th>
					<th>Venue</th>
					<th>Opponents<br />(note)</th>
					<th class="centered">Home<br />Score</th>
					<th class="centered">Away<br />Score</th>
				</tr>
			</thead>
			<tbody>
<%
	SQLStmt = new String("SELECT * from maxifixtures where fixtureyear = "+curseason+" and (hometeam = '"+teamname+"' or awayteam = '"+teamname+"') order by fixturedate");
	// Response.Write(SQLStmt+"<BR>");
	RstObj = ConnObj.Execute(SQLStmt);
	myteam = new String(teamname).toString();
	while (! RstObj.EOF)
	{
		venuetext = new String("Home").toString();
		awayteam = new String(RstObj("awayteam")).toString();
		opponents = new String(awayteam).toString();
		if (awayteam == myteam)
		{
			venuetext=new String("Away").toString();
			opponents = new String(RstObj("hometeam")).toString();
		}
		gamescore=RstObj("homescore")+RstObj("awayscore");
		thefixturedate=new Date(RstObj("fixturedate"));
		strfixturedate = dateasstring(thefixturedate);
		dummy1 = new String(RstObj("fixturenote"));
		if (dummy1 == "null" || dummy1 == "undefined")
				dummy1 = "";
		if (gamescore < 1)
		{
		// Now need to output normal not-yet-resulted fixture row
%>
				<tr>
					<td class="leftalign"><%= strfixturedate %></td>
					<td class="leftalign"><%= venuetext %></td>
					<td class="leftalign"><%= opponents %><br /><b>(<%= dummy1 %>)</b></td>
					<td class="centered">&nbsp;</td>
					<td class="centered">&nbsp;</td>
				</tr>
<%
		}
		else // resulted fixture
		{
%>
				<tr>
					<td class="leftalign" style="background-color: #aed2ac;"><%= strfixturedate %></td>
					<td class="leftalign"><%= venuetext %></td>
					<td class="leftalign"><%= opponents %><br><b><%= dummy1 %></b></td>
					<td class="centered"><%= RstObj("homescore") %></td>
					<td class="centered"><%= RstObj("awayscore") %></td>
				</tr>
<%
		}
		RstObj.MoveNext();
	}
%>			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
				<li><a href="maxiresults2011.asp">Maxi-Tennis match results for current tournament</a></li>
				<li><a href="maxileague2011.asp">Current Maxi-Tennis league table</a></li>
				<li><a href="maxiscores.xls">Download blank score sheet</a></li>
			</ul>
		</div>		
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
