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
var pagetitle = new String("Broadcasting Arden 9 Emails");
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
var debugging;

var whichfile = new String(Request.QueryString("thefile")).toString();
var attachfile1 = new String(Request.QueryString("attach1")).toString();
var attachfile2 = new String(Request.QueryString("attach2")).toString();
var attachfile3 = new String(Request.QueryString("attach3")).toString();
var allowmultiples = new String(Request.QueryString("multiples")).toString();
var toexclude = new String(Request.QueryString("exclusions")).toString();
var sSubject = new String(Request.QueryString("subject")).toString();
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sOnBehalfOf = new String(Request.QueryString("onbehalfof")).toString();
var thequery = new String(Request.QueryString("query")).toString(); 
var sBodyTitle = new String(Request.QueryString("bodytitle")).toString();
var sBodyText = new String(Request.QueryString("bodytext")).toString();
var sFooterText = new String(Request.QueryString("footertext")).toString();
var sIncludeCoaches = new String(Request.QueryString("includecoaches")).toString();
var startage = new String(Request.QueryString("youngest")).toString();
var endage = new String(Request.QueryString("oldest")).toString();
var agerange = false;
var ageclause = new String("").toString();
var agetext = new String("").toString();
var startarray = new Array();
var endarray = new Array();
var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var objCDOMail;
var objMember = new Object();
var sTo;
var SQL1, SQL2;
var RS;
var dbconnect, connObj;
var emaildir = new String("emails").toString();
var debugging=current_debug_status();
var willcirculate = !debugging;
var fullwhichfile = new String("").toString();
var excludeclause = new String("").toString();
var excludelist = toexclude.split(",");
var excludeObj = new Object();
var excludetext = new String("").toString();
// Set up default greeting strings
kount = 0;
strdate = datestring();
strtime = timestring();
strtoday = today();
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (attachfile1 == "null" || attachfile1 == "undefined" || attachfile1 == "")
	attachfile1 = new String("NONE").toString();
if (attachfile2 == "null" || attachfile2 == "undefined" || attachfile2 == "")
	attachfile2 = new String("NONE").toString();
if (attachfile3 == "null" || attachfile3 == "undefined" || attachfile3 == "")
	attachfile3 = new String("NONE").toString();
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Tennis Club Email Circular");
if (thequery == "null" || thequery == "undefined" || thequery == "")
	thequery = new String("members");
if (sOnBehalfOf == "null" || sOnBehalfOf == "undefined" || sOnBehalfOf == "")
	sOnBehalfOf = new String("support@hamptontennis.org.uk");
if (sIncludeCoaches == "" || sIncludeCoaches == "null" || sIncludeCoaches == "undefined")
	sIncludeCoaches = new String("Y").toString();

// Now check for age range
if (startage == "" || startage == "null" || startage == "undefined")
	startage=0;
if (endage == "" || endage == "null" || endage == "undefined")
		endage=100;
// Has target age range been supplied?
if (startage == 0 || endage == 100)	
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
// Now read in contents of HTML email message
if (emaildir == "")
{
	 sMessage = new String(GetEveryThing(whichfile));
	 fullwhichfile = new String(whichfile).toString();
}
else
{
	 sMessage = new String(GetEveryThing(emaildir+"/"+whichfile));
	 fullwhichfile = new String(emaildir+"/"+whichfile).toString();
}	 

// set up sender
sender = new String(sFrom+"@hamptontennis.org.uk").toString();
if (! (sFrom == sOnBehalfOf))
	sender = new String(sOnBehalfOf+"@hamptontennis.org.uk").toString();
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT distinct(email) from "+thequery+" where surname like 'CABLE' and email is not null");
if (! debugging)
	SQL1 = new String("SELECT distinct(email) from "+thequery+ " where email is not null"+ageclause);
// Now do merge field replacements
doctypeindex = sMessage.indexOf("<!DOCTYPE");
htmlindex = sMessage.indexOf("<html");
fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();
// fullmessage = new String(fullmessage.replace("ZZTitleZZ",sSubject)).toString();
// fullmessage = new String(fullmessage.replace("ZZBodyTitleZZ",sBodyTitle)).toString();	
var displaydate = dateasstring(Date());
debugging = false;
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
	<!-- Comment out the next style sheet if runniung in production -->
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Arden-9 Emails:<b>&nbsp;<%= pagetitle %> </b></h1>
		<h2>Subject:&nbsp;<%= sSubject %></h2>
		<ul>
			<li>Email file is:        <%= whichfile %></li>
			<li>Attachment 1 is:      <%= attachfile1 %></li>
			<li>Attachment 2 is:      <%= attachfile2 %></li>
			<li>Attachment 3 is:      <%= attachfile3 %></li>
			<li>Circulation is        <%= thequery %></li>
			<li>To be sent from:      <%= sender %></li>
			<li>Debugging status:     <%= debugging %></li>
			<li>Age-range:            <%= ageclause %></li>
<%
if (debugging)
{
%>
			<li>SQL1:                 <%= SQL1 %></li>
			<li>Email file is:        <%= fullwhichfile %></li>
<%
	// Response.End();
}
%>			
		</ul>
    	<u>Message</u><br /><br />
		<iframe 
			src="<%= fullwhichfile %>" 
			allowTransparency="true" 
			width="100%" 
			height="700" 
			frameborder="0"
			scrolling="yes">
			You must have a browser that supports iframes to view the Arden-9 email you are about to send
		</iframe>
<%
if (attachfile1 != "NONE")
	attachfile1 = Server.MapPath(attachfile1);
if (attachfile2 != "NONE")
	attachfile2 = Server.MapPath(attachfile2);
if (attachfile3 != "NONE")
	attachfile3 = Server.MapPath(attachfile3);
Server.ScriptTimeout = 720;
RS = ConnObj.Execute(SQL1);
the_email = new String("Not specified");
while (! RS.EOF)
{
	the_email = new String(RS("email")).toString();
	tMessage = new String(fullmessage).toString();
	// tMessage = new String(processPersonalMergeFields(tMessage,RS("uniqueref"))).toString();
	// tMessage = new String(processMAXITennisMergeFields(tMessage,RS("uniqueref"))).toString();
	if (the_email == "" | the_email == "null" || the_email == "undefined")
	{
		the_email = new String("Not specified");
	}
	else
	{
		// objCDOMail = new ActiveXObject("CDONTS.NewMail");

		objCDOMail = newMailObject();   // in emailfuncs
		
			objCDOMail.From=new String(sender);
			objCDOMail.Subject=new String(sSubject).toString();
			// objCDOMail.BodyFormat=0;
			// objCDOMail.MailFormat=0;
			// objCDOMail.Body=new String(tMessage).toString();
			objCDOMail.HTMLBody=new String(tMessage).toString();
			objCDOMail.BodyPart.charset = "utf-8";
			
		// Next few lines deal with attachments
		if (attachfile1 != "NONE")
		{
			// attachfile1 = Server.MapPath(attachfile1);
		    // objCDOMail.AttachFile(attachfile1);
		    objCDOMail.AddAttachment(attachfile1);
		}
		if (attachfile2 != "NONE")
		{
			// attachfile2 = Server.MapPath(attachfile2);
		    // objCDOMail.AttachFile(attachfile2);
		    objCDOMail.AddAttachment(attachfile2);
		}
		if (attachfile3 != "NONE")
		{
			// attachfile3 = Server.MapPath(attachfile3);
		    // objCDOMail.AttachFile(attachfile3);
		    objCDOMail.AddAttachment(attachfile3);
		}
		// end of attachments
			
		kount += 1;
		if (! debugging) {
			objCDOMail.To=new String(RS("email")).toString();
			dummy = new String("Y").toString();
			if (dummy == "Y")
			{
				Response.Write("Recipient is ["+RS("email")+"]<br>");
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
					}
				}
			}
			else
			{
				Response.Write("Recipient "+RS("email")+" has elected NOT to receive emails<br>");
			}
		} 
		else 
		{
			Response.Write("Email would have been sent to "+RS("email")+"<br />");
		}  // end if not debugging

	}  // end of email is available to try

	RS.MoveNext();
	objCDOMail=null;
}
Response.Write("<br>");
Response.Write("======================================================================================================<br>");
Response.Write("A total of "+kount+" emails were sent out based on "+thequery+" circulation list<br>");
Response.Write("======================================================================================================<br>");
// Now updating email log as required
SQL2 = new String("INSERT into emails([subject],[emailfile],[attach1],[attach2],[attach3],[circulation],[sent_on],[number_sent])").toString(); 
SQL2 += " values('"+sSubject+"','"+whichfile+"','"+attachfile1+"','"+attachfile2+"','"+attachfile3+"','"+thequery+"','"+strtoday+"',"+kount+")";
if (debugging)
{
	Response.Write("SQL  = ["+SQL1+"]<br>");
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

