<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Details of Another Club");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var m_clubid, m_clubname;
var m_address1, m_address2, m_address3, m_address4;
var m_town, m_county, m_postcode;
var m_telephone, m_fax, m_email, m_contact;
var m_totaltennis, m_cluburl, m_comments;
var m_telephone2, m_contact2, m_email2;
var m_telephone3, m_contact3, m_email3;
var ConnObj, RS;
var addressline, thepostcode;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Set up connection to database and get club info
m_clubid = new String(Request.QueryString("clubid")).toString();
if (m_clubid == "" || m_clubid == "null" | m_clubid == "undefined")
{
	m_clubid = new String(Request.Form("clubid")).toString();
	if (m_clubid == "" || m_clubid == "null" | m_clubid == "undefined")
		Response.Redirect("directions2.asp");
}
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from otherclubs where clubid="+m_clubid);
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
<style type="text/css">
td {
	border: 0;
	// padding: 10px 10px 10px 0;
	// border-bottom: 1px solid black;
}
</style>
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
		<h1>Playing:<b>&nbsp;Locations of Other Clubs</b></h1>
		<img src="images/directions.jpg" width="85" height="74" class="boxleft" style="margin-right: 10px;"/>
		<ul>
			<li>If a map is available, click on its underlined postcode to display a street map of the club's location.</li>
			<li>When a location map has been displayed, click on the Back button to return to this site</li>
			<li>Click on the club name to see more details about the club (if we have any!)</li>
		</ul>
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
	m_fax = new String(RS("fax")).toString();
	m_email = new String(RS("email")).toString();
	m_contact = new String(RS("contact")).toString();
	m_totaltennis = new String(RS("totaltennis")).toString();
	m_cluburl = new String(RS("cluburl")).toString();
	m_email2 = new String(RS("email2")).toString();
	m_contact2 = new String(RS("contact2")).toString();
	m_telephone2 = new String(RS("telephone2")).toString();
	m_email3 = new String(RS("email3")).toString();
	m_contact3 = new String(RS("contact3")).toString();
	m_telephone3 = new String(RS("telephone3")).toString();

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
	if (m_fax == "null" || m_fax == "undefined")
		m_fax = new String("").toString();
	if (m_email == "null" || m_email == "undefined")
		m_email = new String("").toString();
	if (m_contact == "null" || m_contact == "undefined")
		m_contact = new String("").toString();
	if (m_totaltennis == "null" || m_totaltennis == "undefined")
		m_totaltennis = new String("").toString();
	if (m_cluburl == "null" || m_cluburl == "undefined")
		m_cluburl = new String("").toString();
	if (m_telephone2 == "null" || m_telephone2 == "undefined")
		m_telephone2 = new String("").toString();
	if (m_contact2 == "null" || m_contact2 == "undefined")
		m_contact2 = new String("").toString();
	if (m_email2 == "null" || m_email2 == "undefined")
		m_email2 = new String("").toString();
	if (m_telephone3 == "null" || m_telephone3 == "undefined")
		m_telephone3 = new String("").toString();
	if (m_contact3 == "null" || m_contact3 == "undefined")
		m_contact3 = new String("").toString();
	if (m_email3 == "null" || m_email3 == "undefined")
		m_email3 = new String("").toString();
		
	// Take any embedded spaces out of the postcode for the Multimap link
	thepostcode = new String(m_postcode).toString();
	thepostcode = new String(thepostcode.replace(" ","")).toString();
	
	// Finally format the address line		
	addressline = new String(m_address1).toString();
	if (! m_address2=="")
		addressline += ("<br>"+m_address2);
	if (! m_address3=="")
		addressline += ("<br>"+m_address3);
	if (! m_address4=="")
		addressline += ("<br>"+m_address4);
	if (! m_town =="")
		addressline += ("<br>"+m_town);
	if (! m_county=="")
		addressline += ("<br>"+m_county);
// 
// Dont include postcode in the main address - used on the Multimap link
//		
//	if (! m_postcode=="")
//		addressline += (", "+m_postcode);
		
%>
		<h2>Club: <%= m_clubname %></h2>
		<table id="clublisttable">
			<tr>
					<td align=right class="tdsmall">
						Address:
					</td>
					<td class="tdsmall" width="459" >
						<B>
<%
	Response.Write(addressline);
%>
							<br><a href="http://uk.multimap.com/p/browse.cgi?pc=<%= thepostcode %>"><%= m_postcode %></a>
						</B>
					</td>
				</tr>
				<tr>
					<td align=right class="tdsmall">
						Club Contact:
					</td>
					<td class="tdsmall" width="459" >
						<table border=0 align=center>
							<tr>
								<td class="tdsmall" align="right">Telephone:</td>
								<td class="tdsmall" width=400><B><%= m_telephone %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">Fax:</td>
								<td class="tdsmall" width=400><B><%= m_fax %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">email:</td>
								<td class="tdsmall" width=400><B><%= m_email %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">Contact:</td>
								<td class="tdsmall" width=400><B><%= m_contact %></B></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=right class="tdsmall">
						Men's Tennis:
					</td>
					<td class="tdsmall" width="459" >
						<table border=0 align=center>
							<tr>
								<td class="tdsmall" align="right">Telephone:</td>
								<td class="tdsmall" width=400><B><%= m_telephone2 %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">email:</td>
								<td class="tdsmall" width=400><B><%= m_email2 %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">Contact:</td>
								<td class="tdsmall" width=400><B><%= m_contact2 %></B></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=right class="tdsmall">
						Ladies Tennis:
					</td>
					<td class="tdsmall" width="459" >
						<table border=0 align=center>
							<tr>
								<td class="tdsmall" align="right">Telephone:</td>
								<td class="tdsmall" width=400><B><%= m_telephone3 %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">email:</td>
								<td class="tdsmall" width=400><B><%= m_email3 %></B></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">Contact:</td>
								<td class="tdsmall" width=400><B><%= m_contact3 %></B></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=right class="tdsmall">
						On the web:
					</td>
					<td class="tdsmall" width="459" >
						<table border=0>
							<tr>
								<td class="tdsmall" align="right">Club web site:</td>
								<td class="tdsmall" width=400>&nbsp;&nbsp;&nbsp;<a href="<%= m_cluburl %>"><%= m_cluburl %></a></td>
							</tr>
							<tr>
								<td class="tdsmall" align="right">Totaltennis web site:</td>
								<td class="tdsmall" width=400>&nbsp;&nbsp;&nbsp;<a href="<%= m_totaltennis %>"><%= m_totaltennis %></a></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align=right class="tdsmall">
						Current weather:
					</td>
					<td class="tdsmall" width="459" >
						<a href="http://www.accuweather.com/ukie/index-forecast.asp?postalcode=<%= m_postcode %>" target="_weather">Display current weather in this club's locality</a>
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
		<h2>See Also:</h2>
		<ul>
			<li><a href="directions.asp">Back to club list</a></li>
		</ul>
<%
if ( isAdministrator() )	
{
%>
		<h2>Club List Administration:</h2>
		<ul>
			<li><a href="edit_club.asp?clubid=<%= m_clubid %>">Update this clubs details</a></li>
		</ul>
<%
}
%>	
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
