<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Coventry League Division Winners");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var thedivision, theyear, thegender;
var yeartxt, divisiontxt, gendertxt;
var sqlstart, sqlmiddle, sqlend;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var midclause = false;
var needand = false;
var debugging = false;
var curyear;
var numofdivisions = 8;
var divisions = new Array("ALL","Premier Division","Division 1","Division 2","Division 3","Division 4","Division 4","Division 6");
var genderlist = new Array("ALL","Mens","Ladies");
// local function definitions
curyear = new String(currentSeason()).toString();
theyear=0;
theyear=new String(Request.Form("season")).toString();
thedivision=new String(Request.Form("division")).toString();
thegender=new String(Request.Form("category")).toString();
if (theyear=="undefined" || theyear=="null" || theyear=="")
	theyear=new String("ALL").toString();
if (thedivision=="undefined" || thedivision=="null" || thedivision=="")
	thedivision=new String("ALL").toString();
if (thegender=="undefined" || thegender=="null" || thegender=="")
	thegender=new String("ALL").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
divisiontxt = new String("").toString();
yeartxt = new String("").toString();
gendertxt = new String("").toString();
sqlstart = new String("SELECT * from league_winners ").toString();
sqlend = new String(" order by year desc, division, gender").toString();
sqlmiddle = new String("WHERE ").toString();
thisyear = new Number(currentSeason()).valueOf();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
	<div id="content">
		<div id="mainContent">
			<h1>League Tennis:&nbsp;<b>Past Winners</b></h1>
			<div id="resultssearch">
				<form action="leaguew.asp" method="post">
				<fieldset>
					<legend>Coventry League - Past Winners - Search Parameters&nbsp;</legend>
					
					<div>
						<p class="centered">
						<b>Season:&nbsp;</b>
						<select name="season">
<%
if (theyear == "ALL")
	Response.Write('<option selected value="ALL">All years');
else
	Response.Write('<option value="ALL">All years');
for (i=thisyear; i > 2000; i--)
{
	dummy = new String(i).toString();
	if (dummy == theyear)
		Response.Write("<option selected>"+dummy);
	else
		Response.Write("<option>"+dummy);
}
%>						</select>&nbsp;&nbsp;						
						<b>Mens or Ladies?&nbsp;</b>
						<select name="category">
<%
for (i=0; i < 3; i++)
{
	dummy = new String(genderlist[i]).toString();
	if (dummy == thegender)
		Response.Write("<option selected>"+dummy);
	else
		Response.Write("<option>"+dummy);
}
%>
						</select>&nbsp;&nbsp;
					<b>Division:&nbsp;</b>
						<select name="division">
<%
for (i=0; i < numofdivisions; i++)
{
	dummy = new String(divisions[i]).toString();
	if (dummy == thedivision)
		Response.Write("<option selected>"+dummy);
	else
		Response.Write("<option>"+dummy);
}
%>
						</select>					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="Fetch"><br /><br />
					</div>					
				</fieldset>
			</form>
		</div>
		<br />
	<table>
		<caption>Coventry League Winners - most recent first</caption>
		<thead>
			<tr>
				<th class="centered">Year</th>
				<th class="centered">Gender</th>
				<th class="centered">Division</th>
				<th>Winner(s)<br />(<i>Runners-Up</i>)</th>
			</tr>
		</thead>
		<tbody>
<%
// Now generate SQL to query the winners table
// Generate list of winners from the database in reverse order
// (most recent first)
if (theyear != "ALL")
{
	yeartxt = new String("year = " + theyear).toString();
	midclause = true;
}
if (thedivision != "ALL")
{
	divisiontxt = new String("division like '" + thedivision +"%'").toString();	
	midclause = true;
}
if (thegender != "ALL")
{
	gendertxt = new String("gender = '" + thegender + "'").toString();	
	midclause = true;
}
SQLStmt = new String(sqlstart).toString();
if (midclause)   // we need to put in a where clause
{
	SQLStmt += sqlmiddle;
	if (theyear != "ALL")
	{
		SQLStmt += yeartxt;
		needand = true;
	}
	if (thedivision != "ALL")
	{
		if (needand)
			SQLStmt += " AND ";
		SQLStmt += divisiontxt;
		needand = true;
	}
	if (thegender != "ALL")
	{
		if (needand)
			SQLStmt += " AND ";
		SQLStmt += gendertxt;
	}
}
SQLStmt += sqlend;
if (! current_debug_status())
{
	RstObj = ConnObj.Execute(SQLStmt);
	while (! RstObj.EOF)
	{
%>
			<tr>
				<td class="centered">
					<%= RstObj("year") %>
				</td>
				<td class="centered">
					<%= RstObj("gender") %>
				</td>
				<td class="centered">
					<%= RstObj("division") %>
				</td>
				<td>
					<b><%= RstObj("winners") %></b><br />(<i><%= RstObj("runnersup") %></i>)
				</td>
			</tr>
<%
	RstObj.MoveNext();
	}
}
else
{
%>
			<tr>
				<td>theyear&nbsp;</td>
				<td colspan=3><%= theyear %> - <%= yeartxt %></td>
			</tr>			<tr>
				<td>thedivision&nbsp;</td>
				<td colspan=3><%= thedivision %> - <%= divisiontxt %></td>
			</tr>			<tr>
				<td>thegender&nbsp;</td>
				<td colspan=3><%= thegender %> - <%= gendertxt %></td>
			</tr>			<tr>
				<td>SQL&nbsp;</td>
				<td colspan=3><%= SQLStmt %></td>
			</tr>
<%
}
%>
		</tbody>
		<tfoot>
			&nbsp;
		</tfoot>
	</table>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

