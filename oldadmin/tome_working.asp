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
var pagetitle = new String("Broadcasting Email to Members Personal Email Accounts");
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
var sSubject = new String(Request.QueryString("subject")).toString();
var sFrom = new String("Hampton-In-Arden Tennis Club");
var sOnBehalfOf = new String(Request.QueryString("onbehalfof")).toString();
var squery = new String(Request.QueryString("query")).toString(); 
var sBodyTitle = new String(Request.QueryString("bodytitle")).toString();
var sBodyText = new String(Request.QueryString("bodytext")).toString();
var sFooterText = new String(Request.QueryString("footertext")).toString();
var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var objCDOMail, cdoConfig, cdoFields;
var objMember = new Object();
var sTo;
var SQL1, SQL2;
var RS;
var dbconnect, connObj;
var debugging=current_debug_status();
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
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Tennis Club Email Circular");
if (sOnBehalfOf == "null" || sOnBehalfOf == "undefined" || sOnBehalfOf == "")
	sOnBehalfOf = new String("johncable@talk21.com");
// Now read in contents of HTML email message
sMessage = new String(GetEveryThing(whichfile));
// Get user email details
uniqref = getUserCode();
uniqref = uniqref.toString();
SQL2 = new String("SELECT email from members where uniqueref = "+uniqref).toString();
dbconnect=Application("hamptonsportsdb");
connObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
connObj.Open(dbconnect);
RS = connObj.Execute(SQL2);
if (! RS.EOF)
	recipient = Trim(new String(RS("email")).toString());
// Update sender if onbehalfof is not the same
sender = new String("support@hamptontennis.org.uk").toString();
if (! (sFrom == sOnBehalfOf))
{
	sender = new String(sOnBehalfOf+"@hamptontennis.org.uk").toString();
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
var debugging=current_debug_status();
objMember = getMember(uniqref);
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
	Response.Write("<br />");
	Response.Write(printMember(objMember));
	Response.Write("<br />");
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
		<h1>Club Emails:<b>&nbsp;Sending email to me for testing</b></h1>
		<h2>Subject:&nbsp;<%= sSubject %></h2>
		<ul>
			<li>Email file is:        <%= whichfile %></li>
			<li>Attachment 1 is:      <%= attachfile1 %></li>
			<li>Attachment 2 is:      <%= attachfile2 %></li>
			<li>Attachment 3 is:      <%= attachfile3 %></li>
			<li>Circulation is        <%= squery %></li>
			<li>To be sent from:      <%= sender %></li>
			<li>Debugging status:     <%= debugging %></li>
		</ul>
    	<u>Message</u><br /><br />
		<iframe 
			src="<%= whichfile %>" 
			allowTransparency="true" 
			width="100%" 
			height="700"
			frameborder="0"
			scrolling="yes">
			You must have a browser that supports iframes to view the club emails
		</iframe>
<%
	Server.ScriptTimeout = 360;

	tMessage = new String(fullmessage).toString();
	tMessage = new String(processPersonalMergeFields(tMessage,uniqref)).toString();
	tMessage = new String(processMAXITennisMergeFields(tMessage,uniqref)).toString();
	
	// objCDOMail = new ActiveXObject("CDONTS.NewMail");

	cdoConfig = Server.CreateObject("CDO.Configuration");
	
  cdoFields = cdoConfig.Fields;
  cdoFields.Item(cdoSendUsingMethod) = cdoSendUsingPort;
  cdoFields.Item(cdoSMTPServerPort) = 25;
  cdoFields.Item(cdoSMTPServer) = "SMTPMAIL";
  cdoFields.Item(cdoSMTPconnectiontimeout) = 30;
  cdoFields.Update();

/*	
// .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
// .Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
// .Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
// .Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
// .Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
// .Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "user@domain.com"
// .Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "PASSWORD"
*/	
	
	objCDOMail = Server.CreateObject("CDO.Message");
	
  objCDOMail.Configuration = cdoConfig;
	
	objCDOMail.From=new String(sender);
	objCDOMail.Subject=new String(sSubject).toString();
	// objCDOMail.BodyFormat=0;
	// objCDOMail.MailFormat=0;
	// objCDOMail.Body=new String(tMessage).toString();
	objCDOMail.HTMLBody=new String(tMessage).toString();
	// Next few lines deal with attachments
	if (attachfile1 != "NONE")
	{
		attachfile1 = Server.MapPath(attachfile1);
	    // objCDOMail.AttachFile(attachfile1);
	    objCDOMail.AddAttachment("file://"+attachfile1);
	}
	if (attachfile2 != "NONE")
	{
		attachfile2 = Server.MapPath(attachfile2);
	    // objCDOMail.AttachFile(attachfile2);
	    objCDOMail.AddAttachment("file://"+attachfile2);
	}
	if (attachfile3 != "NONE")
	{
		attachfile3 = Server.MapPath(attachfile3);
	    // objCDOMail.AttachFile(attachfile3);
	    objCDOMail.AddAttachment("file://"+attachfile3);
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
		objCDOMail.Send();
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
