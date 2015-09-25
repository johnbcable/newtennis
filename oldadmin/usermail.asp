<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Web User Email Confirmation");
// Now for any variables local to this page
var sTo, sFrom, sSubject, sMessage;
var zz3, mUnique, mWebUser, mWebPassword, mWebAccess;
var mSurname, mForename1, mInitials, mEmail;
var connObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb");
mUnique = new String(Request.QueryString("z45"));
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
    mEmail= Trim(new String(RS("email")));
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
if (mEmail=="null")
	mEmail="";
if (mEmail=="")
	Response.Redirect("services.asp");
sTo = new String(mEmail);
sFrom = new String("secretary@hamptontennis.org.uk").toString();
sSubject = new String("Confirmation of web user details").toString();
sMessage = new String("Hi "+mForename1+",\n\rHere is confirmation of your web user access details for the Hampton-In-Arden Tennis Club members area:\n\r\n\rUsername:   "+mWebUser+"\n\rPassword:   "+mWebPassword+"\n\r\n\rWe hope you enjoy using the members area of our site.\n\r\n\rChris Barnes (Secretary)");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var objNewMail = Server.CreateObject("CDONTS.NewMail");
objNewMail.Send(sFrom,sTo,sSubject,sMessage);
objNewMail=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
	<font size="4" color="#000000" face="Verdana">
	<b>
		Your web user details confirmation for <br><hr><%= mForename1 %>&nbsp;<%= mSurname %><br><hr><br> has been sent to <%= mEmail %>.
	</b>
	</font>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
