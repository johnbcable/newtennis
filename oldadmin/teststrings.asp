<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("String functions Testing Page");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var teamids = new Array (1,2,3);
var curteam, curseason;
var teamcaptain, teamname;
var venuetext, teamnote;
var thefixturedate, strfixturedate;
var isOdd = true;
var teststrings = new Array("It's a lovely day, today","  leading double space", "Arden9 road race – - Sunday June 23rd", "Trailing single space ", " Space each side ", "null", "undefined","!@£$%^&*()-+=;:<>,.?|");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// teamObj = getTeamByName(thisteam);
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
			<h1>Administration:<b>&nbsp;Testing String Manipulation Functions</b></h1>
			<p>
				Original strings are :
			</p>
			<ul type="none">
				<li>[<%= teststrings[0] %>]</li>
				<li>[<%= teststrings[1] %>]</li>
				<li>[<%= teststrings[2] %>]</li>
				<li>[<%= teststrings[3] %>]</li>
				<li>[<%= teststrings[4] %>]</li>
				<li>[<%= teststrings[5] %>]</li>
				<li>[<%= teststrings[6] %>]</li>
				<li>[<%= teststrings[7] %>]</li>
			</ul>
			<hr />
<%
for (i=0; i<teststrings.length; i++) {
	Response.Write("<br />Testing string "+i+":  original ["+teststrings[i]+"]<br /><br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Left-trimmed ["+LTrim(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Right-trimmed ["+RTrim(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All-trimmed ["+Trim(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;StringFromDB ["+StringFromDB(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;StringToDB ["+StringToDB(teststrings[i])+"]<br />");
	Response.Write('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Replace all d -> w ['+replaceAll(teststrings[i],"d","w")+']<br />');
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to Proper Case ["+toProperCase(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as UTF-16 ["+asUTF16(teststrings[i])+"]<br />");
	Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;as ASCII ["+asASCII(teststrings[i])+"]<br /><hr />");
}	
%>		
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


