<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="unserialize.js.asp" -->
<!--#include file="json2.js.asp" -->
<!--#include file="boxleaguesobj.asp" -->
<!--#include file="userfuncs.asp" -->
<%

<<<<<<< HEAD
var myId = new String("0").toString();
var realId = new String("0").toString();

=======
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
function debugWrite(content) {
	if (debugging)
		Response.Write(content);
}

function getDoublesPartner(id) {

<<<<<<< HEAD
	var thepartner = new String("").toString();
=======
	var curpartner = new String("").toString();
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

	// Now, get the partner details if this is a doubles league

	partnerqry = new String("SELECT ep.partner, m.first_name, m.last_name FROM entrant_partner ep, members m WHERE ep.membership_number = "+id+" AND ep.league_id = "+RS("league_id") + " AND ep.partner = m.membership_number");

	RS2 = oConn.Execute(partnerqry);
	if (! RS2.EOF) {
<<<<<<< HEAD
		thepartner = new String(RS2("first_name")+" "+RS2("last_name")).toString();
	}
	RS2.Close();

	return (thepartner);
=======
		curpartner = new String(RS2("first_name")+" "+RS2("last_name")).toString();
	}
	RS2.Close();

	return (curpartner);
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
}

function getPlayerName(id) {

	var playername = new String("").toString();
	var nameqry = new String("").toString();

	// Now, get the player details from the members table

	nameqry = new String("SELECT first_name, last_name FROM members WHERE membership_number = "+id);

	RS2 = oConn.Execute(nameqry);
	if (! RS2.EOF) {
		playername = new String(RS2("first_name")+" "+RS2("last_name")).toString();
	}
	RS2.Close();

	return (playername);
}

function getScore(resultsfield, id, otherid) {

	var resultdata = new Array();
	var parsed, dummyObj, arr;
	var myresults = new Object();
	var myscore = 0;
	var otherguy = 0;
	var opponent = otherid;

	// Now, only unserialize resultsfield if it is non-null

	if ( ! (resultsfield == "")) {
		// debugWrite("<br />Inside getScore, resultsfield = "+resultsfield+"<br />");
		resultdata = unserialize(RS("results"));
	} else {
		resultdata = [];
	}

	// Now print out resultdata

	debugWrite("<p>Inside getScore: results= "+resultdata+", id="+id+", opponent="+opponent+"<p>");

	parsed = JSON.parse(JSON.stringify(resultdata));

	arr = [];
	dummyObj = new Object();
	for(var x in parsed){
		if (x == id) {
			// Only interested in results for id
			dummyObj = new Object(parsed[x]);
			// debugWrite("<br />Inside getMyScores dummyObj contains "+JSON.stringify(dummyObj)+"<br />");
			arr[x] = (dummyObj);
			// debugWrite("Inside getMyScores Contents of arr["+x+"] = "+JSON.stringify(arr[x])+"<br />");
		}
	}

	debugWrite("<p>dummyObj inside getScore is: "+JSON.stringify(arr[id])+"</p>");

	// what to do now before we return it?

	myresults = new Object(arr[id]);

	debugWrite("<p>myresults before loop: "+JSON.stringify(myresults)+"</p>");

	// Now loop through and return the score for the match against opponent (defaults to zero)

	myscore = 0; 		//defaults to zero
	otherguy = 0;
  	for (var p in myresults) {
  		otherguy = parseInt(p);
  		debugWrite("<p>otherguy now set to "+otherguy+" and opponent = "	+opponent+"</p>");
  		debugWrite("<p>typeof otherguy = "+typeof otherguy+" and typeof opponent = "+typeof opponent+"</p>");
  		if (otherguy == opponent) {
	  		debugWrite("<p>p = "+p+", myresults[p] = "+myresults[p]+"</p>");  			
	  		myscore = new Number(myresults[p]);
  		}
	}   

	debugWrite("<p>the score to be returned is: "+myscore+"</p><p>================================</p>");
	return(myscore);

}

var oConn, RS, RS2;
var qry, partnerqry, innerqry, connectstr;
var db_name, db_username, db_userpassword;
var db_server;
var myId;    // onlinebookingid for this person
var myForename, mySurname, myFullname;
<<<<<<< HEAD
=======
var myId = new String("0").toString();
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
var SQL1, SQL2;
var myleagues = new Array();
var allboxleagues = new Array();
var inclause = new String("").toString();
var playerdata = new String("").toString();
var playersarray = new Array();
var playernames = new Array();
var resultdata = new String("").toString();
var resultsarray = new Array();
var divlist = new Array();
var divinsert;
var myindex = 0;
var doublespartner = new String("").toString();
var myscore, theirscore, myopponent;

db_server = new String("bu2.ebookingonline.net").toString();
db_name = new String("bookingdb29").toString();
db_username = new String("29Cabinet").toString();
db_userpassword = new String("aDj4cent").toString();

tablename = new String("members").toString();
myForename = new String("").toString();
mySurname = new String("").toString();
myFullname = new String("").toString();
innerqry = new String("").toString();
partnerqry = new String("").toString();

// Get QueryString parameters

myId= getOnlineID();   // Retrieve the signed-in mambers online booking id

// TODO: What to do if not signed-in?

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

// Set up connection to remote MySQL database
connectstr = new String("Driver={MySQL ODBC 3.51 Driver};SERVER=" + db_server + ";DATABASE=" + db_name + ";UID=" + db_username + ";PWD=" + db_userpassword).toString();

var oConn = Server.CreateObject("ADODB.Connection");
var RS = Server.CreateObject("ADODB.Recordset");
var RS2 = Server.CreateObject("ADODB.Recordset");
var RS3 = Server.CreateObject("ADODB.Recordset");
oConn.Open(connectstr);

// My details ========================================================='
if (debugging) {
	debugWrite("First, get details of me:<br /><br/>");
}

qry = "SELECT * FROM members WHERE membership_number = " + myId;

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myForename = new String(RS("first_name")).toString();;
	mySurname = new String(RS("last_name")).toString();
	myFullname = new String(myForename + " " + mySurname).toString();

		debugWrite("Name: " + myForename + " " + mySurname + "<br />");
		debugWrite("Membership Number (User ID): " + RS("membership_number") + "<br />");
		debugWrite("Email address: " + RS("email") + "<br />");

	RS.MoveNext();
}


RS.Close();

	debugWrite("qry = : "+qry+"<br /><br/>");

// List of all leagues ======================================================

	debugWrite("<h4>Second, get list of all leagues involving player " + myFullname + ":</h4>");

qry = new String("SELECT league_id, name FROM leagues WHERE league_id IN (SELECT DISTINCT(league_id) FROM entrants WHERE membership_number = " + myId + " UNION SELECT DISTINCT(league_id) FROM entrant_partner WHERE partner = " + myId + ") ORDER BY league_id DESC").toString();

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myleagueid = RS("league_id");

		debugWrite("League ID:  " + myleagueid + "<br />");
		debugWrite("Name:  " + RS("name") + "<br /><br />");

	myleagues.push(new String(myleagueid).toString());
	RS.MoveNext();
}
RS.Close();

// Add dummy league on the end so there is always > 1 in the IN clause
myleagues.push(new String(9999).toString());  

inclause = new String("("+myleagues.toString()+")").toString();

	debugWrite("inclause = "+inclause+"<br />");

	
// List of all schedules that are active ======================================

	debugWrite("<h4>Third, get schedules from all leagues that are currently active and involve player " + myFullname +  ":</h4>");

var playermatch = new String("%"+myId+"%").toString();

// qry = "SELECT l.name, ls.league_id, ls.schedule_id, ls.division_number, DATE_FORMAT(ls.start, '%d/%m/%Y') AS boxstart, DATE_FORMAT(ls.finish, '%d/%m/%Y') AS boxend, ls.players, ls.results FROM league_schedule ls, leagues l WHERE l.league_id = ls.league_id AND ls.league_id IN " + inclause + " AND ls.active = 1 AND ls.players LIKE '"+playermatch+"'"; 

qry = "SELECT l.name, ls.league_id, ls.schedule_id, ls.division_number, DATE_FORMAT(ls.start, '%d/%m/%Y') AS boxstart, DATE_FORMAT(ls.finish, '%d/%m/%Y') AS boxend, ls.players, ls.results FROM league_schedule ls, leagues l WHERE l.league_id = ls.league_id AND ls.league_id IN " + inclause + " AND ls.active = 1"; 

	debugWrite("<p>Query is:<br />"+qry+"</p>");

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myleagueid = new String(RS("league_id")).toString();

		debugWrite("<p>Processing league "+myleagueid+", division = "+RS("division_number")+"</p>");
		debugWrite("<br />Players list =  "+RS("players")+"<br /><br />");

	// Set up a new BoxLeague object to hold JSON for this league

	curleague = new BoxLeagueObject(RS("name"), RS("boxstart"), RS("boxend"));
	
	// All leagues if on the database will have a set of players so no need to test 
<<<<<<< HEAD
	// if the database field has any content before unserialise-ing it

	playerdata = new String(unserialize(RS("players"))).toString();

	// Check if I am a player in this league 
	// or if I am a partner, we need to use the 
	// otherr person listed.
=======
	// if the database field has any conetnt before unserialise-ing it

	playerdata = new String(unserialize(RS("players"))).toString();

	// Now, only unserialize RS("results") if it is non-null

/*
	if ( ! (RS("results") == "")) {

			debugWrite("<br />Results = "+RS("results")+"<br />");

		resultdata = unserialize(RS("results"));
	} else {
		resultdata = [];
	}
*/

	// Check if I am a player in this league 
	// or if I am a partner, we need to use the 
	// person listed playerdata.
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

	playersarray = playerdata.split(",");
	playerslength = playersarray.length;

	var inthere = false;
	myindex = -1;
	var tmpplayer, tmpdoubles;
<<<<<<< HEAD

=======
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
	for(var i=0; i<playersarray.length; i++) {
		tmpplayer = playersarray[i];
        if (playersarray[i] == myId) {
        	myindex=i;
<<<<<<< HEAD
        	realId = myId;
	        inthere = true;
	        break;
        } else {
        	// Check if I am the partner to this person

=======
	        inthere = true;
        } else {
        	// Check if I am the partner to this person

			// debugWrite("Checking if "+myId+" is the partner of "+tmpplayer+"<br />");

>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
        	tmpdoubles = getDoublesPartner(tmpplayer);

			debugWrite("Doubles partner for "+tmpplayer+" is "+tmpdoubles+"<br />");

			if (! (tmpdoubles == "")) {
				if (tmpdoubles == myFullname) {
					debugWrite(myId+" IS the partner of "+tmpplayer+"<br />");
					myindex = i;
<<<<<<< HEAD
					realId = playersarray[i];
					inthere = true;
					break;
=======
					inthere = true;
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
				}
			}

        }
    }

<<<<<<< HEAD
    debugWrite("<br />From now on, "+realId+" is the player we will use to get results data<br />");
=======
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

    if (inthere) {

		doublesleague = false;   // Default to singles league
		curpartner = new String("").toString();

		// Get my doubles partner if I have one

<<<<<<< HEAD
		if (realId == myId) {
			curpartner = getDoublesPartner(myId);
		} else {
			curpartner = getPlayerName(realId);
		}

=======
		curpartner = getDoublesPartner(myId);
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
		if (! (curpartner == "")) {
			doublesleague = true;
			curleague.setBoxPartner(curpartner);
		}

<<<<<<< HEAD
		debugWrite("<br />Is this a doubles league?"+ (doublesleague ? "Yes" : "No") +" - partner: "+curpartner+"<br />" );

    	// Remove me (or partner if they are the main player) from the array
=======
    	// Remove me from the array - cant play myself!
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

	   	playersarray.splice(myindex,1);
   	
    	playerlist = new String(playersarray.toString());

			debugWrite("league_id: " + RS("league_id") + " start: " + RS("boxstart") + ", finish: " + RS("boxend") + ", division: " + RS("division_number") + "<br />Players: " + playerdata + ", <br />Results: "  + RS("results") + "<br>");
		    debugWrite("<br />Players array now is: "+playerlist+"<br />");
	    
	    // Get all the names for the players in the playersarray
	    // Must do it in correct order, therefore multiple retrievals

		for(var i=0; i<playersarray.length; i++) {

			// Initialise scores
	    	myscore = 0;
	    	theirscore = 0;
	    	myopponent = 0;
	    	myresults = [];

			curplayer = new String(playersarray[i]).toString();

		    // If this is a doubles league, get the name of the partner for this opponent

		    thepartner = new String("").toString();
		    if(doublesleague) {
		    	thepartner = getDoublesPartner(curplayer);
		    }

			// get current player name and add partner name if applicable

			fullname = getPlayerName(curplayer);
			if (! (thepartner == "")) {
				fullname += " and "+thepartner;
			}

<<<<<<< HEAD
			debugWrite("My/our opponents are: "+fullname+"<br />");

		    // Now we have to traverse resultdata scores relating to me
=======
		    // Now we have to traverse resultdata for my own scores
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

		    	debugWrite("<br />resultdata = "+JSON.stringify(resultdata)+"<br />");

		    myopponent = parseInt(curplayer);

<<<<<<< HEAD
			myscore = getScore(RS("results"),realId,myopponent);
=======
			myscore = getScore(RS("results"),myId,myopponent);
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

		    debugWrite("<br />In main section, myscore against "+curplayer+" = "+myscore+"<br />");

		    // Now need to get the score for myopponent

<<<<<<< HEAD
			theirscore = getScore(RS("results"),myopponent, realId);
=======
			theirscore = getScore(RS("results"),myopponent, myId);
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61

		    debugWrite("<br />In main section, their score (for player "+curplayer+") against me = "+theirscore+"<br />");

			// Make sure and add this match to the the current league 

			debugWrite("<br />Adding this match to the current box league<br />");

			curleague.addBoxMatch(fullname,myscore,theirscore);

	    }

		allboxleagues.push(curleague);

	}   // end-if (I am part of this league)

	RS.MoveNext();	

}
RS.Close();

	debugWrite("List of box leagues I am involved in:<br /><br />"+JSON.stringify(allboxleagues)+"<br />");

// Send JSON back to requester if not debugging

if (! debugging) {

	Response.ContentType = "application/json";
	Response.Write(JSON.stringify(allboxleagues));

	Response.End();
}


RS = null;
oConn = null;

%>
