<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Generating New Tennis Fixture");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3, SQL4, SQL5;
var d, thisyear;
var i, kount, dummy, dummy1;
var teamnames = new Array(10);
var teamids = new Array(10);
var curteam, curseason;
var teamcaptain, teamname;
var venuetext, teamnote;
var thefixturedate, strfixturedate;
var newunique;
var debugging = true;
var doform = false;    // default to being able to redirect to editing mode
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thisyear = "";
d = new Date();
thisyear += d.getYear();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
curteam = new String(Request.Form("teamname")).toString();
if (curteam == "" || curteam == "null" || curteam == "undefined")
{
	curteam = new String(Request.QueryString("teamname")).toString();
	if (curteam == "" || curteam == "null" || curteam == "undefined")
		doform = true;
}	
curseason = new String(Request.Form("season")).toString();
if (curseason == "" || curseason == "null" || curseason == "undefined")
{
	curseason = new String(Request.Form("season")).toString();
	if (curseason == "" || curseason == "null" || curseason == "undefined")
		curseason = new String(thisyear).toString();
}
// Now, if we do not need to display the input form, then we can create the dummy 
// fixture entry and retrieve its unqiue id before redirecting to the fixture editing
// page.
if (! doform)
{
	SQL1 = new String("INSERT INTO tennisfixtures(fixtureyear,teamname,fixturenote) VALUES ("+curseason+",'"+curteam+"','A03PL')").toString();
	RS2 = ConnObj.Execute(SQL1);
	SQL2 = new String("SELECT * from tennisfixtures where fixturenote = 'A03PL'").toString();
	RS2 = ConnObj.Execute(SQL2);
	newunique = "-1";
	if (! RS2.EOF)
	{
		newunique = new String(RS2("fixtureid")).toString();
		Response.Redirect("edit_fixture.asp?id="+newunique);
		RS2=null;
	}
}
// End of page start up coding
SQL5 = new String("SELECT * from tennisteams order by teamname");
RS = ConnObj.Execute(SQL5);
kount=1; // team IDs start at 1
while (! RS.EOF)
{
	teamnames[kount] = new String(RS("teamname")).toString();
	kount=kount+1;
   	RS.MoveNext();
}
kount = kount -1 ;
RS=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="tennis3col.css" />
	<link rel="stylesheet" type="text/css" href="softboxes.css" />
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" />
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<div id="container">
	<div id="header">
		<img id="clublogo" src="images/logo.gif" width="88" height="100" alt="Hampton-In-Arden Sports Club logo" />
		<h2>Hampton-In-Arden Sports Club</h2>
		<h3>Tennis Section</h3>
			<!--#include file="horizmenu.asp" -->
	</div>
<!--#include file="dateval.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Generating New Fixtures ...</h3>
		<p>
			Please choose the team for which you need to generate a brand new fixture
		</p>
		<form id="newfixtureform" method="post" action="new_fixture.asp">
			<fieldset>
				<legend>New fixture details</legend>
				<div>
					<label for="teamname">New fixture for which team:&nbsp;</label>&nbsp;
					<select name="teamname">
						<option>-- Select a Team --
<%
i=1;
while (i <= kount)
{
		dummy=new String(i).toString();
		if (dummy==curteam)
			Response.Write("<option selected>" + teamnames[i]+"\r\n");
		else
			Response.Write("<option>" + teamnames[i]+"\r\n");
		i = i + 1;
}
%>
					</select>
				</div>
				<div>
					<label for="season">Which season?&nbsp;</label>&nbsp;
					<select name="season">
<%
for (i=thisyear; i > 2000; i--)
{
	dummy = new String(i).toString();
	Response.Write("<option>"+dummy);
}
%>
					</select>
				</div>
				<div class="boxright" style="margin-right:40px;">
					<input type="submit" value="Generate">
				</div>
			</fieldset>
		</form>
		<div>
			<p class="centered">
				When you click on the Generate button (above) the system will put in a blank fixture on the fixtures list and then allow
				you to put in all the details (opponents, date etc) before saving.
			</p>
		</div>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
