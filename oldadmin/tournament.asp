<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "2003 Tournament Entry Form";
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="formhead.asp" -->
<DIV align=center>
<TABLE cellSpacing=0 cellPadding=2 width="90%" border=0>
  <TBODY>
  <TR>
    <TD class="tdfont" width="90%" colspan=6 align="center" valign="top">
        Please print this form, complete it, and return it to Steve Ray, 41 Old Station Road, Hampton-In-Arden, B92 0HA by 6 April, 2003<br>
        <br>
    </TD>
  </TR>
  </TBODY>
</TABLE>
<TABLE borderColor=#000000 cellSpacing=0 cellPadding=2 width="95%" border=1>
  <TBODY>
  <TR>
    <TD class="tdfont" width=200 align=right>
    Your Name:&nbsp;&nbsp;&nbsp;&nbsp;
    </TD>
    <TD class="tdfont" colspan=5>
        &nbsp;
    </TD>
  </TR>
  </TBODY>
</TABLE>
<br><br>
<TABLE borderColor=#000000 cellSpacing=0 cellPadding=2 width="95%" border=1>
  <TBODY>
  <TR>
    <TD class="tdfont" width=200>
    &nbsp;
    </TD>
    <TD class="tdfont" width=20 align=center bgcolor="#c0c0c0">
        <b>Events*</b><br>
    </TD>
    <TD class="tdfont" width=5>
        &nbsp;
    </TD>
    <TD class="tdfont">
        Name of Partner<br><i>(if applicable)</i>
    </TD>
    <TD class="tdfont" width=5>
        <i>or</i>
    </TD>
    <TD class="tdfont">
        Partner Required?<br><i>(please tick)</i>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Mens Singles + plate/handicap competition
    </TD>
    <TD class="tdfont" width=5 border=2>
    &nbsp;
    </TD>
    <TD class="tdfont" colspan="4" border=0 bgcolor="#c0c0c0">
    &nbsp;
    </td>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Ladies Singles + plate/handicap competition
    </TD>
    <TD class="tdfont" width=5 border=2>
    &nbsp;
    </TD>
    <TD class="tdfont" colspan="4" border=0 bgcolor="#c0c0c0">
    &nbsp;
    </td>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Mens Doubles
    </TD>
    <TD class="tdfont" width=5 border=2>
        &nbsp;
    </TD>
    <TD class="tdfont" width=30 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
    <TD class="tdfont" width=5 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Ladies Doubles
    </TD>
    <TD class="tdfont" width=5 border=2>
        &nbsp;
    </TD>
    <TD class="tdfont" width=30 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
    <TD class="tdfont" width=5 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Mixed Doubles
    </TD>
    <TD class="tdfont" width=5 border=2>
        &nbsp;
    </TD>
    <TD class="tdfont" width=30 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
    <TD class="tdfont" width=5 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Mixed Doubles Plate
    </TD>
    <TD class="tdfont" width=5 border=2>
        &nbsp;
    </TD>
    <TD class="tdfont" width=30 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" colspan=3 align=center>
        <i>(partners are drawn for this event)</i>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=200 align=left valign=center>
      Veterans Doubles (Mens)
    </TD>
    <TD class="tdfont" width=5 border=2>
        &nbsp;
    </TD>
    <TD class="tdfont" width=30 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
    <TD class="tdfont" width=5 bgcolor="#c0c0c0">
        &nbsp;
    </TD>
    <TD class="tdfont" width=30>
        &nbsp;
    </TD>
  </TR>
</TBODY>
</TABLE>
</DIV>
<BR>
<DIV ALIGN="LEFT">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>&nbsp;&nbsp;&nbsp;<b>*</b>&nbsp;&nbsp;please tick all events that you wish to enter</i>
</DIV>
<br>
<DIV ALIGN="CENTER">
<TABLE borderColor=#000000 cellSpacing=2 cellPadding=2 width=434 border=1 bgcolor=#52bb04>
  <TBODY>
  <TR>
    <TD class="tdfont" ALIGN="CENTER" VALIGN="CENTER">
      <h3><b><i><font color=#ffffff>Finals Day is SATURDAY 12 JULY, 2003</font></i></b></h3>
    </TD>
  </TR>
</TBODY>
</TABLE>
<BR>
<DIV align=center>
<TABLE cellSpacing=0 cellPadding=2 width=95% border=1>
  <TBODY>
  <TR>
    <TD class="tdfont" colspan=2>
      <P align=left valign=top>
      <u><b>NOTES</b></u>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>1.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      The Tournament Committee for this year is:&nbsp;
      <b>
      &nbsp;John Davis, Kathy Hunt and Bert Bodfish</b>
      All queries should be referred to them and their decision in each matter is final.
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>2.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      The Singles competitions will include a plate/handicap competition for all early round losers to try to encourage more members to participate.
      <br>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>3.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      <b>
      If you are likely to be away on 12 July, 2003 please do not enter <u>any</u> events.
      <br><b>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>4.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      It is the responsibility of the first named person (or pair) in any draw to arrange a match.
      A maximum of 3 alternate dates should be offered to opponents. If the dates offered are all
      rejected, the matter must be referred to the above Tournament Committee for their decision.
      <br>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>5.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      Matches must <b>not</b> be arranged during any club session (Senior or Junior).
      Any spare court on league match nights may be used for tournament matches.
      <br>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>6.</FONT></P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      To enter the Veterans event you must be over 40 on 1 April, 2003.
      <br>
      </P>
    </TD>
  </TR>
  <TR>
    <TD class="tdfont" width=14>
      <P align=left valign=top>8.</P>
    </TD>
    <TD class="tdfont">
      <P align=left valign=top>
      <b>
      Closing date for entries is Sunday 6 April, 2003.
      <br><b>
      </P>
    </TD>
  </TR>
</TABLE>
<BR>
<div align=center>
<table  width="90%" border="0" cellspacing="2" cellpadding="5">
	<tr>
		<td class=tdfont width=50>
			&nbsp;
		</td>
		<td  align="right">
			<font color=#ff0000><b><i>YES!</i></b></font> Please enter me into the Wimbledon ticket draw			
		</td>
		<td class=tdfont width=10 border=2>
			&nbsp;
		</td>	
		<td class=tdfont width=50>
			&nbsp;
		</td>
	</tr>
</table>
<A href="fixtures.asp">[Back to Fixtures Page]</A>
</div>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>
