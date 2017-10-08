<!--
METADATA
TYPE="typelib"
UUID="CD000000-8B95-11D1-82DB-00C04FB1625D"
NAME="CDO for Windows 2000 Library"
-->
<%@language="JScript"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Quick Messages to Members");
// Now for any functions and variables local  to this page
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
var requesttemplate = new String("quickmessage.html").toString();
var circulationtemplate = new String("quickmessagecirculation.html").toString();
var debugging;
var sTitle = new String(Request.Form("messagesubject")).toString();
var sSubject = new String(Request.Form("messagetitle")).toString();
var sFrom = new String(Request.Form("onbehalfof")).toString();
var sCirculation = new String(Request.Form("query")).toString();
var sDetails = new String(Request.Form("message")).toString();
var sPost = new String(Request.Form("postid")).toString();
var sLeadParagraph = new String(Request.Form("leadparagraph")).toString();
var sIncludeCoaches = new String(Request.Form("includecoaches")).toString();
var startage = new String(Request.Form("youngest")).toString();
var endage = new String(Request.Form("oldest")).toString();
var sTitle = new String(sSubject).toString();
var replyTo = new String(sFrom+"@hamptontennis.org.uk").toString();
var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var coachclause = new String("").toString();
var agetext = new String("").toString();
var agerange = false;  // default to no age range
var sMessage = new String("").toString();
var tMessage = new String("").toString();
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
var htmlindex, doctypeindex, fullmessage, tMessage;
var dummy;
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();
var memberid = getUserCode();
var targetid;
var myfullname, myemail, myAge, membersAge;
var themember = new Object();
var willcirculate = true;  // default to ciruclating email
var numbersent = 0;    //  Number of emails successfully sent
var numberfailed = 0;  //  Number of emails that failed to send
var circmessage = new String("").toString();
var circhistory = new String("").toString();
var sEmail = new String("").toString();

// Set up default greeting strings
kount = 0;
strdate = datestring();
strtime = timestring();
strtoday = today();
//
if (memberid > 0) 
{
	themember = getMember(memberid);
	myfullname = Trim(new String(themember.forename1+" "+themember.surname)).toString();
	myemail = new String(themember.email).toString();
	myAge = currentAge(themember.dob);
}
//
// Now set up database connections etc
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
// Check over request params and insert suitable defaults
//
if (sIncludeCoaches == "undefined" || sIncludeCoaches == "null" || sIncludeCoaches == "")
	sIncludeCoaches = new String("Y");

if (sIncludeCoaches == "Y" || sIncludeCoaches == "y")
	coachclause = new String(" UNION SELECT DISTINCT(email) FROM coaches WHERE email IS NOT NULL ")

if (sLeadParagraph == "undefined" || sLeadParagraph == "null" || sLeadParagraph == "" || sLeadParagraph == "&nbsp;") {
	requesttemplate = new String("quickmessagenolead.html").toString();
	sLeadParagraph = new String("");
}

if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Important Message from Hampton Tennis Club");
if (sPost == "" || sPost == "null" || sPost == "undefined")
	sPost = new String("0");

// Now check for age range
if (startage == "" || startage == "null" || startage == "undefined")
	startage=1;
if (endage == "" || endage == "null" || endage == "undefined")
		endage=100;
// Has target age range been supplied?
if (startage == 1 || endage == 100)	
{
	agerange = false;
	agetext += "No age range in force";
}
else 
{
	agerange = true;
	agetext += "From "+startage+" to "+endage;
	startage = parseInt(startage);
	endage = parseInt(endage);
}	

//
// Do bulk replacements in textareas (sDetails and sLeadParagraph (if present))
//

sDetails = replaceAll(sDetails,"\r\n", "<br />");
sDetails = replaceAll(sDetails,"\n\r", "<br />");
sDetails = replaceAll(sDetails,"\n", "<br />");
sDetails = replaceAll(sDetails,"\r", "<br />");
sDetails = replaceAll(sDetails,"£", "&pound;");
sDetails = replaceAll(sDetails,"\u0027", "&apos;");
sDetails = replaceAll(sDetails,"\u00e2\u20ac\u201c", "&ndash;");
sDetails = replaceAll(sDetails,'"', "&quot;");
sDetails = replaceAll(sDetails,"\u002d", "&ndash;");

if (! (sLeadParagraph == ""))
{
	sLeadParagraph = replaceAll(sLeadParagraph,"\r\n", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\n\r", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\n", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\r", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"£", "&pound;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u0027", "&apos;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u00e2\u20ac\u201c", "&ndash;");
	sLeadParagraph = replaceAll(sLeadParagraph,'"', "&quot;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u002d", "&ndash;");
}

//
// Now do bulk replacements in message title area
//

sSubject = replaceAll(sSubject,"£", "&pound;");
sSubject = replaceAll(sSubject,"\u0027", "&apos;");
sSubject = replaceAll(sSubject,"\u00e2\u20ac\u201c", "&ndash;");
sSubject = replaceAll(sSubject,'"', "&quot;");
sSubject = replaceAll(sSubject,"\u002d", "&ndash;");

// Now remove any remaining non-ASCII characters from the 
// details, lead and Subject

sSubject = sSubject.replace(/[^\x00-\x7F]/g, "");
sDetails = sDetails.replace(/[^\x00-\x7F]/g, "");
sLeadParagraph = sLeadParagraph.replace(/[^\x00-\x7F]/g, "");

// Now read in contents of HTML request template 
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
// set up sender
sender = new String("communications@hamptontennis.org.uk").toString();
// Now do merge field replacements on request template
doctypeindex = sMessage.indexOf("<!DOCTYPE");
htmlindex = sMessage.indexOf("<html");
fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();
sMessage = new String(fullmessage.replace("ZZcirculationZZ",sCirculation)).toString();
sMessage = new String(sMessage.replace("ZZsenderZZ",sFrom)).toString();
sMessage = new String(sMessage.replace("ZZbodytextZZ",sDetails)).toString();
sMessage = new String(sMessage.replace("ZZtitleZZ",sSubject)).toString();
sMessage = new String(sMessage.replace("ZZleadparagraphZZ",sLeadParagraph)).toString();
//
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
debugging = false;
willcirculate = true;
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
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
			The following message has been sent out to <%= sCirculation %> from <%= sender %>
		</p>
		<h2>Subject:&nbsp;<%= sSubject %></h2>
		<p  style="padding-bottom:20px;">
			<%= sDetails %>
		</p>
		<hr />
<%

// Now, send out the quick message email

ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);

SQL1 = new String("SELECT DISTINCT(email) FROM "+sCirculation+ " WHERE email IS NOT NULL");


Response.Write("<br />Subject: "+sSubject+"<br />");
Response.Write("Sender: "+sender+"<br />");
Response.Write("Circulating To: "+sCirculation+"<br />");
Response.Write("Coaches?: ["+sIncludeCoaches+"]<br />");
Response.Write("Age range?: ["+agetext+"]<br />");
if (debugging)
{
	Response.Write("coachclause =:  ["+coachclause+"]<br />");
	Response.Write("Compound SQL1 is : ["+SQL1+"]<br />");
	Response.Write("Age range is : ["+startage+" to "+endage+"]<br />");
	// SQL1 = new String("SELECT uniqueref, email from members where uniqueref = 11"+coachclause);
	Response.End();
}

Server.ScriptTimeout = 720;
RS = ConnObj.Execute(SQL1);
the_email = new String("Not specified");
while (! RS.EOF)
{
	circmessage = new String("").toString();

	// If there is an age range in force see if there is 
	// anyone in the age range with this email address

	if (agerange)
	{
		numberfound = 0;
		willcirculate = true;
		sEmail = new String(RS("email")).toString();

		numberfound = inAgeRangeAtEmail(sCirculation, sEmail, startage, endage);

		if (numberfound < 1)
		{
			willcirculate = false;
			circmessage = new String(sEmail+" has no members in the age range for this quick message: "+startage+"-"+endage+"<br />").toString();
		}
	}


	the_email = new String(RS("email")).toString();
	objCDOMail = newMailObject();   // in emailfuncs
	
	objCDOMail.From=new String(sender).toString();
	objCDOMail.ReplyTo=new String(replyTo).toString();
	objCDOMail.Subject=new String(sTitle).toString();
	// objCDOMail.BodyFormat=0;
	// objCDOMail.MailFormat=0;
	// objCDOMail.Body=new String(tMessage).toString();
	objCDOMail.HTMLBody=new String(sMessage).toString();
	objCDOMail.BodyPart.charset = "utf-8";
		
	objCDOMail.To=new String(the_email).toString();
	circmessage = new String("").toString();
	// Response.Write("Recipient is :  "+the_email+"<br />");
	if (! debugging)
	{
		if (willcirculate)
		{
			circmessage = "Recipient is "+the_email+"<br />";
			numbersent += 1;
			try {
					objCDOMail.Send();
					}
			catch(e) {
				numbersent -= 1;
				numberfailed += 1;
				if (!(e.number &0xFFFF) == 0) {
					Response.Write("Error sending email<br /><br />");
					Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
					Response.Write("<br />");
					Response.Write("Error code:           "+e.number & 0xFFFF);
					Response.Write("<br />");
					Response.Write("Description:          "+e.description+"<br />");
					circmessage = "Failed to send to "+the_email;
				} else {
					circmessage = "Message sent to "+the_email+"<br />";
				}

			}
			Response.Write(circmessage);
		}    // end of willcirculate=true
		else
		{
			// willcirculate = false
			Response.Write(circmessage);
		}
		circhistory += circmessage;
	}
	else   // debugging path
	{
		objCDOMail.To=new String("johncable@talk21.com").toString();
		numbersent += 1;
			try {
					objCDOMail.Send();
					}
			catch(e) {
				numbersent -= 1;
				numberfailed += 1;
				if (!(e.number &0xFFFF) == 0) {
					Response.Write("Error sending email<br /><br />");
					Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
					Response.Write("<br />");
					Response.Write("Error code:           "+e.number & 0xFFFF);
					Response.Write("<br />");
					Response.Write("Description:          "+e.description+"<br />");
				} else {
					Response.Write("Message would have been sent to "+the_email)
				}

		}
	}
	RS.MoveNext();
	objCDOMail=null;  
	wilcirculate = true;  // default to true for next one in list
}
RS.Close();

Response.Write("<br /><hr /><br /><h4>Circulation details for courtesy copies (and coaches if selected)</h4><br /><br />");

//
// Secondly, circulate to courtesycopies and coaches
//
// Formulate SQL query ...
//
SQL2 = new String("").toString();   // Start with blank SQL
// Set up courtesy copy additons to circulation
// Need to do it as a UNION so they dont get it twice
// 5 == Chester
courtesycopies = "SELECT DISTINCT(email) FROM members WHERE uniqueref IN (5) "
// Add in coachclause
SQL2 += courtesycopies + coachclause;
RS = ConnObj.Execute(SQL2);
the_email = new String("Not specified");
//
// Now, do courtesycopies and coaches if required by SQL query
//
while (! RS.EOF)
{
	the_email = new String(RS("email")).toString();
	tMessage = new String(sMessage).toString();

	// Stamp this message as a courtesy copy by altering the header bar text
	tMessage = replaceAll(tMessage, "Email Circulation", "Courtesy Copy");

	if (debugging)
		Response.Write("Inside loop for courtesycopies and coaches assessing "+the_email+"<br>");

	if (the_email == "" | the_email == "null" || the_email == "undefined")
	{
		the_email = new String("Not specified");
	}
	else
	{
		if (debugging)
		{
			Response.Write("Inside loop emailing "+the_email+"<br>");
			// Response.Write(tMessage+"<br>");
		}

		objCDOMail = newMailObject();   // in emailfuncs
	
		objCDOMail.From=new String(sender);
		objCDOMail.Subject=new String(sTitle).toString();
		objCDOMail.HTMLBody=new String(tMessage).toString();
		objCDOMail.BodyPart.charset = "utf-8";
		
		// No attachments for quick messages
		
		objCDOMail.To=new String(the_email).toString();
		numbersent += 1;

		// No age range checking on these circulations

		if (! debugging) 
		{
			Response.Write("Recipient is ["+RS("email")+"]<br>");
			try {
					objCDOMail.Send();
					}
			catch(e) {
				numbersent -= 1;
				numberfailed += 1;
				if (!(e.number &0xFFFF) == 0) {
					Response.Write("Error sending email<br /><br />");
					Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
					Response.Write("<br />");
					Response.Write("Error code:           "+e.number & 0xFFFF);
					Response.Write("<br />");
					Response.Write("Description:          "+e.description+"<br />");
				}
			}
		} 
		else 
		{
			Response.Write("DEBUGGING - recipient would have been ["+RS("email")+"]<br>")
		}
	}
	RS.MoveNext();
	objCDOMail=null;
}
RS.Close();

Response.Write("<br>");
Response.Write("==============================================================<br>");
Response.Write("Quick message email sent out to the above<br /><br />");
Response.Write("Number successfully sent: "+numbersent+"<br />");
Response.Write("Number failed to send:    "+numberfailed+"<br />");
Response.Write("==============================================================<br>");

//  Now we can send confirmatory circulation email back to sender 
//  (and to support@hamptontennis.org.uk)
//
//  N.B.  We can deal with Chester's copy via BCC'ing the circulation summary
//        for quick messages rather than UNION'ing a courtesycopies SQL
//        so that is what has been done below

sMessage = new String("").toString();
fullwhichfile = new String("").toString();

// Now read in contents of HTML circulation template 
if (emaildir == "")
{
	 sMessage = new String(GetEveryThing(circulationtemplate));
	 fullwhichfile = new String(circulationtemplate).toString();
}
else
{
	 sMessage = new String(GetEveryThing(emaildir+"/"+circulationtemplate));
	 fullwhichfile = new String(emaildir+"/"+circulationtemplate).toString();
}	 
// set up sender
sender = new String("communications@hamptontennis.org.uk").toString();
// Now do merge field replacements on circulation template
doctypeindex = sMessage.indexOf("<!DOCTYPE");
htmlindex = sMessage.indexOf("<html");
fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();

sMessage = new String(fullmessage.replace("ZZcirculationZZ",circhistory)).toString();
sMessage = new String(sMessage.replace("ZZsenderZZ",sFrom)).toString();
sMessage = new String(sMessage.replace("ZZbodytextZZ",sDetails)).toString();
sMessage = new String(sMessage.replace("ZZtitleZZ",sSubject)).toString();
sMessage = new String(sMessage.replace("ZZleadparagraphZZ",sLeadParagraph)).toString();

objCDOMail = newMailObject();   

// assemble wording
var confirmtext = new String("").toString();

objCDOMail.From=new String(sender);
objCDOMail.Subject=new String(sTitle).toString();
objCDOMail.HTMLBody=new String(sMessage).toString();
objCDOMail.BodyPart.charset = "utf-8";
	
objCDOMail.To=new String(myemail).toString();
objCDOMail.ReplyTo=new String(replyTo).toString();
objCDOMail.Cc=new String("support@hamptontennis.org.uk").toString();
// objCDOMail.Bcc=new String("cbarnes@lanner.co.uk").toString();

try 
{
		objCDOMail.Send();
}
catch(e) 
{
	if (!(e.number &0xFFFF) == 0) {
		Response.Write("Error sending email<br /><br />");
		Response.Write("Facility code:        "+e.number>>16 & 0x1FFF);
		Response.Write("<br />");
		Response.Write("Error code:           "+e.number & 0xFFFF);
		Response.Write("<br />");
		Response.Write("Description:          "+e.description+"<br />");
	} 
	else 
	{
		Response.Write("Confirmation of circulation email sent to "+myemail);
	}
}

objCDOMail=null;  

// end of confirmatory email bit

// Now updating quick message log as required
SQL2 = new String("INSERT into quickmessages([subject],[circulation],[sent_on],[number_sent],[messagetext],[sender],[postid])").toString(); 
SQL2 += " values('"+sSubject+"','"+sCirculation+"','"+strtoday+"',"+numbersent+",'"+sDetails+"','"+sFrom+"','"+sPost+"')";
if (debugging)
{
	Response.Write("SQL1 = ["+SQL1+"]<br>");
	Response.Write("SQL2 = ["+SQL2+"]<br>");
} else {
	ConnObj.Execute(SQL2);	
}
%>
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

