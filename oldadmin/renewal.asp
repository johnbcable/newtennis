<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club Limited";
var pagetitle = "Application for Membership";
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var connObj, RS, mUnique, SQLStmt, kount;
var mSurname, mForename1, mInitials, mDoB;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("services.asp");
mUnique = new String(Request.QueryString("code")).toString();
if (mUnique == "" || mUnique=="undefined")
	Response.Redirect("services.asp");
connObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
connObj.Open(dbconnect);
// Get member details for edit
SQLStmt = new String("SELECT * from members where uniqueref = " + mUnique);
RS = connObj.Execute(SQLStmt);
// Retrieve database values for member
kount=0;
while (! RS.EOF)
{
	kount += 1;
    mSurname=Trim(new String(RS("surname")));
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
    mDoB= Trim(new String(RS("dob")));
    RS.MoveNext();
}
if (kount < 1)
	Response.Redirect("notfound.asp");
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
RS.Close();
RS=null;
connObj.Close()
connObj=null;
// End of page start up coding
%>
<!--#include file="clubhead.asp" -->
<DIV align=center>
<font face="Verdana" size="3">
<b>Type of Membership (please tick all that apply)</b><br>
</font>
<br>
<TABLE borderColor=#000000 cellSpacing="0" cellPadding="2" width="565" border="1" cols="20%,20%,20%,20%,20%">
  <TBODY>
  <TR>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>Hockey</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>Tennis</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>Squash</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>Football</FONT></P>
    </TD>
    <TD align="CENTER">
      <P><FONT face=Verdana size=2>Social</FONT></P>
    </TD>
  </TR>
  <TR>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>&nbsp;</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>&nbsp;</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>&nbsp;</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>&nbsp;</FONT></P>
    </TD>
    <TD align="CENTER">
      <P><FONT face=Verdana size=2>&nbsp;</FONT></P>
    </TD>
  </TR>
  </TBODY>
</TABLE>
<br>
<br>
<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
  <TBODY>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Surname&nbsp;&nbsp;</FONT></P></TD>
	<TD WIDTH=264 colspan=2 ALIGN=LEFT>&nbsp;<b><%= mSurname %></b>
	</TD>
    <TD width=194 colSpan=2>
      <P align=right><FONT face=Verdana
      size=2>(Mr / Mrs / Ms / Miss)&nbsp;&nbsp;<b><%= mTitle %></b>&nbsp;&nbsp;</FONT></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Forename(s)&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mForename1 %></b></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Address&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mAddress1 %></b></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mAddress2 %></b></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mAddress3 %></b></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mAddress4 %></b></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Post Code&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mPostCode %></b></P>
    </TD>
  </TR>
  <TR>
    <TD width=107 rowspan=3>
        <P align=center><FONT face=Verdana size=2>Telephone Numbers</FONT></P>
    </TD>
    <TD width=458 colSpan=4>
      <P align=left>Home:&nbsp;&nbsp;&nbsp;<b><%= mHomePhone %></b></P>
    </TD>
  </TR>
  <TR>
    <TD width=458 colSpan=4>
      <P align=left>Business:&nbsp;&nbsp;&nbsp;<b><%= mWorkPhone %></b></P>
    </TD>
  </TR>
  <TR>
    <TD width=458 colSpan=4>
      <P align=left>Mobile:&nbsp;&nbsp;&nbsp;<b><%= mMobile %></b></P>
    </TD>
  </TR>
  <TR>
    <TD width=107>
      <P align=center><FONT face=Verdana size=2>e-mail</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=left>&nbsp;<b><%= mEmail %></b></P></TD>
  </TR>
  <TR>
    <TD colspan=5>
      <P align=left><FONT face=Verdana size=1>&nbsp;&nbsp;If under 21 or in full-time education please state your date of birth:&nbsp;&nbsp;&nbsp;</FONT></P>
    </TD>
  </TR>
  </TBODY>
</TABLE>
</DIV>
<br>
<br>
<DIV ALIGN="CENTER">
<table  width="565" border="0" cellspacing="2" cellpadding="5">
	<tr>
		<td >
<P align=center><FONT face=Verdana size=3><B>I wish to become a member of <%= clubname %> and hereby agree, if accepted, to abide by
the <a href="clubrules.asp">rules of the Club</a>. I give permission for my membership details to be held on computer and for those contact details to be available to other members via the club web site with an authorised password.</B></FONT></P>
		</td>
	</tr>
</table>
<br>
<br>
<TABLE borderColor=#000000 height=24 cellSpacing=0 cellPadding=0 width=568
border=1>
  <TBODY>
  <TR>
    <TD width=195 height=24>
      <P align=center><FONT face=Verdana size=2>Signature of
    Applicant</FONT></P></TD>
    <TD width=156 height=24>
      <P align=center><FONT face=Verdana size=2></FONT>&nbsp;</P></TD>
    <TD width=53 height=24>
      <P align=center><FONT face=Verdana size=2>Date</FONT></P></TD>
    <TD width=154 height=24>
      <P align=center><FONT face=Verdana size=2>&nbsp; </FONT></P></TD>
  </TR>
<!--
   <TR>
    <TD width=195 height=24>
      <P align=center><FONT face=Verdana size=2>Proposer</FONT></P></TD>
    <TD width=156 height=24>
      <P align=center><FONT face=Verdana size=2></FONT>&nbsp;</P></TD>
    <TD width=53 height=24>
      <P align=center><FONT face=Verdana size=2>Seconder</FONT></P></TD>
    <TD width=154 height=24>
      <P align=center><FONT face=Verdana size=2>&nbsp; </FONT></P></TD>
  </TR>
 -->
</TBODY>
</TABLE>
</DIV>
<P align=center><FONT face=Verdana size=1>Please complete and sign this form and return it WITH YOUR CHEQUE
made out to "Hampton-in-Arden Sports Club Limited"</P>
</DIV>
<BR>
<br>
<P align=center><FONT size=2><A
href="juniors/joinus.html">[Back to Membership Page]</A></FONT></P>
<BR>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>





