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
var debugging = false; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("User ID and Password Reminder");
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
var v_membername = new String("");
var dbconnect=Application("hamptonsportsdb"); 
var ConnObj, RS, sqlString, SQL1, SQL2, SQL3, SQL4;
var badSignIn=true;   // default fo failed login attempt
var errMess;
var myusername, myaddress;
var refurl;
var onwardurl;
var theforename, thesurname, theemail;

// variables re sending emails
var memberObj = new Object();
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

// var debugging = current_debug_status();

var debugging=current_debug_status();
debugging = true;

// Set up default greeting strings
// Set up default greeting strings
kount = 0;
strtoday = today();
var displaydate = dateasstring(Date());
strdate = datestring();
strtime = timestring();

// End of page start up coding

// Pick up referring URL etc 
refurl = new String(Request.ServerVariables("HTTP_REFERER")).toString();
if (refurl == "" || refurl=="null" || refurl == "undefined")
	refurl = new String("members.html").toString();
onwardurl = new String(refurl).toString();
myusername = new String(Request.ServerVariables("REMOTE_USER")).toString();
myaddress = new String(Request.ServerVariables("REMOTE_ADDR")).toString();
if (myusername == "" || myusername=="null" || myusername == "undefined")
	myusername = new String(myaddress).toString();
errMess = new String("").toString();
//
// Pick up passed-in parameters
//
var mUnique = new String(Request.QueryString("id")).toString();
if (mUnique == "" || mUnique == "null"  || mUnique == "undefined") {
	mUnique = new String("NONE").toString();
}
var template = new String(Request.QueryString("template")).toString();
if (template == "" || template == "null"  || template == "undefined") {
	template = new String("reminduser.htm").toString();
}
theforename=new String(Request.Form("frmForename")).toString();
if (theforename=="undefined" || theforename=="null" || theforename=="")
{
    theforename=new String(Request.QueryString("frmForename")).toString();
		if (theforename=="undefined" || theforename=="null" || theforename=="")
			 theforename = new String("NONE");
}
thesurname=new String(Request.Form("frmSurname")).toString();
if (thesurname=="undefined" || thesurname=="null" || thesurname=="")
{
    thesurname=new String(Request.QueryString("frmSurname")).toString();
		if (thesurname=="undefined" || thesurname=="null" || thesurname=="")
			 thesurname = new String("NONE");
}
thesurname = thesurname.toUpperCase();  // necessary to allow surname match on DB
theemail=new String(Request.Form("frmEmail")).toString();
if (theemail=="undefined" || theemail=="null" || theemail=="")
{
    theemail=new String(Request.QueryString("frmEmail")).toString();
		if (theemail=="undefined" || theemail=="null" || theemail=="")
			 theemail = new String("NONE");
}
//
displaydate = dateasstring(Date());
// End of page start up coding
errMess += "<p>Firstname ["+theforename+"]</p>";
errMess += "<p>Surname   ["+thesurname+"]</p>";
errMess += "<p>Email     ["+theemail+"]</p>";

ConnObj = Server.CreateObject("ADODB.connection");
ConnObj.Open(dbconnect);

// Now, if no ID has been passed in, attempt match from other parameters on DB

if (mUnique == "NONE") {
	// Now do the check against the members table
	SQL1 = new String("Select uniqueref from members where forename1 = '" + theforename + "' and surname = '" + thesurname + "' and email = '" + theemail + "'");
	errMess += "<p>SQL       ["+SQL1+"]</p>";
	// See if this user is there
	RS = ConnObj.Execute(SQL1);
	if (RS.EOF)
	{
		// No match on the database
		errMess += "<p>No match found on the club database</p>";
		mUnique = new String("NOMATCH").toString();
	}
	else 
	{
		errMess += "<p>Match found on the club database</p>";
		errMess += "<p>Will send email to member with uniqueref of "+RS("uniqueref")+"</p>";
		mUnique = new String(RS("uniqueref")).toString();
	}
	RS.Close();
}

// At this point mUnique = uniqueref or NONE or NOMATCH

if (mUnique == "NOMATCH") {
	errMess += "<p>No email sent - no match on DB</p>";

}
if (mUnique == "NONE") {
	errMess += "<p>No email sent - no ID passed in</p>";
}

// We have a uniqueref for a member - lets proceed

memberObj = getMember(mUnique);
mEmail = new String(memberObj.email).toString();

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

objCDOMail = newMailObject();   // in emailfuncs

objCDOMail.From=new String("secretary@hamptontennis.org.uk");   // keep as constant for testing
objCDOMail.Subject=new String("Tennis Club Online Access Reminder").toString();
// objCDOMail.BodyFormat=0;
// objCDOMail.MailFormat=0;
// objCDOMail.Body=new String(tMessage).toString();
objCDOMail.HTMLBody=new String(sMessage).toString();
objCDOMail.BodyPart.charset = "utf-8";

objCDOMail.To=new String(mEmail).toString();
var sentok = true;
try {
		objCDOMail.Send();
		}
catch(e) {
if (!(e.number &0xFFFF) == 0) {
	errMess += "Error sending email<br /><br />";
	errMess += "Facility code:        "+e.number>>16 & 0x1FFF;
	errMess += "<br />";
	errMess += "Error code:           "+e.number & 0xFFFF;
	errMess += "<br />";
	errMess += "Description:          "+e.description+"<br />";
	sentok = false;
	} else {
		kount += 1;
		errMess += "&nbsp;&nbsp;&nbsp;Online access reminder sent to "+mEmail+" sent OK<br />";
	}
}    // end catch


errMess += "<br />";
errMess += "==============================================================<br />";
errMess += "Test email sent out to the above using template "+template+"<br />";
errMess += "==============================================================<br />";

if (sentok) {
	Response.Redirect("/");
}

%>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hampton-in-Arden Tennis Club - </title>
    <link rel="stylesheet" href="bower_components/foundation/css/normalize.css" />
    <!-- <link rel="stylesheet" href="css/base.css" />  -->
    <link rel="stylesheet" href="css/styles.css" />
    <script src="bower_components/modernizr/modernizr.js"></script>
  </head>
  <body>
<%
if (debugging || (! sentok))
{
	Response.Write("<h2>Passed in parameters and progress notes were:</h2>");
	Response.Write(errMess);
	Response.Write("<br />============================================================<<br />");
	Response.End();
}
%>
</body>
</html>
<%
%>