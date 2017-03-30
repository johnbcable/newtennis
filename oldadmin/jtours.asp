<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="tourfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior Tournament Results");
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL1, SQL2, SQLaudit;
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
var tourObj = new Object();
var theyear;
var mDate, mDateStr;
var drawtext, fulldate;
//
theyear=new String(Request.Form("season")).toString();
if (theyear=="undefined" || theyear=="null" || theyear=="")
{
    theyear=new String(Request.QueryString("season")).toString();
		if (theyear=="undefined" || theyear=="null" || theyear=="")
			 theyear = currentSeason();
}
tourObj = getTour(theyear);
SQL1 = new String("SELECT * FROM winners WHERE [section] = 'JUNIOR TENNIS' AND [year] = "+tourObj.touryear+" ORDER BY [displayorder]").toString();
fulldate = new String(fulltextdate(tourObj.finalsday)).toString();
// debugging = true;
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<div id="content">
			<h1>Playing:&nbsp;<b>Junior Tournament - <%= tourObj.touryear %></b></h1>
<%
if (debugging)
{
 Response.Write("<p>");
 Response.Write("SQL1 = ["+SQL1+"]<br />");
}
%> 			
	<p>
		Hampton-In-Arden Tennis Club Junior Tennis Tournament Finals for <%= tourObj.touryear %> 
		results are displayed below.
	</p>
	<table>
		<thead>
			<th width="40%">Category</th>
			<th width="30%">Winner(s)</th>
			<th><i>Runner(s)-Up</i></th>
		</thead>
		<tbody>
<%
	ConnObj=Server.CreateObject("ADODB.Connection");
	RS=Server.CreateObject("ADODB.Recordset");
	ConnObj.Open(dbconnect);
	RS = ConnObj.Execute(SQL1);
	while(! RS.EOF)
	{
%>			
		<tr>
			<td>
				<%= RS("title") %>
			</td>
			</td>
			<td>
				<%= RS("winners") %>
			</td>
			<td>
				<i><%= RS("runnerup") %></i>
			</td>
		</tr>
<%
		RS.MoveNext();
	}		
%>	
		</tbody>
	</table>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
<%
	if (! (tourObj.juniorphotolink == ""))
	{
%>	
				<li><a href="<%= tourObj.juniorphotolnk %>">Photo gallery</a></li>
<%
	}
%>	
				<li><a href="tours.asp?season=<%= tourObj.touryear %>">Senior tournament results</a></li>
			</ul>
		</div>	
	<div id="tournamentthanks" style="margin-top: 10px;">
		<p>
			 <%= tourObj.juniorthanks %>
		</p>
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

