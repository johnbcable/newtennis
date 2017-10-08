<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Administering Details of Other Clubs");
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
if (!signedin())
	Response.Redirect("directions.asp");
if (! isAdministrator())
	Response.Redirect("members.asp");
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
		<h1>Site Administration:&nbsp;<b>Directory of Other Clubs</b></h1>
		<img src="images/directions.jpg" width="85" height="74" class="boxleft" style="margin-right: 10px;"/>
		<p>
			Click on the club name to edit details about that club
		</p>
		<table style="clear: both;">
			<caption>Other Clubs Addresses</caption>
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
					<td width="25%" >
						<b><a href="edit_club.asp?clubid=<%= m_clubid %>"><%= m_clubname %></a></b>
					</td>
					<td width="68%" >
						<%= addressline %><br /><b>Tel: <%= m_telephone %></b>
					</td>
					<td class="centered" width="7%">
						&nbsp;
<%
if (m_postcode != "")
{
%>
						<a href="http://maps.googleapis.com/maps/api/staticmap?center=<%= thepostcode %>&zoom=14&size=601x500&markers=color:blue%7Clabel:H%7C<%= thepostcode %>&sensor=false">GO</a>
<!--						
						<a href="http://uk.multimap.com/p/browse.cgi?pc=<%= thepostcode %>">GO</a>
-->
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
				This table shows summary details for each club (name,address,telephone number),
				provides links to allow those details to be changed and to show a location map.
			</p>
		<div class="seealso">
			<h2>See Also:</h2>
			<ul>
				<li><a href="http://www2.lta.org.uk/Search/FindAClub/">Find a club via LTA web site</a></li>
			</ul>
		</div>			
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