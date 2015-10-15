<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Saving Title-Holder Amendments");
// Now for any variables local to this page
var winObj = new Object();
var ConnObj;
var RS;
var SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb");
var theid, thewinner, therunnerup, updateStr;
var debugging = true;
var updating = true;
var resultObj = new Object();
// Start page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("members.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
theid=Trim(new String(Request.QueryString("id")));
thewinner=Trim(new String(Request.QueryString("winner")));
therunnerup=Trim(new String(Request.QueryString("runnerup")));
//
winObj=getWinner(theid);
winObj.winners = new String(thewinner).toString();
winObj.runnerup = new String(therunnerup).toString();
// Do DB update
if (updating)
	resultObj=setWinner(winObj);
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
			<h1>Site Administration:&nbsp;<b>Updating Tournament Title Winners</b></h3>
<%
if (debugging)
{
	Response.Write("Contents of resultObj from update operation:-<br /><br />");
	Response.Write("Result code:          "+resultObj.result ? "OK" : "Bad");
	Response.Write("<br />");
	Response.Write("Error code:           "+resultObj.errno);
	Response.Write("<br />");
	Response.Write("Description:          "+resultObj.description+"<br />");
	Response.Write("<br />");
	Response.Write("SQL:                  "+resultObj.sql+"<br />");
	Response.End();
}

Response.Redirect("winners.asp");   // normal termination

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

