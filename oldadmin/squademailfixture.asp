<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Emailing a Squad about a Fixture");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var thefixture;
var theseason;
var theteam, thevenue;
var thenote, thefixturedate, myDate;
var venuetext, teamnote, teamtext;
var curteam, prevteam;
var pair1, pair2, ourscore, theirscore;
var pair1text, pair2text, thenotetext;
var mFixtureDate;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Process referrer info
thefixture = new String(Request.QueryString("fixture")).toString();
if (thefixture == "" || thefixture == "null" || thefixture == "undefined")
	Response.Redirect("members.asp");
// With a specified fixture ID, get current fixture details	
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from tennisfixtures where fixtureid = "+thefixture).toString();
thevenuetext = new String("").toString();
pair1text = new String("").toString();
pair2text = new String("").toString();
RS=ConnObj.Execute(SQL1);
while (! RS.EOF)
{
		mFixtureDate=new Date(Trim(new String(RS("fixturedate"))));
		thevenue=Trim(new String(RS("homeoraway")));
		theopponents=Trim(new String(RS("opponents")));
		ourscore=new Number(RS("hamptonresult"));
		theirscore=new Number(RS("opponentresult"));
		theseason=new Number(RS("fixtureyear"));
		theteam=Trim(new String(RS("teamname")));
		thenote=Trim(new String(RS("fixturenote")));
		thenotetext=Trim(new String(RS("fixturenote")));
		pair1=Trim(new String(RS("pair1")));
		pair1text=Trim(new String(RS("pair1")));
		pair2=Trim(new String(RS("pair2")));
		pair2text=Trim(new String(RS("pair2")));
  	    myDay=mFixtureDate.getDate();
	    myMonth=mFixtureDate.getMonth()+1;
	    myYear=mFixtureDate.getFullYear();
	    thefixturedate=new String(myDay+"/"+myMonth+"/"+myYear).toString();
		RS.MoveNext();	
}
RS.Close();
if (pair1=="null" || pair1=="" || pair1=="undefined")
{
	pair1 = new String("").toString();
	pair1text = new String("Not Specified").toString();
}
if (pair2=="null" || pair2=="" || pair2=="undefined")
{
	pair2 = new String("").toString();
	pair2text = new String("Not Specified").toString();
}	
if (thenote=="null" || thenote=="undefined" || thenote == "")
{
	thenote=new String("").toString();
	thenotetext = new String("No note").toString();
}
strday = new String(myDay).toString();
if (myDay < 10)
	strday = new String("0"+strday).toString();
strmonth = new String(myMonth).toString();
if (myMonth < 10)
	strmonth = new String("0"+strmonth).toString();
// Now finalise the date format
thefixturedate=new String(strday+"/"+strmonth+"/"+myYear).toString();
if (thevenue=="H");
	thevenuetext = new String("Home").toString();
if (thevenue=="A");
	thevenuetext = new String("Away").toString();
// End of page start up coding
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
			<div id="emailfixtureformdiv">
				<form name="EmailFixtureForm" action="postsquademail.asp" method="post">
				<fieldset>
					<legend>Email to the squad about the following fixture:</legend>
					<div>
						<label for="fixturedate">Fixture date:</label>
						<INPUT tabindex="1" TYPE="text" ID="fixturedate" NAME="fixturedate" SIZE="10" MAXLENGTH="10" VALUE="<%= thefixturedate %>" onBlur="javascript:checkdate(this)" />
						<a href="javascript:NewCal('fixturedate','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>					
					<div>
					<div>
						<label for="venue">Home or Away:</label>
						<select name="venue" id="venue" tabindex="2">
<%
if (thevenue == "H")
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
						<input tabindex="7" type="text" name="opponentscore" id="opponentscore" size="1" maxlength="1" value="<%= ourscore %>" />
					<div>
					<div>
						<label for="captainsnote">Team captain's note:</label>
						<input tabindex="8" type="text" name="captainsnote" id="captainsnote" size="50" maxlength="50" value="<%= thenote %>" />
					<div>
					<div>
						<textarea name="message" rows="8" cols="58">Replace me with your message</textarea>
					</div>
				</fieldset>
				<div>
					<input type="hidden" name="uniqueid" value="<%= thefixture %>">
					<input type="hidden" name="confirm" value="N">
					<input type="hidden" name="debug" value="Y">
					<input type="hidden" name="realemailpage" value="postsquademail.asp">
					<input type="hidden" name="emailtemplate" value="squadfixture.htm">
					<input type="submit" value="Send Email" name="submit" tabindex="2">
					<br />
				</div>
			</form>
		</div>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

