<%@language="JScript"%>
<!--#include file="strings.asp" -->
<!--#include file="datefuncs.asp" -->
<%

// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Date Functions Testing Page");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQL1, SQL2;
var d, thisyear;
var i, kount, dummy, dummy1;
var eventids = new Array (786,787,788);
var curyear, curseason;
var isOdd = true;
var stripeText = new String("").toString();
var eventObj = new Object();
// Set up default greeting strings
strdate = "";
strtime = "";
// End of page start up coding
displaydate = "";
// var debugging=current_debug_status();
var debugging = false;


// End of page start up coding
%>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hampton-in-Arden Tennis Club - Date Function Testing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="-1">
    <meta name="Description" lang="en" content="Hampton in Arden Tennis Club web site">
    <!-- Schema.org markup for Google+ -->
    <meta itemprop="name" content="Hampton in Arden Tennis Club web site">
    <meta itemprop="description" content="Hampton in Arden tennis club is a family-friendly tennis club in the green belt area around Solihull ">
    <meta itemprop="image" content="http://hamptontennis.org.uk/img/logos/logo.gif">
    <!-- Twitter Card data -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:site" content="@hamptontennis">
    <meta name="twitter:title" content="Hampton in Arden Tennis Club web site">
    <meta name="twitter:description" content="Your family-friendly tennis club in Solihull">
    <meta name="twitter:creator" content="@author_handle">
    <meta name="twitter:image:src" content="http://hamptontennis.org.uk/img/logos/logo.gif">
    <!-- Open Graph meta information -->
    <meta property="og:title" content="Hampton in Arden Tennis Club">
    <meta property="og:type" content="website">
    <meta property="og:url" content="http://hamptontennis.org.uk/fullindex.html">
    <meta property="og:image" content="http://hamptontennis.org.uk/img/logos/logo.gif">
    <meta property="og:description" content="Your family-friendly tennis club in Solihull">
    <!-- Apple touch icon links -->
    <link rel="icon" sizes="192x192" href="/img/logos/icon192.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="/img/logos/icon180.png">
    <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/img/logos/icon152.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/logos/icon144.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/img/logos/icon120.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/logos/icon114.png">
    <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/img/logos/icon76.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/logos/icon72.png">
    <link rel="apple-touch-icon-precomposed" href="/img/logos/apple-touch-icon-precomposed.png">
    <!-- Favicon link -->
    <link rel="shortcut icon" href="/favicon.ico">
    <!-- IE tile icon links -->
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="/img/logos/icon144.png">
    <meta name="msapplication-square310x310logo" content="/img/logos/icon310.png">
    <meta name="msapplication-wide310x150logo" content="/img/logos/tile-wide.png">
    <meta name="msapplication-square150x150logo" content="/img/logos/icon150.png">
    <meta name="msapplication-square70x70logo" content="/img/logos/icon70.png">
    <!-- CSS links -->
    <link rel="stylesheet" href="bower_components/foundation/css/normalize.css" />
    <!-- <link rel="stylesheet" href="css/base.css" />  -->
    <link rel="stylesheet" href="/css/main.css" />
    <script src="/bower_components/modernizr/modernizr.js"></script>
    <style type="text/css">
    li.current a {
      background-color: white;
      font-weight: bold;
    }
    </style>
  </head>
<body>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
			<h1>Administration:<b>&nbsp;Testing Event Functions</b></h1>
<%

ConnObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
ConnObj.Open(dbconnect);

// Need to test:
// timestring()
// datestring()
// timegreeting()
// dateasstring(adate)
// timeasstring(atime)
// today()
// sortabletoday()
// ddmmyyyy(Date)
// getMonthNumber(strMonth)
// getMonthAsString(monthno)
// currentYear()
// currentMonth()
// currentMonthAsString()
// currentDate()
// currentSeason()
// asSortableDate(Date)
// currentAge(strDOB)
// seasonAge(strDOB)
// daysBetween(startdate, enddate)
// nextBirthday(dob)
// inAgeRangeAtEmail(thequery, emailaddress, startage, endage)

    Response.Write("<h2>Standard functions</h2>");
    Response.Write("<table><thead><th>Variable</th><th>Value</th></thead><tbody>");
    Response.Write("<tr><td>timestring()</td><td>"+timestring()+"</td></tr>");
    Response.Write("<tr><td>datestring()</td><td>"+datestring()+"</td></tr>");
    Response.Write("<tr><td>timegreeting()</td><td>"+timegreeting()+"</td></tr>");
    Response.Write("<tr><td>dateasstring("+Date()+")</td><td>"+dateasstring(Date())+"</td></tr>");
    Response.Write("<tr><td>today()</td><td>"+today()+"</td></tr>");
    Response.Write("<tr><td>sortabletoday()</td><td>"+sortabletoday()+"</td></tr>");
    var dummydate = new Date();
    Response.Write("<tr><td>ddmmyyyy("+dummydate+")</td><td>"+ddmmyyyy(dummydate)+"</td></tr>");
    Response.Write("<tr><td>getMonthNumber('April')</td><td>"+getMonthNumber("April")+"</td></tr>");
    Response.Write("<tr><td>getMonthAsString(3)</td><td>"+getMonthAsString(3)+"</td></tr>");
    Response.Write("<tr><td>currentYear()</td><td>"+currentYear()+"</td></tr>");
    Response.Write("<tr><td>currentMonth()</td><td>"+currentMonth()+"</td></tr>");
    Response.Write("<tr><td>currentMonthAsString()</td><td>"+currentMonthAsString()+"</td></tr>");
    Response.Write("<tr><td>currentDate()</td><td>"+currentDate()+"</td></tr>");
    Response.Write("<tr><td>currentSeason()</td><td>"+currentSeason()+"</td></tr>");
    Response.Write("<tr><td>asSortableDate("+Date()+")</td><td>"+asSortableDate(Date())+"</td></tr>");
    var dummystart = new Date(2016, 3, 1, 0, 0, 0);  // So, April = 3 
    var dummyend = new Date(2016, 3, 29, 0, 0, 0);  
    Response.Write("<tr><td>daysBetween("+dummystart+","+dummyend+")</td><td>"+daysBetween(dummystart,dummyend)+"</td></tr>");

    Response.Write("</table>");

    Response.Write("<h2>Now for Cable family loop</h1>");

SQL1 = "SELECT * from allmembers WHERE surname = 'CABLE'";

RS = ConnObj.Execute(SQL1);
while (!RS.EOF) {
    Response.Write("<h3>"+RS("forename1")+" "+RS("surname")+"</h3>");

    Response.Write("<table><thead><th>Variable</th><th>Value</th></thead><tbody>");
    Response.Write("<tr><td>Current age from DB</td><td>"+RS("currentage")+"</td></tr>");
    Response.Write("<tr><td>Printable DOB from DB</td><td>"+RS("printabledob")+"</td></tr>");
    dummydate = new Date(RS("dob"));
    var strdate = new String(RS("printabledob")).toString();
    Response.Write("<tr><td>ddmmyyyy on DOB from DB</td><td>"+ddmmyyyy(dummydate)+"</td></tr>");
    Response.Write("<tr><td>currentAge("+strdate+"</td><td>"+currentAge(strdate)+"</td></tr>");
    Response.Write("<tr><td>seasonAge("+strdate+")</td><td>"+seasonAge(strdate)+"</td></tr>");
    Response.Write("<tr><td>nextBirthday("+dummydate+")</td><td>"+nextBirthday(dummydate)+"</td></tr>");
    Response.Write("</table>");

    RS.MoveNext();
}

%>		
</div>


</body>
</html>
<%
%>


