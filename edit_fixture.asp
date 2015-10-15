<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Resulting a Fixture");
// Now for any variables local to this page
var theid;
var myDay, myMonth, myYear, mFixtureDate;
var ConnObj;
var RstObj;
var dbconnect=Application("hamptonsportsdb");
var strmonth, stryear, strday, pair1, pair2;
var thefixturedate, thevenue, theopponents, ourscore, theirscore, stryear, theteam, thenote;
// Set up default greeting strings
if (!signedin())
	Response.Redirect("login.asp");
if (!isFixtureEditor())
	Response.Redirect("services.asp");
strdate = datestring();
strtime = timestring();
theid=new String(Request.Querystring("id"));
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from tennisfixtures where fixtureid = "+theid);
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
		mFixtureDate=new Date(Trim(new String(RstObj("fixturedate"))));
		thevenue=Trim(new String(RstObj("homeoraway")));
		theopponents=Trim(new String(RstObj("opponents")));
		ourscore=new Number(RstObj("hamptonresult"));
		theirscore=new Number(RstObj("opponentresult"));
		stryear=new Number(RstObj("fixtureyear"));
		theteam=Trim(new String(RstObj("teamname")));
		thenote=Trim(new String(RstObj("fixturenote")));
		pair1=Trim(new String(RstObj("pair1")));
		pair2=Trim(new String(RstObj("pair2")));
  	    myDay=mFixtureDate.getDate();
	    myMonth=mFixtureDate.getMonth()+1;
	    myYear=mFixtureDate.getFullYear();
	    thefixturedate=new String(myDay+"/"+myMonth+"/"+myYear).toString();
		RstObj.MoveNext();
}
if (theopponents=="null")
	theopponents = new String("").toString();
if (pair1=="null")
	pair1 = new String("").toString();
if (pair2=="null")
	pair2 = new String("").toString();
strday = new String(myDay).toString();
if (myDay < 10)
	strday = new String("0"+strday).toString();
strmonth = new String(myMonth).toString();
if (myMonth < 10)
	strmonth = new String("0"+strmonth).toString();
// Now finalise the date format
thefixturedate=new String(strday+"/"+strmonth+"/"+myYear).toString();
if (thenote=="null" || thenote=="undefined")
	thenote="";
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
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

<!--#include file="dateval.asp" -->
	<div id="content">
		<h1>Playing:&nbsp;<b>Amending/Resulting Fixtures</b></h1>
		<form name="FixtureForm" action="set_fixture.asp" method="post">
			<fieldset>
				<legend>Current fixture information for <%= theteam %></legend>
				<div>
					<label for="fixturedate">Fixture date:</label>
					<INPUT tabindex="1" TYPE="text" ID="fixturedate" NAME="fixturedate" SIZE="10" MAXLENGTH="10" VALUE="<%= thefixturedate %>" onBlur="javascript:checkdate(this)" />
					<a href="javascript:NewCal('fixturedate','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>					
				<div>
				<div>
					<label for="venue">Home or Away:</label>
					<select name="venue" id="venue" tabindex="2">
<%if (thevenue == "H")
{
	Response.Write('<option selected value="H">Home\r\n');
	Response.Write('<option value="A">Away\r\n');
}
else
{
	Response.Write('<option value="H">Home\r\n');
	Response.Write('<option selected value="A">Away\r\n');
}
%>
					</select>
				<div>
				<div>
					<label for="opponents">Opponents:</label>
					<input tabindex="3" type="text" name="opponents" id="opponents" size="30" maxlength="30" value="<%= theopponents %>" />
				<div>
				<div>
					<label for="pair1">First pair:</label>
					<input tabindex="4" type="text" name="pair1" id="pair1" size="50" maxlength="80" value="<%= pair1 %>" />
				<div>
				<div>
					<label for="pair2">Second pair:</label>
					<input tabindex="5" type="text" name="pair2" id="pair2" size="50" maxlength="80" value="<%= pair2 %>" />
				<div>
				<div>
					<label for="hamptonscore">Hampton result:</label>
					<input tabindex="6" type="text" name="hamptonscore" id="hamptonscore" size="1" maxlength="1" value="<%= ourscore %>" />
				<div>			
				<div>
					<label for="opponentscore">Opponents result:</label>
					<input tabindex="7" type="text" name="opponentscore" id="opponentscore" size="1" maxlength="1" value="<%= theirscore %>" />
				<div>
				<div>
					<label for="captainsnote">Team captain's note:</label>
					<input tabindex="8" type="text" name="captainsnote" id="captainsnote" size="50" maxlength="50" value="<%= thenote %>" />
				<div>
			</fieldset>
			<div>
				<input type="hidden" name="uniqueid" value="<%= theid %>">
				<input type="submit" value="Submit" name="submit" tabindex="9">
			</div>
		</form>
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.FixtureForm.fixturedate.Focus
    Document.FixtureForm.fixturedate.Select
End Sub
</SCRIPT>
</html>
<%
%>
