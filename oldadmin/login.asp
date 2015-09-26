<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member Sign-In Area");
var refurl = Request.ServerVariables("HTTP_REFERRER");
var debugging = current_debug_status();
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Redirect if login panel on front page is working
// Response.Redirect("index.asp");
displaydate = dateasstring(Date());
// debugging = true;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Members Login</title>
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
<%
if (debugging)
{
	Response.Write("<br />");
	Response.Write("Referring URL is:  ["+refurl+"]");
	Response.Write("<br />");
	Response.End();
}
%>	
	<h1>Members:<b>&nbsp;Sign-In</b></h1>
    <form name="signin" action="chklogin.asp" method="POST">
		<fieldset>
			<legend>Type in your username and password below</legend>
			<div>
				<label for="frmUserId">Username: </label>
				<input type="text" name="frmUserId" id="frmUserId" size="20" maxlength="50">
			</div>
			<div>
				<label for="frmPassword">Password: </label>
				<input type="password" name="frmPassword" id="frmPassword" size="20" maxlength="50">
			</div>
				<input id="refurl" name="refurl" type="hidden" value="<%= refurl %>" />
				<input type="submit" value="Sign-In" name="btnSubmit" id="btnSubmit" />
		<fieldset>
	</form>		
	<p align="center">
   A member of our club but not got a user name or password yet? Just <a href="mailto:support@hamptontennis.org.uk">email us</a> (or
   contact a <a href="committees.asp">committee member</a>) and we will forward your web user name and password to you.
   </p>
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
<script language="JScript" CODEPAGE="65001">
window.onload=function() {
	firstfield=document.getElementById('frmUserId');
	firstfield.focus();
}
</script>
</html>
<%
%>
