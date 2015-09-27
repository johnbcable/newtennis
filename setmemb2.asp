<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Updating Details ");
// Now for any variables local to this page
var zz3, mGrade, mStatus, mSurname, mForename1, mInitials;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail, mWebPassword, mWebAccess;
var mClubEmail;
var ConnObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
zz3 = new String(Request.Form("MemberId"));
mSurname=new String(Request.Form("MemberSurname"));
mForename1=new String(Request.Form("MemberForename"));
mInitials=new String(Request.Form("MemberInitials"));
mTitle=new String(Request.Form("MemberTitle"));;
mGrade=new String(Request.Form("MemberGrade"));
mStatus=new String(Request.Form("TennisMemberStatus"));
mAddress1=new String(Request.Form("MemberAddress1"));
mAddress2=new String(Request.Form("MemberAddress2"));
mAddress3=new String(Request.Form("MemberAddress3"));
mAddress4=new String(Request.Form("MemberAddress4"));
mPostCode=new String(Request.Form("MemberPostcode"));
mWorkPhone=new String(Request.Form("MemberWorkPhone"));
mMobile=new String(Request.Form("MemberMobilePhone"));
mHomePhone=new String(Request.Form("MemberHomePhone"));
mEmail=new String(Request.Form("MemberEmail"));;
mClubEmail=new String(Request.Form("MemberClubEmail"));;
mWebPassword=new String(Request.Form("MemberPassword"));;
mWebAccess=new String(Request.Form("MemberWebAccess"));;
if (mGrade=="undefined")
    mGrade="";
if (mSurname=="undefined")
    mSurname="";
if (mForename1=="undefined")
    mForename1="";
if (mInitials=="undefined")
    mInitials="";
if (mAddress1=="undefined")
    mAddress1="";
if (mAddress2=="undefined")
    mAddress2="";
if (mAddress3=="undefined")
    mAddress3="";
if (mAddress4=="undefined")
    mAddress4="";
if (mPostCode=="undefined")
    mPostCode="";
if (mHomePhone=="undefined")
    mHomePhone="";
if (mWorkPhone=="undefined")
    mWorkPhone="";
if (mMobile=="undefined")
    mMobile="";
if (mTitle=="undefined")
    mTitle="";
if (mEmail=="undefined")
    mEmail="";
if (mClubEmail=="undefined")
    mClubEmail="";
if (mWebPassword=="undefined")
    mWebPassword="";
if (mWebAccess=="undefined")
    mWebAccess="";
// MUST set surname to upper case otherwise searching will NOT work
mSurname=mSurname.toUpperCase();
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1="update members set membergrade='"+mGrade+"',surname='"+mSurname+"',forename1='"+mForename1+"',initials='"+mInitials+"'";
SQL1+=",title='"+mTitle+"',address1='"+mAddress1+"',address2='"+mAddress2+"',address3='"+mAddress3+"',address4='"+mAddress4+"'";
SQL1+=",postcode='"+mPostCode+"',homephone='"+mHomePhone+"',workphone='"+mWorkPhone+"',mobilephone='"+mMobile+"',tennis='"+mStatus+"'";
SQL1+=",email='"+mEmail+"',clubemail='"+mClubEmail+"',webpassword='"+mWebPassword+"', webaccess="+mWebAccess+" where memberid='"+zz3+"'";
RS = ConnObj.Execute(SQL1)
RS=null;
// Now do email if this member has supplied a personal email address
if (mEmail != "")
{
		sTo=new String(mEmail);
		sFrom = new String("support@hamptonsports.org.uk");
		sSubject = new String("Welcome to the club!");
		// Construct the message
		sMessage="Dear "+mForename1+",\n\n"
		// Now, send the standard welcome email
	
		objCDOMail = newMailObject();  // in emailfuncs.asp
	
		objCDOMail.From=new String(sFrom);
		objCDOMail.Subject=new String(sSubject).toString();
		objCDOMail.HTMLBody=new String(sMessage).toString();
		objCDOMail.BodyPart.charset = "utf-8";
		objCDOMail.To=new String(sTo);

		objCDOMail.Send();
		objCDOMail=null;
}
ConnObj.Close();
ConnObj=null;
pagetitle += " for " + mForename1 + " " + mSurname;
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
	Response.Write("<br />");
	Response.Write(printMember(objMember));
	Response.Write("<br />");
}
%>
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
		<h1>Admin:<b>&nbsp;Standard Welcome Email</b></h1>
		<p>
				Database updated with revised details for <%= mForename1 %>&nbsp;<%= mSurname %>
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
</html>
<%
%>

