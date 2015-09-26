<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="memberfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Sports Club - Updating Tennis Member Details");
// Now for any variables local to this page
var mDateObj, mDob;
var zz3, mNew, mUnique, mGrade, mSurname, mForename1;
var mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mMobile, mEmail, mWebPassword, mWebAccess;
var mBritishTennisNo, dummy, dummy1, dummypin;
var mMailing,mJoined, mLeft;
var mEmergencyName, mEmergencyPhone, mMedicalInfo;
var mPhotoConsent;
var mOnlineBookingID, mOnlineBookingPIN;
var themember = new Object();
var genderlist = new Array("M","F");
var gradelist = new Array("Adult","Junior","18-25s","Under 7","Non-Member","Ex-Member","Social", "Course Only");
var connObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3, SQL4;
var kount;
var mtref;
var memberknt;
var admin=false;
var dbconnect=Application("hamptonsportsdb");
var supportonly;
var membereditor;
var myrowspan = new String("13").toString();
var newone;
var debugging = false;
// Locally declared functions
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
mUnique = new String(Request.QueryString("code"));
mNew = new String(Request.QueryString("new")).toString();
if (mNew == "" || mNew == "null" || mNew == "undefined") {
	mNew = new String ("N").toString();
}
admin=isAdministrator();
if (isAdministrator())
	myrowspan="22";
else
	Response.Redirect("editmemb.asp?code="+mUnique+"&new="+mNew);
supportonly = new String("READONLY=TRUE").toString();
membereditor = new String("READONLY=TRUE").toString();
if (isSupport())
{
	supportonly = new String("").toString();
	myrowspan = "25";
}
if (isAdministrator())
	membereditor = new String("").toString();	
// End of page start up coding
mDob = "";
// Get member details for edit
themember = getMember(mUnique);

mID = themember.id;
mGrade = themember.grade;
mSurname= themember.surname;
mForename1= themember.forename1;
mGender= themember.gender;
mAddress1= themember.address1;
mAddress2= themember.address2;
mAddress3= themember.address3;
mAddress4= themember.address4;
mPostCode= themember.postcode;
mHomePhone= themember.homephone;
mMobile= themember.mobile;
mEmail= themember.email;
mWebPassword = themember.webpassword;
mBritishTennisNo = themember.britishtennisno;
mEmergencyName = themember.emergencyname;
mEmergencyPhone = themember.emergencyphone;
mMedicalInfo = themember.medicalinfo;
mPhotoConsent = themember.photoconsent;
mWebAccess = themember.webaccess;
mMailing = themember.mailing;
mOnlineBookingID = themember.onlinebookingid;
mOnlineBookingPIN = themember.onlinebookingpin;
// dates
mDob = themember.dob;
mJoined = themember.joined;
mLeft = themember.left;
displaydate = dateasstring(Date());
// flag new member form details
newone = false;
if (mNew === "Y") {
	newone = true;
	dummypin = Math.floor(Math.random()*10000+1);
	if (dummypin < 1000)
		dummypin += 1000;
	mOnlineBookingPIN = new String(dummypin).toString();
}
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title><%= pagetitle %></title>
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

<!--#include file="dateval.asp" -->
<style type="text/css">
<!--
#currentmembers {
				 position: relative;
				 margin: 20px auto;
}
#membersbutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#membertext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#membertext p {
			 padding-left: 30px;
}						

#membersbutton a, #membersbutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
  font-weight: bold;
	padding: 5px 10px 6px; 
	color: #fff; 
	text-decoration: none;
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer;
}

#membersbutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>
<script type="text/javascript">
function validateMember()
{
	// alert("Inside validateMember");
	// var result = true;   // default to everythjing being OK
	var errmess = new String("").toString();  // set up blank error message string

	// alert("Just before confirm");
	var r = confirm("OK to save these details? Press Cancel to return to the form without saving");
	// alert("Just after confirm");
	if (r == false)
		return(false);

	// Now validate form contents
	var x;
	//  Check that message has a title
	x=document.forms["MemberForm"]["MemberSurname"].value;
	if (x==null || x=="")
		errmess += ("Your member must have a surname\n");
	// alert("After surname check - errmess = \n"+errmess);

	// Process error indications
	if( ! (errmess == "")) {
		alert(errmess);
		return false;
	} 
}
</script>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
<<<<<<< HEAD
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
=======
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
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
		<h1>Members:&nbsp;<b>Updating the Members Directory</b></h1>
<%
if (isAdministrator() && !(newone))
{
%>
	<div id="currentmembers" style="clear: both; padding: 20px 0; margin-top: 20px">
		 <div id="membersbutton">
		 			<a href="delete_member.asp?id=<%= mUnique %>">Delete Member</a>
		 </div>
		<div id="membertext">
			<p>
				Clicking on the Delete Member button will permanently remove the details of the member below
				from the database. If you click this button you cannot cancel the request.
			</p>
		</div>
	</div>
	<p style="clear: both; margin-bottom: 10px;">&nbsp;</p>
<%
}
%>
		<form name="MemberForm" action="set_memb.asp" method="post" onsubmit="return validateMember()">
				<fieldset>
					<legend><span class="akey">P</span>ersonal Details</legend>
						<div>
							<label for="MemberSurname">Surname:</label>
							<input type="text" name="MemberSurname" id="MemberSurname" accesskey="p" size="35" maxlength="35" value="<%= mSurname %>">
						</div>
						<div>
							<label for="MemberSurname">First Name:</label>
							<input type="text" name="MemberForename" id="MemberForename" size="20" maxlength="20" value="<%= mForename1 %>">
						</div>
						<div>
								 <label for="MemberGender">Gender :</label>
								 <select name="MemberGender" accesskey="g">
<%
	for (i=0; i<2; i++)
	{
		if (genderlist[i]==mGender)
			Response.Write("<option selected>"+genderlist[i]);
		else
			Response.Write("<option>"+genderlist[i]);
	}
%>
								 </select>
						</div>
						<div>
							<label for="BritishTennisNumber">British Tennis Membership No.:</label>
							<input type="text" name="BritishTennisNumber" id="BritishTennisNumber" size="10" maxlength="12" value="<%= mBritishTennisNo %>">
						</div>
					</fieldset>
					<fieldset>
						<legend><span class="akey">A</span>ddress Details</legend>
						<div>
							<label for="MemberAddress1">Address:</label>
							<input type="text" name="MemberAddress1" id="MemberAddress1" accesskey="a" size="35" maxlength="35" value="<%= mAddress1 %>">
						</div>							
						<div>
							<label for="MemberAddress2">&nbsp;</label>
							<input type="text" name="MemberAddress2" id="MemberAddress2" size="35" maxlength="35" value="<%= mAddress2 %>">
						</div>
						<div>
							<label for="MemberAddress3">&nbsp;</label>
							<input type="text" name="MemberAddress3" id="MemberAddress3" size="35" maxlength="35" value="<%= mAddress3 %>">
						</div>								
						<div>
							<label for="MemberAddress4">&nbsp;</label>
							<input type="text" name="MemberAddress4" id="MemberAddress4" size="35" maxlength="35" value="<%= mAddress4 %>">
						</div>
						<div>
							<label for="MemberPostCode">Post Code:</label>
							<input type="text" name="MemberPostCode" id="MemberPostCode" size="12" maxlength="12" value="<%= mPostCode %>">
						</div>
					</fieldset>
					<fieldset>
						<legend><span class="akey">C</span>ontact Details</legend>
						<div>
							<label for="MemberHomePhone">Home Phone:</label>
							<input type="text" name="MemberHomePhone" id="MemberHomePhone" accesskey="c" size="20" maxlength="20" value="<%= mHomePhone %>">
						</div>
						<div>
							<label for="MemberMobilePhone">Mobile Phone:</label>
							<input type="text" name="MemberMobilePhone" id="MemberMobilePhone" size="50" maxlength="50" value="<%= mMobile %>">
						</div>
						<div>
							<label for="MemberEmail">Email Address:</label>
							<input type="text" name="MemberEmail" id="MemberEmail" size="50" maxlength="100" value="<%= mEmail %>">
						</div>
					</fieldset>

					<fieldset>
						<legend>Emergency Contact Details</legend>
						<div>
							<label for="AdultContact">Name:</label>
							<input type="text" name="EmergencyName" id="EmergencyName" accesskey="e" size="60" maxlength="60" value="<%= mEmergencyName %>">
						</div>
						<div>
							<label for="AdultPhone">Telephone number:</label>
							<input type="text" name="EmergencyPhone" id="EmergencyPhone" size="60" maxlength="60" value="<%= mEmergencyPhone %>">
						</div>
						<div>
							<label for="SpecialCare">Medical Information:</label>
							<input type="text" name="MedicalInfo" id="MedicalInfo" size="50" maxlength="150" value="<%= mMedicalInfo %>">
						</div>
					</fieldset>
<%
if (isAdministrator())
{  // administration area only
%>
					<fieldset>
						<legend><span class="akey">T</span>ennis Administration Details</legend>
						<div>
							<label for="MemberGrade">Member Grade:</label>
							<select name="MemberGrade" accesskey="t">
<%
	for (i=0; i<8; i++)
	{
		if (gradelist[i]==mGrade)
			Response.Write("<option selected>"+gradelist[i]);
		else
			Response.Write("<option>"+gradelist[i]);
	}
%>
							</select>
						</div>
						<div class="datepicker">
							<label for="MemberDOB">Date of Birth:</label>
							<input type="text" name="MemberDOB" id="MemberDOB" size="10" maxlength="10" value="<%= mDob %>" onBlur="javascript:checkdate(this)" />
<!--
							<a href="javascript:NewCal('MemberDOB','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
-->
							<a href="javascript:NewCal('MemberDOB','ddmmyyyy');">Select</a>
						</div>
						<div class="datepicker">
							<label for="MemberJoined">Date Joined Club:</label>
							<input type="text" name="MemberJoined" id="MemberJoined" size="10" maxlength="10" value="<%= mJoined %>" onBlur="javascript:checkdate(this)" />
<!--
							<a href="javascript:NewCal('MemberJoined','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
-->
							<a href="javascript:NewCal('MemberJoined','ddmmyyyy');">Select</a>
						</div>
						<div class="datepicker">
							<label for="MemberLeft">Date Left Club:</label>
							<input type="text" name="MemberLeft" id="MemberLeft" size="10" maxlength="10" value="<%= mLeft %>" onBlur="javascript:checkdate(this)" />
<!--
							<a href="javascript:NewCal('MemberLeft','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>
-->
							<a href="javascript:NewCal('MemberLeft','ddmmyyyy');">Select</a>
						</div>
						<div>
							<label for="MemberMailing">Include for Mailings?:</label>
							<select name="MemberMailing">
<%
	if (mMailing == "Y")
		Response.Write("<option selected>Y\r\n<option>N\r\n");
	else
		Response.Write("<option selected>N\r\n<option>Y\r\n");
%>
							</select>
						</div>
						<div>
							<label for="PhotoConsent">Consent for photos?:</label>
							<select name="PhotoConsent">
<%
	if (mPhotoConsent == "Y")
		Response.Write("<option selected>Y\r\n<option>N\r\n");
	else
		Response.Write("<option selected>N\r\n<option>Y\r\n");
%>
							</select>
						</div>						
						<div>
							<label for="OnlineBookingID">Online Booking:</label>
							<input <%= supportonly %> type="text" name="OnlineBookingID" id="OnlineBookingID" value="<%= mOnlineBookingID %>" size="5" maxlength="4">&nbsp;&nbsp;&nbsp;&nbsp;PIN:  <%= mOnlineBookingPIN %>
						</div>
<%
	if (isSupport())
	{
%>					
						<div>
							<label for="MemberId">Web User ID:</label>
							<input <%= supportonly %> type="text" name="MemberId" id="MemberId" size="10" maxlength="10" value="<%= mID %>" />
						</div>
						<div>
							<label for="MemberPassword">Web Password:</label>
							<input <%= supportonly %> type="text" name="MemberPassword" id="MemberPassword" size="10" maxlength="10" value="<%= mWebPassword %>">
						</div>
						<div>
							<label for="MemberWebAccess">Web Access Level:</label>
							<input <%= supportonly %> type="text" name="MemberWebAccess" id="MemberWebAccess" size="2" maxlength="2" value="<%= mWebAccess %>">
						</div>
						<input type="hidden" name="OnlineBookingPIN" value="<%= mOnlineBookingPIN %>">
<%
	}   // end of Support-only section
	else
	{
%>
					<input type="hidden" name="MemberId" value="<%= mID %>">
					<input type="hidden" name="MemberPassword" value="<%= mWebPassword %>">
					<input type="hidden" name="MemberWebAccess" value="<%= mWebAccess %>">
					<input type="hidden" name="OnlineBookingPIN" value="<%= mOnlineBookingPIN %>">
<%
	}
%>

					</fieldset>
<%
}
else
{
%>
				<div>
					// mop up for non administrators
					<input type="hidden" name="MemberGrade" value=<%= mGrade %>
					<input type="hidden" name="MemberMailing" value=<%= mMailing %>
					<input type="hidden" name="MemberId" value="<%= zz3 %>">
					<input type="hidden" name="MemberDOB" value="<%= mDob %>">
					<input type="hidden" name="MemberJoined" value="<%= mJoined %>">
					<input type="hidden" name="MemberLeft" value="<%= mLeft %>">
					<input type="hidden" name="MemberWebAccess" value="<%= mWebAccess %>">
					<input type="hidden" name="MemberPassword" value="<%= mWebPassword %>">
					<input type="hidden" name="PhotoConsent" value="<%= mPhotoConsent %>">
					<input type="hidden" name="OnlineBookingID" value="<%= mOnlineBookingID %>">
					<input type="hidden" name="OnlineBookingPIN" value="<%= mOnlineBookingPIN %>">
				</div>
<%
}  // end of admin general
%>
						<div>
							<input type="hidden" name="Uniqueref" value="<%= mUnique %>">
						</div>
				<div id="submitblock" align="right">
					<input type="hidden" name="NewMember" value="<%= mNew %>">
						<input align="right" type="submit" value="Save">
					</p>
				</div>
			</form>
			<p class="centered">
				<br />
				Please set the members details to what they SHOULD be in the form above and
				click on Save to make the changes on the club's members database.
				<br />
			</p>
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.MemberForm.MemberSurname.Focus
End Sub
</SCRIPT>
</html>
<%
%>
