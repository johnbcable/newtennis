<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior + Mini-Tennis<br />Coaching Booking Form");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var connObj, RS, mUnique, SQLStmt, kount;
var mSurname, mForename1, mInitials, mDoB;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail;
var wholeAddress;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// if (!signedin())
// 	Response.Redirect("members.asp");
// if (! isAdministrator())
// 	Response.Redirect("services.asp");
mUnique = new String(Request.QueryString("code")).toString();
if (mUnique == "" || mUnique=="undefined")
	mUnique = "-1";
// Retrieve database values for member
membObj = getMember(mUnique);
//
mID = new String(membObj.memberid).toString();
mGrade = new String(membObj.membergrade).toString();
mSurname= new String(membObj.surname).toString();
mForename1= new String(membObj.forename1).toString();
mInitials= new String(membObj.initials).toString();
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
mPool= new String(membObj.pool).toString();
wholeAddress = new String(membObj.address1);
if (! (membObj.address2 == ""))
	wholeAddress += ","+membObj.ddress2;
if (! (membObj.address3 == ""))
	wholeAddress += ","+membObj.address3;
if (! (membObj.address4 == ""))
	wholeAddress += ","+membObj.address4;
wholeAddress = new String(wholeAddress.replace(/undefined,/g,"")).toString();	
wholeAddress = new String(wholeAddress.replace(/undefined/g,"")).toString();	
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
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
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
		<h1>Coaching:&nbsp;<b>Junior + Mini-Tennis Coaching - Booking Form</b></h1>
		<p>
				The junior tennis programme offers coaching and both social and competitive playing opportunities for players 
				of all levels, within a structured, but friendly environment. The current coaching schedule is set out 
				<a href="http://hamptontennis.org.uk/juniors/coaching_schedule.html">here</a>.
		</p>
		<table>
			<caption>Child's Details</caption>
			<thead>
				<tr>
					<td colspan="2" width="100%">
						<p class="centered">
							Please supply details of the coaching attendee below
						</p>
					</td>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td width="50%" class="tripleheight">Name:<span style="margin-left: 20px;"><b><%= membObj.forename1 %></b>&nbsp;<b><%= membObj.surname %></b></span></td>
				<td width="50%" class="tripleheight">DOB:<span style="margin-left: 20px;"></span></td>
			</tr>
			<tr>
				<td colspan="2" width="100%" class="tripleheight">
					Address:<span style="margin-left: 20px;"><b><%= wholeAddress %></b></span>
				</td>
			</tr>
			<tr>
				<td width="50%" class="tripleheight">Home Tel:<span style="margin-left: 20px;"><b><%= membObj.homephone %></span></td>
				<td width="50%" class="tripleheight">Emergency Tel:&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" width="100%" class="tripleheight">e-mail:&nbsp;&nbsp;&nbsp;<b><%= membObj.email %></td>
			</tr>
			<tr>
				<td width="50%" class="tripleheight">Day Attending:&nbsp;&nbsp;</td>
				<td width="50%" class="tripleheight">Time Attending:&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2" width="100%" valign="top" class="sixheight">Any medical conditions that the coaching team should be aware of<b></td>
			</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" width="100%">
						<p class="centered">
							&nbsp;
						</p>
					</td>
				</tr>
			</tfoot>
		</table>
		<div id="courseblurb">
			<br>
			<h2>Personal Liability</h2>
			<p>
				I understand and accept that Hampton-In-Arden Sports Club and its servants cannot 
				accept any liability in respect of personal injury or loss or damage to equipment or
				personal belongings.
			</p>
			<p>
				<b>
				I give permission for the above details to be held on computer and for those contact
				details to be available to authorised club members with an authorised password via 
				the club web site. I understand that these details will not be passed outside the club.
				</b>
			</p>
		</div>
		<div id="tablenotes">
			<h3>NOTES</h3>
			<ul>
				<li>a) Please wear appropriate sportswear and tennis trainers + bring a drink of water in an appropriate container</li>
				<li>b) Contact: <b>Ian Poole (07968 451956) (<a href="mailto:Ianpoole23@yahoo.co.uk">Ianpoole23@yahoo.co.uk</a>)</b></li>
				<li>c) Please cheques payable to "Matchpoint Sportz Ltd" and send to <b>Flat 1, Bromford Mere, Warwick Road, Solihull, B92 7AN</b></li>
			</ul>
			</td>
		</div>
		<div>
			<table>
				<tr>
					<td align="right" width="210" class="tripleheight">Signature of Parent/Guardian&nbsp;&nbsp;</td>
					<td align="right" width="250">&nbsp;</td>
					<td width="53" align="right">Date</td>
					<td width="60" align="right">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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

