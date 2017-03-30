<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var displaydate = dateasstring(Date());
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Confirm 200 Club Annual Draw Results");
// Now for any variables local to this page
var debugging = false;
var ConnObj;
var RS,RS2,RS3;
var SQL1, SQL2, SQL3, SQL4, SQL5;
var dbconnect=Application("hamptonsportsdb");
var winners = new Array("","","","","","","");
var owners = new Array("","","","","","","");
var prizes = new Array("","","","","","","");
var numprizes, drawtype, drawmonth, drawyear;
var thewinners, theprizes, thenumbers;
var owner1, owner2, owner3, owner4, owner5, owner6;
var prize1, prize2, prize3, prize4, prize5, prize6;
var winner1, winner2, winner3, winner4, winner5, winner6;
var errmess;
//
// Check if an administrator
//
if (! is200ClubEditor() )	
	Response.Redirect("200club.asp");
//===============================================================
// On with the processing
//===============================================================
errmess = new String("").toString();
drawyear = new String(Request.Form("drawyear")).toString();
if (drawyear == "" || drawyear == "null" || drawyear == "undefined")
{
	drawyear = new String(Request.QueryString("drawyear")).toString();
	if (drawyear == "" || drawyear == "null" || drawyear == "undefined")
	{
		errmess += "<br />No draw year has been supplied.<br />";
		drawyear = new String("").toString();
	}
}
drawmonth = new String(Request.Form("drawmonth")).toString();
if (drawmonth == "" || drawmonth == "null" || drawmonth == "undefined")
{
	drawmonth = new String(Request.QueryString("drawmonth")).toString();
	if (drawmonth == "" || drawmonth == "null" || drawmonth == "undefined")
	{
		errmess += "<br />No draw month has been supplied.<br />";
		drawmonth = new String("").toString();
	}
}
drawtype = new String(Request.Form("drawtype")).toString();
if (drawtype == "" || drawtype == "null" || drawtype == "undefined")
{
	drawtype = new String(Request.QueryString("drawtype")).toString();
	if (drawtype == "" || drawtype == "null" || drawtype == "undefined")
	{
		errmess += "<br />No draw type has been supplied.<br />";
		drawtype = new String("").toString();
	}
}
if ( errmess == "" )        // No error messages to be displayed
{
// Redirect if we are doing an annual draw
if (drawtype == "ANNUAL")
	Response.Redirect("get200annualdraw.asp?drawmonth="+drawmonth+"&drawyear="+drawyear);
// Monthly draw - set up SQL	
SQL1 = new String("select * from 200clubwinners where drawmonth = '"+drawmonth+"' and drawyear = "+drawyear+" and drawtype = '"+drawtype+"' order by drawpos asc").toString();
// Loop through recordset retrieving draw numbers and winners names
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
RS = ConnObj.Execute(SQL1);
numprizes = 0;
while (! RS.EOF)
{
	numprizes = numprizes + 1;
	winners[numprizes] = new String(RS("drawnumber")).toString();
	prizes[numprizes] = new String(RS("prize")).toString();
	// Create SQL to retrieve owners name
	SQL2 = new String("select ownersname from 200club where drawnumber = " + RS("drawnumber")).toString();
	owners[prizes] = "";
	RS2 = ConnObj.Execute(SQL2);
	if (! RS2.EOF)
		owners[numprizes] = new String(RS2("ownersname")).toString();
	RS2.Close();
	RS.MoveNext();
}	
RS.Close();
// Establish drawtext
drawtext = new String("Entering new draw results ....");
if (numprizes > 0)
	drawtext = new String("Reviewing existing draw results ....");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
owner1 = new String(owners[1]).toString();
owner2 = new String(owners[2]).toString();
owner3 = new String(owners[3]).toString();
owner4 = new String(owners[4]).toString();
owner5 = new String(owners[5]).toString();
owner6 = new String(owners[6]).toString();
winner1 = new String(winners[1]).toString();
winner2 = new String(winners[2]).toString();
winner3 = new String(winners[3]).toString();
winner4 = new String(winners[4]).toString();
winner5 = new String(winners[5]).toString();
winner6 = new String(winners[6]).toString();
prize1 = new String(prizes[1]).toString();
prize2 = new String(prizes[2]).toString();
prize3 = new String(prizes[3]).toString();
prize4 = new String(prizes[4]).toString();
prize5 = new String(prizes[5]).toString();
prize6 = new String(prizes[6]).toString();
if (prize1 == "")
	prize1 = new String("50").toString();
if (prize2 == "")
	prize2 = new String("30").toString();
if (prize3 == "")
	prize3 = new String("20").toString();
if (prize4 == "")
	prize4 = new String("15").toString();
if (prize5 == "")
	prize5 = new String("10").toString();
if (prize6 == "")
	prize6 = new String("10").toString();
// End of page start up coding
}
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
<%
if (debugging)
{
	Response.Write("<br /><br />");
	Response.Write("owners: "+owner1+","+owner2+","+owner3+","+owner4+","+owner5+","+owner6+"<br />");
	Response.Write("winners: "+winner1+","+winner2+","+winner3+","+winner4+","+winner5+","+winner6+"<br />");
	Response.Write("prizes: "+prize1+","+prize2+","+prize3+","+prize4+","+prize5+","+prize6+"<br />");
	Response.Write("errmess: "+errmess);
}
if (! (errmess == ""))
{
	Response.Write("<h3>Cannot proceed with 200 club draw amendment:</h3><p>"+errmess+"</p>");
	Response.End();
}
%>
		<h1>Our Club:<b>&nbsp;Fetching 200 Club Draw Results</b></h1>
		<form action="post200Draw.asp" method="POST">
			<fieldset>
				<legend>200 Club results for the <%= Request.Form("drawtype") %> draw for <%= Request.Form("drawmonth") %>&nbsp;<%= Request.Form("drawyear") %>:</legend>
		<table>
			<caption>&nbsp;</caption>
			<thead>
				<th width="30%">&nbsp;</th>
				<th width="20%">Prize Value (&pound;)</th>
				<th width="20%">Winning Number</th>
				<th width="30%">Winning Owner</th>
			</thead>
			<tbody>
				<tr>
					<td class="centered">1st Prize</td>
					<td class="centered"><input type="text" class="centered" name="firstprize" id="firstprize" size="3" maxlength="3" value="<%= prize1 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="firstwinner" id="firstwinner" size="3" maxlength="3" value="<%= winner1 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="firstowner" id="firstowner" size="30" maxlength="30" value="<%= owner1 %>" /></td>
				</tr>
				<tr>
					<td class="centered">2nd Prize</td>
					<td class="centered"><input type="text" class="centered" name="secondprize" id="secondprize" size="3" maxlength="3" value="<%= prize2 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="secondwinner" id="secondwinner" size="3" maxlength="3" value="<%= winner2 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="secondowner" id="secondowner" size="30" maxlength="30" value="<%= owner2 %>" /></td>
				</tr>
				<tr>
					<td class="centered">3rd Prize</td>
					<td class="centered"><input type="text" class="centered" name="thirdprize" id="thirdprize" size="3" maxlength="3" value="<%= prize3 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="thirdwinner" id="thirdwinner" size="3" maxlength="3" value="<%= winner3 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="thirdowner" id="thirdowner" size="30" maxlength="30" value="<%= owner3 %>" /></td>
				</tr>
				<tr>
					<td class="centered">4th Prize</td>
					<td class="centered"><input type="text" class="centered" name="fourthprize" id="fourthprize" size="3" maxlength="3" value="<%= prize4 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="fourthwinner" id="fourthwinner" size="3" maxlength="3" value="<%= winner4 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="fourthowner" id="fourthowner" size="30" maxlength="30" value="<%= owner4 %>" /></td>
				</tr>
				<tr>
					<td class="centered">5th Prize</td>
					<td class="centered"><input type="text" class="centered" name="fifthprize" id="fifthprize" size="3" maxlength="3" value="<%= prize5 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="fifthwinner" id="fifthwinner" size="3" maxlength="3" value="<%= winner5 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="fifthowner" id="fifthowner" size="30" maxlength="30" value="<%= owner5 %>" /></td>
				</tr>
				<tr>
					<td class="centered">6th Prize</td>
					<td class="centered"><input type="text" class="centered" name="sixthprize" id="sixthprize" size="3" maxlength="3" value="<%= prize6 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="sixthwinner" id="sixthwinner" size="3" maxlength="3" value="<%= winner6 %>" /></td>
					<td class="centered"><input type="text" class="centered" name="sixthowner" id="sixthowner" size="30" maxlength="30" value="<%= owner6 %>" /></td>
				</tr>	
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<input type="hidden" name="drawyear" value="<%= Request.Form("drawyear") %>" />
						<input type="hidden" name="drawmonth" value="<%= Request.Form("drawmonth") %>" />
						<input type="hidden" name="drawtype" value="<%= Request.Form("drawtype") %>" />
						<input type="hidden" name="numprizes" value="<%= numprizes %>" />
						<br />
						<p><input type="submit" value="Confirm"></p>	
					</td>
				</tr>
			</tfoot>
		</table>
	</fieldset>
</form>
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
<script language="Javascript">
function firstbox()
{
	document.firstprize.focus();
	document.firstprize.select();
}
</html>
<%
%>
