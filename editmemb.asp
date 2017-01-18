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
var mBritishTennisNo, dummy, dummy1;
var mMailing,mJoined, mLeft, mCoach;
var mEmergencyName, mEmergencyPhone, mMedicalInfo;
var mPhotoConsent;
var mOnlineBookingID, mOnlineBookingPIN, mGender;
var themember = new Object();
var gradelist = new Array("Adult","Junior","18-25s","Under 7","Non-Member","Ex-Member","Social", "Course Only");
var genderlist = new Array("M","F");
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
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
mUnique = new String(Request.QueryString("code"));
mNew = new String(Request.QueryString("new")).toString();
if (mNew == "" || mNew == "null" || mNew == "undefined") {
	mNew = new String ("N");
}

if (isSupport() || isAdministrator() || isMembershipEditor() )
	Response.Redirect("editmemb2.asp?code="+mUnique+"&new="+mNew);
	
admin=isAdministrator();
if (isAdministrator())
	myrowspan="22";
supportonly = new String("READONLY=TRUE").toString();
membereditor = new String("READONLY=TRUE").toString();
if (isSupport())
{
	supportonly = new String("").toString();
	myrowspan = "25";
}
if (isMembershipEditor())
	membereditor = new String("").toString();	
// End of page start up coding
// Get member details for edit
mDob = "";
mJoined="";
mLeft="";
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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW, NOARCHIVE">
	<title>Hampton-In-Arden Tennis Club - Member Detail Editing</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
	<script language="Javascript" src="js/datetimepicker.js"></script>
	<script language="Javascript" src="js/TabInterface.js"></script>
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

		<form name="MemberForm" action="set_memb.asp" method="post" onsubmit="return validateMember()">

	 	<div id="editform">
  		<h2>Personal Details</h2>
			<fieldset>
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
			
			<h2>Address Details</h2>
			<fieldset>
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
			
			<h2>Contact Details</h2>
			<fieldset>
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
				<fieldset>
					<legend>Emergency Contact Details</legend>
					<div>
						<label for="EmergencyName">Name:</label>
						<input type="text" name="EmergencyName" id="EmergencyName" accesskey="a" size="60" maxlength="60" value="<%= mEmergencyName %>">
					</div>
					<div>
						<label for="EmergencyPhone">Telephone number:</label>
						<input type="text" name="EmergencyPhone" id="EmergencyPhone" size="60" maxlength="60" value="<%= mEmergencyPhone %>">
					</div>
					<div>
						<label for="MedicalInfo">Medical Information:</label>
						<input type="text" name="MedicalInfo" id="MedicalInfo" size="50" maxlength="150" value="<%= mMedicalInfo %>">
					</div>
				</fieldset>
			
				<div>
					<!--  mop up for non administrators  -->
					<input type="hidden" name="Uniqueref" value="<%= mUnique %>">
					<input type="hidden" name="MemberGrade" value="<%= mGrade %>">
					<input type="hidden" name="MemberMailing" value="<%= mMailing %>">
					<input type="hidden" name="MemberId" value="<%= mID %>">
					<input type="hidden" name="MemberDOB" value="<%= mDob %>">
					<input type="hidden" name="MemberJoined" value="<%= mJoined %>">
					<input type="hidden" name="MemberLeft" value="<%= mLeft %>">
					<input type="hidden" name="MemberWebAccess" value="<%= mWebAccess %>">
					<input type="hidden" name="MemberPassword" value="<%= mWebPassword %>">
					<input type="hidden" name="PhotoConsent" value="<%= mPhotoConsent %>">
					<input type="hidden" name="OnlineBookingID" value="<%= mOnlineBookingID %>">
					<input type="hidden" name="OnlineBookingPIN" value="<%= mOnlineBookingPIN %>">
				</div>
			</fieldset>
			
			</div>   <!-- end of editform div  -->
			
			<div id="submitblock" align="right">
				<input type="hidden" name="NewMember" value="<%= mNew %>">
				<p style="margin-right:50px;">
					<input align="right" type="submit" value="Submit">
				</p>
			</div>
		</form>
		<p style="text-align: center;">
			<br />
			Please set the details to what they SHOULD be in the form above and
			click on Submit to make the changes on the club's members database.
			<br />
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.MemberForm.MemberSurname.Focus
End Sub
</SCRIPT></html>
<%
%>


