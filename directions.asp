<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Locations of Other Clubs");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var m_clubid, m_clubname;
var m_address1, m_address2, m_address3, m_address4;
var m_town, m_county, m_postcode;
var m_telephone, m_fax, m_email, m_contact;
var m_totaltennis, m_cluburl, m_comments;
var ConnObj, RS;
var addressline, thepostcode;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Set up connection to database and get club info
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from otherclubs order by clubname");
displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Playing:&nbsp;<b>Directions to Other Clubs</b></h1>
		<div id="directionsheader" class="borderbottom">
			<img src="images/directions.jpg" width="85" height="74" class="boxleft" style="margin-right: 10px;"/>
			<ul>
				<li>If a map is available, click on <span id="gobutton" class="bluetext">GO</span> to display a street map of the club's location.</li>
				<li>When a location map has been displayed, click on the Back button to return to this site</li>
				<li>Click on the club name to see more details about the club (if we have any!)</li>
			</ul>
		</div>
		<h2 style="clear:both;">List of Clubs Hampton Play Against</h2>
		<table>
			<thead>
				<tr>
					<th>Club</th>
					<th>Address</th>
					<th>Map?</th>
				</tr>
			</thead>
			<tbody>
<%
RS = ConnObj.Execute(SQLStmt);
while (! RS.EOF)
{
	addressline = new String("").toString();
	m_clubname = new String(RS("clubname")).toString();
	m_address1 = new String(RS("address1")).toString();
	m_address2 = new String(RS("address2")).toString();
	m_address3 = new String(RS("address3")).toString();
	m_address4 = new String(RS("address4")).toString();
	m_town = new String(RS("town")).toString();
	m_county = new String(RS("county")).toString();
	m_postcode = new String(RS("postcode")).toString();
	m_telephone = new String(RS("telephone")).toString();
	m_clubid = new String(RS("clubid")).toString();

	// Now for post processing on field values
	if (m_clubname == "null" || m_clubname == "undefined")
		m_clubname = new String("").toString();
	if (m_address1 == "null" || m_address1 == "undefined")
		m_address1 = new String("").toString();
	if (m_address2 == "null" || m_address2 == "undefined")
		m_address2 = new String("").toString();
	if (m_address3 == "null" || m_address3 == "undefined")
		m_address3 = new String("").toString();
	if (m_address4 == "null" || m_address4 == "undefined")
		m_address4 = new String("").toString();
	if (m_town == "null" || m_town == "undefined")
		m_town = new String("").toString();
	if (m_county == "null" || m_county == "undefined")
		m_county = new String("").toString();
	if (m_postcode == "null" || m_postcode == "undefined")
		m_postcode = new String("").toString();
	if (m_telephone == "null" || m_telephone == "undefined")
		m_telephone = new String("").toString();
		
	// Take any embedded spaces out of the postcode for the Multimap link
	thepostcode = new String(m_postcode).toString();
	thepostcode = new String(thepostcode.replace(" ","")).toString();
	
	// Finally format the address line		
	addressline = new String(m_address1).toString();
	if (! m_address2=="")
		addressline += (", "+m_address2);
	if (! m_address3=="")
		addressline += (", "+m_address3);
	if (! m_address4=="")
		addressline += (", "+m_address4);
	if (! m_town =="")
		addressline += (", "+m_town);
	if (! m_county=="")
		addressline += (", "+m_county);
	if (! m_postcode=="")
		addressline += (", "+m_postcode);
		
%>
				<tr>
					<td>
						<b><a href="lst_club.asp?clubid=<%= m_clubid %>"><%= m_clubname %></a></b>
					</td>
					<td>
						<%= addressline %><br /><b>Tel: <%= m_telephone %></b>
					</td>
					<td>
						&nbsp;
<%
if (m_postcode != "")
{
%>
						<a href="http://uk.multimap.com/p/browse.cgi?pc=<%= thepostcode %>">GO</a>
<%
}
%>
					</td>
				</tr>
<%
	RS.MoveNext();
}
RS.Close();
ConnObj.Close();
RS=null;
ConnObj=null;
%>				
			</table>
			<p>
				<summary class="centered">
					This table shows summary details for each club (name,address,telephone number) and
					provides links to get more detail and to show a location map.
				</summary>			
			</p>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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
