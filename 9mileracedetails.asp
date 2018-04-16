<%@language="JScript" CODEPAGE="65001"%>
<%
Response.AddHeader("Access-Control-Allow-Origin", "*");
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
%>
<%

// Set up cache control on this page

var strtime, strdate, title2;
var clubname = new String("Arden9 - Race Details");
var pagetitle = new String("Set race details for the current Arden 9 race");
// Now for any variables local to this page
var RS, Conn, SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb"); 
var SQLstart, SQLmiddle, SQLend;
var resultObj = new Object();
var uniqueref;
var today = new Date();
var mydebug;
var destinationtable = "arden9races";   
var raceyear, racedate, photolink, childrens1, childrens2, adult1;
var results, hamptonlink, childrensresults, racedatetext, racecomment, photoprovider;

var debugging = true;  // Production = false
var updating = false;   // Production = true    Add records to the database

// Process QueryString for run options
mydebug = Request.QueryString("debug");
if (mydebug == "" || mydebug == "null" || mydebug == "undefined")
{
	mydebug = new String("N").toString();
}
if (mydebug == "Y") {
	destinationtable = new String("arden9races").toString();
	debugging = true;
} else {
	destinationtable = new String("arden9races").toString();
	debugging = false;
}
raceyear = Request.QueryString("year");
if (raceyear == "" || raceyear == "null" || raceyear == "undefined")
{
	raceyear = new String("2018").toString();
}

/*

"race_year": 2018,
"race_date": "17/06/2018",
"photo_link": "http://www.hamptontennis.org.uk/arden9/9milephotos.asp",
"childrens1": "N",
"childrens2": "N",
"adult1": "Y",
"results": "9mileresults.asp?year=2018",
"hampton_link": "9milehina.asp?year=2018",
"childrens_results": "",
"race_date_text": "Sunday 18th June, 2017",
"race_comment": "TBA",
"photo_provider": null

*/

// Initialise to new values 
raceyear = 2018;
racedate = new String("17/06/2018").toString();
photolink = new String("http://www.hamptontennis.org.uk/arden9/9milephotos.asp");
childrens1 = new String("N").toString();
childrens2 = new String("N").toString();
adult1 = new String("Y").toString();
results = new String("9mileresults.asp?year=2018").toString();
hamptonlink = new String("9milehina.asp?year=2018").toString();
childrensresults = new String("").toString();
racedatetext = new String("Sunday 17th June, 2018").toString();
racecomment = new String("TBA").toString();
photoprovider = new String("").toString();


// Set up DB connections and unchanging bits of SQL
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
RS2 = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);

// Firstly see if this year has a row on the database


// Delete existing data from reference table 

SQL1 = new String("DELETE FROM arden9races WHERE [race_year] = "+raceyear);
if (debugging) {
	Response.Write(SQL1+"<br />");
}
if (updating) {
	RS2 = Conn.Execute(SQL1);
}

// Set up SQL insertion 

SQL2 = new String("INSERT INTO "+destinationtable+"([race_year],[race_date],[photo_link],[childrens1],[childrens2],[adult1],[results],[hampton_link],[childrens_results], [race_date_text], [race_comment], [photo_provider]) VALUES ('"+raceyear+"','"+racedate+"','"+photolink+"','"+childrens1+"','"+childrens2+"','"+adult1+"','"+results+"','"+hamptonlink+"','"+childrensresults+"','"+racedatetext+"','"+racecomment+"','"+photoprovider+"')").toString();
if (debugging) {
	Response.Write(SQL2+"<br />");
}
if (updating) {
	RS2 = Conn.Execute(SQL2);
}

Response.End();


%>


