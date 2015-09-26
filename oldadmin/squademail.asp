<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - General Email to a Squad");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
var thesquad;
var squaddetails;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Process referrer info
thesquad = new String("-1").toString();
thesquad = mySquadID();
if (thesquad == "-1")
	Response.Redirect("members.asp");
squaddetails = getSquad(thesquad);
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="tennis3col.css" />
	<link rel="stylesheet" type="text/css" href="softboxes.css" />
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" />
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
</head>
<body>
<div id="container">
	<div id="header">
		<img id="clublogo" src="images/logo.gif" width="88" height="100" alt="Hampton-In-Arden Sports Club logo" />
		<h2>Hampton-In-Arden Sports Club</h2>
		<h3>Tennis Section</h3>
			<!--#include file="horizmenu.asp" -->
	</div>
<!--#include file="dateval.asp" -->
	<div id="content">
		<div id="mainContent">
			<h3>Sending an email to the <%= squaddetails.squadname %> squad members</h3>
			<div id="squademailformdiv">
				<form name="SquadEmailForm" action="postsquademail.asp" method="post">
					<fieldset>
						<legend>Supply message to send in box below</legend>
						<div>
							<label for="subject">Subject:</label>
							<input tabindex="1" type="text" name="subject" id="subject" size="60" maxlength="190" />
						<div>
						<div>
							<label for="message">Text of message:</label>
							<textarea name="message" rows="20" cols="58" tabindex="2">Replace me with your message</textarea><br />
							<input type="hidden" name="uniqueid" value="-1">
							<input type="hidden" name="confirm" value="N">
							<input type="hidden" name="debug" value="Y">
							<input type="hidden" name="realemailpage" value="postsquademail.asp">
							<input type="hidden" name="emailtemplate" value="squademail.htm">
						</div>
						<div style="clear: both;">
							<p class="rightalign">
								<input type="submit" value="Send Email" name="submit" tabindex="3">
							</p>
						</div>
					</fieldset>
				</form>
			</div>
		</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

