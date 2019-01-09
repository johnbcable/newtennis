<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Match Reports");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var kount, thetext, theparas;
var title, issueno, issueseq, author, fixturetext;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var dummystr;
var thefixture = new String("NONE");
var m_ourteam, m_theirteam, m_location, m_date;
var m_ourscore, m_theirscore, m_note, m_reportid;
var m_author, m_text;
var paralength, i;
thefixture=new String(Request.QueryString("fixture"));
if (thefixture=="undefined")
	thefixture="0";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// Get basic fixture details
SQLStmt=new String("select * from tennisfixtures where fixtureid = " + thefixture);
RstObj=ConnObj.Execute(SQLStmt);
if (! RstObj.EOF)
{
	m_ourteam=new String(RstObj("teamname"));
	m_theirteam=new String(RstObj("opponents"));
	m_location=new String(RstObj("homeoraway"));
	m_date=new Date(RstObj("fixturedate"));
	m_datestr=dateasstring(m_date);
	m_ourscore=new String(RstObj("hamptonresult"));
	m_theirscore=new String(RstObj("opponentresult"));
	m_note==new String(RstObj("fixturenote"));
	m_reportid=new String(RstObj("matchreport"));
}
RstObj.Close();
if (m_location=="H")
	m_location="at home";
if (m_location=="A")
	m_location="away";
if (m_note=="undefined")
	m_note="";
if (!m_note=="")
	m_note = "N.B. "+m_note;
// Now go and get article info - if present
if (m_reportid=="undefined" || m_reportid=="")
	m_reportid="0";
m_author="";
m_text=new String("No report filed");
if (! m_reportid=="0")
{
	SQLStmt=new String("select author, articletext from articles where articleid = " + m_reportid);
	RstObj=ConnObj.Execute(SQLStmt);
	if (! RstObj.EOF)
	{
		m_author=Trim(new String(RstObj("author")));
		m_text=Trim(new String(RstObj("articletext")));
	}
	RstObj.Close();
}
ConnObj.Close();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu
		</comment>
		
		<td valign="TOP" align="LEFT" width="440">
			<!--#include file="tickertape.asp" -->
			<br>
			<table  width="100%" cellspacing="2" cellpadding="5" border="0">
				<tr>
					<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
						<b>
							<%= m_ourteam %>&nbsp;<%= m_location %>&nbsp;to&nbsp;<%= m_theirteam %>&nbsp;on&nbsp;<%= m_datestr %>
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" colspan="2" border="0">
							 <b>Result:</b>&nbsp;&nbsp;&nbsp;&nbsp;Hampton:&nbsp;&nbsp;<b><%= m_ourscore %></b>&nbsp;,&nbsp;&nbsp;<%= m_theirteam %>:&nbsp;&nbsp;<b><%= m_theirscore %></b><br>
							 <%= m_note %>
					</td>
				</tr>
				<tr>
					<td class="tdfont" colspan="2" border="0">
						<hr width="95%" align=center>
					</td>
				</tr>
				<tr>
					<td class="tdfont" colspan="2" border="0">
							 <b><i><u><h3>Match Report</h3></u></i></b>
<%
// Loop through the paras
theparas=m_text.split("|");
paralength=new Number(theparas.length);
for(i=0; i<paralength; i++)
	Response.Write(theparas[i]+"<br><br>\r\n");
%>
							<b><i><%= m_author %></i></b>
					</td>
				</tr>
			</table>
			<hr align="center" width="50%">
		</td>
		<comment>
			Column 3 reserved for internal and external advertising - not used here
		</comment>
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
