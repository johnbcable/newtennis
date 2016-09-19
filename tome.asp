<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Test Club Email to my Email Account");
// Now for any functions and variables local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	fcontents = Trim(new String(f.ReadAll())).toString();
	f.Close();
	return(fcontents);
}
var whichfile = new String(Request.QueryString("thefile")).toString();
var attachfile1 = new String(Request.QueryString("attach1")).toString();
var attachfile2 = new String(Request.QueryString("attach2")).toString();
var attachfile3 = new String(Request.QueryString("attach3")).toString();
var allowmultiples = new String(Request.QueryString("multiples")).toString();
var toexclude = new String(Request.QueryString("exclusions")).toString();
var sSubject = new String(Request.QueryString("subject")).toString();
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sOnBehalfOf = new String(Request.QueryString("onbehalfof")).toString();
var replyTo = new String("").toString();
var squery = new String(Request.QueryString("query")).toString(); 
var sBodyTitle = new String(Request.QueryString("bodytitle")).toString();
var sBodyText = new String(Request.QueryString("bodytext")).toString();
var sFooterText = new String(Request.QueryString("footertext")).toString();
var sIncludeCoaches = new String(Request.QueryString("includecoaches")).toString();
var startage = new String(Request.QueryString("youngest")).toString();
var endage = new String(Request.QueryString("oldest")).toString();
var coachclause = new String("").toString();
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
strdate = datestring();
strtime = timestring();
if (whichfile == "null" || whichfile == "undefined" || whichfile == "")
	Response.Redirect("services.asp");
if (attachfile1 == "null" || attachfile1 == "undefined" || attachfile1 == "")
	attachfile1 = new String("NONE").toString();
if (attachfile2 == "null" || attachfile2 == "undefined" || attachfile2 == "")
	attachfile2 = new String("NONE").toString();
if (attachfile3 == "null" || attachfile3 == "undefined" || attachfile3 == "")
	attachfile3 = new String("NONE").toString();
if (allowmultiples == "null" || allowmultiples == "undefined" || allowmultiples == "")
	allowmultiples = new String("N").toString();
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Tennis Club Email Circular");
if (sOnBehalfOf == "null" || sOnBehalfOf == "undefined" || sOnBehalfOf == "")
	sOnBehalfOf = new String("johncable@talk21.com");
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

// How are we dealing with coaches
if (sIncludeCoaches == "Y" || sIncludeCoaches == "y")
	coachclause +=" UNION SELECT DISTINCT(email) FROM coaches WHERE email IS NOT NULL";	

// Now prepare any exlcusions to add to the end of the SQL
if (toexclude == "" || toexclude == "null" || toexclude == "undefined")
	excludeclause = new String("").toString();
else
	excludeclause = new String(" AND uniqueref NOT IN ("+toexclude+") ");
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
// Get user email details
var uniqref = getUserCode();
uniqref = uniqref.toString();
SQL2 = new String("SELECT email from allmembers where uniqueref = "+uniqref).toString();

// Response.Write("["+SQL2+"]<br />");
// Response.End();

dbconnect=Application("hamptonsportsdb");
connObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
connObj.Open(dbconnect);
RS = connObj.Execute(SQL2);
if (! RS.EOF)
	recipient = Trim(new String(RS("email")).toString());
// Update sender if onbehalfof is not the same
//
// Changes 19 Sep 2016:  
// always send from tennisclub@...
// as this is a POP address and configure the ReplyTo 
// parameter so that replies go there and not to tennisclub
//
sender = new String("tennisclub@hamptontennis.org.uk").toString();
replyTo = new String("tennisclub@hamptontennis.org.uk").toString();
if (! (sFrom == sOnBehalfOf))
{
	replyTo = new String(sOnBehalfOf+"@hamptontennis.org.uk").toString();
}
// 
doctypeindex = sMessage.indexOf("<!DOCTYPE");
htmlindex = sMessage.indexOf("<html");
fullmessage = new String(sMessage.substr(doctypeindex)).toString();
htmlindex = fullmessage.indexOf("<html");
fullmessage = new String(fullmessage.substr(htmlindex)).toString();
// fullmessage = new String(fullmessage.replace("ZZTitleZZ",sSubject)).toString();
// fullmessage = new String(fullmessage.replace("ZZBodyTitleZZ",sBodyTitle)).toString();
// End of page start up coding
var displaydate = dateasstring(Date());
// debugging = true;
// willcirculate = !debugging;
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
		<h1>Club Emails:<b>&nbsp;Sending email to me for testing</b></h1>
		<h2>Subject:&nbsp;<%= sSubject %></h2>
		<ul>
			<li>Email file is:        <%= whichfile %></li>
			<li>Attachment 1 is:      <%= attachfile1 %></li>
			<li>Attachment 2 is:      <%= attachfile2 %></li>
			<li>Attachment 3 is:      <%= attachfile3 %></li>
			<li>Circulation is:       <%= squery %></li>
			<li>Coaches?:             <%= coachclause %></li>
			<li>To be sent from:      <%= sender %></li>
			<li>Replies go to:		  <%= replyTo %></li>
			<li>Debugging status:     <%= debugging %></li>
			<li>Age-range:            <%= agetext %> &ndash; <%= ageclause %></li>
<%
	if (debugging)
	{
		Response.Write("<br />");
		Response.Write("uniqref before being passed to getMember is ["+uniqref+"]")
		Response.Write("the type of uniqref was  ["+typeof(uniqref)+"]")
		Response.Write("<br />");
	}			

	if(excludelist.length > 0) {
		for(var i=0; i<excludelist.length; i++) {
			dummy1 = new String("["+excludelist[i]+"]").toString();
			if (! (dummy1 == "[]"))
			{
				if (! isNaN(excludelist[i])) {

					if (debugging)
					{
						Response.Write("<br />");
						Response.Write("excludelist[i] before being passed to getMember is ["+excludelist[i]+"]")
						Response.Write("the type of excludelist[i] was  ["+typeof(excludelist[i])+"]")
						Response.Write("<br />");
					}			

					excludeObj = getMember(excludelist[i]);
					excludetext+=excludeObj.forename1+" "+excludeObj.surname+" | ";
				}
			}
		}
	}
%>
			<li>Exclusions:           <%= excludetext %></li>
		</ul>
    	<u>Message</u><br /><br />
		<iframe 
			src="<%= fullwhichfile %>" 
			allowTransparency="true" 
			width="100%" 
			height="700"
			frameborder="0"
			scrolling="yes">
			You must have a browser that supports iframes to view the club emails
		</iframe>
<%
	if (debugging)
	{
		Response.Write("<br />");
		Response.Write("uniqref before being passed to getMember is ["+uniqref+"]")
		Response.Write("the type of uniqref was  ["+typeof(uniqref)+"]")
		Response.Write("<br />");
	}			

	objMember = getMember(uniqref);

	if (debugging)
	{
		Response.Write("<br />");
		Response.Write(printMember(objMember));
		Response.Write("<br />");
		Response.End();
	}

	Server.ScriptTimeout = 360;

	tMessage = new String(fullmessage).toString();
	tMessage = new String(processPersonalMergeFields(tMessage,uniqref)).toString();
	// tMessage = new String(processMAXITennisMergeFields(tMessage,uniqref)).toString();
	
	// objCDOMail = new ActiveXObject("CDONTS.NewMail");

	objCDOMail = newMailObject();  // in emailfuncs.asp
	
	objCDOMail.From=new String(sender);
	objCDOMail.Subject=new String(sSubject).toString();
	objCDOMail.HTMLBody=new String(tMessage).toString();
	objCDOMail.BodyPart.charset = "utf-8";
	objCDOMail.ReplyTo=new String(replyTo).toString();
	
	// Next few lines deal with attachments
	if (attachfile1 != "NONE")
	{
		attachfile1 = Server.MapPath(attachfile1);
		// Response.Write(attachfile1+"<br />")
	    // objCDOMail.AttachFile(attachfile1);
	    // objCDOMail.AddAttachment("file://"+attachfile1);
	    objCDOMail.AddAttachment(attachfile1);
	}
	if (attachfile2 != "NONE")
	{
		attachfile2 = Server.MapPath(attachfile2);
	    // objCDOMail.AttachFile(attachfile2);
		// Response.Write(attachfile2+"<br />")
	    // objCDOMail.AddAttachment("file://"+attachfile2);
	    objCDOMail.AddAttachment(attachfile2);
	}
	if (attachfile3 != "NONE")
	{
		attachfile3 = Server.MapPath(attachfile3);
	    // objCDOMail.AttachFile(attachfile3);
		// Response.Write(attachfile3+"<br />")
	    // objCDOMail.AddAttachment("file://"+attachfile3);
	    objCDOMail.AddAttachment(attachfile3);
	}
	// end of attachments
	objCDOMail.To=new String(recipient);
	if (debugging)
	{
		Response.Write("Recipient would be ["+recipient+"]<br />");
	}
	else
	{		
		Response.Write("Recipient is ["+recipient+"]<br />");
		try {
			objCDOMail.Send();
		}
		catch(e) {
			if (!(e.number &0xFFFF) == 0) {
				Response.Write("Error sending email<br /><br />")
				Response.Write("Facility code:        "+e.number>>16 & 0x1FFF)
				Response.Write("<br />")
				Response.Write("Error code:           "+e.number & 0xFFFF)
				Response.Write("<br />")
				Response.Write("Description:          "+e.description+"<br />")
			}
		}
	}
	objCDOMail=null;
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
