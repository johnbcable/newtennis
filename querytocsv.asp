<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// This page sends back CSV from a specified query as a downloaded file
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Details of Another Club");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var thequery; 		// Name of the pre-defined query to run
var refurl;			// Page calling this utility
var downloadfile;	// Name of the file to download
var SQLStmt;
var ConnObj, RS;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();


'Now retrieve query details from submitting form or querystring
'and initialise the strSQL variable with an SQL statement to query the database
thequery = Request.Form("query");
if (thequery == "" || thequery == "null" || thequery = "undefined") {
	thequery = Request.QueryString("query");
	if (thequery == "" || thequery == "null" || thequery = "undefined") {
		thequery = "coaches";
	}
}

refurl = Request.ServerVariables("HTTP_REFERRER");

downloadfile = Request.Form("download");
if (downloadfile == "" || downloadfile == "null" || downloadfile = "undefined") {
	downloadfile = Request.QueryString("download");
	if (downloadfile == "" || downloadfile == "null" || downloadfile = "undefined") {
		downloadfile = "coaches";
	}
}

debug = Request.Form("debug");
if (debug == "" || debug == "null" || debug = "undefined") {
	debug = Request.QueryString("debug");
	if (debug == "" || debug == "null" || debug = "undefined") {
		debug = "N";
	}
}
debug = new String(debug.toUpperCase()).toString();
if (debug == "Y")
	debugging = true;

// Now open connection to the database
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);

// Define SQL to be executed
SQLStmt = new String("SELECT * from "+thequery;

// Now we can select all records from the query 
// and write them out as CSV data


if (debugging) {
	Response.Write("thequery = [" + thequery + "]<br />");
	Response.Write("refurl = [" + refurl + "]<br />");
	Response.Write("downloadfile = [" + downloadfile + "]<br />");
	Response.Write("debug = [" + (debug ? "TRUE" : "FALSE") + "]<br />");
	Response.End(); 
} else {
	RS = ConnObj.Execute(SQLStmt);
	while (! RS.EOF)
	{
		Response.ContentType("application/json");
		Response.ContentDisposition

}

dataResults = QueryToJSON(adoCon, strSQL).Flush

Response.ContentType = "application/csv"

Response.Write(dataResults)
Response.End
%>
