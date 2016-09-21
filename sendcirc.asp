<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Circulating Pre-Prepared Emails");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var defquery = new String("members").toString();
var dummy1;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from circulation_lists order by name asc");
var displaydate = dateasstring(Date());
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
		<script language="Javascript" src="datetimepicker.js"></script>
		<script language="Javascript" src="minmax.js"></script>
<!--#include file="dateval.asp" -->
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
			<h1>Circulating Pre-Prepared Emails</h1>
			<form name="CircularForm" method="GET" action="tome.asp">
				<fieldset>
					<legend>Email Details</legend>
						<div>
							<label for="subject">Subject:</label>
							<input type="text" name="subject" id="subject" size="40" maxlength="120" tabindex="1">
						</div>
						<div>
							<label for="thefile">Pre-prepared email file:</label>
							<input type="text" name="thefile" id="thefile" size="40" maxlength="60" tabindex="2">
						</div>
						<div>
							<label for="attach1">First attachment:</label>
							<input type="text" name="attach1" id="attach1" size="40" maxlength="90" tabindex="3">
						</div>
						<div>
							<label for="attach2">Second attachment:</label>
							<input type="text" name="attach2" id="attach2" size="40" maxlength="90" tabindex="4">
						</div>
						<div>
							<label for="attach3">Third attachment:</label>
							<input type="text" name="attach3" id="attach3" size="40" maxlength="90" >
						</div>
						<div>
							<label for="query">Circulation:</label>
							<select name="query" id="query">
<%
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	dummy1 = new String(RS("queryname")).toString();
	if (dummy1 == defquery)
		Response.Write('<option selected value="'+RS("queryname")+'">'+RS("name"));
	else
		Response.Write('<option value="'+RS("queryname")+'">'+RS("name"));
	RS.MoveNext();
}
RS.Close();
%>
							</select>
						</div>
						<div>
							<label for="multiples">Allow multiple emails per address:</label>
							<select name="multiples">
											<option selected value="N">No - normal circulations
											<option value="Y">Yes - personal circulations
							</select>
						</div>

						<div>
							<label for="includecoaches">Send to coaches? :</label>
							<select name="includecoaches" id="includecoaches">
								<option selected value="Y">Include coaches in circulation</option>
								<option value="N">Leave coaches out of circulation</option>
							</select>
						</div>

						<div>
							<label for="onbehalfof">Replies go to:</label>
							<select name="onbehalfof" id="onbehalfof">
								<option selected value="support">From web administrator</option>
								<option value="secretary">Club Secretary</option>
								<option value="chairman">Club Chairman</option>
								<option value="coaching">Coaching Administration</option>
								<option value="tournaments">Tournament Organisers</option>
								<option value="juniors">Juniors</option>
								<option value="social">Social Event Organisers</option>
								<option value="league">League Tennis Administration</option>
								<option value="boxleagues"> Box Leagues Administration</option>
								<option value="arden9">Arden 9 Organisers</option>
								<option value="committee">Committee</option>
								<option value="support">Web Site Administration</option>
								<option value="wimbledontickets">Wimbledon Ticket Draw</option>
							</select>
						</div>

						<div>
							<hr />
							<h2 style="margin-left: 20px;">Optional</h2>
							<p style="margin-left: 20px;">
								Emails can also target different age ranges:
							</p> 
							<p style="font-weight: bold; text-decoration: underline; margin-left: 30px;">Target age range (in years):</p>
							<label id="youngestlabel" for="youngest">Youngest :</label>
							<input type="text" name="youngest" id="youngest" size="3" maxlength="3" value=""/>
						</div>
						<div>
							 <label id="oldestlabel" for="oldest">Oldest :</label>
							 <input type="text" name="oldest" id="oldest" size="3" maxlength="3" value=""/><br />
							 <p style="margin-left: 20px;">
								 Please fill in both youngest and oldest ages for 
								 the age range restriction to work 
							</p>
							 <hr />
						</div>

<%
if (isSupport())
{
%>
						<div>
							<label for="exclusions">Excluding:</label>
							<input type="text" name="exclusions" id="exclusions" size="40" maxlength="90" >
							&nbsp;&nbsp;(list of unique refs, comma separated)
						</div>
<%
}
else
{
%>
						<input type="hidden" name="exclusions" value="" >
<%						 	
}	
%>					
					</fieldset>
				<div id="submitblock" align="right">
							<p style="margin-right:50px;">
								<input align="right" type="submit" value="Submit">
							</p>
				</div>
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
