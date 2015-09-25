<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt, SQL2;
var d, thisyear;
var kount, dummy1;
var teams = new Array(10);
var team_ids = new Array(10);
var teamlinks = new Array(10);
var curteam, thisteam, newteam;
var venuetext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thisyear = "";
d = new Date();
thisyear += d.getYear();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
RS2=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>North Warwickshire Doubles League Fixtures</h3>
		<p>
			Hampton-In-Arden Tennis Club participates in the North Warwickshire Doubles League.
		</p>
		<p>
			The provisionally arranged fixtures for the <%= thisyear %> season are shown below along with the 
			contact details for the applicable adult who looks after this team for the club.
		</p>
		<div id="nwfixtures" class="centered">
			<img src="images/nwfix2008-a.gif" alt="North Warwickshire Doubles - Preliminary Fixtures for 2008 Part A">
			<img src="images/nwfix2008-b.gif" alt="North Warwickshire Doubles - Preliminary Fixtures for 2008 Part B">
		</div>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="nwdoublesinfo.asp">General information about the North Warwickshire Doubles League</a></li>
				<li><a href="nwrules.asp">Rules of the North Warwickshire Doubles League</a></li>
				<li><a href="nwcontactguide.asp">Guide for club contacts for this league</a></li>
				<li><a href="nwwinners.asp">Past winners and runners up</a></li>
			</ul>
		</div>	
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">

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
