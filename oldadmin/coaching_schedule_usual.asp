<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Junior Coaching - Summer Term");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var connObj, RS, mUnique, SQLStmt, kount;
var mSurname, mForename1, mInitials, mDoB;
var mTitle, mAddress1, mAddress2, mAddress3, mAddress4, mPostCode;
var mHomePhone, mWorkPhone, mMobile, mEmail;
var addressline1, addressline2;
var myDay, myMonth, myYear, myDOB;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// if (!signedin())
// 	Response.Redirect("login.asp");
// if (! isAdministrator())
// 	Response.Redirect("services.asp");
mUnique = new String(Request.QueryString("code")).toString();
if (mUnique == "" || mUnique=="undefined" || mUnique=="")
{
    mSurname="";
    mForename1="";
    mInitials="";
    mAddress1="";
    mAddress2="";
    mAddress3="";
    mAddress4="";
	addressline1 = "";
	addressline2 = "";
    mPostCode="";
    mHomePhone="";
    mWorkPhone="";
    mMobile="";
    mTitle="";
    mEmail="";
	 myDOB = "";
}
else
{
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
		addressline1 = mAddress1 + " , "+mAddress2;
    	mAddress3= Trim(new String(RS("address3")));
    	mAddress4= Trim(new String(RS("address4")));
		addressline2 = mAddress3 + " , " + mAddress4;
    	mPostCode= Trim(new String(RS("postcode")));
    	mHomePhone= Trim(new String(RS("homephone")));
    	mWorkPhone= Trim(new String(RS("workphone")));
    	mMobile= Trim(new String(RS("mobilephone")));
    	mTitle= Trim(new String(RS("title")));
    	mEmail= Trim(new String(RS("email")));
	   mDob=new Date(RS("dob"));
	   myDay=mDob.getDate();
	   myMonth=mDob.getMonth()+1;
	   myYear=mDob.getFullYear();
		// reformat retrieved date info
		myDOB = new String("").toString();
		if (myDay < 10)
			myDOB += "0";
		myDOB += myDay+"/";
		if (myMonth < 10)
			myDOB += "0";
		myDOB += myMonth+"/";
		myDOB += myYear;
    	RS.MoveNext();
	}
	RS.Close();
	RS=null;
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
	connObj.Close()
	connObj=null;
}
// End of page start up coding
%>
<!--#include file="formhead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<div align="center">
				&nbsp;<table  borderColor="#000000" width="599" border="1" cellspacing="0" cellpadding="0">
					<tr>
						<td align="left" width="270" height="24">
							<b>
								Course
							</b>
						</td>
						<td align="center" width="94" height="24">
							<p align="center">
							<b>
								Times
							</b>
						</td>
						<td align="center" width="129" height="24">
							<p align="center"><b>Cost for term* </b>
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" bgcolor="#C0C0C0" >
							<b><font face="Verdana">Tuesdays&nbsp;&nbsp; (13 
                            weeks)</font></b></td>
						<td class="tdsmall" align="center" width="94" height="19" bgcolor="#C0C0C0">
							&nbsp;</td>
						<td align="center" class="tdsmall" height="19" width="129" bgcolor="#C0C0C0">
							&nbsp;</td>
					</tr>
					<tr>
						<td class="tdsmall-indented" width="270" height="19" >
							Tiny Tots (pre school)
						</td>
						<td class="tdsmall" align="center" width="94" height="19">
							2.30 to 3.00
						</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£32.50</td>
					</tr>
               <tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Red 2</td>
						<td class="tdsmall" align="center" width="94" height="19">
							3.45 to 4.30
						</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£39.65</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Red 3
						</td>
						<td class="tdsmall" align="center" width="94" height="19">
							4.30 to 5.15</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£39.65</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Orange Squad (Invite only)&nbsp;&nbsp;&nbsp;
                            <font color="#FF0000">New! </font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							4.30.to 5.30</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£53.30</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Orange/Green Players</td>
						<td class="tdsmall" align="center" width="94" height="19">
							5.15 to 6.15</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£53.30</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Bronze Squad Training (Invite only)
                            <font color="#FF0000">New!</font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							5.30 to 6.30</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£53.30</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Gold Squad Training (Invite only)
                            <font color="#FF0000">New!</font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							6.30 to 7.30</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£53.30</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" bgcolor="#C0C0C0" >
							<b><font face="Verdana">Wednesdays (13 weeks)&nbsp;
                            </font></b></td>
						<td class="tdsmall" align="center" width="94" height="19" bgcolor="#C0C0C0">
							&nbsp;</td>
						<td align="center" class="tdsmall" height="19" width="129" bgcolor="#C0C0C0">
							&nbsp;</td>
					</tr>
                    <tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Red&nbsp;&nbsp; <font color="#FF0000">
                            New!</font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							3.45 to 4.30
						</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£39.65</td>
					</tr>
                    <tr>
						<td class="tdsmall" width="270" height="19" >
							Mini Tennis Orange&nbsp;&nbsp;&nbsp;&nbsp;
                            <font color="#FF0000">New!</font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							4.30 to 5.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30
						</td>
					</tr>
                    <tr>
						<td class="tdsmall" width="270" height="19" >
							Mini Tennis Green/Junior Tennis&nbsp;&nbsp;&nbsp;
                            <font color="#FF0000">New!</font></td>
						<td class="tdsmall" align="center" width="94" height="19">
							5.30 to 6.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" bgcolor="#C0C0C0" >
							<b><font face="Verdana">Thursdays (13 weeks)</font></b></td>
						<td class="tdsmall" align="center" width="94" height="19" bgcolor="#C0C0C0">
							&nbsp;</td>
						<td align="center" class="tdsmall" height="19" width="129" bgcolor="#C0C0C0">
							&nbsp;</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Orange</td>
						<td class="tdsmall" align="center" width="94" height="19">
							3.45 to 4.30
						</td>
						<td align="center" class="tdsmall" height="19" width="129">
							£39.65</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Junior</td>
						<td class="tdsmall" align="center" width="94" height="19">
							4.30 to 5.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Junior</td>
						<td class="tdsmall" align="center" width="94" height="19">
							5.30 to 6.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" bgcolor="#C0C0C0" >
							<b><font face="Verdana">Fridays (13 weeks)</font></b></td>
						<td class="tdsmall" align="center" width="94" height="19" bgcolor="#C0C0C0">
							&nbsp;</td>
						<td align="center" class="tdsmall" height="19" width="129" bgcolor="#C0C0C0">
							&nbsp;</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Red </td>
						<td class="tdsmall" align="center" height="20" width="94">
							3.45 to 4.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£39.65
						</td>
					</tr>
					<tr>
						<td class="tdsmall" height="20" width="270" >
							Mini-Tennis Orange and Green</td>
						<td class="tdsmall" align="center" width="94" height="19">
							4.30 to 5.15
						</td>
						<td align="center" class="tdsmall" height="20" width="129">
							£39.65
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Mini-Tennis Green (Girls) and Juniors</td>
						<td class="tdsmall" align="center" width="94" height="19">
							5.15 to 6.00
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£39.65
						</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Junior and Silver Squads (Invite only)</td>
						<td class="tdsmall" align="center" width="94" height="19">
							6.00 to 7.00</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30 </td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" >
							Gold Squads (invite only)</td>
						<td class="tdsmall" align="center" width="94" height="19">
							7.00 to 8.00
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£53.30</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19" bgcolor="#C0C0C0" >
							<b><font face="Verdana">Saturdays&nbsp; (12 weeks)</font></b></td>
						<td class="tdsmall" align="center" width="94" height="19" bgcolor="#C0C0C0">
							&nbsp;</td>
						<td align="center" class="tdsmall" height="19" width="129" bgcolor="#C0C0C0">
							&nbsp;</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="21">
							Mini-Tennis Red (invite only)</td>
						<td class="tdsmall" align="center" width="94" height="21">
							9.00 to 9.45
						</td>
						<td align="center" class="tdsmall" width="129" height="21">
							£36.60</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="20">
							Mini Tennis Red&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <font color="#FF0000">New!</font></td>
						<td class="tdsmall" align="center" width="94" height="20">
							9.45 to 10.30</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£36.60</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="20">
							Juniors (girls only)
						</td>
						<td class="tdsmall" align="center" width="94" height="20">
							10.30 to 11.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£49.20</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="18">
							Juniors
						</td>
						<td class="tdsmall" align="center" width="94" height="18">
							11.30 to 12.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£49.20</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="20">
							Silver Squad
						</td>
						<td class="tdsmall" align="center" width="94" height="20">
							12.30 to 1.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£49.20</td>
					</tr>
					<tr>
						<td class="tdsmall" width="270" height="19">
							Gold Squad
						</td>
						<td class="tdsmall" align="center" width="94" height="19">
							1.30 to 2.30
						</td>
						<td align="center" class="tdsmall" width="129" height="19">
							£49.20</td>
					</tr>
				</table>
			</div>
			<div align="center">
				<p class="tdfont">
						* Term runs from 16 April to 20 July 2007 (excl. week 
                        commencing 28 May - half term)<b><br>
                        All non-members will be charged an extra £12 per term.</b></p>
				<hr width="100%" align=center>
			</div>
			<b>
				<u>
					Child's details:
				</u>
			</b>
			<DIV ALIGN="CENTER">
				<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
					<TR>
						<td class="tdsmall" align="right" width="119">
							Name&nbsp;&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								<%= mSurname %>
							</b>
						</TD>
					</TR>
					<TR>
						<td class="tdsmall" align="right" width="119">
							Address&nbsp;&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								<%= addressline1 %>
							</b>
						</TD>
					</TR>
					<TR>
						<td class="tdsmall" width="119">
							&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								<%= addressline2 %>
							</b>
						</TD>
					</TR>
					<TR>
						<td class="tdsmall" align="right" width="119">
							Post Code&nbsp;&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								<%= mPostCode %>
							</b>
						</TD>
					</TR>
					<TR>
						<td class="tdsmall" align="right" width="119">
							Phone Numbers&nbsp;&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
                              <tr>
                                <td class="tdsmall" width="12%">Home:</td>
                                <td class="tdsmall" width="38%"><%= mHomePhone %></td>
                                <td class="tdsmall" width="12%">Mobile:</td>
                                <td class="tdsmall" width="38%"><%= mMobile %></td>
                              </tr>
                            </table>
						</TD>
					</TR>
					<tr>
						<td class="tdsmall" align="right" width="119">
							&nbsp;e-mail &nbsp;
						</TD>
						<td class="tdsmall" width="446">
							<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
                              <tr>
                                <td class="tdsmall" width="12%">&nbsp;</td>
                                <td class="tdsmall" width="50%"><%= mEmail %></td>
                                <td class="tdsmall" width="19%">Date of Birth:</td>
                                <td class="tdsmall" width="19%"><%= myDOB %></td>
                              </tr>
                            </table>
						</TD>
					</tr>
					<TR>
						<td class="tdsmall" align="right" width="119">
							Medical Condition&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								<%= mEmail %>
							</b>
						</TD>
					</TR>
					<TR>
						<td class="tdsmall" align="right" width="119">
							Courses attending&nbsp;
						</TD>
						<td class="tdsmall" width="446">
							&nbsp;&nbsp;&nbsp;
							<b>
								&nbsp;
							</b>
						</TD>
					</TR>
					</TABLE>
			</DIV>
			<P align=left class=tdsmall>
			<b>I understand and accept that Hampton-In-Arden Sports Club and its servants
			cannot accept any liability in respect of personal injury or loss or damage to
			equipment or personal belongings.</b>
			<B>
				I give permission for the above details to be held on computer and for those
				contact details to be available to other tennis club members 
            with an authorised password via the
				club web site. I understand that these details will not be 
            passed outside the club</B></P>
			<DIV ALIGN="CENTER">
				<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
					<TR>
						<td class="tdsmall" align="right" width="191">
							Signature of Parent/Guardian&nbsp;&nbsp;
						</TD>
						<td class="tdsmall" align="right" width="269">
							&nbsp;
						</TD>
						<td class="tdsmall" width="53" align="right">
							Date
						</TD>
						<td class="tdsmall" width="60" align="right">
							&nbsp;
						</TD>
					</TR>
				</TABLE>
			</DIV>
		</td>
	</tr>
</table>
<DIV ALIGN=left>
<br>
<TABLE borderColor=#000000 cellSpacing=0 cellPadding=0 width=647 bgColor=#ffffff border=0 class="tdeight" style="border-collapse: collapse">
	<TR VALIGN="TOP">
		<td width=61>
			<u><b>NOTES&nbsp;</b></u>&nbsp;
		</td>
		<TD class="tdeight" align="left" width="586">
			a) Please wear appropriate sports wear and tennis trainers + bring a drink of water in an appropriate container.</TD>
	</TR>
	<TR VALIGN="TOP">
		<td width=61>
			&nbsp;</td>
		<TD class="tdeight" align="left" width="586">
			b)<b> Contacts: Alan Cutts (07748 656002 -
            <a href="mailto:alan@coaching.ac">alan@coaching.ac</a>)</b></TD>
	</TR>
	<TR VALIGN="TOP">
		<td width=61>
			&nbsp;</td>
		<TD class="tdeight" align="left" width="586">
			c) Please make cheques payable to <b>Coaching ac Ltd. </b>and 
            send to Alan Cutts, 53 Fishponds Road, Kenilworth, Warwickshire, CV8 1EY</TD>
	</TR>
	</TABLE>
</DIV>
<div align="left">
<table  width=650 border="0" cellspacing="2" cellpadding="5" bgcolor="#ffffaa">
	<tr>
		<td bgcolor="#ffffaa" align="center" width=640>
			<b><font face="Verdana" color="#FF0000"><u>REMEMBER:</u> Demand is 
            usually high so please book early!</font></b></td>
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