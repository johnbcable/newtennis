<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="json2.js.asp" -->
<!--#include file="bookingsobj.asp" -->
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
var mybookings = new BookingsObject();
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

//
//   TODO:
//
//   How to pick up bookings if you didnt book them
//   What to do if not signed-in
//

// Set up connection to remote MySQL database
connectstr = new String("Driver={MySQL ODBC 3.51 Driver};SERVER=" + db_server + ";DATABASE=" + db_name + ";UID=" + db_username + ";PWD=" + db_userpassword).toString();

var oConn = Server.CreateObject("ADODB.Connection");
var RS = Server.CreateObject("ADODB.Recordset");
var RS2 = Server.CreateObject("ADODB.Recordset");
var RS3 = Server.CreateObject("ADODB.Recordset");
oConn.Open(connectstr);

// My details ========================================================='
if (debugging) {
	Response.Write("First, get player details from members table:<br /><br/>");
}

qry = "SELECT * FROM members WHERE membership_number = " + myId;
if (debugging) {
	Response.Write("SQL1 = : "+SQL1+"<br /><br/>");
}

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myForename = RS("first_name");
	mySurname = RS("last_name");
	myFullname = new String(myForename + " " + mySurname).toString();

	if (debugging) {
		Response.Write("Name: " + myForename + " " + mySurname + "<br />");
		Response.Write("Membership Number (User ID): " + RS("membership_number") + "<br />");
		Response.Write("Email address: " + RS("email") + "<br />");
	}

	RS.MoveNext();
}

RS.Close();

// List of all court bookings
// N.B.  Tennis is sport_id = 2
//       Court_id must have 2 taken off it to reflect correct tennis court number

if (debugging) {
	Response.Write("Second, get list of all future tennis court bookings involving player " + myForename + " " + mySurname + ":<br /><br/>");
}

// Need to return distinct set of booking refs if you booked them or are part of the booking

qry = new String("SELECT ref FROM bookings WHERE membership_number = " + myId + " AND sport_id = 2 AND time > (DATE_SUB(CURDATE(), INTERVAL 1 DAY)) AND deleted NOT LIKE 1 UNION SELECT ref FROM players WHERE membership_number = " + myId + " UNION SELECT ref FROM guests WHERE player = " + myId);
RS = oConn.Execute(qry);
while (! RS.EOF) {
	inlist.push(new String(RS("ref")).toString());
	RS.MoveNext();
}
RS.Close();
inclause = new String("("+inlist.toString()+")").toString();
if (debugging) {
	Response.Write("The target ref list is + " + inclause + ":<br /><br/>");
}

qry = new String("SELECT ref, DATE_FORMAT(time, '%d/%m/%Y') AS bookingdate, DATE_FORMAT(time, '%H%i') AS bookingtime, (court_id-2) AS court FROM bookings WHERE ref IN " + inclause + " AND sport_id = 2 AND time > (DATE_SUB(CURDATE(), INTERVAL 1 DAY)) AND deleted NOT LIKE 1 ORDER BY time ASC").toString();

RS = oConn.Execute(qry);

if (debugging) {
	Response.Write("<h3>Results</h3><table>")
}
while (! RS.EOF)
{
	bookingdate = new String(RS("bookingdate")).toString();
	bookingtime = new String(RS("bookingtime")).toString();
	bookedcourt = new String(RS("court")).toString();

	if(debugging) {
		Response.Write("<tr>");
		Response.Write("<td>ref:  " + RS("ref") + "</td>");
		Response.Write("<td>court_id:  " + RS("court") + "</td>");
		Response.Write("<td>On:  " + RS("bookingdate") + " at " + RS("bookingtime") + "</td>");
		Response.Write("</tr>");
	}

	//  Now, for each booking, get list of membership numbers on booking

	bookingref = RS("ref");

	// Now pick up guests and members 
	// First query players (membership_number will be 1 if this person is a guest)

	qry2 = new String("SELECT p.membership_number, p.player, m.first_name, m.last_name FROM players p, members m WHERE p.membership_number = m.membership_number AND p.ref = "+bookingref+ " ORDER BY p.player ASC");

	playerknt = 0;
	strplayers = new String("");
	strguests = new String("");
	RS2 = oConn.Execute(qry2);

	if (debugging) {
		Response.Write("<tr>");  // start a new row for the debug info
	}

	while (! RS2.EOF)
	{
		var dummy = new String(RS2("membership_number")).toString();
		var fullname = new String(RS2("first_name")+" "+RS2("last_name")).toString();

		if (dummy == "1") {
			fullname = new String("").toString();
			// This player is a guest - get their Name
			qry3 = new String("SELECT guest FROM guests WHERE ref = "+bookingref+" AND player = "+RS2("player")).toString();
			RS3 = oConn.Execute(qry3);
			if (! RS.EOF) {
				fullname = new String(RS3("guest")).toString();
				fullname += "*";
			}
		}

		if (! (fullname == myFullname)) {    // leave me out of the other players list
			strplayers += fullname + " ";	
		}
		
		playerknt += 1;   // increment count of players
		RS2.MoveNext();
	}
	RS2.Close();

	// Now we have the list of players other than me, so create the bookings ref

	mybookings.addBooking(bookingdate, bookingtime, bookedcourt, strplayers);


	if (debugging) {
		Response.Write("<td>Number of people in this booking: "+playerknt+"<br />");
		Response.Write("Players: "+strplayers+"<br />");
		Response.Write("</td>");
		Response.Write("</tr>");
	}

	RS.MoveNext();
}
if (debugging) {
	Response.Write("</table><br />");
}

RS.Close();


// Send JSON back to requester of not debugging

if (! debugging) {
	Response.ContentType = "application/json";
	Response.AddHeader("Access-Control-Allow-Origin", "http://hamptontennis.org.uk");
	Response.AddHeader("Access-Control-Allow-Origin", "http://www.hamptontennis.org.uk");
	Response.Write(JSON.stringify(mybookings));

	Response.End();
}


RS = null;
oConn = null;

%>
