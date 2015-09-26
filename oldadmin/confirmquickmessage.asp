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
var pagetitle = new String("Confirming Quick Messages to Members");
// Now for any functions and variables  local to this page
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
var requesttemplate = new String("quickmessage.html").toString();

var dbconnect=Application("hamptonsportsdb");
var debugging;
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
var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var coachclause = new String("").toString();
var ageclause = new String("").toString();
var agerange = false;  // default to no age range
var sortablestart, sortableend;
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
var myfullname, myemail;
var themember = new Object();
// Set up default greeting strings
kount = 0;
strdate = datestring();
strtime = timestring();
strtoday = today();
//
if (memberid > 0) {
	themember = getMember(memberid);
	myfullname = Trim(new String(themember.forename1+" "+themember.surname)).toString();
	myemail = new String(themember.email).toString();
	myAge = currentAge(themember.dob);
}
// Now set up database connections etc
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// Get full text describing circulation list
sTarget = new String(sCirculation).toString();
SQL1 = new String("SELECT [name] FROM circulation_lists WHERE [queryname] = '"+sCirculation+"'").toString();
RS = ConnObj.Execute(SQL1);
if(! RS.EOF)
{
	sTarget = new String(RS("name")).toString();
}
RS.Close();
//
// Check over request params and insert suitable defaults
//
if (sIncludeCoaches == "undefined" || sIncludeCoaches == "null" || sIncludeCoaches == "")
	sIncludeCoaches = new String("Y");
if (sLeadParagraph == "undefined" || sLeadParagraph == "null" || sLeadParagraph == "" || sLeadParagraph == "&nbsp;") {
	requesttemplate = new String("quickmessagenolead.html").toString();
	sLeadParagraph = new String("");
}

if (sIncludeCoaches == "Y")
	coachclause +=" UNION SELECT * from allmembers where [uniqueref] in SELECT [uniqueref] FROM coaches";	

// Now check for age range
if (startage == "" || startage == "null" || startage == "undefined")
	startage=new String("1").toString();
if (endage == "" || endage == "null" || endage == "undefined")
		endage=new String("100").toString();
// Has target age range been supplied?
if (startage == "1" || endage == "100")	{
	agerange = false;
}
else {
	agerange = true;
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
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Important Message from Hampton Tennis Club");
if (sPost == "" || sPost == "null" || sPost == "undefined")
	sPost = new String("0");
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

//
// set up sender
sender = new String(sFrom+"@hamptontennis.org.uk").toString();
//
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// debugging = true;
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
<%
if (debugging)
{
	Response.Write("<br />"+Request.QueryString()+"<br />");
}
else
{
	var pstext = new String("").toString();
	if (agerange)
	{
		if (myAge < startage || myAge > endage)
		{
			pstext = new String("I would not receive this email myself.<br /> ").toString();
		}
		else
		{
			pstext = new String("I MAY receive this email myself if I am part of the underlying circulation group (i.e. "+sCirculation+").<br /> ").toString();
		}
	}

	// Send the email to listed email address for this user

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

	// Merge in text from submitting form. 

	doctypeindex = sMessage.indexOf("<!DOCTYPE");
	fullmessage = new String(sMessage.substr(doctypeindex)).toString();
	htmlindex = fullmessage.indexOf("<html");
	fullmessage = new String(fullmessage.substr(htmlindex)).toString();
	sMessage = new String(fullmessage.replace("ZZcirculationZZ",sCirculation)).toString();
	sMessage = new String(sMessage.replace("ZZsenderZZ",sFrom)).toString();
	sMessage = new String(sMessage.replace("ZZbodytextZZ",sDetails)).toString();
	sMessage = new String(sMessage.replace("ZZtitleZZ",sSubject)).toString();
	sMessage = new String(sMessage.replace("ZZleadparagraphZZ",sLeadParagraph)).toString();

	// Send out merged email to users account

	Server.ScriptTimeout = 360;
	var circmessage = new String("").toString();

	objCDOMail = newMailObject();   // in emailfuncs
	
	objCDOMail.From=new String(sender);
	objCDOMail.Subject=new String(sTitle).toString();
	// objCDOMail.BodyFormat=0;
	// objCDOMail.MailFormat=0;
	// objCDOMail.Body=new String(tMessage).toString();
	objCDOMail.HTMLBody=new String(sMessage).toString();
	objCDOMail.BodyPart.charset = "utf-8";
		
	objCDOMail.To=new String(myemail).toString();
	circmessage = new String("").toString();
	// Response.Write("Recipient is :  "+myemail+"<br />");
	if (! debugging)
	{
		circmessage = "trying to send to "+myemail;
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
			circmessage = "Failed to send to "+myemail;
			numberfailed += 1;
			} else {
				numbersent += 1;
				circmessage = "Message sent to "+myemail;
			}

		}
		// Response.Write(circmessage+"<br />");
	}
	else  // debugging path
	{
		objCDOMail.To=new String("johncable@talk21.com").toString();
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
				numberfailed += 1;
				} else {
					numbersent += 1;
					// Response.Write("Message would have been sent to "+the_email)
				}

		}  // 
	}    // end else
}	
%>	
		<p>
			The following message has been sent to <%= myemail %> for you to check over. Please check content, target audience and sender BEFORE pressing the Send Message button (below). Messages cannot be recalled once sent.<br />
		</p>
		<hr /><br />
		<p>
			Sending to: <span style="font-weight:bold;"><%= sTarget %></span>
		</p>
		<p>
			From: <span style="font-weight:bold;"><%= sender %></span>
		</p>
		<div id="messagetoconfirm" style="margin: 10px auto; width: 95%; background-color: white; border: 2px solid black;">
			<h2>Subject:&nbsp;<%= sSubject %></h2>
			<h4>Lead paragraph</h4>
			<p  style="margin: 10px auto;width:95%;padding-bottom:10px;">
<%
if (sLeadParagraph == "")
{
	Response.Write("No lead paragraph supplied by person submitting this quick message.");
}				
else 
{
	Response.Write(sLeadParagraph);
}
%>
			</p>
			<h4>Body of the message</h4>
			<p  style="margin: 10px auto;width:95%;padding-bottom:10px;">
				<%= sDetails %>
			</p>
			<hr />
			<p style="margin: 10px auto;width:95%;padding-bottom:10px;">
				Am I including coaches in this circulation?  <%= sIncludeCoaches %>
			</p>
			<hr />
			<p style="margin: 10px auto;width:95%;padding-bottom:10px;">
				Age Range? 
			</p>
			<p style="margin: 10px auto;width:95%;padding-bottom:10px;">
				<%= pstext %>
			</p>
			<hr />
			<form id="confirmedmessage" action="sendquickmessage.asp" method="post">
				<input type="hidden" name="messagesubject" value="<%= sTitle %>">
				<input type="hidden" name="messagetitle" value="<%= sSubject %>">
				<input type="hidden" name="onbehalfof" value="<%= sFrom %>">
				<input type="hidden" name="query" value="<%= sCirculation %>">
				<input type="hidden" name="message" value="<%= sDetails %>">
				<input type="hidden" name="leadparagraph" value="<%= sLeadParagraph %>">
				<input type="hidden" name="youngest" value="<%= startage %>">
				<input type="hidden" name="oldest" value="<%= endage %>">
				<input type="hidden" name="includecoaches" value="<%= sIncludeCoaches %>">
				<input type="hidden" name="postid" value="<%= sPost %>">
				<div id="submitblock" align="right">
					<p style="margin-right:50px;">
						<input align="right" type="submit" value="Send Message">
					</p>
				</div>
			</form>
		</div>
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

