.<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Viewing Circulated Messages");
// Now for any functions and variables local to this page
// Now for any variables local to this page
var debugging=false;
var Conn, RS, SQL1, SQL2, SQL3;
var thmessageid = new String(Request.QueryString("id")).toString();
var sMessage, emailnumber, maxemailnumber;
var datesent;
var nextlink, prevlink;
var messageobj;
var idnumber = 1;
var displaydate;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
if (thmessageid == "null" || thmessageid == "undefined" || thmessageid == "")
{
    thmessageid = new String(Request.Form("messageid")).toString();
    if (thmessageid == "null" || thmessageid == "undefined" || thmessageid == "")
		thmessageid = new String("1").toString();
}
idnumber = new Number(thmessageid);
idnumber = idnumber.valueOf();
// Retrieve the message as an Object via its id
messageobj = getMessageByID(idnumber);
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
<style type="text/css">
<!--
#closewindow {
				 position: relative;
				 margin: 20px auto;
}
#closebutton {
					 position: relative;
					 top: 0;
					 left: 40%;
					 width: 20%;
					 text-align: center;
}

#closebutton a, #closebutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  	font-size: 110%;
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

#closebutton a:hover { 
	background-color: #111; 
	color: #fff; 
}
hr {
	margin: 20px 0 20px 0;
}
-->
</style>
<style>
</style>
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
		<h1>Viewing text of a quick message</h1>
		<hr />
<%
if (debugging)
{
%>		
		<p>
		<%= messageobj.subject %><br />
		<%= messageobj.senton %><br />
		<%= messageobj.circulation %><br />
		<%= messageobj.numbersent %><br />
		<%= messageobj.messageid %><br />
		<%= messageobj.sender %><br />
		<%= messageobj.postid %><br />
		<%= messageobj.leadparagraph %><br />
		</p>
<%
}
%>
	<div id="mainContent">
		<div class="borderbottom" id="emailparams">
			<p class="leftindent">Subject: ------->  <%= messageobj.subject %></p>
			<p class="leftindent">Date sent: ----->  <%= dateasstring(messageobj.senton) %></p>
			<p class="leftindent">Sent to: ------->  <%= messageobj.circulation %></p>
			<p class="leftindent">Sent from: ----->  <%= messageobj.sender %></p>
			<p class="leftindent">Message text: -->  </p>
		</div>
		<div class="centered" id="quickmessage" style="overflow: hidden; background-color:white; padding: 20px 0;">
<%
			Response.Write(messageobj.leadparagraph);
			Response.Write("<br /><hr /><br />");
			Response.Write(messageobj.messagetext);
%>
		</div>

		<hr />

	</div>    <!-- mainContent -->
	<div id="closewindow" style="clear: both; padding: 20px 0; margin-top: 20px">
		 <div id="closebutton">
		 			<a href="javascript:window.close();">Close Window</a>
		 </div>
	</div>
<!--
	<div id="closewindow" style="width: 90%; margin: 20px auto 20px auto;">
		<a href="javascript:window.close();">Close this window</a>
	</div>
-->	
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
		<!--#include file="messagepanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>
