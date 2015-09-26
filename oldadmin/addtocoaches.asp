<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="coachfuncs.asp" -->
<%
// Adding a new club member to the list of coaches
//
// User MUST have administrator or higher privileges
// Determine member to be added to the coavches list from 
// querystring
// If member supplied
// 		-  Get member details from members
//		-  Update its iscoach yo 'Y'
// 		-  Update member details
// 		-  Set confirmation text message
// If there is a confirmation text message, display it
// Create list of members available for selection into
// the list of coaches and display as drop-down list
//
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Adding New Member to Existing coach");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var mycoach, thegender;
var callinguser;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL0, SQL1, SQL2, SQL3, SQL4, SQL5;
var SQLaudit;
var messagetext;
var v_memberid = getUserID();
var v_usercode = getUserCode();
var v_access = getUserAccessLevel();
var memberObj = new Object();
var dummy, dummy2, dummy3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
messagetext = new String("").toString();
thecoachtext = new String("(None)").toString();
callinguser=new String("NONE");
//
// start of page processing
//
if (!signedin())
	Response.Redirect("login.asp");
// Get details of currently logged on user
if (! isAdministrator())
	Response.Redirect("lst_coaches.asp");
//
// Now process querystring
//
themember = new String(Request.QueryString("member")).toString();
if (themember == "" || themember == "null" || themember == "undefined")
	themember = new String("-1").toString();
//
// Establish the initial DB connection
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
memberObj = getMember(themember);
if (! (memberObj.memberid == themember))  // Got member details back
{
	memberObj.iscoach = new String("Y").toString();
	resultObj = setMember(memberObj);
	if (resultObj.result)   // Update succeeded
	{
		messagetext += memberObj.forename1 + " " + memberObj.surname + " has been added to the list of coaches";
	}
	else 
	{
		messagetext += "Update failed. " + memberObj.forename1 + " " + memberObj.surname + " has not been added to the list of coaches";
	}
}
else
{
	messagetext += "Could not retrieve member details for " + memberObj.forename1 + " " + memberObj.surname;
}
// 
// Now construct the SQL to fill up the drop down list box
//
SQL5 = new String("SELECT * from allmembers where [iscoach] is null or [iscoach] = 'N' and [uniqueref] not in (SELECT [uniqueref] from allmembers WHERE [iscoach] = 'Y') order by [surname] asc, [membergrade] asc"). toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title>Hampton-In-Arden Tennis Club - Member Detail Editing</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="TabInterface.js"></script>
</head>
<body>
<!--#include file="dateval.asp" -->
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
		<h1>Admin: <b>Coach list</b></h1>
		<div id="coachmemberchoice">
<%
if (debugging)
{
	Response.Write("    SQL1 statement = ["+SQL1+"]<br />");
	Response.Write("    SQL2 statement = ["+SQL2+"]<br />");	
	Response.Write("    SQL3 statement = ["+SQL3+"]<br />");
	Response.Write("    SQL4 statement = ["+SQL4+"]<br />");
	Response.Write("    SQL5 statement = ["+SQL5+"]<br />");
	Response.Write("    thecoach       = ["+thecoach+"]<br />");
	Response.Write("    themember      = ["+themember+"]<br />");
	Response.End();
}
//
// Now create the form to display the drop down list to choose a member
// to add to the list of coaches at the club
//
%>
			<p>
				<%= messagetext %>
			</p>
			<br />
			<form name="coachMemberForm" action="addtocoaches.asp" method="GET">
				<fieldset>
				<legend>Adding club members to the list of coaches</legend>
				<div>
					<label for="member">Select club member who is a coach:</label>
					<select name="member" id="member">
<%
	RS = ConnObj.Execute(SQL5);
	while (! RS.EOF)
	{
		dummy = Trim(new String(RS("uniqueref")).toString());
		dummy2 = Trim(new String(RS("forename1")))+" "+Trim(new String(RS("surname")));
		dummy3 = Trim(new String(RS("membergrade")).toString());
		if (! (dummy3 == "Adult"))
			Response.Write("<option value="+dummy+">"+dummy2+"("+dummy3+")");
		else
			Response.Write("<option value="+dummy+">"+dummy2);
		RS.MoveNext();
	}
	RS.Close();
%>
					</select>&nbsp;&nbsp;&nbsp;	
					<input type="submit" value="Add">
				</div>
				</fieldset>
			</form>
		</div>
		<div class="seealso">
			<p class="centered">
				<a href="lst_coaches.asp">Complete list of coaches</a>
			</p>
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
