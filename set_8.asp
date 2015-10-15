<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Eighth Birthday ");
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
// Now for any variables local to this page
var zz3, dummy;
var RS, Conn, dbconnect;
var SQLText;
var SQL2 = new String("").toString();
var kount = 0;
var memberknt;
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
var updating=true;
var v_memberid = getUserID();
var memberObj = new Object();
var result = new Object();
var resulttext = new String("").toString();
var supporttemplate = new String("youare8.htm").toString();
var coachtemplate = new String("coaching8yearold.htm").toString();
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();
var sMessage = new String("").toString();
var mNew;
var mAge, mNextBirthday, dummydate, dummy1;
var dateArr, theYear, theMonth, theDay;
var mUnique = new String(Request.QueryString("id")).toString();
if (mUnique == "" || mUnique == "null"  || mUnique == "undefined") {
	mUnique = new String("11").toString();
}
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
//
debugging = true;
// End of page start up coding

// Initialise update variables from prior form
SQLText = new String("").toString();
SQLAudit = new String("").toString();
SQL2 = new String("").toString();

memberObj = getMember(mUnique);

// Calculate current age 
if (memberObj.dob == "" || memberObj.dob == "null" || memberObj.dob == "undefined")
{
	mAge = new String("Not Known");
	mNextBirthday = new String("soon");
} else {
	mAge = currentAge(memberObj.dob);
	// memberObj.dob in dd/mm/yyyy format already
	dateArr = memberObj.dob.split("/");
	theYear = dateArr[2];
	theMonth = new Number(dateArr[1])-1;  // Month numbers start at zero in Javascript
	theDay = dateArr[0];
	dummy1 = new Date(theYear,theMonth,theDay,0,0,0);
	mNextBirthday = nextBirthday(dummy1);
}

pagetitle += " for " + memberObj.forename1 + " " + memberObj.surname;
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
// Now write audit record
SQLaudit = new String("insert into member_audits([memberid],[action]) values ('"+v_memberid+"','18TH BIRTHDAY ("+memberObj.uniqueref+" - "+memberObj.forename1+" "+memberObj.surname+")')");
if (debugging)
	Response.Write("SQLaudit = ["+SQLaudit+"]</br />");
RS = Conn.Execute(SQLaudit);
//
RS=null;
Conn.Close();
Conn=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title>Hampton-In-Arden Tennis Club Home Page</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production -->
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
	<script language="Javascript" src="datetimepicker.js"></script>
</head>
<body>
<!--#include file="dateval.asp" -->
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Administration:&nbsp;<b>Updating details for <%= memberObj.forename1 %>&nbsp;<%= memberObj.surname %></b></h1>
<%
Response.Write("<p>Sending 18th birthday emails ... <br /><br />");

// ========================================================================
// Now send note to member who is (or soon will be) 18.
//=========================================================================

// Read in contents of HTML email template to be used
if (emaildir == "")
{
	 sMessage = new String(GetEveryThing(supporttemplate));
	 fullwhichfile = new String(supporttemplate).toString();
}
else
{
	 sMessage = new String(GetEveryThing(emaildir+"/"+supporttemplate));
	 fullwhichfile = new String(emaildir+"/"+supporttemplate).toString();
}	 
//
/// Now do merge field replacements on support template
var doctypeindex = sMessage.indexOf("<!DOCTYPE");
var htmlindex = sMessage.indexOf("<html");
var fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();
sMessage = new String(fullmessage.replace("ZZforenameZZ",memberObj.forename1)).toString();
sMessage = new String(sMessage.replace("ZZsurnameZZ",memberObj.surname)).toString();
sMessage = new String(sMessage.replace("ZZonlinebookingidZZ",memberObj.onlinebookingid)).toString();
sMessage = new String(sMessage.replace("ZZonlinebookingpinZZ",memberObj.onlinebookingpin)).toString();
sMessage = new String(sMessage.replace("ZZmembergradeZZ",memberObj.grade)).toString();
sMessage = new String(sMessage.replace("ZZgenderZZ",memberObj.gender)).toString();
sMessage = new String(sMessage.replace("ZZageZZ",mAge)).toString();
sMessage = new String(sMessage.replace("ZZnextbirthdayZZ",dateasstring(mNextBirthday))).toString();


objCDOMail = newMailObject();   // in emailfuncs

objCDOMail.From=new String("secretary@hamptontennis.org.uk");
objCDOMail.Subject=new String("Your Eighth Birthday").toString();
// objCDOMail.BodyFormat=0;
// objCDOMail.MailFormat=0;
// objCDOMail.Body=new String(tMessage).toString();
objCDOMail.HTMLBody=new String(sMessage).toString();

if (debugging) {
	objCDOMail.To=new String("johncable@talk21.com").toString();
} else {
	objCDOMail.To=new String(memberObj.email).toString();
}


// Response.Write("Recipient is johncable@talk21.com<br>");
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
		Response.Write("&nbsp;&nbsp;&nbsp;8th birthday congratulations sent to "+memberObj.forename1+" "+memberObj.surname+"<br />")
	}

}
objCDOMail=null;

if (! debugging) 
{
// ========================================================================
	// Secondly, send note to Head Coach to discuss changes to coaching
	//=========================================================================

	// Read in contents of HTML email template to be used
	if (emaildir == "")
	{
		 sMessage = new String(GetEveryThing(coachtemplate));
		 fullwhichfile = new String(coachtemplate).toString();
	}
	else
	{
		 sMessage = new String(GetEveryThing(emaildir+"/"+coachtemplate));
		 fullwhichfile = new String(emaildir+"/"+coachtemplate).toString();
	}	 
	//
	/// Now do merge field replacements on id card template
	var doctypeindex = sMessage.indexOf("<!DOCTYPE");
	var htmlindex = sMessage.indexOf("<html");
	var fullmessage = new String(sMessage.substr(doctypeindex)).toString();
	htmlindex = fullmessage.indexOf("<html");
	fullmessage = new String(fullmessage.substr(htmlindex)).toString();
	sMessage = new String(fullmessage.replace("ZZforenameZZ",memberObj.forename1)).toString();
	sMessage = new String(sMessage.replace("ZZsurnameZZ",memberObj.surname)).toString();
	sMessage = new String(sMessage.replace("ZZonlinebookingidZZ",memberObj.onlinebookingid)).toString();
	sMessage = new String(sMessage.replace("ZZonlinebookingpinZZ",memberObj.onlinebookingpin)).toString();
	sMessage = new String(sMessage.replace("ZZmembergradeZZ",memberObj.grade)).toString();
	sMessage = new String(sMessage.replace("ZZgenderZZ",memberObj.gender)).toString();


	objCDOMail = newMailObject();   // in emailfuncs
	
	objCDOMail.From=new String("secretary@hamptontennis.org.uk");
	objCDOMail.Subject=new String("Eighth Birthday for Member").toString();
	// objCDOMail.BodyFormat=0;
	// objCDOMail.MailFormat=0;
	// objCDOMail.Body=new String(tMessage).toString();
	objCDOMail.HTMLBody=new String(sMessage).toString();
	
	if (debugging) {
		objCDOMail.To=new String("johncable@talk21.com").toString();
	} else {
		objCDOMail.To=new String("ianpoole23@yahoo.co.uk").toString();
	}

	// Response.Write("Recipient is ianpoole23@yahoo.co.uk<br>");
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
			Response.Write("&nbsp;&nbsp;&nbsp;Head Coach email sent OK<br />")
		}

	}
	objCDOMail=null;
}

if (debugging)
{
	Response.Write("<br />["+SQLText+"]<br />");
	Response.Write("<br />["+SQL2+"]<br />");
	Response.Write("<br />["+SQLAudit+"]<br />");
}
%>
		<h2>What would you like to do now?</h2>
		<div>
			<ul>
				<li><a href="editmemb2.asp?code=<%= memberObj.uniqueref %>">Edit <%= memberObj.forename1 %>'s details</a><br /><br /></li>
				<li><a href="chk_memb.asp">Search members directory</a><br /><br /></li>
				<li><a href="chk_birthdays.asp">Members birthday search</a><br /><br /></li>
<%
if (memberObj.email != "")
{
	if (isAdministrator())
	{
%>
				<div id="welcomediv" style="clear: both; padding: 20px 0; margin-top: 20px">
					 <div id="welcomebutton">
					 	<a href="sendwelcome.asp?uniqueref=<%= memberObj.uniqueref %>">Welcome Email</a>
					 </div>
					<div id="welcometext">
						<p>
							Clicking on the &quot;Welcome Email&quot; button will send the club standard welcome email to <%= memberObj.forename1 %>. The email will confirm to <%= memberObj.forename1 %> the User ID and PIN they can use to access this web site and to book courts.
						</p>
					</div>
				</div>
				<p style="clear: both; margin-bottom: 10px;">&nbsp;</p>
<%
	}
}
%>		
			</ul>
		</div>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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

