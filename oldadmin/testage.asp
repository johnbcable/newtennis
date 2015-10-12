<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Age Testing Page");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var teamids = new Array (1,2,3);
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging=current_debug_status();
var birthdate="10/05/1959";
var age = currentAge("10/05/1959");
var theyear = birthdate.substr(6);
var themonth = new Number(birthdate.substr(3,2))-1;  // Month numbers start at zero in Javascript
var theday = birthdate.substr(0,2);
var composite = new String(theyear+"-"+themonth+"-"+theday).toString();
var d = new Date(theyear,themonth,theday,0,0,0);
var today = new Date();

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
			<h1>Administration:<b>&nbsp;Testing Age functions</b></h1>
<%
	var numberfound = inAgeRangeAtEmail("allmembers","johncable@talk21.com", 57, 59);
	var numberfound2 = inAgeRangeAtEmail("allmembers","johncable@talk21.com", 59, 60);
	var numberfound3 = inAgeRangeAtEmail("allmembers","cath.mcelholm@gmail.com", 30, 70);

	

	Response.Write("The string birth date is : ["+birthdate+"]<br />");
	Response.Write("The year from the string birth date is : ["+theyear+"]<br />");
	Response.Write("The month from the string birth date is : ["+themonth+"]<br />");
	Response.Write("The day from the string birth date is : ["+theday+"]<br />");
	Response.Write("The composite date string is : ["+composite+"]<br />");
	Response.Write("The Date object from the string birth date is : ["+d+"]<br />");
	Response.Write("Todays date is : ["+today+"]<br />");
	Response.Write("The calculated age is : ["+age+"]<br />");
	Response.Write("The expected number found is 1 - actual number found is : ["+numberfound+"]<br />");
	Response.Write("The second expected number found is 0 - actual number found is : ["+numberfound2+"]<br />");
	Response.Write("The third expected number found is 2 - actual number found is : ["+numberfound3+"]<br />");
%>		
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


