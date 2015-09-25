<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Club News and Events Diary");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var datefrom, eventtype;
var curevents, curseason;
var eventname, eventtype, eventnote, theeventdate, streventdate;
var eventknt;
var theeventdtime, streventtime;
var strtoday, sortabletoday, enddate;
var editline, editstr;
var canEdit = isSupport();
var numcols = "3";
var debugging = false;
// Set up default greeting strings
eventknt = 0;
strdate = datestring();
strtime = timestring();
thisyear = new String("").toString();
strtoday = new String("").toString();
d = new Date();
thisyear += d.getYear();
sortabletoday = sortabletoday();
strtoday = today();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
var thecategory = new String("NONE");
var globalcategory = new String("ALL");
thecategory=new String(Request.QueryString("category"));
if (thecategory=="undefined" || thecategory=="null")
{
	thecategory=new String(Request.Form("category"));
	if (thecategory=="undefined" || thecategory=="null")
		thecategory=new String("ALL").toString();
}
curevents = new String(Request.QueryString("events")).toString();
if (curevents == "null" || curevents == "undefined")
	curevents = new String("20").toString();
datefrom = new String(Request.QueryString("datefrom")).toString();
if (datefrom == "null" || datefrom == "undefined" || datefrom == "")
	datefrom = new String(sortabletoday).toString();
// enddate = new Date()+ curevents.toNumber();
// End of page start up coding
eventname="";
eventnote="";
eventknt = new Number (curevents.valueOf());
pagetitle += " for next "+curevents+" from "+strtoday;
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
		<h1>Our Club:&nbsp;<b>Tennis Club News and Events</b></h1>
		<div id="allnews">
			<h2>News Items</h2>
<%
	var allnews = new String(getNewsSummaries()).toString();
	Response.Write(allnews);
%>	
		</div>   
		<form name="frmJump" action="eventlist.asp" method="GET">
			<div id="eventform">
				<h2>Event Diary</h2>
				<p>
					Choose number of events to display:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="events">
<%
i=1;
while (i <= 50)
{
		dummy=new String(i).toString();
		if (dummy==curevents)
			Response.Write("<option selected>" + curevents+"\r\n");
		else
			Response.Write("<option>" + i+"\r\n");
		i = i + 1;
}
%>
					</select>
					&nbsp;&nbsp;<input type="submit" value="Fetch">
				</p>
			</div>
		</form>
<%
if (debugging)
{
%>
			<div id="eventcurrent_debug_status()1" class="borderboth">
		<table>
			<caption>current_debug_status() info at debug point 1</caption>
			<thead>
				<tr>
					<th>Variable</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>sortabletoday</td>
					<td><%= sortabletoday %></td>
				</tr>
				<tr>
					<td>strtoday</td>
					<td><%= strtoday %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						****    End of debug info    ****
					</td>
				</tr>
			</tfoot>
		</table>				
			</div>
<%
}
%>

			<div class="borderboth">
				<table>
					<caption><span class="blueheading">Forthcoming events at the tennis club</span></caption>
					<thead>
						<tr>
							<th>Date</th>
							<th class="centered">Start Time</th>
							<th>Description</th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
<%
SQLStmt = new String("SELECT * from allevents where sortabledate > '"+datefrom+"' order by eventdate asc, eventtime asc");
	// Response.Write(SQLStmt+"<br />");
	RstObj = ConnObj.Execute(SQLStmt);
	editstr = new String("");
	if (canEdit)
		editstr=new String("Edit").toString();
	kount = 0;
	while (! RstObj.EOF)
	{
		editline = new String("").toString();
		kount += 1;
		// Response.Write("Done "+kount+"<br />");
		theeventdate=new Date(RstObj("eventdate"));
		theeventtime= new Date(RstObj("eventtime"));
		// streventdate = new String(RstObj("eventdate")).toString();
		streventdate = dateasstring(theeventdate);
		streventtime = timeasstring( theeventtime);
		eventtype = new String( RstObj("eventtype")).toString();
		eventtype = eventtype.toUpperCase();
		bgcolorstring = new String("bgcolor=#ffffff").toString();
		if (eventtype == "EVENT")
			bgcolorstring = new String("bgcolor=#44fdb3").toString()
		if (eventtype == "SOCIAL")
			bgcolorstring = new String("bgcolor=#ffff80").toString()
		if (canEdit)
			editline = new String("edit_event.asp?id="+RstObj("eventid")).toString();

%>
						<tr>
							<td <%= bgcolorstring %>>
								<%= streventdate %>
							</td>
							<td <%= bgcolorstring %> class="centered">
								<%= streventtime %>
							</td>
							<td <%= bgcolorstring %>>
								<%= RstObj("eventnote") %>
							</td>
							<td <%= bgcolorstring %>>
								<a href="<%= editline %>"><%= editstr %></a>
							</td>
						</tr>
<%
	RstObj.MoveNext();
	if (kount == eventknt)
		break;
	}
	numcols = "4";
%>
						<tr>
							<td colspan="<%= numcols %>" class="centered">
								<p><strong><%= kount %>&nbsp;events found and displayed</strong></p>
							</td>
						</tr>
					</tbody>
				</table>
				<p>
					Every effort is made to ensure that the above information is up-to-date.
					However, it cannot reflect last minute changes or cancellations. .<br /><br />
				</p>
<%
if ( isAdministrator() )	
{
%>
		<div id="200clubadminarea" class="admin">
			<h3>News and Event Administration:</h3>
			<ul>
				<li><a href="new_event.asp">Create a new event</a></li>
				<li><a href="lst_news.asp">Maintain news item list</a></li>
			</ul>
		</div>		
		
<%
}
%>					
			</div>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
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
