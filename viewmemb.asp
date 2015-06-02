<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Viewing");
// Now for any variables local to this page
var zz3, mUnique, mGrade, mSurname, mForename1, mDob;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail, mWebPassword, mWebAccess;
var dummy, dummy1, dummy2, datebits;
var mMailing, mJoined, mLeft;
var gradelist = new Array('Adult','Junior','18-25s','Under 7','Non-Member','Ex-Member','Social');
var connObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var admin=false;
var dbconnect=Application("hamptonsportsdb"); 
var membObj = new Object();
var mylevel = getUserAccessLevel();
var mycode = getUserCode();
var theirlevel, theircode;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
admin=isAdministrator();
var ebookinguserid, ebookingpin;
var memberObj = new Object();
ebookinguserid= 0;
ebookingpin = 0;
// Establish online user Id and PIN if signed in
if (signedin) {
	var myUnique = getUserCode();
	if (! (myUnique == 0)) {
		memberObj = getMember(myUnique);
		ebookinguserid = memberObj.onlinebookingid;
		ebookingpin = memberObj.onlinebookingpin;
	}
}
// End of page start up coding
mUnique = new String(Request.QueryString("code"));
membObj = getMember(mUnique);
//
mID = new String(membObj.memberid).toString();
mGrade = new String(membObj.membergrade).toString();
mSurname= new String(membObj.surname).toString();
mForename1= new String(membObj.forename1).toString();
mAddress1= new String(membObj.address1).toString();
mAddress2= new String(membObj.address2).toString();
mAddress3= new String(membObj.address3).toString();
mAddress4= new String(membObj.address4).toString();
mPostCode= new String(membObj.postcode).toString();
mHomePhone= new String(membObj.homephone).toString();
mMobile= new String(membObj.mobile).toString();
mGender= new String(membObj.gender).toString();
mEmail= new String(membObj.email).toString();
mWebPassword = new String(membObj.webpassword).toString();
mWebAccess = new String(membObj.webaccess).toString();
// mPool= new String(membObj.pool).toString();
//
theirlevel = new Number(mWebAccess).valueOf();
mylevel = new Number(mylevel).valueOf();
theircode = new Number(membObj.uniqueref);
// Now augment page title with name details
pagetitle += "\n\n Details for " + mForename1 + " " + mSurname;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title>Hampton-In-Arden Tennis Club Home Page</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production  -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
	<script language="Javascript" src="datetimepicker.js"></script>
<style type="text/css">
#detailstable tbody td, #detailstable thead th, #detailstable tfoot th {
	border: 0;
	padding: 10px 10px 10px 0;
	border-bottom: 1px solid black;
}
#detailstable thead tr, #detailstable tfoot tr {
	height: 2em;
}
</style>
</head>
<body>
<!--#include file="dateval.asp" -->
<!--   1.  Branding   -->
<div id="branding">
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<table id="detailstable" width="100%" border="1" cellspacing="2" cellpadding="5"  cols="100,100,250,*">
				<thead>
					<tr style="height: 2em;">
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							<b>Name:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= mForename1 %>&nbsp;<%= mSurname %><br>
						</td>
					</tr>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							<b>	Address Details:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= mAddress1 %><br>
							<%= mAddress2 %><br>
							<%= mAddress3 %><br>
							<%= mAddress4 %><br>
							<%= mPostCode %><br>
						</td>
					</tr>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							            <b>Phone Numbers:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<b>Home&nbsp;&nbsp;:</b> <%= mHomePhone %><br>
							<b>Mobile:</b> <%= mMobile %><br>
						</td>
					</tr>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							            <b>Email Address:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= mEmail %><br>
						</td>
					</tr>
<%
if (mylevel > theirlevel || ((mylevel == theirlevel) && mycode == theircode))
{
%>	
					<tr>
						<td colspan="2" style="text-align:left;padding-left:10px;background:#ccc">
							<b>Online Court Booking</b>
						</td>
					</tr>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							<b>User ID:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= membObj.onlinebookingid %><br>
						</td>
					</tr>
					<tr>
						<td class="tdnine" valign="CENTER" align="RIGHT">
							<b>PIN:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= membObj.onlinebookingpin %><br>
						</td>
					</tr>
<%
}
%>
				</tbody>
				<tfoot>
					<tr>
						<th></th>
						<th></th>
					</tr>
				</tfoot>
			</table>
			<DIV ALIGN="CENTER" bgcolor="#408080">
				<br>
				<h3>
					Click 	<a href="chk_memb.asp">	here</a> to find another member
				</h3>
			</DIV>
		</td>
	</tr>
</table>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="bookingpanel.asp" -->
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
    Document.MemberForm.MemberSurname.Focus
End Sub
</SCRIPT></html>
<%
%>









