<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var debugging = false; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Setting up New Fixtures");
// Now for any variables local to this page
var hamptonteam, fixtureyear;
var date1, date2;
var venue1, venue2;
var opponents1, opponents2;

var dates = new Array();
var venues = new Array();
var opponents = new Array();
var datelength, venuelength, opponentlength;

var dbconnect=Application("hamptonsportsdb"); 
var ConnObj, RS, sqlString, SQL1, SQL2, SQL3, SQL4;
var debugging = current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();

// End of page start up coding

// Process POST'ed data 

hamptonteam = new String(Request.Form("teamchoice")).toString();
if (hamptonteam == "" || hamptonteam=="null" || hamptonteam == "undefined") {
	hamptonteam = new String("").toString();
}

fixtureyear = new String(Request.Form("yearchoice")).toString();
if (fixtureyear == "" || fixtureyear=="null" || fixtureyear == "undefined") {
	fixtureyear = new String("").toString();
}

// First fixture
date1 = new String(Request.Form("date1")).toString();
if (date1 == "" || date1=="null" || date1 == "undefined") {
	date1 = new String("").toString();
}

venue1 = new String(Request.Form("venue1")).toString();
if (venue1 == "" || venue1=="null" || venue1 == "undefined") {
	venue1 = new String("").toString();
}

opponents1 = new String(Request.Form("opponents1")).toString();
if (opponents1 == "" || opponents1=="null" || opponents1 == "undefined") {
	opponents1 = new String("").toString();
}
if ((! (date1 == "")) && (! (venue1 == "")) && (! (opponents1 == ""))) {
	dates.push(date1);
	venues.push(venue1);
	opponents.push(opponents1);
}
	
// Second fixture
date2 = new String(Request.Form("date2")).toString();
if (date2 == "" || date2=="null" || date2 == "undefined") {
	date2 = new String("").toString();
}

venue2 = new String(Request.Form("venue2")).toString();
if (venue2 == "" || venue2=="null" || venue2 == "undefined") {
	venue2 = new String("").toString();
}
opponents2 = new String(Request.Form("opponents2")).toString();
if (opponents2 == "" || opponents2=="null" || opponents2 == "undefined") {
	opponents2 = new String("").toString();
}
if ((! (date2 == "")) && (! (venue2 == "")) && (! (opponents2 == ""))) {
	dates.push(date2);
	venues.push(venue2);
	opponents.push(opponents2);
}

// Third fixture
date3 = new String(Request.Form("date3")).toString();
if (date3 == "" || date3=="null" || date3 == "undefined") {
	date3 = new String("").toString();
}

venue3 = new String(Request.Form("venue3")).toString();
if (venue3 == "" || venue3=="null" || venue3 == "undefined") {
	venue3 = new String("").toString();
}
opponents3 = new String(Request.Form("opponents3")).toString();
if (opponents3 == "" || opponents3=="null" || opponents3 == "undefined") {
	opponents3 = new String("").toString();
}
if ((! (date3 == "")) && (! (venue3 == "")) && (! (opponents3 == ""))) {
	dates.push(date3);
	venues.push(venue3);
	opponents.push(opponents3);
}

// Fourth fixture
date4 = new String(Request.Form("date4")).toString();
if (date4 == "" || date4=="null" || date4 == "undefined") {
	date4 = new String("").toString();
}

venue4 = new String(Request.Form("venue4")).toString();
if (venue4 == "" || venue4=="null" || venue4 == "undefined") {
	venue4 = new String("").toString();
}
opponents4 = new String(Request.Form("opponents4")).toString();
if (opponents4 == "" || opponents4=="null" || opponents4 == "undefined") {
	opponents4 = new String("").toString();
}
if ((! (date4 == "")) && (! (venue4 == "")) && (! (opponents4 == ""))) {
	dates.push(date4);
	venues.push(venue4);
	opponents.push(opponents4);
}

// Fifth fixture
date5 = new String(Request.Form("date5")).toString();
if (date5 == "" || date5=="null" || date5 == "undefined") {
	date5 = new String("").toString();
}

venue5 = new String(Request.Form("venue5")).toString();
if (venue5 == "" || venue5=="null" || venue5 == "undefined") {
	venue5 = new String("").toString();
}
opponents5 = new String(Request.Form("opponents5")).toString();
if (opponents5 == "" || opponents5=="null" || opponents5 == "undefined") {
	opponents5 = new String("").toString();
}
if ((! (date5 == "")) && (! (venue5 == "")) && (! (opponents5 == ""))) {
	dates.push(date5);
	venues.push(venue5);
	opponents.push(opponents5);
}

// Sixth fixture
date6 = new String(Request.Form("date6")).toString();
if (date6 == "" || date6=="null" || date6 == "undefined") {
	date6 = new String("").toString();
}

venue6 = new String(Request.Form("venue6")).toString();
if (venue6 == "" || venue6=="null" || venue6 == "undefined") {
	venue6 = new String("").toString();
}
opponents6 = new String(Request.Form("opponents6")).toString();
if (opponents6 == "" || opponents6=="null" || opponents6 == "undefined") {
	opponents6 = new String("").toString();
}
if ((! (date6 == "")) && (! (venue6 == "")) && (! (opponents6 == ""))) {
	dates.push(date6);
	venues.push(venue6);
	opponents.push(opponents6);
}

// Seventh fixture
date7 = new String(Request.Form("date7")).toString();
if (date7 == "" || date7=="null" || date7 == "undefined") {
	date7 = new String("").toString();
}

venue7 = new String(Request.Form("venue7")).toString();
if (venue7 == "" || venue7=="null" || venue7 == "undefined") {
	venue7 = new String("").toString();
}
opponents7 = new String(Request.Form("opponents7")).toString();
if (opponents7 == "" || opponents7=="null" || opponents7 == "undefined") {
	opponents7 = new String("").toString();
}
if ((! (date7 == "")) && (! (venue7 == "")) && (! (opponents7 == ""))) {
	dates.push(date7);
	venues.push(venue7);
	opponents.push(opponents7);
}

// Eighth fixture
date8 = new String(Request.Form("date8")).toString();
if (date8 == "" || date8=="null" || date8 == "undefined") {
	date8 = new String("").toString();
}

venue8 = new String(Request.Form("venue8")).toString();
if (venue8 == "" || venue8=="null" || venue8 == "undefined") {
	venue8 = new String("").toString();
}
opponents8 = new String(Request.Form("opponents8")).toString();
if (opponents8 == "" || opponents8=="null" || opponents8 == "undefined") {
	opponents8 = new String("").toString();
}
if ((! (date8 == "")) && (! (venue8 == "")) && (! (opponents8 == ""))) {
	dates.push(date8);
	venues.push(venue8);
	opponents.push(opponents8);
}

// Ninth fixture
date9 = new String(Request.Form("date9")).toString();
if (date9 == "" || date9=="null" || date9 == "undefined") {
	date9 = new String("").toString();
}

venue9 = new String(Request.Form("venue9")).toString();
if (venue9 == "" || venue9=="null" || venue9 == "undefined") {
	venue9 = new String("").toString();
}
opponents9 = new String(Request.Form("opponents9")).toString();
if (opponents9 == "" || opponents9=="null" || opponents9 == "undefined") {
	opponents9 = new String("").toString();
}
if ((! (date9 == "")) && (! (venue9 == "")) && (! (opponents9 == ""))) {
	dates.push(date9);
	venues.push(venue9);
	opponents.push(opponents9);
}

// Tenth fixture
date10 = new String(Request.Form("date10")).toString();
if (date10 == "" || date10=="null" || date10 == "undefined") {
	date10 = new String("").toString();
}

venue10 = new String(Request.Form("venue10")).toString();
if (venue10 == "" || venue10=="null" || venue10 == "undefined") {
	venue10 = new String("").toString();
}
opponents10 = new String(Request.Form("opponents10")).toString();
if (opponents10 == "" || opponents10=="null" || opponents10 == "undefined") {
	opponents10 = new String("").toString();
}
if ((! (date10 == "")) && (! (venue10 == "")) && (! (opponents10 == ""))) {
	dates.push(date10);
	venues.push(venue10);
	opponents.push(opponents10);
}

// Eleventh fixture
date11 = new String(Request.Form("date11")).toString();
if (date11 == "" || date11=="null" || date11 == "undefined") {
	date11 = new String("").toString();
}

venue11 = new String(Request.Form("venue11")).toString();
if (venue11 == "" || venue11=="null" || venue11 == "undefined") {
	venue11 = new String("").toString();
}
opponents11 = new String(Request.Form("opponents11")).toString();
if (opponents11 == "" || opponents11=="null" || opponents11 == "undefined") {
	opponents11 = new String("").toString();
}
if ((! (date11 == "")) && (! (venue11 == "")) && (! (opponents11 == ""))) {
	dates.push(date11);
	venues.push(venue11);
	opponents.push(opponents11);
}

// Twelfth fixture
date12 = new String(Request.Form("date12")).toString();
if (date12 == "" || date12=="null" || date12 == "undefined") {
	date12 = new String("").toString();
}

venue12 = new String(Request.Form("venue12")).toString();
if (venue12 == "" || venue12=="null" || venue12 == "undefined") {
	venue12 = new String("").toString();
}
opponents12 = new String(Request.Form("opponents12")).toString();
if (opponents12 == "" || opponents12=="null" || opponents12 == "undefined") {
	opponents12 = new String("").toString();
}
if ((! (date12 == "")) && (! (venue12 == "")) && (! (opponents12 == ""))) {
	dates.push(date12);
	venues.push(venue12);
	opponents.push(opponents12);
}

// Thirteenth fixture
date13 = new String(Request.Form("date13")).toString();
if (date13 == "" || date13=="null" || date13 == "undefined") {
	date13 = new String("").toString();
}

venue13 = new String(Request.Form("venue13")).toString();
if (venue13 == "" || venue13=="null" || venue13 == "undefined") {
	venue13 = new String("").toString();
}
opponents13 = new String(Request.Form("opponents13")).toString();
if (opponents13 == "" || opponents13=="null" || opponents13 == "undefined") {
	opponents13 = new String("").toString();
}
if ((! (date13 == "")) && (! (venue13 == "")) && (! (opponents13 == ""))) {
	dates.push(date13);
	venues.push(venue13);
	opponents.push(opponents13);
}

// Fourteenth fixture
date14 = new String(Request.Form("date14")).toString();
if (date14 == "" || date14=="null" || date14 == "undefined") {
	date14 = new String("").toString();
}

venue14 = new String(Request.Form("venue14")).toString();
if (venue14 == "" || venue14=="null" || venue14 == "undefined") {
	venue14 = new String("").toString();
}
opponents14 = new String(Request.Form("opponents14")).toString();
if (opponents14 == "" || opponents14=="null" || opponents14 == "undefined") {
	opponents14 = new String("").toString();
}
if ((! (date14 == "")) && (! (venue14 == "")) && (! (opponents14 == ""))) {
	dates.push(date14);
	venues.push(venue14);
	opponents.push(opponents14);
}


// Now we need to loop throgh the arrays 
datelength = dates.length;
venuelength = venues.length;
opponentlength = opponents.length;


ConnObj = Server.CreateObject("ADODB.connection");
ConnObj.Open(dbconnect);


displaydate = dateasstring(Date());
// End of page start up coding
debugging = true;
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
<<<<<<< HEAD
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
=======
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
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
	Response.Write("<br /><table>");
	Response.Write("<tr><td>Hampton team was</td><td>"+ hamptonteam +"</td></tr>");
	Response.Write("<tr><td>Fixture year was</td><td>"+ fixtureyear +"</td></tr>");
	Response.Write("<tr><td>No of fixture dates</td><td>"+ datelength +"</td></tr>");
	Response.Write("<tr><td>No of fixture venues</td><td>"+ venuelength +"</td></tr>");
	Response.Write("<tr><td>No of fixture opponents</td><td>"+ opponentlength +"</td></tr>");
	Response.Write("<tr><td>And now the list of fixtures POST'ed ...</td></tr>");
	var numfix = 1;
	for (var i = 0; i<datelength; i++) {
		Response.Write("<tr><td>Fixture "+ numfix +  " was</td><td>"+ dates[i] + "," + venues[i] + "," + opponents[i] +"</td></tr>");
		numfix++;
	}
	
	Response.Write("</table>");

	Response.End();
}

%>
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
if (! debugging)
	Response.Redirect(onwardurl); // redirect to member services area
%>
