<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="json2.js.asp" -->
<!--#include file="boxleaguesobj.asp" -->

<%
//  Tee up some test data for two records to be returned
var theresult = true;
var boxpartner = "Ray BARNETT";
var boxname1 = "Tennis Box Leagues";
var boxname2 = "Tennis Doubles Box League";
var nopartner = "";

// Declare a new BookingsObject

var myBoxLeagues = new BoxLeaguesObject();

// Add a league

var league1 = myBoxLeagues.addLeague(boxname1,nopartner);
league1.addBoxmatch("Name 1",7,5);
league1.addBoxmatch("Name 2",8,4);

var league2 = myBoxLeagues.addLeague(boxname2,boxpartner);
league2.addBoxmatch("Name 3 and Name 4",10,2);

Response.ContentType = "application/json";
Response.Write(JSON.stringify(myBookings));

Response.End();

%>

