<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Club News and Events");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var kount, thetext, theparas;
var title, issueno, issueseq, author, articletext;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
Response.Redirect("eventlist.asp");
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
	<h3>Tennis Club News and Events</h3>
	<p>
		Your tennis club news and events have moved - you will be automatically taken there in a few seconds.
	</p>
	<p>
		If the above redirection does not work, please click <a href="eventlist.asp">here</a> to go to the new location for news and events.
	</p>
	</div>  <!-- mainContent -->
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
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
