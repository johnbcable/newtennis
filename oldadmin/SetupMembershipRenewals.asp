<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Setting up Membership Renewals");
var debugging = false;
var curpos, kount;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj;
var SQLStart, SQLEnd;
var SQL1, SQL2, SQL3, SQL4;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
var endpos, endpoint;
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
			<h1>Setting Up Membership Renewals</h1>
			<div id="addreesslabels">
				<p>
<%
//
//	Process :-
//
//	1.	Delete from LastYearsRenewalAddresses
//	2.	Insert all rows from RenewalAddresses into LastYearsRenewalAddresses
//	3.	Delete all rows from RenewalAddresses
//	4.	Insert new rows into RenewalAddresses
//	5.	Update RenewalAddresses with addressees from LastYearsRenewalAddresses
//

//	1.	Delete from LastYearsRenewalAddresses
//
Response.Write("<br />===============================================================<br /><br />")
SQL1 = new String("DELETE FROM LastYearsRenewalAddresses").toString();
try {
	RstObj = ConnObj.Execute(SQL1);
	}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	Response.Write("Error clearing out LastYearsRenewalAddresses<br /><br />");
	Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
	Response.Write("<br />");
	Response.Write("Error code:           "+e.number & 0xFFFF);
	Response.Write("<br />");
	Response.Write("Description:          "+e.description+"<br />");
	Response.End();
	} else {
		Response.Write("LastYearsRenewalAddresses cleared out<br />")
	}
	Response.Write("<br />+++++++++++++++++++++++++++++++++++++++++++++++++++++++<br /><br />")
}

//	2.	Insert all rows from RenewalAddresses into LastYearsRenewalAddresses
//
SQL1 = new String("INSERT INTO LastYearsRenewalAddresses SELECT * FROM RenewalAddresses").toString();
try {
	RstObj = ConnObj.Execute(SQL1);
	}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	Response.Write("Error refilling LastYearsRenewalAddresses<br /><br />");
	Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
	Response.Write("<br />");
	Response.Write("Error code:           "+e.number & 0xFFFF);
	Response.Write("<br />");
	Response.Write("Description:          "+e.description+"<br />");
	Response.End();
	} else {
		Response.Write("LastYearsRenewalAddresses refilled")
	}
	Response.Write("<br />+++++++++++++++++++++++++++++++++++++++++++++++++++++++<br /><br />")
}

//	3.	Delete all rows from RenewalAddresses
//
SQL1 = new String("DELETE FROM RenewalAddresses").toString();
try {
	RstObj = ConnObj.Execute(SQL1);
	}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	Response.Write("Error deleting from RenewalAddresses<br /><br />");
	Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
	Response.Write("<br />");
	Response.Write("Error code:           "+e.number & 0xFFFF);
	Response.Write("<br />");
	Response.Write("Description:          "+e.description+"<br />");
	Response.End();
	} else {
		Response.Write("RenewalAddresses cleared out")
	}
	Response.Write("<br />+++++++++++++++++++++++++++++++++++++++++++++++++++++++<br /><br />")
}

//	4.	Insert new rows into RenewalAddresses
//
SQLStart = new String("INSERT INTO RenewalAddresses").toString();
SQLEnd = new String("FROM DistinctAddresses").toString();
SQL1 = new String("SELECT [address1] AS address1, [address2] AS address2, [address3] AS address3, [address4] AS address4, [postcode] AS postcode, '' AS addressee, [surname] AS surname ").toString();
try {
	RstObj = ConnObj.Execute(SQLStart+SQL1+SQLEnd);
	}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	Response.Write("Error deleting from RenewalAddresses<br /><br />");
	Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
	Response.Write("<br />");
	Response.Write("Error code:           "+e.number & 0xFFFF);
	Response.Write("<br />");
	Response.Write("Description:          "+e.description+"<br />");
	Response.End();
	} else {
		Response.Write("Insert into RenewalAddresses successful")
	}
	Response.Write("<br />+++++++++++++++++++++++++++++++++++++++++++++++++++++++<br /><br />")
}
	
//	5.	Update RenewalAddresses with addressees from LastYearsRenewalAddresses
//
SQLStart = new String("UPDATE RenewalAddresses AS ra, LastYearsRenewalAddresses AS p ").toString();
SQLEnd = new String("WHERE ra.address1=p.address1 And ra.address2=p.address2 And ra.surname=p.surname").toString();
SQL1 = new String("SET ra.addressee = p.addressee ").toString();
try {
	RstObj = ConnObj.Execute(SQLStart+SQL1+SQLEnd);
	}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	Response.Write("Error deleting from RenewalAddresses<br /><br />");
	Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
	Response.Write("<br />");
	Response.Write("Error code:           "+e.number & 0xFFFF);
	Response.Write("<br />");
	Response.Write("Description:          "+e.description+"<br />");
	Response.End();
	} else {
		Response.Write("Insert into RenewalAddresses successful")
	}
	Response.Write("<br />+++++++++++++++++++++++++++++++++++++++++++++++++++++++<br /><br />")
}
Response.Write("<br />===============================================================<br /><br />")
	
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



