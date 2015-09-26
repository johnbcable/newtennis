<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Setting up New Tournament Winners (blanks)");
var debugging = false;
var curpos, kount;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj;
var SQL1, SQL2, SQL3, SQL4;
var dummy, theyear, previousyear;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
debugging = true;
theyear = currentYear();
dummy = parseInt(theyear)-1;
previousyear = new String(dummy).toString(); 
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
		<div id="mainContent">
			<h1>Setting up new season's tournament blanks ...</h1>
			<div id="toursetup">
				<p>
<%
SQLStart = new String("INSERT INTO winners([year],[title],[section],[displayorder]) ").toString();
SQL0 = new String("SELECT [title],[section],[displayorder] FROM winners WHERE [year] = "+previousyear+" ORDER BY [displayorder]").toString();
if (debugging)
{
	 Response.Write("Current year is:      "+theyear+"<br />")
	 Response.Write("Previous year is:     "+previousyear+"<br />")
	 Response.Write("SQL0 is:              [ "+SQL0+" ]<br />")
	 Response.Write("<hr>");
}
RS = ConnObj.Execute(SQL0);
while (! RS.EOF)
{
 // Insert into winners table
 SQL1 = new String("VALUES ("+theyear+",'"+RS("title")+"','"+RS("section")+"',"+RS("displayorder")+")").toString();
 RstObj = ConnObj.Execute(SQLStart+SQL1);
 if (debugging)
 		Response.Write("                     "+SQL1+"<br />")
 RS.MoveNext();
}
SQL1 = new String("UPDATE winners SET [winners] = 'TBA', [runnerup]='TBA' WHERE [year] = "+theyear).toString();
if (debugging)
{
 Response.Write("<hr>");
 Response.Write("SQL1 now is:            "+SQL1+"<br />");
}
RS = ConnObj.Execute(SQL1);
%>
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



