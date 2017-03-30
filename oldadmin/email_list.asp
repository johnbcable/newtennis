<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Club - Sent Emails List");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var circulation;
var curemails, curseason;
var teamcaptain, eventname;
var circulation, eventnote;
var theeventdate, streventdate;
var emailknt;
var theeventdtime, streventtime;
var strtoday, enddate;
var debugging = false;
// Set up default greeting strings
emailknt = 0;
strdate = datestring();
strtime = timestring();
thisyear = new String("").toString();
strtoday = new String("").toString();
d = new Date();
thisyear += d.getYear();
strtoday = today();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
curemails = new String(Request.QueryString("emails")).toString();
if (curemails == "null" || curemails == "undefined")
	curemails = new String("10").toString();
// enddate = new Date()+ curemails.toNumber();
// End of page start up coding
eventname="";
eventnote="";
emailknt = new Number (curemails.valueOf());
pagetitle += " for next "+curemails+" from "+strtoday;
displaydate = dateasstring(Date());
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
		<h1>Tennis Club - Sent Emails List</h1>
		<form name="frmJump" action="email_list.asp" method="GET">
			<div id="eventform">
				<p>
					Emails sent out by the club are listed below, most recent first<br />Click on an email subject to show the full email<br />
				</p>
				<p class="bordertop">
					Choose number of emails to display:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="emails">
<%
i=1;
while (i <= 50)
{
		dummy=new String(i).toString();
		if (dummy==curemails)
			Response.Write("<option selected>" + curemails+"\r\n");
		else
			Response.Write("<option>" + i+"\r\n");
		i = i + 1;
}
%>
					</select>
					&nbsp;&nbsp;(max. 50)&nbsp;&nbsp;<input type="submit" value="Fetch">
				</p>
			</div>
		</form>
			<div class="borderboth">
				<table>
					<caption><span class="blueheading">Emails previously circulated by the tennis club</span></caption>
					<thead>
						<tr>
							<th>Date Sent</th>
							<th>Subject</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
<%
SQLStmt = new String("SELECT * from emails order by sent_on desc");
	// Response.Write(SQLStmt+"<BR>");
	RstObj = ConnObj.Execute(SQLStmt);
	kount = 0;
	while (! RstObj.EOF)
	{
		kount += 1;
		// Response.Write("Done "+kount+"<br>");
		theeventdate=new Date(RstObj("sent_on"));
		// streventdate = new String(RstObj("sent_on")).toString();
		streventdate = dateasstring(theeventdate);
		circulation = new String( RstObj("circulation")).toString();
		emailfile = new String(RstObj("emailfile")).toString();
		the_id = new String(RstObj("emailid")).toString();
%>
						<tr>
							<td>
								<%= streventdate %>
							</td>
							<td>
								<p><a href="emailviewer.asp?emailid=<%= the_id %>"><%= RstObj("subject") %></a></p>
							</td>
							<td>
								<p><a href="delete_email_log.asp?id=<%= the_id %>">Delete Log</a></p>
							</td>
						</tr>
<%
	RstObj.MoveNext();
	if (kount == emailknt)
		break;
	}
%>
						<tr>
							<td colspan="3" class="centered">
								<p><strong><%= kount %>&nbsp;emails found and displayed</strong></p>
							</td>
						</tr>
					</tbody>
				</table>
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
