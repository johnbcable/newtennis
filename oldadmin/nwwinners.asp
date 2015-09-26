<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("North Warwickshire Doubles - Title Winners");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var thetitle, theyear, thecategory, theclub;
var yeartxt, titletxt, categorytxt;
var sqlstart, sqlmiddle, sqlend;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var midclause = false;
var needand = false;
var debugging = false;
var curyear;
var nw_years = new Array();
var nw_categories = new Array();
var nw_filter = new Array();
var nw_clubs = new Array();
var thelength;
var captiontext, clubSQL;
// local function definitions
curyear = new String(currentSeason()).toString();
theyear=0;
theyear=new String(Request.Form("year")).toString();
thetitle=new String(Request.Form("title")).toString();
thecategory=new String(Request.Form("category")).toString();
theclub=new String(Request.Form("club")).toString();
if (theyear=="undefined" || theyear=="null" || theyear=="")
	theyear=new String(curyear).toString();
if (thetitle=="undefined" || thetitle=="null" || thetitle=="")
	thetitle="ALL";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// Get list of clubs
clubSQL = new String("SELECT * from nwclubs order by nwclub").toString();
RS2 = ConnObj.Execute(clubSQL);
knt = 1;
while (! RS2.EOF)
{
	nw_clubs[knt] = new String(RS2("nwclub")).toString();
	knt++;
	RS2.MoveNext();
}
RS2.Close();
titletxt = new String("").toString();
yeartxt = new String("").toString();
sqlstart = new String("SELECT * from nwwinners ").toString();
sqlend = new String(" order by year desc, title").toString();
sqlmiddle = new String("WHERE ").toString();
// 
// Fill up reference arrays
//
nw_years[0] = new String("ALL").toString();
nw_categories[0] = new String("All age categories").toString();
nw_filter[0] = new String("ALL").toString();
for (i = 1; i < 10; i++)
    nw_years[i] = (2001+i);
var knt = 10;
var kntsub = 1;
while (knt < 19)
{
	nw_filter[kntsub] = new String("U"+knt+" Boys").toString();
	nw_categories[kntsub] = new String("Under "+knt+" Boys").toString();
	kntsub++;
	nw_filter[kntsub] = new String("U"+knt+" Girls").toString();
	nw_categories[kntsub] = new String("Under "+knt+" Girls").toString();
	kntsub++;
	nw_filter[kntsub] = new String("U"+knt+" Mixed").toString();
	nw_categories[kntsub] = new String("Under "+knt+" Mixed").toString();
	kntsub++;
	knt = knt + 1;
}
captiontext = new String("Results for: ").toString();
if (thetitle == "ALL")
	captiontext += "All titles in ";
else
	captiontext += thetitle + " in ";
if (theyear == "ALL")
	captiontext += "all recorded years";
else
	captiontext += theyear;
if (theclub == "ALL")
	captiontext += " for all finalist clubs";
else
	captiontext += " for "+theclub+" as winner or runner-up"	
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
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
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
	<div id ="content">
		<h1>Juniors:&nbsp;<b>North Warwickshire Doubles</b></h1>
		<h2><%= pagetitle %></h2>
		<form action="nwwinners.asp" method="post">
		<fieldset>
			<legend>Specify what results you would like to see</legend>
			<div id="nwyearfilter" style="margin-left:50px;">
				<label for="year" id="year">Choose a year: </label>
				<select name="year">
					<option selected value="ALL">All years
<%
thelength = nw_years.length;
for (i=1; i<thelength; i++)
	Response.Write('\t\t\t\t<option value="'+nw_years[i]+'">'+nw_years[i]);
%>
				</select>
			</div>
			<div id="nwcategoryfilter" style="margin-left:50px;">
				<label for="title">Choose a title: </label>
				<select name="title" id="title">
					<option selected value="ALL">All age categories
<%
thelength = nw_categories.length;
for (i=1; i<thelength; i++)
	Response.Write('\t\t\t\t<option value="'+nw_filter[i]+'">'+nw_categories[i]);
%>
				</select>
			</div>
			<div id="nwclubfilter" style="margin-left:50px;">
				<label for="club">Choose a club: </label>
				<select name="club" id="club">
					<option selected value="ALL">All clubs
<%
thelength = nw_clubs.length;
for (i=1; i<thelength; i++)
	Response.Write('\t\t\t\t<option value="'+nw_clubs[i]+'">'+nw_clubs[i]);
%>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Fetch" name="btnSubmit" id="btnSubmit">
			</div>
		</fieldset>
		</form>					
		<hr>
		<table width="100%">
			<caption><%= captiontext %></caption>
			<thead>
				<tr>
					<th>Year</th>
					<th>Title</th>
					<th>Winning Club<br /><i>Runners Up</i><br />Match Score</th>
					<th>Winning Team<br /><i>Runners Up</i></th>
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
if (thetitle != "ALL")
{
	titletxt = new String("title = '" + thetitle +"'").toString();	
	midclause = true;
}
if (theclub != "ALL")
{
	clubtxt = new String("(champion_club = '"+theclub+"' or runnersup_club = '"+theclub+"')").toString();
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
	if (theclub != "ALL")
	{
		if (needand)
			SQLStmt += " AND ";
		SQLStmt += clubtxt;
		needand = true;
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
					<td align="right" style="margin-right: 3">
						<%= RstObj("year") %> &nbsp;
					</td>
					<td align="left" style="margin-left: 3">
						<%= RstObj("title") %> &nbsp;
					</td>
					<td>
						<span class="blueheading"><%= RstObj("champion_club") %></span>&nbsp;beat<br />
						<i><%= RstObj("runnersup_club") %></i><br />
						<%= RstObj("match_score") %><br />
					</td>
					<td>
						<span class="blueheading"><%= RstObj("champion_team") %></span>&nbsp;versus<br />
						<i><%= RstObj("runnersup_team") %></i><br />
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
					<td>
						SQL&nbsp;
					</td>
					<td colspan="3" align="left">
						<%= SQLStmt %> &nbsp;
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
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="nwrules.asp">Rules of the North Warwickshire Doubles League</a></li>
				<li><a href="nwdoublesinfo.asp">General information about the North Warwickshire Doubles League</a></li>
				<li><a href="nwcontactguide.asp">Guide for club contacts for this league</a></li>
				<li><a href="nwdblsleague.asp">Current club contacts and provisional fixtures</a></li>
			</ul>
		</div>	
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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


