<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="json2.js.asp" -->
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="socialtennisobj.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="datefuncs.asp" -->
<%

// Set up cache control on this page
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);

var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Generate Events From Social Tennis Schedule");
// Now for any variables local to this page
var RS, Conn, SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb"); 
var SQLstart, SQLmiddle, SQLend;
var resultObj = new Object();
var uniqueref;
var today = new Date();
var start_date, end_date;
var socialday = false;
var mykount = 0;
var socialsessions = new Array();
var weekdays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
var mydebug;
var destinationtable = "events";   // Production = events, testing = newevents

var debugging = false; // Production = false
var updating = true;   // Production = true    Add records to the database in destinationtable
var reporting = true;  // Production = false;

// Process QueryString for run options
mydebug = Request.QueryString("debug");
if (mydebug == "" || mydebug == "null" || mydebug == "undefined")
{
	mydebug = new String("N").toString();
}
if (mydebug == "Y") {
	destinationtable = new String("newevents").toString();
	debugging = true;
} else {
	destinationtable = new String("events").toString();
	debugging = false;
}

// Set up DB connections and unchanging bits of SQL
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
RS2 = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);

// Firstly lets get the dates for the next period of social tennis.
// Normally runs 1 April to 31 March

SQL1 = new String("SELECT start_date, end_date FROM coaching_schedules WHERE schedule_role = 'SOCIALTENNIS'").toString();

RS=Conn.Execute(SQL1);// Only one row or absent so no loop
if (! RS.EOF) {
	start_date = new Date(RS("start_date"));
	end_date = new Date(RS("end_date"));
}
RS.Close();

// OK start loop from start_date 
mydate = start_date;
real_end = end_date;
mykount = 0;

real_end.setDate(real_end.getDate() + 1);

if (debugging && reporting) {
	Response.Write("<h4>After schedule retrieval</h4>");
	Response.Write("<table>");
	Response.Write("<tr><td>Start Date</td><td>End Date</td></tr>");
	Response.Write("<tr><td>"+ddmmyyyy(start_date)+"</td><td>"+ddmmyyyy(end_date)+"</td></tr>");
	Response.Write("</table>");
	Response.Write("<h4>Date variables</h4>");
	Response.Write("<table>");
	Response.Write("<tr><td>Variable</td><td>Type</td><td>Value</td></tr>");
	Response.Write("<tr><td>mydate</td><td>"+(mydate instanceof Date)+"</td><td>"+mydate+"</td></tr>");
	Response.Write("<tr><td>real_end</td><td>"+(real_end instanceof Date)+"</td><td>"+real_end+"</td></tr>");
	Response.Write("<tr><td>start_date</td><td>"+(start_date instanceof Date)+"</td><td>"+start_date+"</td></tr>");
	Response.Write("</table>");
}


while (mydate < real_end) {

	curdate = mydate;
	socialday = false;

	// if this date is not a social tennis day, ignore it

	myday = curdate.getDay();
	switch(myday) {
    case 6:   // Saturday
    case 0:   // Sunday
    case 2:   // Tuesday
    case 5:   // Friday
        cursocial = new SocialTennisObject(ddmmyyyy(curdate));
        // mykount++;
        socialday = true;
        break;
    default:    
        cursocial = {};
	}


	if (socialday) {
		socialsessions.push(cursocial);
	}
	cursocial = {};

	mydate.setDate(mydate.getDate() + 1);  // Move on to the next day

}   //   end while

//  Lets have a look at the the socialsessions array

if (debugging && (! reporting)) {
	Response.ContentType = "application/json";
	Response.Write(JSON.stringify(socialsessions));

}

// Otherwise, lets loop through what we have generating SQL inserts

SQLstart= new String("INSERT INTO "+destinationtable+" ([eventdate],[eventtime],[endtime],[eventtype],[eventnote]) ").toString();
for (var i=0; i < socialsessions.length; i++) {
	socialsession = socialsessions[i];
	SQLmiddle = new String("VALUES('"+socialsession.socialdate+"','"+socialsession.start_time+"','"+socialsession.end_time+"','SOCIALTENNIS','"+socialsession.socialtext+"')");
	SQL1 = SQLstart + SQLmiddle;
	if (debugging && reporting) {
		Response.Write("<br />"+SQL1);
	}
	if (updating) {
		RS = Conn.Execute(SQL1);
	}
}

%>


