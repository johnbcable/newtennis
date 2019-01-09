<%@language="JScript"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club Limited";
var pagetitle = "Application for Membership";
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="clubhead.asp" -->
<DIV align=left style="margin-left: 40px">
	<font face="Verdana" size="3">
		<b>
			Type of Membership (please tick all that apply)
		</b>
		<br>
	</font>
	<br>
	<TABLE borderColor=#000000 cellSpacing="0" cellPadding="2" width="600" border="1" cols="20%,20%,20%,20%,20%">
		<TBODY>
			<TR>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						Hockey
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						Tennis
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						Squash
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						Football
					</FONT>
					</P>
				</TD>
				<TD align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						Social
					</FONT>
					</P>
				</TD>
			</TR>
			<TR>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width="108" align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
				<TD align="CENTER">
					<P>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
	<br>
	<br>
	<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="600" border="1">
		<TBODY>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=right>
					<FONT face=Verdana size=2>
						Name&nbsp;&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P align=right>
					<FONT face=Verdana
						size=2>
						(&nbsp;
					</FONT>
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=right>
					<FONT face=Verdana size=2>
						British Tennis membership number&nbsp;&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P align=center>
					&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=center>
					<FONT face=Verdana size=2>
						Date Of Birth
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P align=right style="margin-right: 20px">
					&nbsp;&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=right>
					<FONT face=Verdana size=2>
						Address including postcode&nbsp;&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P align=center>
					&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107>
					<P align=center>
					<FONT face=Verdana size=2>
						Home telephone:&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width=458 height=30 valign=center colSpan=4>
					<P align=left>
					&nbsp;&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107>
					<P align=center>
					<FONT face=Verdana size=2>
						Mobile Telephone:&nbsp;
					</FONT>
					</P>
				</TD>
				<TD width=458 height=30 valign=center colSpan=4>
					<P align=left>
					&nbsp;&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=center>
					<FONT face=Verdana size=2>
						e-mail
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P align=center>
					&nbsp;
					</P>
				</TD>
			</TR>
			<TR>
				<TD width=107 height=30 valign=center>
					<P align=center>
					<FONT face=Verdana size=2>
						Medical Conditions*
					</FONT>
					</P>
				</TD>
				<TD width=458 colSpan=4>
					<P>
						&nbsp;
					</P>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</DIV>
<P style="margin-left: 40px" align="left">
* For children attending coaching courses please advise us of any medical conditions 
that we may need to know about
</P>
<DIV ALIGN="left" style="margin-left: 40px">
	<table  width="600" border="0" cellspacing="2" cellpadding="5">
		<tr>
			<td >
				<P align=center>
				<FONT face=Verdana size=2>
					<B>
						I wish to become a member of <%= clubname %>
						and hereby agree, if accepted, to abide by
						the
						<a href="clubrules.asp">
							rules of the Club
						</a>
						. I recognise that there is a potential personal 
                liability of £5 should the club be wound up.
					</B>
				</FONT>
				</P>
				<P align=center>
				<FONT face=Verdana size=2>
					<B>
						I give permission for my membership details to be held 
                on computer and for those contact details to be available on the 
                club web site to other members with an authorised password. I 
                understand that these details should not be passed on outside 
                the club. If I have provided my email address above, I agree 
                that the club may send me notices for Annual and Extraordinary 
                General Meetings by email
					</B>
				</FONT>
				</P>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<TABLE borderColor=#000000 height=24 cellSpacing=0 cellPadding=0 width=600
		border=1>
		<TBODY>
			<TR>
				<TD width=195 height=24>
					<P align=center>
					<FONT face=Verdana size=2>
						Signature of
						Applicant
					</FONT>
					<br>
					<FONT SIZE="1">
						(or parent/guardian of junior applicant)
					</FONT>
					</P>
				</TD>
				<TD width=200 height=24>
					<P align=center>
					<FONT face=Verdana size=2>
					</FONT>
					&nbsp;
					</P>
				</TD>
				<TD width=53 height=24>
					<P align=center>
					<FONT face=Verdana size=2>
						Date
					</FONT>
					</P>
				</TD>
				<TD width=154 height=24>
					<P align=center>
					<FONT face=Verdana size=2>
						&nbsp;
					</FONT>
					</P>
				</TD>
			</TR>
<!--
   <TR>
    <TD width=195 height=24>
      <P align=center><FONT face=Verdana size=2>Proposer</FONT></P></TD>
    <TD width=200 height=24>
      <P align=center><FONT face=Verdana size=2></FONT>&nbsp;</P></TD>
    <TD width=53 height=24>
      <P align=center><FONT face=Verdana size=2>Seconder</FONT></P></TD>
    <TD width=154 height=24>
      <P align=center><FONT face=Verdana size=2>&nbsp; </FONT></P></TD>
  </TR>
-->
			<tr>
				<td colspan=4 width=600 style="padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1">
					<P align=center>
					<FONT face=Verdana size=1>
						Please complete and sign this form and return it WITH YOUR CHEQUE
						made out to "Hampton-in-Arden Sports Club" to The Secretary (Chris
						Barnes), 68 Meriden Road, Hampton-In-Arden, Solihull, B92 0BT</FONT>
						</P>
						<p align="center">
							For more information about Hampton Tennis Club please visit our web site: <a href="www.hamptontennis.org.uk">www.hamptontennis.org.uk</a>
						</p>
					</td>
				</tr>
			</TBODY>
		</TABLE>
		<br />
		<TABLE borderColor=#000000 height=24 cellSpacing=0 cellPadding=0 width=600 border=0>
		<TBODY>
			<tr>
				<td width=600 style="padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1">
					<P align=center>
					<FONT size=2>
					<A href="juniors/joinus.html">[Back to Membership Page]</A>
					</FONT>
					</P>
				</td>
			</tr>
		</TBODY>
		</TABLE>
	</DIV>
	<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>