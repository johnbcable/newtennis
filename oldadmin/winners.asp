<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Title Winners");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var thetitle, theyear, thecategory;
var yeartxt, titletxt, categorytxt;
var sqlstart, sqlmiddle, sqlend;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var midclause = false;
var needand = false;
var debugging;
// local function definitions
curyear = new String(currentYear()).toString();
theyear=0;
theyear=new String(Request.Form("year"));
thetitle=new String(Request.Form("title"));
thecategory=new String(Request.Form("category"));
if (theyear=="undefined" || theyear=="null" || theyear=="")
{
	theyear=new String(Request.QueryString("year"));
	if (theyear=="undefined" || theyear=="null" || theyear=="")
		theyear=new String(curyear).toString();
}
if (thetitle=="undefined" || thetitle=="null" || thetitle=="")
{
	thetitle=new String(Request.QueryString("title"));
	if (thetitle=="undefined" || thetitle=="null" || thetitle=="")
		thetitle=new String("ALL").toString();
}
if (thecategory=="undefined" || thecategory=="null" || thecategory=="")
{
	thecategory=new String(Request.QueryString("category"));
	if (thecategory=="undefined" || thecategory=="null" || thecategory=="")
		thecategory=new String("ALL").toString();
}
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
titletxt = new String("").toString();
yeartxt = new String("").toString();
categorytxt = new String("").toString();
sqlstart = new String("SELECT * from winners ").toString();
sqlend = new String(" order by [year] desc, [displayorder] asc, [title]").toString();
sqlmiddle = new String("WHERE ").toString();
thisyear = new Number(currentSeason()).valueOf();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// debugging=true;
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
			<h1>Playing:&nbsp;<b>Tournament Title Winners</b></h3>
			<div id="resultssearch">
				<form action="winners.asp" method="post">
				<fieldset>
					<legend>Tennis Title Winners - Search Parameters&nbsp;</legend>
					<div>
						<label for="year">Choose a year:</label>
						<select name="year">
							<option selected value="ALL">All years
<%
for (i=thisyear; i > 1968; i--)
{
	dummy = new String(i).toString();
	if (dummy == theyear)
		Response.Write("<option selected>"+dummy);
	else
		Response.Write("<option>"+dummy);
}
%>
						</select>
					</div>
					<div>
						<label for="category">Choose a tournament category:&nbsp;</label>
						<select name="category">
							<option selected value="ALL">All categories
							<option value="ADULT TENNIS">Adult Tennis Tournaments
							<option value="JUNIOR TENNIS">Junior Tennis Tournaments
						</select>
					</div>
					<div>
						<label for="title">Choose a tournament title:&nbsp;</label>
						<select name="title">
							<option selected value="ALL">All titles
							<option>Ladies Doubles
							<option>Ladies Doubles Veterans
							<option>Ladies Doubles Plate
							<option>Ladies Singles
							<option>Ladies Singles Plate
							<option>Mens Doubles
							<option>Mens Doubles Veterans
							<option>Mens Doubles Plate
							<option>Mens Over 55
							<option>Mens Singles
							<option>Mens Singles Plate
							<option>Mixed Doubles
							<option>Mixed Doubles Plate
							<option>Under 12 Boys
							<option>Under 12 Girls
							<option>Under 16 Boys
							<option>Under 16 Girls
						</select>
					</div>
					<div style="text-align: right; padding-right: 10%;">
						<input type="submit" value="Fetch" name="submit" tabindex="9">
					</div>
				</fieldset>
			</form>
		</div>
		<h2>Tennis Title Winners</h2>
	<table>
		<thead>
			<th>Year</th>
			<th>Title</th>
			<th>Winner(s)<br /><i>Runner(s) Up</i></th>
<%
if (isSupport())
{
%>
			<th>ACTION</th>
<%
}
%>
		</thead>
		<tbody>
<%
// Now generate SQL to query the winners table
// Generate list of winners from the database in reverse order
// (most recent first)
if (theyear != "ALL")
{
	yeartxt = new String("[year] = " + theyear).toString();
	midclause = true;
}
if (thetitle != "ALL")
{
	titletxt = new String("[title] like '" + thetitle +"%'").toString();	
	midclause = true;
}
if (thecategory != "ALL")
{
	categorytxt = new String("[section] = '" + thecategory + "'").toString();	
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
	if (thetitle != "ALL")
	{
		if (needand)
			SQLStmt += " AND ";
		SQLStmt += titletxt;
		needand = true;
	}
	if (thecategory != "ALL")
	{
		if (needand)
			SQLStmt += " AND ";
		SQLStmt += categorytxt;
	}
}
SQLStmt += sqlend;
if (debugging) {
	Response.Write("SQLStmt = ["+SQLStmt+"]");
}
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
%>
			<tr>
				<td>
					<%= RstObj("year") %>
				</td>
				<td>
					<%= RstObj("title") %>
				</td>
				<td>
					<b><%= RstObj("winners") %><br /><i><%= RstObj("runnerup") %><br /></b>
				</td>
<%
	if (isSupport())
	{
%>
				<td style="width:20px; text-align:center;">
					<a href="edit_winner.asp?id=<%= RstObj("winnerid") %>">Edit</a><br />
					<a href="delete_winner.asp?id=<%= RstObj("winnerid") %>">Delete</a>
				</td>
<%
	}
%>
			</tr>
<%
	RstObj.MoveNext();
}
if (debugging)
{
%>
			<tr>
				<td>
					theyear&nbsp;
				</td>
				<td colspan=2>
					<%= theyear %>
				</td>
			</tr>
			<tr>
				<td>
					thetitle&nbsp;
				</td>
				<td colspan=2>
					<%= thetitle %>
				</td>
			</tr>			
			<tr>
				<td>
					thecategory&nbsp;
				</td>
				<td colspan=2>
					<%= thecategory %>
				</td>
			</tr>			
			<tr>
				<td>
					SQL&nbsp;
				</td>
				<td colspan=2>
					<%= SQLStmt %>
				</td>
			</tr>
<%
}
%>
		</tbody>
		<tfoot>
			&nbsp;
		</tfoot>
	</table>
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

