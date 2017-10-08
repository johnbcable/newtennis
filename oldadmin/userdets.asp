<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Web User ");
// Now for any variables local to this page
var zz3, mUnique, mWebUser, mWebPassword, mWebAccess;
var mSurname, mForename, mInitials;
var dummy, dummy2;
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
if (!isAdministrator())
	Response.Redirect("services.asp");
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
    mWebUser = Trim(new String(RS("memberid")));
    mSurname= Trim(new String(RS("surname")));
    mForename1= Trim(new String(RS("forename1")));
    mInitials= Trim(new String(RS("initials")));
    mMailing= Trim(new String(RS("mailing")));
    mWebPassword = Trim(new String(RS("webpassword")));
    dummy=new Number(RS("webaccess")).valueOf();
	 mWebAccess=dummy.valueOf();
    RS.MoveNext();
}
if (mSurname=="null")
    mSurname="";
if (mForename1=="null")
    mForename1="";
if (mInitials=="null")
	mInitials="";
if (mWebUser=="null")
	mWebUser="";
if (mWebPassword=="null")
    mWebPassword="tennis";
if (mWebAccess < 20)
		 mWebAccess = 20;
// Now augment page title with name details
pagetitle += "\n\n Details for " + mForename1 + " " + mSurname;
connObj.Close();
connObj=null;
%>
<!--#include file="clubhead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<table  width="100%" border="0" cellspacing="0" cellpadding="0"  bgcolor="#c0c0c0" cols="100,100,250,*">
				<form name="UserForm" action="set_user.asp" method="post">
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Web User ID:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="WebUserID" size="10" maxlength="10" value="<%= mWebUser %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Web Password:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="WebPassword" size="10" maxlength="10" value="<%= mWebPassword %>
							">
							<br>
						</td>
					</tr>
					<tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Web Access Level:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="text" name="WebAccess" size="2" maxlength="2" value="<%= mWebAccess %>
							">
							<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" valign="CENTER" align="RIGHT">
							            Include for mailings?:&nbsp;&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<select name="WebMailing">
<%
	if (mMailing == "Y")
		Response.Write("<option selected>Y\r\n<option>N\r\n");
	else
		Response.Write("<option selected>N\r\n<option>Y\r\n");
%>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" name="Uniqueref" value="<%= mUnique %>">
							<input type="hidden" name="MemberSurname" value="<%= mSurname %>">
							<input type="hidden" name="MemberForename" value="<%= mForename1 %>">
							<input type="hidden" name="MemberInitials" value="<%= mInitials %>">
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
				Please set the web user's details to what they SHOULD be in the form above and
				click on Submit to make the changes on the club's members database.
			</DIV>
		</td>
	</tr>
</table>
<!--#include file="textnav.asp" -->
</BODY>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.UserForm.WebUserID.Focus
End Sub
</SCRIPT>
</HTML>
<%
%>










