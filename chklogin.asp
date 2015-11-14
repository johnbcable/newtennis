<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var debugging = false; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Checking Member Sign-In");
// Now for any variables local to this page
var v_membername = new String("");
var v_memberid;
var v_acclevel;
var v_uniqueref;
var dbconnect=Application("hamptonsportsdb"); 
var ConnObj, RS, sqlString, SQL1, SQL2, SQL3, SQL4;
var message1, message2, message3, message4, message5;
var badSignIn=true;
var errMess;
var myusername, myaddress;
var refurl;
var onwardurl;
var debugging = current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
v_memberid=new String("");
v_membername=new String("");
v_acclevel=0;
//
// Major changes following release of new site//
// Now only allow people to sign-in who are designated 
// administrators. Can still login with online booking
// ID and PIN or previously released useranme/password
//
// Adjust login process to check this
//
message1=new String("signin with SQL1 not tried");
message2=new String("signin with SQL2 not tried");
message3=new String("signin with SQL3 not tried");
message4=new String("signin with SQL4 not tried");
message5=new String("access level too low");
// End of page start up coding

// Set up onward route after signin check has succeeded

refurl = new String(Request.Form("refurl")).toString();
if (refurl == "" || refurl=="null" || refurl == "undefined")
	refurl = new String("").toString();
onwardurl = new String(refurl).toString();
if (onwardurl == "")
	onwardurl = new String("oldwayin.asp").toString();

// Get details for audit logging

myusername = new String(Request.ServerVariables("REMOTE_USER")).toString();
myaddress = new String(Request.ServerVariables("REMOTE_ADDR")).toString();
if (myusername == "" || myusername=="null" || myusername == "undefined")
	myusername = new String(myaddress).toString();

errMess = new String("")
displaydate = dateasstring(Date());
// debugging = true;
// End of page start up coding
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

// Set up sign-in SQL queries

sqlString=new String("delete from user_sessions where remoteaddress = '"+myaddress+"' or remoteuser = '"+myusername+"' or memberid = '"+v_memberid+"'").toString();
RS=ConnObj.Execute(sqlString);
SQL1 = new String("Select uniqueref, memberid, forename1, webaccess from members where memberid = '" + Request.Form("frmUserId") + "' and webpassword = '" + Request.Form("frmPassword") + "'");
SQL2 = new String("Select uniqueref, memberid, forename1, webaccess from members where onlinebookingid = " + Request.Form("frmUserId") + " and onlinebookingpin = '" + Request.Form("frmPassword") + "'");
SQL3 = new String("Select uniqueref, memberid, forename1, webaccess from members where email = '" + Request.Form("frmUserId") + "' and webpassword = '" + Request.Form("frmPassword") + "'");
SQL4 = new String("Select uniqueref, memberid, forename1, webaccess from members where email = '" + Request.Form("frmUserId") + "' and onlinebookingpin = '" + Request.Form("frmPassword") + "'");

// Now try each in turn until success

RS = ConnObj.Execute(SQL1);
message1=new String("trying signin with SQL1 ...");
while (! RS.EOF)
{
	badSignIn=false;
	message1 = "signin with SQL1 succeeded";
	v_uniqueref = new String(RS("uniqueref")).toString();
	v_memberid = new String(RS("memberid")).toString();
	v_membername = new String(RS("forename1")).toString();
	v_acclevel = new String(RS("webaccess")).toString();
	RS.MoveNext();
}
RS.Close();
if (badSignIn) // not valid username and password - check email and webpassword (strings)
{
 	message3=new String("trying signin with SQL3 ...");
	RS = ConnObj.Execute(SQL3);
	// Now check if sign in was OK
	while (! RS.EOF)
	{
 	 	message3=new String("signin with SQL3 succeeded");
		badSignIn=false;
		v_uniqueref = new String(RS("uniqueref")).toString();
		v_memberid = new String(RS("memberid")).toString();
		v_membername = new String(RS("forename1")).toString();
		v_acclevel = new String(RS("webaccess")).toString();
		RS.MoveNext();
	}
	RS.Close();
}
if (badSignIn) // not valid username and password - check email and PIN (strings)
{
 	message4=new String("trying signin with SQL4 ...");
	RS = ConnObj.Execute(SQL4);
	// Now check if sign in was OK
	while (! RS.EOF)
	{
 	 	message4=new String("signin with SQL4 succeeded");
		badSignIn=false;
		v_uniqueref = new String(RS("uniqueref")).toString();
		v_memberid = new String(RS("memberid")).toString();
		v_membername = new String(RS("forename1")).toString();
		v_acclevel = new String(RS("webaccess")).toString();
		RS.MoveNext();
	}
	RS.Close();
}
if (badSignIn) // not valid username and password - check onlinebookinid (integer) and PIN (string)
{
	if (! isNaN(Request.Form("frmUserId")))
		{
		 	message2=new String("trying signin with SQL2 ...");
			RS = ConnObj.Execute(SQL2);
			// Now check if sign in was OK
			while (! RS.EOF)
			{
 	 		 	message2=new String("signin with SQL2 succeeded");
				badSignIn=false;
				v_uniqueref = new String(RS("uniqueref")).toString();
				v_memberid = new String(RS("memberid")).toString();
				v_membername = new String(RS("forename1")).toString();
				v_acclevel = new String(RS("webaccess")).toString();
				RS.MoveNext();
			}
			RS.Close();
		}
}
if (debugging)
{
%>
		<p>
			<br />
			SQL enquiry was   [<%= sqlString %>]<br />
			SQL1  was   			[<%= SQL1 %>]<br />
			SQL2  was   			[<%= SQL2 %>]<br />
			SQL3  was   			[<%= SQL3 %>]<br />
			SQL4  was   			[<%= SQL4 %>]<br />
			Referring URL was [<%= refurl %>]<br />
			Onward URL was    [<%= onwardurl %>]<br />
			v_uniqueref  was  [<%= v_uniqueref %>]<br />
			v_memberid was   	[<%= v_memberid %>]<br />
			v_acclevel was   	[<%= v_acclevel %>]<br />
			v_membername was  [<%= v_membername %>]<br />
			message1 was   		[<%= message1 %>]<br />
			message2 was   		[<%= message2 %>]<br />
			message3 was   		[<%= message3 %>]<br />
			message4 was   		[<%= message4 %>]<br />
		</p>
<%
}
if (badSignIn)
{
	// Bad user name detected
	errMess+=new String("Incorrect admin user name and/or password supplied.");
%>	
			<h1>Administration:<b>&nbsp;Login Problem</b></h1>
			<div id="loginerror" align="center">
				<u>Member Sign-In Problem - Access Denied</u><br /><br />
				<%= errMess %><br />
				<br />
				<p>
					Click <a href="oldwayin.asp">here</a> to return to sign-in again, or<br>
					click on a menu choice on the left to go elsewhere in the site.
				</p>
			</div>
<%
}
if (!badSignIn)
{
	// Username/password OK
	/// Now check access level
	if (v_acclevel < "50") {
	
		errMess+=new String("You do not have administration access");
%>	
			<h1>Administration:<b>&nbsp;Login Problem</b></h1>
			<div id="loginerror" align="center">
				<u>Administration Sign-In Problem - Access Denied</u><br /><br />
				<%= errMess %><br />
				<br />
				<p>
					Click <a href="oldwayin.asp">here</a> to return to sign-in again, or<br>
					click on a menu choice on the left to go elsewhere in the site.
				</p>
			</div>
<%
	}
	else {
		setUser(v_uniqueref,v_memberid,v_membername,v_acclevel);  // Session record - not permanent
		SQL1 = new String("insert into member_audits([memberid],[action]) values ('"+v_memberid+"','LOGIN')");
	//	Response.Write("["+SQL1+"]");
		RS = ConnObj.Execute(SQL1);
		RS=null;
		ConnObj.Close();
		ConnObj=null;
		onwardurl = new String("oldwayin.asp").toString();
	}
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
