<%@language="JScript"%>
<%

var rssResults = new String("").toString();
var rssStart = new String("").toString();
var rssEnd = new String("").toString();
var rssItems = new String("").toString();

//  Add in DB connectors and selectors to construct real RSS data
//  N.B. rssStart, rssEnd and rssItems will  all need to change
	var RS, RS2, Conn, SQL1, SQL2, dbconnect, uniqref;
	var mDateObj, dummy1;

	dbconnect=Application("hamptonsportsdb");
	Conn = Server.CreateObject("ADODB.Connection");
	RS = Server.CreateObject("ADODB.RecordSet");
	Conn.Open(dbconnect);
	// Need to query league results
	SQL1 = new String("SELECT * FROM tennisfixtures where teamname = 'Mens 1st Team' and fixtureyear = 2018 ORDER BY fixturedate;").toString();
	RS = Conn.Execute(SQL1);

/*
-- Constant data
*/

rssStart = "<?xml version='1.0' encoding='utf-8'?><rss version='2.0'><channel><title>Test RSS Channel</title><description>Mens 1st Team Results</description><link>https://hamptontennis.org.uk</link>";

rssEnd = "</channel></rss>";

// Now loop creating item entries as we go

var curItem = new String("").toString();
while  (! RS.EOF) 
{
	curItem = new String("").toString();



	// Add onto end of rssItems
	rssItems += curItem;
}


rssItems = "<item><title>Item Title</title><description>Updated on: 5/20/2018</description><link>https://hamptontennis.org.uk/fetchRSS.asp</link></item><item><title>Item Title 2</title><description>Updated on: 5/20/2018</description><link>https://hamptontennis.org.uk/fetchRSS.asp</link></item>";

rssResults = rssStart+rssItems+rssEnd;

Response.ContentType = "application/rss+xml";
Response.Write(rssResults);
Response.End();
%>
