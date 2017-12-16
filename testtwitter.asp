<%@language="JScript" CODEPAGE="65001" %>
<%
Response.AddHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Response.AddHeader("Pragma", "no-cache");
Response.AddHeader("Expires", 0);
Response.AddHeader("Access-Control-Allow-Origin", "*");
%>
<!--#include file="json2.js.asp" -->
<!--#include file="twitterobj.asp" -->

<%
//  Tee up some test data for two tweets to be returned
var theresult = true;
var players1 = ["John MORGANS", "Richard SMITH", "Will CURTIS"];
var players2 = ["Brian BLESSED*"];

// Declare a new TwitterObject

var myTweets = new TwitterObject("hamptontennis");

// Add bookings

myTweets.addTweet("10/04/2015","https://pbs.twimg.com/profile_images/1877871403/court_panorama_normal.jpg", "We are planning a couple of social tournaments for December, as follows: Friday 6th December 9am–11.30am Adult american doubles style...");
myTweets.addTweet("15/04/2015","https://pbs.twimg.com/profile_images/1877871403/court_panorama_normal.jpg","Finals day today. Matches start 12.30. Tea and cake 3.30. Presentations c3pm and c6pm. Good luck to all players.");


Response.ContentType = "application/json";
Response.Write(JSON.stringify(myTweets));

Response.End();

%>

