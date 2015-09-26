<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Generating new seasons fixtures for ...");
var debugging = false;
var kount;
var curteam, curteamid, curteamnumber, teamdivision;
var opposingteamid;
var teamobj = new Object();
var homeleagueteam = new Object();
var opposingleagueteam = new Object();
var opponents, blankstring;
var theteam = new String(Request.QueryString("teamid")).toString();
blankstring = new String("BLANK").toString();
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RS;
var SQL1, SQL2, SQL3, SQL4, SQL5,
//
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
%>
<!--#include file="sectionhead.asp" -->
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="content"> 
		<div id="mainContent">
			<h1>Administration:&nbsp;<b>Loading new seasons fixtures</b></h1>
			<div id="fixtureloadsummary">
				<p>
<%
	teamobj = getTeam(theteam);
	teamnumber = new String(teamobj.teamnumber).toString();
	teamdivision = teamobj.division;
	Response.Write(teamobj.teamname+","+teamnumber+","+teamdivision+","+theteam+"<br />");
	
	// Get home night offset for this home team and then do all home fixtures first 
	homeleagueteam = getLeagueTeam(teamdivision,teamnumber);
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;Offset for this team is "+homeleagueteam.homenightoffset+"<br />");
	SQL2 = new String("SELECT weekcommencing, format((weekcommencing+"+homeleagueteam.homenightoffset+"),'DD/MM/YYYY') as fixturedate, awayteamid from FixtureMasterPlan where hometeamid="+teamnumber+" ORDER BY weekcommencing asc").toString();
	RS2 = ConnObj.Execute(SQL2);
	while (!RS2.EOF)
	{
		opposingleagueteam = getLeagueTeam(teamdivision,RS2("awayteamid"))
		opponents = new String(opposingleagueteam.teamname).toString();
		if (opponents == blankstring)
		{
			Response.Write("Opposing team for team number "+RS2("awayteamid")+" is ["+opponents+"]<br />");
		}
		else
		{
			Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+teamobj.teamname+" vs "+opposingleagueteam.teamname+" on "+RS2("fixturedate")+"<br />");
			SQL4 = new String("INSERT into NewSeasonFixtures(fixturedate,homeoraway,opponents,fixtureyear,teamname) VALUES ").toString();
			SQL4 += ("('"+RS2("fixturedate")+"','H','"+opposingleagueteam.teamname+"',2010,'"+teamobj.teamname+"')").toString();
			Response.Write(SQL4+"<br />");
			RS4 = ConnObj.Execute(SQL4);
		}
		RS2.MoveNext();
	}
	RS2.Close();
	
	// Now do all away fixtures - get opposing league team offsets for each fixture
	SQL2 = new String("SELECT * from FixtureMasterPlan where awayteamid="+teamnumber+" ORDER BY weekcommencing asc").toString();
	RS2 = ConnObj.Execute(SQL2);
	while (!RS2.EOF)
	{
		opposingteamid = new String(RS2("hometeamid")).toString();
		opposingleagueteam = getLeagueTeam(teamdivision,opposingteamid);
		opponents = new String(opposingleagueteam.teamname).toString();
		if (opponents == blankstring)
		{
			Response.Write("Opposing team for team number "+RS2("awayteamid")+" is ["+opponents+"]<br />");
		}
		else
		{
			Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;Offset for "+opposingleagueteam.teamname+" is "+opposingleagueteam.homenightoffset+"<br />");
			SQL3 = new String("SELECT weekcommencing, format((weekcommencing+"+opposingleagueteam.homenightoffset+"),'DD/MM/YYYY') as fixturedate, awayteamid from FixtureMasterPlan where hometeamid="+opposingteamid+" and awayteamid = "+teamnumber+" ORDER BY weekcommencing asc").toString();
			RS3 = ConnObj.Execute(SQL3);
			while (! RS3.EOF)
			{
				homeleagueteam = getLeagueTeam(teamdivision, RS3("awayteamid"));
				Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+opposingleagueteam.teamname+" vs "+teamobj.teamname+" on "+RS3("fixturedate")+"<br />");
				SQL4 = new String("INSERT into NewSeasonFixtures(fixturedate,homeoraway,opponents,fixtureyear,teamname) VALUES ").toString();
				SQL4 += ("('"+RS3("fixturedate")+"','A','"+opposingleagueteam.teamname+"',2010,'"+teamobj.teamname+"')").toString();
				Response.Write(SQL4+"<br />");
				RS4 = ConnObj.Execute(SQL4);
			
				RS3.MoveNext();
			}
			RS3.Close();
		}
		RS2.MoveNext();
	}
	
Response.Write("<br />============================================<br />");

%>
				</p>
			</div>
		</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
RstObj=null;
ConnObj.Close();
ConnObj=null;
%>


