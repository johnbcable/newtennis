<!--
METADATA
TYPE="typelib"
UUID="CD000000-8B95-11D1-82DB-00C04FB1625D"
NAME="CDO for Windows 2000 Library"
-->
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Welcome Message to New Members");
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
var dbconnect=Application("hamptonsportsdb");
var requesttemplate = new String("welcome.htm").toString();  // default welcome note
var debugging;
var memberObj = new Object();
var nomember = new String("-1").toString();
var memberid = new String(Request.Form("uniqueref")).toString();
if (memberid == "" || memberid == "null" || memberid == "undefined")
{
	memberid = new String(Request.QueryString("uniqueref")).toString();
	if (memberid == "" || memberid == "null" || memberid == "undefined") 
	{
		memberid = new String("-1").toString();
	}
}
memberObj = getMember(memberid);

// Now calculate the age of the member
var membersAge = currentAge(memberObj.dob);
if (membersAge < 7) {
	requesttemplate = new String("nobooking.htm").toString();  // default welcome note for under 7s	
}

var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var objCDOMail;
var sTo, the_email;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var RS, RS2, RS3;
var SQL1, SQL2;
var updatelog = true;
var kount;
var the_email;
var strtoday;
var attachfile1 = new String("welcome.pdf").toString();
var attachfile2;
var htmlindex, doctypeindex, fullmessage, tMessage;
var dummy;
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();
// Set up default greeting strings
kount = 0;
strdate = datestring();
strtime = timestring();
strtoday = today();
// Now set up database connections etc
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
// Now read in contents of HTML welcome template 
if (emaildir == "")
{
	 sMessage = new String(GetEveryThing(requesttemplate));
	 fullwhichfile = new String(requesttemplate).toString();
}
else
{
	 sMessage = new String(GetEveryThing(emaildir+"/"+requesttemplate));
	 fullwhichfile = new String(emaildir+"/"+requesttemplate).toString();
}	 
//
/// Now do merge field replacements on request template
doctypeindex = sMessage.indexOf("<!DOCTYPE");
htmlindex = sMessage.indexOf("<html");
fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();
sMessage = new String(fullmessage.replace("ZZforenameZZ",memberObj.forename1)).toString();
sMessage = new String(sMessage.replace("ZZsurnameZZ",memberObj.surname)).toString();
sMessage = new String(sMessage.replace("ZZonlinebookingidZZ",memberObj.onlinebookingid)).toString();
sMessage = new String(sMessage.replace("ZZonlinebookingpinZZ",memberObj.onlinebookingpin)).toString();
sMessage = new String(sMessage.replace("ZZmembergradeZZ",memberObj.grade)).toString();
sMessage = new String(sMessage.replace("ZZgenderZZ",memberObj.gender)).toString();
sMessage = new String(sMessage.replace("ZZageZZ",membersAge)).toString();
//
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// debugging = true;
// set up sender
sender = new String("secretary@hamptontennis.org.uk").toString();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
<style type="text/css">
<!--
#welcomediv {
				 position: relative;
				 margin: 20px auto;
}
#welcomebutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#welcometext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#welcometext p {
			 padding-left: 30px;
}						

#welcomebutton a, #welcomebutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
  font-weight: bold;
	padding: 5px 10px 6px; 
	color: #fff; 
	text-decoration: none;
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer;
}

#welcomebutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content"> 
		<h1>Admin:<b>&nbsp;<%= pagetitle %> </b></h1>
		<p>
			The standard welcome message has been sent out to <%= memberObj.forename1 %>&nbsp;<%= memberObj.surname %> from <%= sender %>
		</p>
		<p>
			Their online booking ID and PIN have been confirmed as being :-<br /><br />
			Online Booking User ID:    <%= memberObj.onlinebookingid %><br />
			Online Booking PIN:        <%= memberObj.onlinebookingpin %><br />
		</p>
		<p style="padding-bottom:20px;">
			A confirmatory email has also been sent to ensure that the online booking ID/PIN is set up in the next 48-hours.
		</p>
		<hr />
<%
// Now, send out the welcome email

ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT distinct(email), mailing, uniqueref from allmembers where uniqueref = 11");
if (! debugging)
	SQL1 = new String("SELECT distinct(email), mailing, uniqueref from allmembers where uniqueref = "+memberid);

Server.ScriptTimeout = 720;
RS = ConnObj.Execute(SQL1);
the_email = new String("Not specified");
kount = 0;
// if (attachfile1 != "NONE")
//	attachfile1 = Server.MapPath(attachfile1);
// if (attachfile2 != "NONE")
//	attachfile2 = Server.MapPath(attachfile2);
while (! RS.EOF)
{

	the_email = new String(RS("email")).toString();
	objCDOMail = newMailObject();   // in emailfuncs
	
	objCDOMail.From=new String(sender);
	objCDOMail.Subject=new String("Welcome to Hampton-in-Arden Tennis Club").toString();
	// objCDOMail.BodyFormat=0;
	// objCDOMail.MailFormat=0;
	// objCDOMail.Body=new String(tMessage).toString();
	objCDOMail.HTMLBody=new String(sMessage).toString();
	objCDOMail.BodyPart.charset = "utf-8";
	
// Next few lines deal with attachments
//	if (attachfile1 != "NONE")
//	{
//		// attachfile1 = Server.MapPath(attachfile1);
//	    // objCDOMail.AttachFile(attachfile1);
//	    objCDOMail.AddAttachment(attachfile1);
//	}
		
	objCDOMail.To=new String(the_email).toString();
	objCDOMail.Cc=new String("chairman@hamptontennis.org.uk").toString();
	Response.Write("Recipient is "+the_email+"<br>");
			try {
					objCDOMail.Send();
					}
			catch(e) {
			if (!(e.number &0xFFFF) == 0) {
				Response.Write("Error sending email<br /><br />");
				Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
				Response.Write("<br />");
				Response.Write("Error code:           "+e.number & 0xFFFF);
				Response.Write("<br />");
				Response.Write("Description:          "+e.description+"<br />");
				} else {
					kount += 1;
					Response.Write("Message sent to "+the_email)
				}

			}
	RS.MoveNext();
	objCDOMail=null;
}

%>
		<h2>What would you like to do now?</h2>
		<div>
			<ul>
				<li><a href="editmemb.asp?code=<%= memberObj.uniqueref %>">Edit <%= memberObj.forename1 %>'s details again</a><br /><br /></li>
				<li><a href="chk_memb.asp">Search members again</a><br /><br /></li>
			</ul>
		</div>   <!--  End of the what would you like to do njow div  -->

	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>

