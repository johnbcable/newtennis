<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var displaydate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member List Print");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var dataline;
var toclick;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL1, SQL2, SQLaudit;
var thesorttext;
var memberknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
memberknt=0;
// lastly, the type of report layout
thelayouttext=new String("Phone List");
SQLStmt = new String("SELECT * from over18members order by surname, forename1");
displaydate = dateasstring(Date());
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
		<h1>Members:&nbsp;<b>current 18 and over members list</h1>
		<table id="memberlist">
			<caption>&nbsp;</caption>
			<thead>
				<th>
					Member Name:
				</th>
				<th>
					(Start of address) - [Home Telephone] {Mobile Phone} [BTM Number]
				</th>
			</thead>
			<tbody>
<%				
// execute the SQL statement
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
RS = ConnObj.Execute(SQLStmt);
memberknt = 0;
while (! RS.EOF)
{
	memberknt = memberknt + 1;
	dataline=new String("("+RS("address1")+" "+RS("address2")+") - ["+RS("homephone")+"] {"+RS("mobilephone")+"} ["+RS("britishtennisno")+"]");
%>
				<tr>
					<td>
						<%= RS("surname") %></a>&nbsp;,&nbsp;<%= RS("forename1") %>
					</td>
					<td>
						<%= dataline %> &nbsp;
					</td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<p class="centered">
						<%= memberknt %> members details printed
						<br />
					</p>
				</td>
			</tr>
		</tfoot>		
	</table>
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


