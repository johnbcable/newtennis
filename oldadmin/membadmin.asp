<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member");
// Now for any variables local to this page
var zz3, mUnique, mGrade, mSurname, mForename1, mInitials, mDob;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail, mWebPassword, mWebAccess;
var mClubEmail, mClubEmailPW, mClubEmailUser;
var mTennis, mSquash, mHockey, mFootball, mSocial;
var months = new Array('','January','February','March','April','May','June','July','August','September','October','November','December');
var myDay, myMonth, myYear;
var dummy, dummy1, dummy2, datebits;
var statusknt;
var statuslist = new Array('N','P','Y');
var gradelist = new Array('Adult','Junior','18-25s','Non-Member');
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
SQLStmt = new String("SELECT memberid, membergrade, title, surname, forename1, initials, address1, address2, address3, address4, postcode, homephone, workphone, mobilephone, email, clubemail, webpassword, webaccess, tennis, squash, hockey, football, social from members where uniqueref = " + mUnique);
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
    mClubEmail= Trim(new String(RS("clubemail")));
    mWebPassword = Trim(new String(RS("webpassword")));
    dummy=new Number(RS("webaccess"));
	 mWebAccess=dummy.valueOf();
	 mTennis = Trim(new String(RS("tennis")));
	 mSquash = Trim(new String(RS("squash")));
	 mHockey = Trim(new String(RS("hockey")));
	 mFootball = Trim(new String(RS("football")));
	 mSocial = Trim(new String(RS("social")));
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
if (mClubEmail=="null")
    mClubEmail="";
if (mWebPassword=="null")
    mWebPassword="tennis";
if (mWebAccess < 20)
		 mWebAccess = 20;
if (mTennis=="null")
		 mTennis="N";
if (mSquash=="null")
		 mSquash="N";
if (mHockey=="null")
		 mHockey="N";
if (mFootball=="null")
		 mFootball="N";
if (mSocial=="null")
		 mSocial="N";
// Now augment page title with name details
pagetitle += "\n\n Details for " + mForename1 + " " + mSurname;
connObj.Close();
connObj=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu
		</comment>
		
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>
			<table  width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#c0c0c0" cols="100,100,250,*">
				<form name="MemberForm" action="set_memb.asp" method="post">
					<tr>
						<td class="tdfont" valign="CENTER" align="CENTER" width="30" nowrap rowspan="20">
							            &nbsp;
						</td>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Surname:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberSurname" size="35" maxlength="35" value="<%= mSurname %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            First Name:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberForename" size="20" maxlength="20" value="<%= mForename1 %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Other Initial(s):&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberInitials" size="5" maxlength="5" value="<%= mInitials %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Preferred Title:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberTitle" size="5" maxlength="5" value="<%= mTitle %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							<b>
								Address Details:&nbsp;&nbsp;&nbsp;&nbsp;
							</b>
						</td>
						<td>
							<input type="text" name="MemberAddress1" size="35" maxlength="35" value="<%= mAddress1 %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="CENTER">
							            &nbsp;
						</td>
						<td>
							<input type="text" name="MemberAddress2" size="35" maxlength="35" value="<%= mAddress2 %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="CENTER">
							            &nbsp;
						</td>
						<td>
							<input type="text" name="MemberAddress3" size="35" maxlength="35" value="<%= mAddress3 %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="CENTER">
							            &nbsp;
						</td>
						<td>
							<input type="text" name="MemberAddress4" size="35" maxlength="35" value="<%= mAddress4 %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Postcode:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberPostCode" size="12" maxlength="12" value="<%= mPostCode %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Home Phone:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberHomePhone" size="20" maxlength="20" value="<%= mHomePhone %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Work Phone:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberWorkPhone" size="20" maxlength="20" value="<%= mWorkPhone %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Mobile Phone:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberMobilePhone" size="50" maxlength="50" value="<%= mMobile %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Email Address:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberEmail" size="50" maxlength="50" value="<%= mEmail %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Web Password:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberPassword" size="10" maxlength="10" value="<%= mWebPassword %>
							">
							<br>
						</td>
					</tr>
<%
if (isAdministrator())
{  // administration area only
%>
					<tr>
						<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
							<b>
								Administrators Use Only:
							</b>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Member Grade:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<select name="MemberGrade">
<%
for (i=0; i<4; i++)
{
	if (gradelist[i]==mGrade)
		Response.Write("<option selected>"+gradelist[i]);
	else
		Response.Write("<option>"+gradelist[i]);
}
%>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Club Email :&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberClubEmail" size="50" maxlength="50" value="<%= mClubEmail %>
							">
							<br>
							<font size="1" >
								&nbsp;&nbsp;&nbsp;N.B. Can be left blank
							</font>
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Member Status :&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td class="tdfont" valign="CENTER" align="LEFT">
							<select name="TennisMemberStatus">
<%
for (i=0; i<3; i++)
{
	if (statuslist[i]==mTennis)
		Response.Write("<option selected>"+statuslist[i]);
	else
		Response.Write("<option>"+statuslist[i]);
}
%>
							</select>
							&nbsp;&nbsp;
							<font size="1">
								&nbsp;&nbsp;
								<b>
									N
								</b>
								 = not a member,
								<b>
									P
								</b>
								 = paid up member,
								<b>
									Y
								</b>
								 = member not paid
							</font>
						</TD>
					</tr>
<%
if (isSupport())
{
// Just for me for now
%>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Web Access Level:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="MemberWebAccess" size="3" maxlength="2" value="<%= mWebAccess %>">
							<br>
						</td>
					</tr>
<%
}
else
{ // ensure existing value always available to set_memb regardless
%>
					<input type="hidden" name="MemberWebAccess" value="<%= mWebAccess %>">
<%
} // end of support only section
%>
					<tr>
						<td class="tdfont" bgcolor="#aed2ac" colspan="2" border="0">
							<b>
								End of administrator-only section:
							</b>
						</td>
					</tr>
<%
}
else
{
%>
					<input type="hidden" name="TennisMemberStatus" value="mTennis">
					<input type="hidden" name="MemberClubEmail" value="mClubEmail">
					<input type="hidden" name="MemberGrade" value="mGrade">
<%
}  // end of admin general
%>
					<tr>
						<td colspan="2">
							<input type="hidden" name="MemberId" value="<%= zz3 %>">
							<input type="hidden" name="Uniqueref" value="<%= mUnique %>">
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" bgcolor="#c0c0c0" colspan="3" align="CENTER">
							<br>
							<input type="submit" value="Submit">
							<br>
						</td>
					</tr>
				</form>
			</table>
			<DIV ALIGN="CENTER" bgcolor="#408080">
				<br>
				Please set the members details to what they SHOULD be in the form above and
				click on Submit to make the changes on the database.
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
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.MemberForm.MemberSurname.Focus
End Sub
</SCRIPT>
</HTML>
<%
%>








