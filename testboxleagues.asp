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
var allboxleagues = new Array();

// Declare a new BoxLeagueObject

var league1 = new BoxLeagueObject(boxname1, "30/12/2014", "01/03/2015");

// Add a league

league1.setBoxPartner("");  // Not really necessary as it efaults to this anyway
league1.boxmatches.push({opponent: "Carol GRANT", myscore: 6, theirscore: 6 } );
league1.addBoxMatch("Stephen CARNEY",7,5);
league1.addBoxMatch("Gary LAWRENCE",0,0);
league1.addBoxMatch("Catherine ELEY",7,5);
league1.addBoxMatch("Sally LEACH",9,3);
league1.addBoxMatch("Matthew TOMLIN",6,6);

// Add league to composite Array
allboxleagues.push(league1);

// Now for the next league
// Declare with no parameters first and then set name, start and finish afterwards

var league2 = new BoxLeagueObject();
league2.setName(boxname2);
league2.setStart("30/12/2014");
league2.setFinish("01/03/2015");
league2.setBoxPartner(boxpartner);
league2.addBoxMatch("Steve PHELPS-JONES and Claire BOWIE",10,2);
league2.addBoxMatch("Stewart MAUDSLEY and Wayman MORRIS",6,6);
league2.addBoxMatch("Carol GRANT and Chris DURBIN",7,5);
league2.addBoxMatch("Jenny ROBERTS and Judith WILLIAMS",0,0);
league2.addBoxMatch("Jillian SMITH and Rachel MORGANS",10,2);
league2.addBoxMatch("Diane DAVIS and Louise BUSBY",11,1);

// Add league 2 to the composite object
allboxleagues.push(league2);

Response.ContentType = "application/json";
Response.AddHeader("Access-Control-Allow-Origin", "http://hamptontennis.org.uk");
Response.AddHeader("Access-Control-Allow-Origin", "http://www.hamptontennis.org.uk");
Response.Write(JSON.stringify(allboxleagues));

Response.End();

%>

