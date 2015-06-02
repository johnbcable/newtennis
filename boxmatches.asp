<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="resultobj.asp" -->
<%
var oConn, RS;
var qry, connectstr;
var db_name, db_username, db_userpassword;
var db_server;
var myId, myLeagues;
var myForename, mySurname;
var myId = new String("0").toString();
var SQL1, SQL2;

// Should myLeagues be an array? '

db_server = new String("bu2.ebookingonline.net").toString();
db_name = new String("bookingdb29").toString();
db_username = new String("29Cabinet").toString();
db_userpassword = new String("aDj4cent").toString();

tablename = new String("members").toString();
myForename = new String("").toString();
mySurname = new String("").toString();

// Get QueryString parameters
myId = Request.QueryString("playerid");
if (myId == "" || myId == "null" || myId == "undefined")
{
	myId = new String("0").toString();
}

// Set up connection to remote MySQL database
connectstr = new String("Driver={MySQL ODBC 3.51 Driver};SERVER=" + db_server + ";DATABASE=" + db_name + ";UID=" + db_username + ";PWD=" + db_userpassword).toString();

var oConn = Server.CreateObject("ADODB.Connection");
var RS = Server.CreateObject("ADODB.Recordset");
oConn.Open(connectstr);

Response.Write("Fetching ebooking online involvement for player " + myId + "<br /><br />");

// My details ========================================================='
Response.Write("First, get player details from members table:<br /><br/>");

qry = "SELECT * FROM members WHERE membership_number = " + myId;

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myForename = RS("first_name");
	mySurname = RS("last_name");

	Response.Write("Name: " + myForename + " " + mySurname + "<br />");
	Response.Write("Membership Number (User ID): " + RS("membership_number") + "<br />");
	Response.Write("Email address: " + RS("email") + "<br />");
	RS.MoveNext();
}

/* 
' response.write "membership_number: " + oRS.Fields("membership_number") + ", first_name: " + oRS.Fields("first_name") + ", last_name: " + oRS.Fields("last_name") + ", password: "  + oRS.Fields("password") + ", active: "  + oRS.Fields("active") + ", priv_level: "  + oRS.Fields("priv_level") + ", special: "  + oRS.Fields("special") + ", colour: "  + oRS.Fields("colour") + ", email: "  + oRS.Fields("email") + ", remails: "  + oRS.Fields("remails") + ", html_email: "  + oRS.Fields("html_email") + ", bounce: "  + oRS.Fields("bounce")  + ", auth_id: "  + oRS.Fields("auth_id") + ", type_id: "  + oRS.Fields("type_id") + ", alt_membership_number: "  + oRS.Fields("alt_membership_number") + "<br><br>" 
'
*/

RS.Close();

// List of all leagues ========================================================='
Response.Write("Second, get list of all leagues involving player " + myForename + " " + mySurname + ":<br /><br/>");

qry = new String("SELECT * FROM leagues WHERE league_id IN (SELECT DISTINCT(league_id) FROM entrants WHERE membership_number = " + myId + ") ORDER BY league_id DESC").toString();

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	Response.Write("League ID:  " + RS("league_id") + "<br />");
	Response.Write("Name:  " + RS("name") + "<br /><br />");

/*
'response.write "league_id: " + oRS.Fields("league_id") + ", name: " + oRS.Fields("name") + ", ideal: " + oRS.Fields("ideal") + ", min: "  + oRS.Fields("min") + ", win: "  + oRS.Fields("win") + ", game: "  + oRS.Fields("game") + ", scored: "  + oRS.Fields("scored") + ", movement: "  + oRS.Fields("movement") + ", email: "  + oRS.Fields("email") + ", mobile: "  + oRS.Fields("mobile") + "<br><br>"
'
*/

	myLeagues = myLeagues + RS("league_id");
	RS.MoveNext();
}
RS.Close();

// List of all leagues ========================================================='
Response.Write("<h4>Third, get schedules from all leagues that are currently active and involve player " + myForename + " " + mySurname +  ":</h4><br /><br/>");

qry = "SELECT * FROM league_schedule WHERE league_id IN (1,4) AND active = 1 "

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	Response.Write("league_id: " + RS("league_id") + " start: " + RS("start") + ", finish: " + RS("finish") + ", division: " + RS("division_number") + ", period: "  + RS("period") + ",<br /> players: "  + RS("players") + ", <br />results: "  + RS("results") + ", <br />active: "  + RS("active") + "<br>");
	RS.MoveNext();	
}
RS.Close();

RS = null;
oConn = null;

%>
