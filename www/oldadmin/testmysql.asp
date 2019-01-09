
<%@language="JScript" CODEPAGE="65001" %>
<!--#include file="unserialize.js.asp" -->
<!--#include file="json2.js.asp" -->
<!--#include file="boxleaguesobj.asp" -->
<!--#include file="userfuncs.asp" -->
<%

function debugWrite(content) {
	if (debugging)
		Response.Write(content);
}

function showObject(obj) {
  var result = "";
  for (var p in obj) {
    if( obj.hasOwnProperty(p) ) {
      result += p + " , " + obj[p] + "\n";
    } 
  }              
  return result;
}

function getDoublesPartner(id) {

	var curpartner = new String("").toString();

	// Now, get the partner details if this is a doubles league

	partnerqry = new String("SELECT ep.partner, m.first_name, m.last_name FROM entrant_partner ep, members m WHERE ep.membership_number = "+id+" AND ep.league_id = "+RS("league_id") + " AND ep.partner = m.membership_number");

	RS2 = oConn.Execute(partnerqry);
	if (! RS2.EOF) {
		curpartner = new String(RS2("first_name")+" "+RS2("last_name")).toString();
	}
	RS2.Close();

	return (curpartner);
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
var myId = new String("0").toString();
var SQL1, SQL2;
var myleagues = new Array();
var allboxleagues = new Array();
var inclause = new String("").toString();
var playerdata = new String("").toString();
var playersarray = new Array();
var playernames = new Array();
var resultdata = new String("").toString();
var resultsarray = new Array();
var theseresults, resultlength, myresults;
var divlist = new Array();
var divinsert;
var myindex = 0;
var doublespartner = new String("").toString();
var allresults = new Array();
var mydebug = "N";
var myresults, myscore, theirscore;

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
myId = Request.QueryString("playerid");
if (myId == "" || myId == "null" || myId == "undefined")
{
	myId = new String("0").toString();
}

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
oConn.Open(connectstr);

// debugWrite("Fetching box league involvement for player " + myId + "<br /><br />");

// My details ========================================================='
// debugWrite("<h4>First, get player details from members table:<h4>");

qry = "SELECT * FROM members WHERE membership_number = " + myId;

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myForename = new String(RS("first_name")).toString();;
	mySurname = new String(RS("last_name")).toString();
	myFullname = new String(myForename + " " + mySurname).toString();

	// debugWrite("Name: " + myForename + " " + mySurname + "<br />");
	// debugWrite("Membership Number (User ID): " + RS("membership_number") + "<br />");
	// debugWrite("Email address: " + RS("email") + "<br />");
	RS.MoveNext();
}


RS.Close();

// List of all leagues ======================================================
// debugWrite("<h4>Second, get list of all leagues involving player " + myFullname + ":</h4>");

qry = new String("SELECT league_id, name FROM leagues WHERE league_id IN (SELECT DISTINCT(league_id) FROM entrants WHERE membership_number = " + myId + " UNION SELECT DISTINCT(league_id) FROM entrant_partner WHERE partner = " + myId + ") ORDER BY league_id DESC").toString();

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myleagueid = RS("league_id");

	// debugWrite("League ID:  " + myleagueid + "<br />");
	// debugWrite("Name:  " + RS("name") + "<br /><br />");

	myleagues.push(new String(myleagueid).toString());
	RS.MoveNext();
}
RS.Close();

inclause = new String("("+myleagues.toString()+")").toString();
debugWrite("inclause = "+inclause+"<br />");

// List of all schedules that are active ======================================
// debugWrite("<h4>Third, get schedules from all leagues that are currently active and involve player " + myFullname +  ":</h4>");

var playermatch = new String("%"+myId+"%").toString();


qry = "SELECT l.name, ls.league_id, ls.schedule_id, ls.division_number, DATE_FORMAT(ls.start, '%d/%m/%Y') AS boxstart, DATE_FORMAT(ls.finish, '%d/%m/%Y') AS boxend, ls.players, ls.results FROM league_schedule ls, leagues l WHERE l.league_id = ls.league_id AND ls.league_id IN " + inclause + " AND ls.active = 1 AND ls.players LIKE '"+playermatch+"'"; 

debugWrite("<p>Query is:<br />"+qry+"</p>");

RS = oConn.Execute(qry);

while (! RS.EOF)
{
	myleagueid = new String(RS("league_id")).toString();

	// debugWrite("<p>Processing league "+myleagueid+", division = "+RS("division_number")+"</p>");

	curleague = new BoxLeagueObject(RS("name"), RS("boxstart"), RS("boxend"));

	playerdata = new String(unserialize(RS("players"))).toString()

	// Now, only unserialize RS("results") if it is non-null

/*
	if ( ! (RS("results") == "")) {
		// debugWrite("<br />Results = "+RS("results")+"<br />");
		resultdata = unserialize(RS("results"));
	} else {
		resultdata = [];
	}
*/

	// Check if I am a player in this league

	playersarray = playerdata.split(",");
	playerslength = playersarray.length;


	var inthere = false;
	myindex = -1;
	for(var i=0; i<playersarray.length; i++) {
        if (playersarray[i] == myId) {
        	myindex=i;
	        inthere = true;
        }
    }


    if (inthere) {

		doublesleague = false;   // Default to singles league

		// Get my doubles partner if I have one

		curpartner = getDoublesPartner(myId);
		if (! (curpartner == "")) {
			doublesleague = true;
			curleague.setBoxPartner(curpartner);
		}

    	// Remove me from the array - cant play myself!

    	playersarray.splice(myindex,1);
   	
    	playerlist = new String(playersarray.toString());

		// debugWrite("league_id: " + RS("league_id") + " start: " + RS("boxstart") + ", finish: " + RS("boxend") + ", division: " + RS("division_number") + "<br />Players: " + playerdata + ", <br />Results: "  + resultdata + "<br>");

	    // debugWrite("<br />Players array now is: "+playerlist+"<br />");
	    
	    // Get all the names for the players in the playersarray
	    // Must do it in correct order, therefore multiple retrievals

		for(var i=0; i<playersarray.length; i++) {

	    	myopponent = 0;
	    	myscore = 0;
	    	theirscore = 0;
	    	myresults = [];

			curplayer = new String(playersarray[i]).toString();

		    // If this is a doubles league, get the name of the partner for this player

		    thepartner = new String("").toString();
		    if(doublesleague) {
		    	thepartner = getDoublesPartner(curplayer);
		    }

			// Create SQL to get details
		    innerqry = new String("SELECT first_name, last_name FROM members WHERE membership_number = "+curplayer).toString();

			RS2 = oConn.Execute(innerqry);
			while (! RS2.EOF)
			{
				// Create full name and add a boxmatch to the curleague
				fullname = new String(RS2("first_name")+" "+RS2("last_name")).toString();
				if (! (thepartner == "")) {
					fullname += " and "+thepartner;
				}
				// curleague.addBoxMatch(fullname,0,0);
				RS2.MoveNext();
			}
			RS2.Close();

			// Now print out resultdata

			// debugWrite("<br /><h5>Results</h5>"+resultdata+"<br /><br />");

			// Try using the function to determine the scores for me

		    myopponent = parseInt(curplayer);

			myscore = getScore(RS("results"),myId,myopponent);

		    // debugWrite("<br />In main section, myscore against "+curplayer+" = "+myscore+"<br />");

		    // Now need to get the score for myopponent

			theirscore = getScore(RS("results"),myopponent, myId);

		    // debugWrite("<br />In main section, their score (for player "+curplayer+") against me = "+theirscore+"<br />");

			// Make sure and add this match to the the current league 

			debugWrite("<br />Adding this match to the current box league: " +JSON.stringify(curleague)+"<br />");

			curleague.addBoxMatch(fullname,myscore,theirscore);

	    }

	    // allresults.push(resultdata);

		allboxleagues.push(curleague);  // Add the stuff from this league to the collection

	}   // end-if (I am part of this league)

	RS.MoveNext();	

}
RS.Close();

debugWrite("Results:<br /><br />"+JSON.stringify(allboxleagues)+"<br />");

// Send JSON back to requester if not debugging

if (! debugging) {
	Response.ContentType = "application/json";
	Response.Write(JSON.stringify(allboxleagues));

	Response.End();
}

RS = null;
oConn = null;

%>
