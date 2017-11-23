<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Saving Fixture Amendments");
// Now for any variables local to this page
var mUnique;
var fixObj = new Object();
var theyear, theteam;
var mOurScore, mTheirScore, mNote;
var mFixtureDate, mVenue, mOpponents;
var mOpponents, mVenue;
var mPair1, mPair2;
var finalmess = new String("").toString();
var dbupdated = false;
var redirecturl = new String("").toString();
// Start page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isFixtureEditor())
	Response.Redirect("services.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
mUnique=Trim(new String(Request.Form("uniqueid")));
mOurScore=Trim(new String(Request.Form("hamptonscore")));
mTheirScore=Trim(new String(Request.Form("opponentscore")));
mNote=Trim(new String(Request.Form("captainsnote")));
mOpponents=Trim(new String(Request.Form("opponents")));
mVenue=Trim(new String(Request.Form("venue")));
mPair1=Trim(new String(Request.Form("pair1")));
mPair2=Trim(new String(Request.Form("pair2")));
if (mNote=="" || mNote=="undefined" || mNote=="null")
	mNote=" ";
mFixtureDate = new String(Request.Form("fixturedate")).toString();
var updating = true;
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// get other data back about this fixture
fixObj.ourscore = -1;
fixObj = getFixture(mUnique);
if (! (fixObj.ourscore == -1))
{
	// Update fixture object ready to do update
	theyear = fixObj.season;
	theteam = fixObj.teamname;
	fixObj.fixtureid = new String(mUnique).toString();
	fixObj.ourscore = new String(mOurScore).toString();
	fixObj.theirscore = new String(mTheirScore).toString();
	fixObj.note = new String(mNote).toString();
	fixObj.pair1 = new String(mPair1).toString();
	fixObj.pair2 = new String(mPair2).toString();
	fixObj.fixturedate = new String(mFixtureDate).toString();
	fixObj.opponents = new String(mOpponents).toString();
	dbupdated = setFixture(fixObj);
	if (dbupdated) 	{
		finalmess = new String("Database successfully updated with fixture details").toString();
		redirecturl += "lstfixtures.asp?season="+theyear+"&venue=BOTH&team="+theteam;
		Response.Redirect(redirecturl);
	}
	else {
		finalmess = new String("ERROR - Could not retrieve fixture details for fixture "+mUnique).toString();
	}
}
else
{
	finalmess = new String("ERROR - Database could not be successfully updated with fixture details").toString();
}
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
			<h1>Playing:&nbsp;<b>Updating fixture results for <%= theteam %></b></h1>
			<p style="text-align: center; foxn-weight: bold;">
				<%= finalmess %>
			</p>
			<div id="morefixtureupdates">
				<form name="MoreResults" action="lstfixtures.asp" method="GET">
					<input type="hidden" name="season" value="<%= theyear %>" size="4">
					<input type="hidden" name="team" value="<%= theteam %>" size="30">
					<input type="submit" value="More results for <%= theteam %> in the <%= theyear %> season ..." name="gofetch">
				</form>
				<br />
				<a href="new_fixture.asp?teamname=<%= theteam %>&season=<%= theyear %>">Another fixture for <%= theteam %> in <%= theyear %></a>
				<br />
				<br />
				I will redirect to [<%= redirecturl %>]
			</div>
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
