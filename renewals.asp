
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var debugging = false; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Membership Renewals Process");
// Now for any variables local to this page
var v_membername = new String("");
var v_memberid;
var v_acclevel;
var v_uniqueref;
var dbconnect=Application("hamptonsportsdb"); 
var ConnObj, RS, sqlString, SQL1, SQL2, SQL3, SQL4;
var badSignIn=true;
var errMess;
var myusername, myaddress;
var refurl, onwardurl;
var onlinebookingid, onlinebookingpin;
var debugging = current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
v_uniquref = -1;
v_memberid=new String("");
v_membername=new String("");
v_acclevel=0;
// End of page start up coding
refurl = new String(Request.QueryString("refurl")).toString();
if (refurl == "" || refurl=="null" || refurl == "undefined")
	refurl = new String("").toString();
onwardurl = new String(refurl).toString();
if (onwardurl == "")
	onwardurl = new String("members.asp").toString();  // default for old site

onlinebookingid = new String(Request.QueryString("frmUserId")).toString();
if (onlinebookingid == "" || onlinebookingid=="null" || onlinebookingid == "undefined") {
	onlinebookingid = new String("").toString();
}

onlinebookingpin = new String(Request.QueryString("frmPassword")).toString();
if (onlinebookingpin == "" || onlinebookingpin=="null" || onlinebookingpin == "undefined") {
	onlinebookingpin = new String("").toString();
}

myusername = new String(Request.ServerVariables("REMOTE_USER")).toString();
myaddress = new String(Request.ServerVariables("REMOTE_ADDR")).toString();
if (myusername == "" || myusername=="null" || myusername == "undefined")
	myusername = new String(myaddress).toString();
errMess = new String("")
displaydate = dateasstring(Date());
// End of page start up coding
debugging = true;    // Production = false
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<%
ConnObj = Server.CreateObject("ADODB.connection");
ConnObj.Open(dbconnect);
sqlString=new String("delete from user_sessions where remoteaddress = '"+myaddress+"' or remoteuser = '"+myusername+"' or memberid = '"+v_memberid+"'").toString();
if (! debugging) {
	RS=ConnObj.Execute(sqlString);
}
// Only dealing with online booking Id and PIN now
SQL1 = new String("Select uniqueref, memberid, forename1, webaccess from members where onlinebookingid = " + onlinebookingid + " and onlinebookingpin = '" + onlinebookingpin + "'");

if (debugging)
{
%>
		<p>
			<br />
			SQL1 was                    [<%= SQL1 %>]<br />
			Referring URL was           [<%= refurl %>]<br />
			Onward URL was              [<%= onwardurl %>]<br />
			Online Booking ID was       [<%= onlinebookingid %>]<br />
			Online Booking PIN was      [<%= onlinebookingpin %>]<br />
		</p>
<%
}

if (! isNaN(onlinebookingid)) {
	RS = ConnObj.Execute(SQL1);
	// Now check if sign in was OK
	while (! RS.EOF)
	{
		badSignIn=false;
		v_uniqueref = new String(RS("uniqueref")).toString();
		v_memberid = new String(RS("memberid")).toString();
		v_membername = new String(RS("forename1")).toString();
		v_acclevel = new String(RS("webaccess")).toString();
		RS.MoveNext();
	}
	RS.Close();
}

if (debugging)
{
%>
		<p>
			<br />
			SQL1 was                    [<%= SQL1 %>]<br />
			Referring URL was           [<%= refurl %>]<br />
			Onward URL was              [<%= onwardurl %>]<br />
			Online Booking ID was       [<%= onlinebookingid %>]<br />
			Online Booking PIN was      [<%= onlinebookingpin %>]<br />
			badSignIn is                [<%= badSignIn ? "TRUE" : "FALSE" %>]<br />
			v_uniqueref                 [<%= v_uniqueref %>]<br />
			v_memberid                  [<%= v_memberid %>]<br />
			v_membername                [<%= v_membername %>]<br />
			v_acclevel                  [<%= v_acclevel %>]<br />
		</p>
<%
	Response.End();
}
if (!badSignIn)
{
	setUser(v_uniqueref,v_memberid,v_membername,v_acclevel);  // Session record - not permanent
//	SQL1 = new String("insert into member_audits([memberid],[action]) values ('"+v_memberid+"','LOGIN')");
//	Response.Write("["+SQL1+"]");
//	RS = ConnObj.Execute(SQL1);
	RS=null;
	ConnObj.Close();
	ConnObj=null;
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
if (! debugging)
	Response.Redirect(onwardurl); // redirect to member services area
%>

