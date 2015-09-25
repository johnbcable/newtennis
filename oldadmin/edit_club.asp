<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Contact Details of Other Clubs");
// Now for any variables local to this page
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
var clubid;
var theclub = new Object();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
//
clubid = new String(Request.Form("clubid")).toString();
if (clubid == "" || clubid == "null" || clubid == "undefined")
{
	clubid = new String(Request.QueryString("clubid")).toString();
	if (clubid == "" || clubid == "null" || clubid == "undefined")
		Response.Redirect("directions.asp");
}
// Security checks
if (! signedin())
	Response.Redirect("lst_club.asp?clubid="+clubid);
if (! isAdministrator())
	Response.Redirect("lst_club.asp?clubid="+clubid);
// Fetch existing club details
theclub = getClub(clubid);
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
		<h1>Site Administration:&nbsp;<b>Other Club Details</b></h1>
		<h3>Amending Details for <span class="blueheading"><%= theclub.clubname %></span></h3>
		<p>
			In the form below, please make sure that the information in the boxes reflects the up-to-date 
			contact and location information for the club and then click on the Save button to safeguard your 
			changes.
		</p>
		<p>
			Every effort is made to ensure that the following information is up-to-date.
			However, it cannot reflect any last minute or un-notified changes. If you are at all unsure 
			about this information, please ring the club directly.
		</p>		
		<br />
		<form action="set_club.asp" method="post">
			<fieldset>
				<legend>Club Name and Address</legend>
				<div>
					<label for="clubname">Club Name:</label>
					<input type="text" name="clubname" id="clubname" size="35" maxlength="60" value="<%= theclub.clubname %>">
				</div>
				<div>
					<label for="address1">Address:</label>
					<input type="text" name="address1" id="address1" size="35" maxlength="50" value="<%= theclub.address1 %>">
				</div>							
				<div>
					<label for="address2">&nbsp;</label>
					<input type="text" name="address2" id="address2" size="35" maxlength="50" value="<%= theclub.address2 %>">
				</div>
				<div>
					<label for="address3">&nbsp;</label>
					<input type="text" name="address3" id="address3" size="35" maxlength="50" value="<%= theclub.address3 %>">
				</div>								
				<div>
					<label for="address4">&nbsp;</label>
					<input type="text" name="address4" id="address4" size="35" maxlength="50" value="<%= theclub.address4 %>">
				</div>
				<div>
					<label for="town">Town:</label>
					<input type="text" name="town" id="town" size="35" maxlength="50" value="<%= theclub.town %>">
				</div>
				<div>
					<label for="county">County</label>
					<input type="text" name="county" id="county" size="35" maxlength="50" value="<%= theclub.county %>">
				</div>
				<div>
					<label for="postcode">Post Code:</label>
					<input type="text" name="postcode" id="postcode" size="12" maxlength="12" value="<%= theclub.postcode %>">
				</div>
			</fieldset>					
			<fieldset>
				<legend>Club Contact</legend>
				<div>
					<label for="contact">Contact Name:</label>
					<input type="text" name="contact" id="contact" size="35" maxlength="50" value="<%= theclub.contact %>">
				</div>
				<div>
					<label for="telephone">Telephone:</label>
					<input type="text" name="telephone" id="telephone" size="35" maxlength="50" value="<%= theclub.telephone %>">
				</div>							
				<div>
					<label for="fax">Fax:</label>
					<input type="text" name="fax" id="fax" size="35" maxlength="50" value="<%= theclub.fax %>">
				</div>
				<div>
					<label for="email">Email:</label>
					<input type="text" name="email" id="email" size="35" maxlength="50" value="<%= theclub.email %>">
				</div>								
			</fieldset>
			<fieldset>
				<legend>Mens Tennis</legend>
				<div>
					<label for="contact2">Contact Name:</label>
					<input type="text" name="contact2" id="contact2" size="35" maxlength="50" value="<%= theclub.contact2 %>">
				</div>
				<div>
					<label for="telephone2">Telephone:</label>
					<input type="text" name="telephone2" id="telephone2" size="35" maxlength="50" value="<%= theclub.telephone2 %>">
				</div>							
				<div>
					<label for="email2">Email:</label>
					<input type="text" name="email2" id="email2" size="35" maxlength="50" value="<%= theclub.email2 %>">
				</div>	
			</fieldset>
			<fieldset>
				<legend>Ladies Tennis</legend>
				<div>
					<label for="contact3">Contact Name:</label>
					<input type="text" name="contact3" id="contact3" size="35" maxlength="50" value="<%= theclub.contact3 %>">
				</div>
				<div>
					<label for="telephone3">Telephone:</label>
					<input type="text" name="telephone3" id="telephone3" size="35" maxlength="50" value="<%= theclub.telephone3 %>">
				</div>							
				<div>
					<label for="email3">Email:</label>
					<input type="text" name="email3" id="email3" size="35" maxlength="50" value="<%= theclub.email3 %>">
				</div>												
			</fieldset>
			<fieldset>
				<legend>Miscellaneous</legend>
				<div>
					<label for="cluburl">Club web site:</label>
					<input type="text" name="cluburl" id="cluburl" size="60" maxlength="100" value="<%= theclub.cluburl %>">
				</div>
				<div>
					<label for="totaltennis">Totaltennis web site:</label>
					<input type="text" name="totaltennis" id="totaltennis" size="60" maxlength="100" value="<%= theclub.totaltennis %>">
				</div>							
				<div>
					<label for="comments">Comments:</label>
					<input type="text" name="comments" id="comments" size="60" maxlength="200" value="<%= theclub.comments %>">
				</div>												
			</fieldset>
			<div id="submitblock" align="right">
				<p style="text-align:right; margin-right: 20px;">
					<input type="hidden" name="clubid" value="<%= clubid %>">
					<input align="right" type="submit" value="Save">
				</p>
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
</html>
<%
%>
