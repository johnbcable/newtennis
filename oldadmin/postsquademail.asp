<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Broadcasting Email to Squad Members");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	fcontents = new String(f.ReadAll()).toString();
	f.Close();
	return(fcontents);
}
var thefixture = new String(Request.Form("uniqueid")).toString();   // Uniquely identfies a fixture
if (thefixture == "" || thefixture == "null" || thefixture == "undefined")
	thefixture == new String("-1").toString();
var whichfile = new String(Request.Form("emailtemplate")).toString();
var debugging = new String(Request.Form("debug")).toString();
var queryname = new String(Request.Form("query")).toString();
var whofrom = new String(Request.Form("whofrom")).toString();
var title1 = new String(Request.Form("title1")).toString();
var title2 = new String(Request.Form("title2")).toString();
var title3 = new String(Request.Form("title3")).toString();
var para1 = new String(Request.Form("para1")).toString();
var para2 = new String(Request.Form("para2")).toString();
var para3 = new String(Request.Form("para3")).toString();
var confirmed = new String(Request.Form("confirm")).toString();
var themessage = new String(Request.Form("message")).toString();
var theadvert = new String("Keep your eyes on your email for more messages from the club").toString();
var thedisclaimer = new String("****** Disclaimer *******").toString();
var realemailpage = new String(Request.Form("realemailpage")).toString();
var dbconnect=Application("hamptonsportsdb");
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sSubject = new String(Request.Form("subject"));
var sPersonal = new String(Request.Form("whotopersonal"));
var sMessage, fullmessage;
var objCDOMail;
var sTo;
var ConnObj, ConnObj2;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3, SQL4;
var thesquadid, v_memberid, v_usercode;
// Initialise fixture variables
var theteam=new String("Not specified").toString();
var thevenue=new String("Not specified").toString();
var thefixturedate=new String("Not specified").toString();
var theopponents=new String("Not specified").toString();
var thepair1=new String("Not specified").toString();
var thepair2=new String("Not specified").toString();
var oSquad = new Object();
var thesquadobj;
var emaildir = new String("emails").toString();
// End of variable declarations
if (!signedin())
	Response.Redirect("login.asp");
// Manual resets of flag variables
current_debug_status() = true;
confirmed = new String("N").toString();
//
thesquadid = new String(mySquadID()).toString();
thesquadobj = getSquad(thesquadid);
// set the following variable to Y  if actually sending email
var sending = new String("N").toString();      
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("").toString();
if (! (thefixture=="-1"))
{
	// A fixture was specified so we need to get the fixture info
	SQL1 = new String("SELECT * from tennisfixtures where fixtureid = "+thefixture);
	RS = ConnObj.Execute(SQL1);
	while (! RS.EOF)
	{
		theteam=new String(RS("teamname")).toString();
		thevenue=new String(RS("homeoraway")).toString();
		dummy1=new Date(RS("fixturedate"));
		thefixturedate = dateasstring(dummy1);
		theopponents=new String(RS("opponents")).toString();
		thepair1=new String(RS("pair1")).toString();
		thepair2=new String(RS("pair2")).toString();
		RS.MoveNext();
	}
	if (thepair1 == "" || thepair1 == "null" || thepair1 == "undefined")
		thepair1 = new String("Not specified").toString();
	if (thepair2 == "" || thepair2 == "null" || thepair2 == "undefined")
		thepair2 = new String("Not specified").toString();
	if (thevenue == "H")
		thevenue = new String("Home")
	else
		thevenue = new String("Away");
	sSubject = new String(thevenue+" match on "+thefixturedate+" vs "+theopponents).toString();
	SQL1 = new String("UPDATE tennisfixtures set pair1='"+thepair1+"',pair2='"+thepair2+"' WHERE fixtureid="+thefixture).toString();
}
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	whichfile = new String("messtemp.htm");
if (current_debug_status() == "null" || current_debug_status() == "undefined" || current_debug_status() == "")
	current_debug_status() = new String("N").toString();
if (queryname == "null" || queryname == "undefined" || queryname == "")
	queryname = new String("members").toString();
// Process message title area
if (title1 == "null" || title1 == "undefined" || title1 == "")
	title1 = new String(" ").toString();
else
	title1 = new String("<p align=center><b>"+title1+"</b></p>");
if (title2 == "null" || title2 == "undefined" || title2 == "")
	title2 = new String(" ").toString();
else
	title2 = new String(title2);
if (title3 == "null" || title3 == "undefined" || title3 == "")
	title3= new String(" ").toString();
else
	title3 = new String(title3);
// Process message text area inserts
if (para1 == "null" || para1 == "undefined" || para1 == "")
	para1 = new String(" ").toString();
else
	para1 = new String("<p align=center><b>"+para1+"</b></p>");
if (para2 == "null" || para2 == "undefined" || para2 == "")
	para2 = new String(" ").toString();
else
	para2 = new String("<br />GG"+para2+"GG<br />");
if (para3 == "null" || para3 == "undefined" || para3 == "")
	para3= new String(" ").toString();
else
	para3 = new String("<br />"+para3+"<br />");
// Now read in contents of HTML email message
if (emaildir == "")
	 sMessage = new String(GetEveryThing(whichfile));
else
	 sMessage = new String(GetEveryThing(emaildir+"/"+whichfile));
// Get details of currently logged on user
v_memberid = getUserID();
v_usercode = getUserCode();
//
SQLStmt = new String("SELECT m.email, m.forename1 from members m WHERE m.uniqueref in (SELECT uniqueref from squadmembers WHERE squadid ="+thesquadid+")").toString();
if (confirmed == "N")
	SQLStmt = new String("SELECT m.email, m.forename1 from members m WHERE m.uniqueref = '"+v_usercode+"'").toString();
// End of page start up coding
Server.ScriptTimeout = 360;
// Now do merge field replacements
sMessage = processSquadMergeFields(sMessage,thefixture);
sMessage = new String(sMessage.replace("ZZmessageZZ",themessage)).toString();
sMessage = new String(sMessage.replace("ZZteamZZ",thesquadobj.squadname)).toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="tennis3col.css" />
	<link rel="stylesheet" type="text/css" href="softboxes.css" />
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" />
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<div id="container">
	<div id="header">
		<img id="clublogo" src="images/logo.gif" width="88" height="100" alt="Hampton-In-Arden Sports Club logo" />
		<h2>Hampton-In-Arden Sports Club</h2>
		<h3>Tennis Section</h3>
			<!--#include file="horizmenu.asp" -->
	</div>
	<div id="content">
		<div id="mainContent">
			<br />
			<h3>Sending <%= theteam %> squad emails</h3>
			<p class="leftindent">
				<b>Subject: <%= sSubject %></b><br /><br />
				<u>Message</u><br /><br />
			</p>
			<div id="sentemailconfirmations" class="borderboth" style="background-color: white;">
				<%= sMessage %>
<%
// Firstly, we need to update the tennis fixture detail once only if this email is about a fixture
if (! (thefixture=="-1"))
{
	RstObj=ConnObj.Execute(SQL1);
}
//
if (! current_debug_status())
{
	RstObj = ConnObj.Execute(SQLStmt);
	while (! RstObj.EOF)
	{
		sForename = new String(RstObj("forename1")).toString();
		// fullmessage = new String(sMessage).toString();
		fullmessage = new String(sMessage.replace("ZZforenameZZ",sForename)).toString();
		if (sending=="Y")
		{
	
			// objCDOMail = new ActiveXObject("CDONTS.NewMail");

			objCDOMail = newMailObject();  // in emailfuncs.asp
	
			objCDOMail.From=new String("secretary@hamptontennis.org.uk");
			objCDOMail.Subject=new String(sSubject).toString();
			objCDOMail.HTMLBody=new String(fullmessage);
			
			objCDOMail.To=new String(RstObj("email"));
			dummy=new String("["+RstObj("email")+"]");
			if (! (dummy=="[]"))
			{
				Response.Write("Recipient is ["+RstObj("email")+"]<br />");
				objCDOMail.Send();
			}
		}
		RstObj.MoveNext();
		objCDOMail=null;
	}
}
%>
				<br />
				<p class="centered">
					<form id="squademailchoices" action=
				</p>
			</div>
		</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>













