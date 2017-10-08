<%@language="JScript" CODEPAGE="65001" %>
<%
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
Response.AddHeader("Access-Control-Allow-Origin", "*");
%>
<!--#include file="json2.js.asp" -->
<!--#include file="bookingsobj.asp" -->

<%
//  Tee up some test data for two records to be returned
var theresult = true;
var players1 = ["John MORGANS", "Richard SMITH", "Will CURTIS"];
var players2 = ["Brian BLESSED*"];

// Declare a new BookingsObject

var myBookings = new BookingsObject();

// Add bookings

myBookings.addBooking("10/04/2015","14:30", 1, players1);
myBookings.addBooking("15/04/2015","19:00", 3, players2);


Response.ContentType = "application/json";
Response.Write(JSON.stringify(myBookings));

Response.End();

%>

