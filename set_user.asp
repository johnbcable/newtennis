<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Updating Web User Details ");
// Now for any variables local to this page
var zz3, mUnique, mSurname, mForename1, mInitials;
var mWebUser, mWebPassword, mWebAccess;
var mMailing;
var ConnObj;
var RS,RS2,RS3;
var SQLStmt, SQL2, SQL3;
var kount;
var memberknt;
var dbconnect=Application("hamptonsportsdb");
var debugging=false;
var updating=true;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
mWebUser = Trim(new String(Request.Form("WebUserID")));
mUnique=Trim(new String(Request.Form("Uniqueref")));
mSurname=Trim(new String(Request.Form("MemberSurname")));
mForename1=Trim(new String(Request.Form("MemberForename")));
mInitials=Trim(new String(Request.Form("MemberInitials")));
mWebPassword=Trim(new String(Request.Form("WebPassword")));
mWebAccess=Trim(new String(Request.Form("WebAccess")));
mMailing=Trim(new String(Request.Form("WebMailing")));
// reset if null
if (mSurname=="undefined")
    mSurname="";
if (mForename1=="undefined")
    mForename1="";
if (mInitials=="undefined")
    mInitials="";
if (mWebPassword=="undefined")
    mWebPassword="";
if (mWebAccess=="undefined" || mWebAccess=="null")
    mWebAccess="20";
// MUST set surname to upper case otherwise member directory searching will NOT work
mSurname=mSurname.toUpperCase();
// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1="update members set memberid='"+mWebUser+"', mailing='"+mMailing+"'";
SQL1+=",webpassword='"+mWebPassword+"', webaccess="+mWebAccess+" where uniqueref="+mUnique;
pagetitle += " for " + mForename1 + " " + mSurname;
if (updating)
	RS = ConnObj.Execute(SQL1);
RS=null;
ConnObj.Close();
ConnObj=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td calss="tdfont">
	<font size="4">
	<b>
		Database updated with web user details for <%= mForename1 %>&nbsp;<%= mSurname %><br><br>
	</b>
<% 
if (debugging)
	Response.Write("<br>["+SQL1+"]<br><br>["+SQL2+"]<br>");
%>
	</font>
<TABLE BORDER=0 WIDTH=650  bgcolor="#408080" CELLPADDING=5>
    <TR>
		<td colspan="2" class="tdfont" color="#00000" bgcolor="#aed2ac">
			<BR>
			<DIV ALIGN="CENTER">
				<a href="usermail.asp?z45=<%= mUnique %>">Send email</a><br><br>
				<a href="chk_memb.asp">Search members again</a><br><br>
			</DIV>
			<BR>
		</TD>
    </TR>
</TABLE>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>








