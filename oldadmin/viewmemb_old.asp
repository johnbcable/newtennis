<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Viewing");
// Now for any variables local to this page
var zz3, mUnique, mGrade, mSurname, mForename1, mInitials, mDob;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail, mWebPassword, mWebAccess;
var dummy, dummy1, dummy2, datebits;
var mMailing,mJoined, mLeft;
var gradelist = new Array('Adult','Junior','Student','Under 7','Non-Member','Ex-Member','Social');
var connObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var admin=false;
var dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
admin=isAdministrator();
// End of page start up coding
mUnique = new String(Request.QueryString("code"));
connObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connObj.Open(dbconnect);
// Get member details for edit
SQLStmt = new String("SELECT * from members where uniqueref = " + mUnique);
RS = connObj.Execute(SQLStmt);
// Retrieve database values for member
while (! RS.EOF)
{
    mID = Trim(new String(RS("memberid")));
    mGrade = Trim(new String(RS("membergrade")));
    mSurname= Trim(new String(RS("surname")));
    mForename1= Trim(new String(RS("forename1")));
    mInitials= Trim(new String(RS("initials")));
    mAddress1= Trim(new String(RS("address1")));
    mAddress2= Trim(new String(RS("address2")));
    mAddress3= Trim(new String(RS("address3")));
    mAddress4= Trim(new String(RS("address4")));
    mPostCode= Trim(new String(RS("postcode")));
    mHomePhone= Trim(new String(RS("homephone")));
    mWorkPhone= Trim(new String(RS("workphone")));
    mMobile= Trim(new String(RS("mobilephone")));
    mTitle= Trim(new String(RS("title")));
    mEmail= Trim(new String(RS("email")));
    mWebPassword = Trim(new String(RS("webpassword")));
    dummy=new Number(RS("webaccess"));
	 mWebAccess=dummy.valueOf();
    RS.MoveNext();
}
if (mGrade=="null")
    mGrade="";
if (mSurname=="null")
    mSurname="";
if (mForename1=="null")
    mForename1="";
if (mInitials=="null")
    mInitials="";
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
if (mWorkPhone=="null")
    mWorkPhone="";
if (mMobile=="null")
    mMobile="";
if (mTitle=="null")
    mTitle="";
if (mEmail=="null")
    mEmail="";
if (mWebPassword=="null")
    mWebPassword="tennis";
if (mWebAccess < 20)
		 mWebAccess = 20;
// Now augment page title with name details
pagetitle += "\n\n Details for " + mForename1 + " " + mSurname;
connObj.Close();
connObj=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<table  width="100%" border="1" cellspacing="2" cellpadding="5"  cols="100,100,250,*">
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							<b>Name:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= mTitle %>&nbsp;<%= mForename1 %>&nbsp;<%= mInitials %>&nbsp;<%= mSurname %><br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
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
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            <b>Phone Numbers:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<b>Home&nbsp;&nbsp;:</b> <%= mHomePhone %><br>
							<b>Work&nbsp;&nbsp;:</b> <%= mWorkPhone %><br>
							<b>Mobile:</b> <%= mMobile %><br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            <b>Email Address:&nbsp;&nbsp;&nbsp;&nbsp;</b>
						</td>
						<td>
							<%= mEmail %><br>
						</td>
					</tr>
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
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>










