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
var pagetitle = new String("Testing email template - ");
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
var debugging;
var mUnique = new String(Request.QueryString("id")).toString();
if (mUnique == "" || mUnique == "null"  || mUnique == "undefined") {
	mUnique = new String("11").toString();
}
var template = new String(Request.QueryString("template")).toString();
if (template == "" || template == "null"  || template == "undefined") {
	template = new String("newmember.htm").toString();
}
var memberObj = getMember(mUnique);

// Calculate current age of member
var membersAge = currentAge(memberObj.dob);

// var template = new String("newmember.htm").toString();
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();

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
var htmlindex, doctypeindex, fullmessage, tMessage;
var dummy;
// Set up default greeting strings
kount = 0;
strdate = datestring();
strtime = timestring();
strtoday = today();
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
		<h1>Admin:<b>&nbsp;<%= pagetitle %> </b></h1>
<%
		Response.Write("<p>Testing email template "+template+" ... <br /><br />");

		// ========================================================================
		// Do mail-merge replacements in template and send out via email
		//=========================================================================

		// Read in contents of HTML email template to be used
		if (emaildir == "")
		{
			 sMessage = new String(GetEveryThing(template));
			 fullwhichfile = new String(template).toString();
		}
		else
		{
			 sMessage = new String(GetEveryThing(emaildir+"/"+template));
			 fullwhichfile = new String(emaildir+"/"+template).toString();
		}	 
		//
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
		sMessage = new String(sMessage.replace("ZZageZZ",membersAge)).toString();
		//
		// Now put dummy text into heading, lead paragrah and body text.
		//
		var mTitle = "This is my email title";
		var mLead = "This is my lead paragraph. It appears emphasised on the email like first paragraphs in newspaper articles to summarise and interest viewers about what comes next.";
		var mBody = "This is the main body of the email and appears in normal type after any lead paragrpah that may have been defined. This can consist of one paragraph of text or<br /><br />may extend to more than one";
		var circhistory = "johncable@talk21.com <br />lesleycable@btinternet.com<br />";
		sMessage = new String(sMessage.replace("ZZbodytextZZ",mBody)).toString();
		sMessage = new String(sMessage.replace("ZZtitleZZ",mTitle)).toString();
		sMessage = new String(sMessage.replace("ZZleadparagraphZZ",mLead)).toString();
		sMessage = new String(sMessage.replace("ZZcirculationZZ",circhistory)).toString();

		objCDOMail = newMailObject();   // in emailfuncs
		
		objCDOMail.From=new String("secretary@hamptontennis.org.uk");   // keep as constant for testing
		objCDOMail.Subject=new String("Email template test - "+template).toString();
		// objCDOMail.BodyFormat=0;
		// objCDOMail.MailFormat=0;
		// objCDOMail.Body=new String(tMessage).toString();
		objCDOMail.HTMLBody=new String(sMessage).toString();
		objCDOMail.BodyPart.charset = "utf-8";
		
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
			} else {
				kount += 1;
				Response.Write("&nbsp;&nbsp;&nbsp;Test of email template "+template+" sent OK<br />")
			}
		}    // end catch


		Response.Write("<br>");
		Response.Write("==============================================================<br>");
		Response.Write("Test email sent out to the above using template "+template+"<br>");
		Response.Write("==============================================================<br>");

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

