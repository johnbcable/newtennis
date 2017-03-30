<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("<<pagetitle >>");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
var eventtypelist = new Array("EVENT","JUNIOR","MATCH","SOCIAL");
var defType = new String("EVENT").toString();            // default event type
var myname, displaydate;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-in-Arden Tennis Club logo" /></a>
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
	<h1>Hampton-in-Arden Tennis Club</h1>
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
	<div id="content">
		<h1>Admin: <b>Creating a new event</b></h1>
		<p>
			Fill in the form below with details of the new event. All boxes must be completed with the exception of 
			the Event Starts At box (which may be left blank). Click on Submit when the new event details are ready 
			for submission.
		</p>
		<form method="get" action="set_event.asp">
			<fieldset>
				<legend>Details of New Event</legend>
				<div>
					<label for="eventnote">Name/Title for Event</label>
					<input type="text" name="eventnote" id="eventnote" size="60" maxlength="120" tabindex="1" />
				</div>
				<div>
					<label for="eventdate"> Event Starts On</label>
					<input type="text" name="eventdate" id="eventdate" size="10" maxlength="10" tabindex="2" onBlur="javascript:checkdate(this)" />&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="eventtime">Event Starts At</label>
					<input type="text" name="eventtime" id="eventtime" size="5" maxlength="4" tabindex="3" />&nbsp;(hhmm) e.g. 0910 = ten past nine in the morning
				</div>
				<div>
					<label for="eventtype">Type of Event</label>
					<select name="eventtype" id="eventtype" tabindex="4">
<%
for (i=0; i<4; i++)
{
	if (eventtypelist[i]==defType)
		Response.Write("<option selected>"+eventtypelist[i]);
	else
		Response.Write("<option>"+eventtypelist[i]);
}
%>
					</select>	
				</div>		
				<div id="submitblock" align="right">
							<input type="hidden" name="eventid" value="-1">
							<p style="margin-right:50px;">
								<input align="right" type="submit" value="Submit">
							</p>
				</div>
			</fieldset>
		</form>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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
