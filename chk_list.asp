<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Showing members of a circulation list");
var membername = new String("");
var debugging = false;
var dbconnect=Application("hamptonsportsdb"); 
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
displaydate = dateasstring(Date());
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * FROM circulation_lists ORDER BY queryname").toString();
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
		<h1>Members <b>Showing members of a circulation list</b></h1>
		<form name="ListForm" method="GET" action="lst_circulation.asp">
		<fieldset id="membercheck">
			<legend><%= pagetitle %></legend>
					<div>
						<label for="listname">Which list:</label>
						<select name="listname" id="listname">
<%
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	Response.Write('<option value="'+RS("queryname")+'">'+RS("name"));
	RS.MoveNext();
}
RS.Close();
%>
						</select>
					</div>
				<div>
					<label for="sortorder">Ordering for Results:&nbsp;</label>
					<select id="sortorder" name="sortorder">
						<option selected>A - Alphabetic by surname, grade and forename
						<option>B - Ascending by grade, then surname then forename
						<option>C - Ascending by date of birth, then surname
					</select>
				</div>

				<div>
					<hr />
					<h2 style="margin-left: 20px;">Optional</h2>
					<p style="margin-left: 20px;">
						You can also check how an age range filter would work with this circulation list as follows:
					</p> 
					<p style="font-weight: bold; text-decoration: underline; margin-left: 30px;">Target age range (in years):</p>
					<label id="youngestlabel" for="youngest">Youngest :</label>
					<input type="text" name="youngest" id="youngest" size="3" maxlength="3" value=""/>
				</div>
				<div>
					 <label id="oldestlabel" for="oldest">Oldest :</label>
					 <input type="text" name="oldest" id="oldest" size="3" maxlength="3" value=""/><br />
					 <p style="margin-left: 20px;">
						 Please fill in both youngest and oldest ages for 
						 the age range filter to work 
					</p>
					 <hr />
				</div>



				<div align="right" style="margin-right: 20px;">
					<br />
					<input type="hidden" name="acclevel" value="9">
					<input name="cmdSubmit" type="Submit" value="Show" onclick="DisableSubmitButton(this);">
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
    Document.ListForm.surname.Focus
End Sub
</SCRIPT>
</html>
<%
%>
