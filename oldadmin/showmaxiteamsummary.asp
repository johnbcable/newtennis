<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Maxi-Tennis Team Profile");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
var dbconnect=Application("hamptonsportsdb");
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3;
var themaxiteam = new String(Request.QueryString("maxiteam")).toString();
var m_teamname, m_teamnote, m_flagfile, m_flagwidth, m_flagheight;
var flagimgalttext;
var m_captain, mAddress1,mAddress2,mAddress3,mAddress4,mPostCode,mHomePhone,mMobile,mEmail;
var m_phone, m_fulladdress; 
var theCurrentYear = currentYear();
var captainknt = 0;
var memberknt = 0;
var mName, mPool;
var captainlist = new String("").toString();;
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from maxitennisteams where teamname = '"+themaxiteam+"'").toString();
SQL2 = new String("SELECT * from maxicaptains where maxiteam = '"+themaxiteam+"'").toString();
SQL3 = new String("SELECT * from allmembers where maxiteam = '"+themaxiteam+"' order by surname, forename1").toString();
//
m_flagfile = new String("").toString();
m_flagwidth = new String("").toString();
m_flagheight = new String("").toString();
m_teamnote = Trim(new String("")).toString();
m_teamname = new String(themaxiteam.substr(13)).toString();
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	m_flagfile = new String(RS("flag")).toString();
	m_flagwidth = new String(RS("flagwidth")).toString();
	m_flagheight = new String(RS("flagheight")).toString();
	m_teamnote = Trim(new String(RS("teamnote"))).toString(); 
	RS.MoveNext();
}
RS.Close();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
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
	<script language="Javascript" src="datetimepicker.js"></script>
	<script language="Javascript" src="minmax.js"></script>
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
		<h1>MAXI-Tennis <b>Team Profile<b></h1>
		<div id="teamsummary">
			<img  class="boxleft" src="images/<%= m_flagfile %>" width="<%= m_flagwidth %>" height="<%= m_flagheight %>" alt="<%= m_teamname %> team flag" style="margin-right: 2em;"/>
			<p>
				<span class="bigblueheading"><%= m_teamname %></span>
				<ul>
					<li><%= m_teamnote %></li>
				</ul>
			</p>
		</div>
		<div id="contactnote" style="background-color:yellow; color:#000000; clear:both;">
			<p class="centered">
				<br />
				N.B.  You will only see names for <%= m_teamname %> members below because you are not signed-in to the members area.<br />
				Contact details are only available to you if you sign-in to the members area with the username/password you have been allocated.
				<br />
			</p>
		</div>		
		<div id="summarymaxicaptains">
			<h2>Current Captains</h2>
<%
RS2 = ConnObj.Execute(SQL2);
while (! RS2.EOF)
{
	captainknt += 1;
	m_captain= Trim(new String(RS2("forename1")+" "+RS2("surname"))).toString();
    mAddress1= Trim(new String(RS2("address1")));
    mAddress2= Trim(new String(RS2("address2")));
    mAddress3= Trim(new String(RS2("address3")));
    mAddress4= Trim(new String(RS2("address4")));
    mPostCode= Trim(new String(RS2("postcode")));
    mHomePhone= Trim(new String(RS2("homephone")));
    mMobile= Trim(new String(RS2("mobilephone")));
    mEmail= Trim(new String(RS2("email")));	
	
	if (mAddress1=="null")
		mAddress1="";
	if (mAddress2=="null")
		mAddress2="";
	if (mAddress3=="null")
		mAddress3="";
	if (mAddress4=="null")
		mAddress4="";
	if (mPostCode=="null")
		mPostCode="";	
	if (mHomePhone=="null")
		mHomePhone="";
	if (mMobile=="null")
		mMobile="";
	if (mEmail=="null")
		mEmail="";

	// Set up full address field and composite phone field
	
	m_fulladdress = Trim(new String(mAddress1)).toString();
	if (! (mAddress2 == ""))
		m_fulladdress += "<br />"+mAddress2;
	if (! (mAddress3 == ""))
		m_fulladdress += "<br />"+mAddress3;
	if (! (mAddress4 == ""))
		m_fulladdress += "<br />"+mAddress4;		
	if (! (mPostCode == ""))
		m_fulladdress += "<br />"+mPostCode;		
	m_fulladdress += "<br />";
	
	m_phone = Trim(new String(mHomePhone)).toString();
	if (! (mMobile == ""))
		m_phone += "("+mMobile+")";
		
	if (captainlist == "")
		captainlist = new String(m_captain).toString();
	else
		captainlist += " and "+m_captain;

	RS2.MoveNext();
}
%>
			<h4><%= captainlist %></h4>
		</div>
		<div id="summarymaxiteammemberlist" style="margin-top: 10px;">
			<table id="maxiteamlist" width="70%" align="center" style="border-collapse: collapse; border: none;">
				<caption>Club Members Currently in <%= themaxiteam %> </caption>
				<thead>
					<tr>
						<th width="80%">Name</th>
						<th style="text-align: center;">Player&nbsp;Pool</th>
					</tr>
				</thead>
				<tbody>
<%
memberknt = 0;
RS3 = ConnObj.Execute(SQL3);
while (! RS3.EOF)
{
	memberknt += 1;
	mName= Trim(new String(RS3("forename1")+" "+RS3("surname"))).toString();
    mAddress1= Trim(new String(RS3("address1")));
    mAddress2= Trim(new String(RS3("address2")));
    mAddress3= Trim(new String(RS3("address3")));
    mAddress4= Trim(new String(RS3("address4")));
    mPostCode= Trim(new String(RS3("postcode")));
    mHomePhone= Trim(new String(RS3("homephone")));
    mMobile= Trim(new String(RS3("mobilephone")));
    mEmail= Trim(new String(RS3("email")));	
	mPool=Trim(new String(RS3("pool")));
	
	if (mAddress1=="null")
		mAddress1="";
	if (mAddress2=="null")
		mAddress2="";
	if (mAddress3=="null")
		mAddress3="";
	if (mAddress4=="null")
		mAddress4="";
	if (mPostCode=="null")
		mPostCode="";	
	if (mHomePhone=="null")
		mHomePhone="";
	if (mMobile=="null")
		mMobile="";
	if (mEmail=="null")
		mEmail="";
	if (mPool=="null")
		mPool="";

	// Set up full address field and composite phone field
	
	m_fulladdress = Trim(new String(mAddress1)).toString();
	if (! (mAddress2 == ""))
		m_fulladdress += ","+mAddress2;
	if (! (mAddress3 == ""))
		m_fulladdress += ","+mAddress3;
	if (! (mAddress4 == ""))
		m_fulladdress += ","+mAddress4;		
	if (! (mPostCode == ""))
		m_fulladdress += ","+mPostCode;		
	m_fulladdress += "<br />";
	
	m_phone = Trim(new String(mHomePhone)).toString();
	if (! (mMobile == ""))
		m_phone += "("+mMobile+")";
		
	Response.Write("                	<tr>");
	Response.Write('						<td style="border: none;"><strong>'+mName+'</strong></td>');
	Response.Write('						<td  style="border: none; text-align: center;">');
	Response.Write("							"+mPool);
	Response.Write("						</td>");
	Response.Write("					</tr>");

	RS3.MoveNext();
}
%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<%= memberknt %> members in <%= themaxiteam %>
						</td>
					</tr>
				</tfoot>
			</table>
		
		</div>
		<p style="margin-top: 10px;">
			Click on another team flag (below) to check out another Maxi-tennis team squad
		</p>
		<div id="maxitennisteambanner" class="centered">
			<!--#include file="maxitennisflags.htm" -->	
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
