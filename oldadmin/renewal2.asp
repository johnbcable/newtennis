<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior Coaching Programme (Winter 2002)");
// Now for any variables local to this page
var dbconnect="DSN=hamptontennis";
var connObj, RS, mUnique, SQLStmt, kount;
var mSurname, mForename1, mInitials, mDob;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("members.asp");
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
pagetitle += " "+mForename1+" "+mSurname
%>
<!--#include file="formhead.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*,120">
	<tr>
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>
			<center>
				The coaching programme is taken by Jane Hodge and Richard Perkins, both LTA DCA
				Coaches. The programme <br>offers coaching, social and competitive opportunities
				for all levels of players.
			</center>
			<br>
			<div align="center">
				<table  borderColor="#000000" width="565" border="1" cellspacing="2" cellpadding="0">
					<tr>
						<td align="left"><b>Day</b></td>
						<td align="left"><b>Course</b></td>
						<td align="right"><b>Time</b></td>
						<td align="right"><b>Cost (£)</b></td>
						<td align="center"><b>(tick)</b></td>
					</tr>
					<tr>
						<td class="tdfont" align="left" valign="center" rowspan="4"><b>FRIDAYS</b></td>
						<td class="tdfont" >Mini-Tennis,Red</td>
						<td class="tdfont" align="right">4.00 - 4.45</td>
						<td align="right" class="tdfont">£14.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont" >Mini-Tennis,Orange</td>
						<td class="tdfont" align="right">4.45 - 5.30</td>
						<td align="right" class="tdfont">£14.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont" >Mini-Tennis,Orange</td>
						<td class="tdfont" align="right">5.30 - 6.15</td>
						<td align="right" class="tdfont">£14.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont" >Mini-Tennis,Green</td>
						<td class="tdfont" align="right">6.15 - 7.00</td>
						<td align="right" class="tdfont">£14.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left" valign="center" rowspan="3"><b>SATURDAYS</b></td>
						<td class="tdfont">Beginners (Davis Cup)</td>
						<td class="tdfont" align="right">9.30 - 10.30</td>
						<td align="right" class="tdfont">£21.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont">Advanced (Wimbledon)</td>
						<td class="tdfont" align="right">10.30 - 11.30</td>
						<td align="right" class="tdfont">£21.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont">Top Squad</td>
						<td class="tdfont" align="right">11.30 - 12.30</td>
						<td align="right" class="tdfont">£21.00</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="tdfont" colspan="5" align="center" bgcolor="#c0c0c0">The dates for the current programme are as follows:	</td>
					</tr>
					<tr>
						<td><b>Fridays</b></td>
						<td colspan="4" class="tdfont">November 8th, 15th, 22nd and 29th; December 6th, 13th and 20th</td>
					</tr>
					<tr>
						<td><b>Saturdays</b></td>
						<td colspan="4" class="tdfont">November 9th, 16th, 23rd and 30th; December 7th, 14th and 21st</td>
					</tr>
				</table>
			</div>
			<br>
			<div align="center">
				<font size="1"><b>Note: Bad Weather? No problem! On Fridays, coaching can be held indoors; on Saturdays we hope to use the indoor squash courts - bring indoor shoes!
			</b></font>
			</div>
			<br>
			<b>	<u>	Child's details:</u></b>
			<br>
			<DIV ALIGN="CENTER">
				<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
						<TR>
							<td class="tdfont" align="right" width="107">Surname&nbsp;&nbsp;</TD>
							<td class="tdfont" width="458" colSpan="4" align="left">&nbsp;&nbsp;<b><%= mSurname %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="right" width="107">Forename(s)&nbsp;&nbsp;</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;&nbsp;<b><%= mForename1 %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="right" width="107">Address&nbsp;&nbsp;</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;&nbsp;<b><%= mAddress1 %></b>,&nbsp;<b><%= mAddress2 %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" width="107">&nbsp;</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;&nbsp;<b><%= mAddress3 %></b>,&nbsp;<b><%= mAddress4 %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="right" width="107">Post Code&nbsp;&nbsp;</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;&nbsp;<b><%= mPostCode %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="center" width="107" rowspan="2">Telephone Numbers</TD>
							<td class="tdfont" width="458" colSpan="4">Home:&nbsp;&nbsp;&nbsp;<b><%= mHomePhone %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" width="458" colSpan="4">Mobile:&nbsp;&nbsp;<b><%= mMobile %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="center" width="107">e-mail</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;&nbsp;<b><%= mEmail %></b></TD>
						</TR>
						<TR>
							<td class="tdfont" align="center" width="107">Date of Birth</TD>
							<td class="tdfont" width="458" colSpan="4">&nbsp;</TD>
						</TR>
				</TABLE>
			</DIV>
			<br>
			<B><U>Personal Liability</U></B><br>
			<P align=center>
				I understand and accept that Hampton-In-Arden Sports Club and its servants cannot
				accept any liability in respect of personal injury or loss or damage to equipment or
				personal belongings.
			</P>
			<P align=center>
			<B>
				I give permission for the above details to be held on computer and for those contact
				details to be available to authorised club members via the club web site.
			</B>
			</P>
			<DIV ALIGN="CENTER">
				<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
						<TR>
							<td class="tdfont" align="right" width="210">Signature of Parent/Guardian&nbsp;&nbsp;</TD>
							<td class="tdfont" align="right" width="250">&nbsp;</TD>
							<td class="tdfont" width="53" align="right">Date</TD>
							<td class="tdfont" width="60" align="right">&nbsp;</TD>
						</TR>
				</TABLE>
			</DIV>
		</td>
	</tr>
</table>
<DIV ALIGN="CENTER">
	<TABLE borderColor=#000000 cellSpacing=2 cellPadding=2 width=565 bgColor=#ffffff border=0>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				<u>
					NOTES
				</u>
				<BR>
			</TD>
		</TR>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				a) Non-members over 7 years of age pay £1.00 extra per lesson.
			</TD>
		</TR>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				b) Courses to be paid in full - no deductions unless advised.
			</TD>
		</TR>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				c) Cheques payable to "Hampton-In-Arden Sports Club"
			</TD>
		</TR>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				d) <b>FEES WILL BE COLLECTED ON FRIDAY 8 NOV &amp; SATURDAY 9 NOV, 2002</b>
			</TD>
		</TR>
		<TR VALIGN="TOP">
			<TD class="tdfont" align="left">
				e) Coaches: <b>Jane Hodge (01675 443197) (mobile: 07900 025718) or Richard Perkins (07796
					148164)</b>
			</TD>
		</TR>
	</TABLE>
</TD>
</TR>
</TABLE>
</DIV>
<br>
<div align="center">
<table  width="90%" border="0" cellspacing="2" cellpadding="5" bgcolor="#ffffaa">
	<tr>
		<td bgcolor="#ffffaa" align="center">
			<b><u><font color="#ff0000" size="4">Mini-Tennis Match Play</font></u></b>
		</td>
	</tr>
	<tr>
		<td bgcolor="#ffffaa" align="center">
			Open to all 6-10 year olds. Every Monday from 4.00 till 5.30 pm starting Monday 9 September, 2002. £2.50 per session on a pay-as-you-play basis. Turn up and join in the fun.
		</td>
	</tr>
</table>
</div>
<br>
<br>
<br>
<br>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>














