<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="unserialize.js.asp" -->
<!--#include file="json2.js.asp" -->
<!--#include file="userfuncs.asp" -->
<%

// Set up cache control on this page
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);

var startdate, enddate, excludestart, escludeend;
var fees60, fees45, fees30;
var coachingobject = new Object();
var coachingresults = new Array();

//
var debugging = false;  // Production = false

// defaults for variables

coachingobject.startdate = "13/04/2015";
coachingobject.enddate = "18/07/2015";
coachingobject.excludestart = "25/05/2015";
coachingobject.excludeend = "31/05/2015";
coachingobject.fees60 = "80.00";
coachingobject.fees45 = "66.00";
coachingobject.fees30 = "51.00";

coachingresults.push(coachingobject);

if (! debugging) {

	Response.ContentType = "application/json";
	Response.Write(JSON.stringify(coachingresults));

	Response.End();
}

%>


