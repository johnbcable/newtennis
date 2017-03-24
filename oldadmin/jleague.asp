<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var kount, dummy1;
var teams = new Array(10);
var team_ids = new Array(10);
var curteam, thisteam, newteam;
var venuetext;
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
// End of page start up coding
%>
<!--#include file="junhead.asp" -->
			<h2>
				Juniors: League Involvement
			</h2>
<table align=center  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
	<tr>
		<td>
			<br>
			<table align=center width=567 border="1" cellspacing="2" cellpadding="5">
				<tr>
					<td class="tdfont" >
						Hampton-In-Arden Tennis Club is an accredited Mini-Tennis club. Mini-Tennis
						league fixtures are arranged for local participating tennis clubs and usually take place on weekends. Fixtures are run throughout the year as demand and
						availability dictates at both indoor and outdoor venues in the local area.
						<br>
						<br>
						<b>
							N.B.
						</b>
						If you are unsure of the address of another club that we play against, why not
						check our list of
						<a href="directions.asp">
							club addresses
						</a>
						<br>
						<br>
						The tennis section currently runs the following junior section teams (whose arranged fixtures for the <%= thisyear %>
						 season are listed via the [
						<font color=#0000ff>
							View]
						</font>
						links below):
						<br>
						<br>
					</td>
				</tr>
			</table>
			<div align=center>
				<table align=center border=1 cellspacing=3 cols=2 width=567>
<%
SQLStmt = new String("SELECT * from tennisteams where teamcategory like 'JUNIOR' order by teamid");
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	fixtureline = RstObj("fixtureline");
%>
					<tr>
						<td class="tdfont">
							<%= RstObj("teamname") %>
						</td>
						<td class="tdfont" align="center">
							<a href="<%= fixtureline %>">
								[View]
							</a>
						</td>
					</tr>
<%
	RstObj.MoveNext();
}
RstObj=null;
%>
					<tr>
						<td class=tdfont align=center colspan=2>
							<br>
							The Red Mini-Tennis team were champions of their league in their first season of entry before Christmas 2002.
							Why not come along and watch? Support our children as they enter competitive tennis against other clubs
							<br>
						</td>
					</tr>
				</table>
			</div>
		</td>
		<comment>
			Column 3 reserved for internal and external advertising
		</comment>
		<!--#include file="adverts.asp" -->
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>






