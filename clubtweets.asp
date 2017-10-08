<%@language="JScript" CODEPAGE="65001" %>
<%
Response.AddHeader("Access-Control-Allow-Origin", "*");
%>
<!--#include file="json2.js.asp" -->
<!--#include file="twitterobj.asp" -->
<!--#include file="userfuncs.asp" -->
<%
var oConn, RS;
var qry, qry2, qry3, connectstr;
var db_name, db_username, db_userpassword;
var db_server;
var myId, myLeagues;
var myForename, mySurname, myFullname;
var myId = new String("0").toString();
var SQL1, SQL2;
var playerknt, strplayers, strguests;
var bookingdate, bookingtime, bookedcourt;
var myId= getOnlineID();   // Retrieve the signed-in mambers online booking id
var mytweets = new TwitterObject("hamptontennis");
var inclause = new String("(").toString();
var inlist = new Array();
var debugging = false;   // default to production running

db_server = new String("bu2.ebookingonline.net").toString();
db_name = new String("bookingdb29").toString();
db_username = new String("29Cabinet").toString();
db_userpassword = new String("aDj4cent").toString();

tablename = new String("members").toString();
myForename = new String("").toString();
mySurname = new String("").toString();
myFullname = new String("").toString();

// Get QueryString parameters

// myId = Request.QueryString("playerid");
// if (myId == "" || myId == "null" || myId == "undefined")
// {
//	myId = new String("0").toString();
// }

mydebug = Request.QueryString("debug");
if (mydebug == "" || mydebug == "null" || mydebug == "undefined")
{
	mydebug = new String("N").toString();
}
if (mydebug == "Y") {
	debugging = true;
} else {
	debugging = false;
}







// Send JSON back to requester of not debugging

if (! debugging) {
	Response.ContentType = "application/json";
	Response.Write(JSON.stringify(mytweets));

	Response.End();
}


RS = null;
oConn = null;

%>
