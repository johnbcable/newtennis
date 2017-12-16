<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Fixture List Administration");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var theseason;
var theid, theteam;
var thenote, thefixturedate, myDate;
var venuetext, teamnote;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var fixtureknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isFixtureEditor())
	Response.Redirect("services.asp");
fixtureknt=0;
theseason = new String(Request.Form("season"));
theseason = theseason.toUpperCase();
theteam = new String(Request.Form("theteam"));
theteam=theteam.toUpperCase();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from tennisfixtures where fixtureyear = "+theseason+"  order by teamname, fixturedate");
// Response.Write(SQLStmt+"<BR>");
RstObj = ConnObj.Execute(SQLStmt);
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<b>
                                <h3>
                                Complete fixture list for the&nbsp;<%= theseason %>&nbsp;season</h3>
				<br>
			</b>
			<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="5">
				<TH ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
					<FONT SIZE=2 COLOR=#000000>
						Fixture
						<BR>
						Date
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 COLOR=#000000>
						Home/
						<BR>
						Away
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 COLOR=#000000>
						Opponents
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 COLOR=#000000>
						Hampton
						<br>
						Score
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 COLOR=#000000>
						Opponent
						<br>
						Score
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 COLOR=#000000>
						Action
					</FONT>
				</TH>
<%
        prevteam = new String("ejgfergf").toString();
        curteam = new String("bgfb").toString();
	while (! RstObj.EOF)
	{
                curteam = new String(RstObj("teamname")).toString();
                if (curteam != prevteam)
                {
                        Response.Write("<TR><TD colspan=7 bgcolor=#c0c0c0>");
                        Response.Write(curteam);
                        Response.Write("</TD></TR>");
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
%>
				<TR>
					<TD class="tdfont" align="left" bgcolor="#ffffff"><%= thefixturedate %>&nbsp;</TD>
					<TD class="tdfont" align="center" bgcolor="#ffffff"><%= venuetext %>&nbsp;</TD>
					<TD class="tdfont" align="left" bgcolor="#ffffff"><%= RstObj("opponents") %><br><b><%= thenote %></b></TD>
					<TD class="tdfont" align="center" bgcolor="#ffffff"><%= RstObj("hamptonresult") %>&nbsp;</TD>
					<TD class="tdfont" align="center" bgcolor="#ffffff"><%= RstObj("opponentresult") %> &nbsp;</TD>
<%
if (! isSupport())
{
%>
					<TD class="tdfont" align="left" bgcolor="#ffffff"><a href="result_fixture.asp?id=<%= theid %>">Result</a><br></TD>
<%
}
else
{
%>
					<TD class="tdfont" align="left" bgcolor="#ffffff">
							<a href="result_fixture.asp?id=<%= theid %>">Result</a><br>
							<a href="edit_fixture.asp?id=<%= theid %>">Edit</a><br>
							<a href="delete_fixture.asp?id=<%= theid %>">Delete</a>
					</TD>
<%
}
%>
				</TR>
<%
	RstObj.MoveNext();
	}
%>
				</TABLE>

			</td>

			<td>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</td>

		</tr>
	</table>
	<br>
	<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
ConnObj.Close();
ConnObj=null;
%>
