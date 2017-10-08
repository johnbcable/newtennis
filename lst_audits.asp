<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("List of member audits");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var RS, ConnObj, SQL1, SQL2;
var mremoteuser, myremoteaddress, myloggedindate, myloggedintime;
var mymemberid, mymembername;
var modeline, modetext;
var auditknt, auditlimit;
var v_memberid = new String("");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
v_memberid = getUserID();
auditknt=0;
auditlimit = new String(Request.QueryString("limit")).toString();
if (auditlimit == "" || auditlimit == "undefined" || auditlimit == "null")
	auditlimit=50;
else
	auditlimit = new Number(auditlimit).valueOf();
// 
// Now set up database connection
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from member_audits order by action_date desc, action_time desc").toString();
RS = ConnObj.Execute(SQL1);
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
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
		<h1>Site Administration:&nbsp;<b>Member Audits</b></h1>
		<div class="borderboth">
			<table>
				<caption>List of Member Audits</caption>
				<thead>
				<th>Member ID</th>
				<th>Action</th>
				<th>Action Date</th>
				<th>Action Time</th>
				</thead>
				<tbody>
<%
while ((! RS.EOF) && (auditknt < auditlimit))
{
%>
				<tr>
					<td><%= RS("memberid") %></td>
					<td><%= RS("action") %></td>
					<td><%= RS("action_date") %></td>
					<td><%= RS("action_time") %></td>
				</tr>
<%
	auditknt = auditknt + 1;
	RS.MoveNext();
}
%>
				</tbody>
				<tfoot>
				<tr>
					<td  colspan="6">
						<br />
						<p class="centered">
						<%= auditknt %> audit rows retrieved.
						</p>
						<br />
					</td>
				</tr>
				</tfoot>
			</table>
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
