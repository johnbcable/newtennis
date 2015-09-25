<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Birthday Search");
var membername = new String("");
var debugging = false;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (!isCommittee())
	Response.Redirect("index.asp");
displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis - <%= pagetitle %></title>
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
#currentmembers {
				 position: relative;
				 margin: 20px auto;
}
#membersbutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#membertext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#membertext p {
			 padding-left: 30px;
}						

#membersbutton a, #membersbutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
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

#membersbutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>
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
		<h1>Admin <b>Birthday Search</b></h1>
 		<div id="currentmembers" style="clear: both; padding: 20px 0; margin-bottom: 20px; ">
			 <div id="membersbutton">
			 			<a href="printmemberlist.asp">Member Directory</a>
			 </div>
			<div id="membertext">
				<p>
					The current complete 18 and over members directory is now available on the site. Click on the Member Directory button to view it.
				</p>
			</div>
		</div>
		<p style="clear: both; margin-bottom: 20px; line-height: 20px;">&nbsp;</p>
		<form name="BirthdayForm" method="GET" action="lst_birthdays.asp">
		<fieldset id="membercheck">
			<legend><%= pagetitle %></legend>
				<div>
					<label for="BirthdayPeriod">In What Time Period:&nbsp;</label>
					<select id="BirthdayPeriod" name="BirthdayPeriod">
						<option selected value="season">Any time this season
						<option value="week">In the next week
						<option value="month">In the next month (30 days)
						<option value="3months">In the next 3 months (90 days)
					</select>
				</div>
				<div>
					<label for="BirthdayAge">For what age:&nbsp;</label>
					<select id="BirthdayAge" name="BirthdayAge">
						<option selected value="ANY">Any age
<%
for (i=7; i<19; i++)
{
	Response.Write("<option value="+i+">"+i);
}	
%>						
					</select>
				</div>
<!--
				<div>
					<label for="sortorder">Ordering for Results:&nbsp;</label>
					<select id="sortorder" name="sortorder">
						<option selected>A - Alphabetic by surname, grade and forename
						<option>B - Ascending by grade, then surname then forename
						<option>C - Ascending by date of birth, then surname
					</select>
				</div>
-->
				<div align="right" style="margin-right: 20px;">
					<br />
					<input name="cmdSubmit" type="Submit" value="Fetch "+&raquo; onclick="DisableSubmitButton(this);">
				</div>
			</form>
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.BirthdayForm.BirthdayPeriod.Focus
End Sub
</SCRIPT>
</html>
<%
%>
