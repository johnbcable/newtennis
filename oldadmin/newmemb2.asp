<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("New Member Creation");
// Now for any variables local to this page
var zz3, mGrade, mSurname, mForename1, mInitials, mDob;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail, mWebPassword, mWebAccess;
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
zz3 = new String(Request.QueryString("code"));
connObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connObj.Open(dbconnect);
// Get member details for edit
SQLStmt = new String("SELECT membergrade, title, surname, forename1, initials, address1, address2, address3, address4, postcode, homephone, workphone, mobilephone, email, clubemail, webpassword, webaccess, tennis, squash, hockey, football, social, dob from members where memberid like '" + zz3 + "'");
RS = connObj.Execute(SQLStmt);
// Retrieve database values for member
myDay=0;
myMonth=new String("");
myYear=new String("");
while (! RS.EOF)
{
    mID = new String(zz3);
    mGrade = new String(RS("membergrade"));
    mSurname= new String(RS("surname"));
    mForename1= new String(RS("forename1"));
    mInitials= new String(RS("initials"));
    mAddress1= new String(RS("address1"));
    mAddress2= new String(RS("address2"));
    mAddress3= new String(RS("address3"));
    mAddress4= new String(RS("address4"));
    mPostCode= new String(RS("postcode"));
    mHomePhone= new String(RS("homephone"));
    mWorkPhone= new String(RS("workphone"));
    mMobile= new String(RS("mobilephone"));
    mTitle= new String(RS("title"));
    mEmail= new String(RS("email"));
    mClubEmail= new String(RS("clubemail"));
    mWebPassword = new String(RS("webpassword"));
    dummy=new Number(RS("webaccess"));
	 mWebAccess=dummy.valueOf();
	 mTennis = new String(RS("tennis"));
	 mSquash = new String(RS("squash"));
	 mHockey = new String(RS("hockey"));
	 mFootball = new String(RS("football"));
	 mSocial = new String(RS("social"));
	 dummy1=new Date(RS("dob"));
	 mDob=dummy1.toLocaleString();
	 datebits=mDob.split();
 	 dummy1=new Number(datebits[0]);
	 myDay=dummy1.valueOf();
	 myMonth=new String(datebits[1]);
	 myYear=new String(datebits[2]);
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
    mWebPassword="";
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
				<form name="MemberForm" action="setmemb2.asp" method="post">
					<tr>
						<td class="tdfont" valign="CENTER" align="CENTER" width="30" nowrap rowspan="20">
							            &nbsp;
						</td>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Surame:&nbsp;&nbsp;&nbsp;&nbsp;
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
							            Date of Birth :&nbsp;&nbsp;&nbsp;&nbsp;<br><%= myDay %>/<%= myMonth %>/<%= myYear %>
						</td>
						<td>
							<select name="theday">
<%
// days first
for (i=1; i<32; i++)
{
if (i<10)
	dummy2=new String("0"+i);
else
	dummy2=new String(i);
if (i==myDay)
	Response.Write("<option selected>"+dummy2);
else
	Response.Write("<option>"+dummy2);
}
%>
							</select>
							&nbsp;&nbsp;
							<select name="themonth">
<%
// now for the month
for (i=0; i<13; i++)
{
if (months[i]==myMonth)
	Response.Write("<option selected>"+months[i]);
else
	Response.Write("<option>"+months[i]);
}
%>
							</select>
							&nbsp;&nbsp;
							<select name="theyear">
<%
// finally for the year
for (i=1900; i<2004; i++)
{
dummy2=new String(i);
if (dummy2==myYear)
	Response.Write("<option selected>"+dummy2);
else
	Response.Write("<option>"+dummy2);
}
%>
							</select>
							&nbsp;&nbsp;
							<font size="1" >
								&nbsp;&nbsp;&nbsp;N.B. Required for Juniors
							</font>
							<br>
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
							<input type="text" name="MemberWebAccess" size="3" maxlength="2" value="<%= mWebAccess %>
							">
							<br>
						</td>
					</tr>
<%
}
else
{ // ensure existing value always available to set_memb regardless
%>
					<input type="hidden" name="MemberWebAccess" value="mWebAccess">
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
						<td class="tdfont" valign="CENTER" bgcolor="#c0c0c0" colspan="2" align="CENTER">
							<br>
							<input type="submit" value="Submit">
							<br>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="MemberId" value="<%= zz3 %>
							">
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
					Click
					<a href="chk_memb.asp">
						here
					</a>
					 to find another member
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
connObj.Close();
connObj=null;
%>
