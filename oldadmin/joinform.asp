<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club Limited";
var pagetitle = "Application for Membership";
// Now for any variables local to this page
var thesecretary = new String("Mo Matthews, 'Witsend', 16 Spring Hill, New Arley, Coventry, CV7 8FE");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="clubhead.asp" -->
<DIV align=center>
<font face="Verdana" size="2">
<b>Type of Membership (please tick all that apply)</b><br>
</font>
<br>
<TABLE borderColor=#000000 cellSpacing="0" cellPadding="2" width="565" border="1" cols="20%,20%,20%,20%,20%">
  <TBODY>
  <TR>
    <TD width="108" align="CENTER" bgcolor="#c0c0c0">
      <P><FONT face=Verdana size=2>Hockey</FONT></P>
    </TD>
    <TD width="108" align="CENTER">
      <P><FONT face=Verdana size=2>Tennis</FONT></P>
    </TD>
    <TD width="108" align="CENTER" bgcolor="#c0c0c0">
      <P><FONT face=Verdana size=2>Squash</FONT></P>
    </TD>
    <TD width="108" align="CENTER" bgcolor="#c0c0c0">
      <P><FONT face=Verdana size=2>Football</FONT></P>
    </TD>
    <TD align="CENTER" bgcolor="#c0c0c0">
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
<TABLE borderColor="#000000" cellSpacing="0" cellPadding="2" width="565" border="1">
  <TBODY>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Surname&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=right><FONT face=Verdana
      size=2>(Mr / Mrs / Ms / Miss)&nbsp;&nbsp;&nbsp;&nbsp;</FONT></P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Forename(s)&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Address&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD></TR>
  <TR>
    <TD width=107>
      <P align=center>&nbsp;</P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD></TR>
  <TR>
    <TD width=107>
      <P align=right><FONT face=Verdana size=2>Post Code&nbsp;&nbsp;</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P>
    </TD>
  </TR>
  <TR>
    <TD width=107 rowspan=3>
        <P align=center><FONT face=Verdana size=2>Telephone Numbers</FONT></P>
    </TD>
    <TD width=458 colSpan=4>
      <P align=left>Home:</P>
    </TD>
  </TR>
  <TR>
    <TD width=458 colSpan=4>
      <P align=left>Business:</P>
    </TD>
  </TR>
  <TR>
    <TD width=458 colSpan=4>
      <P align=left>Mobile:</P>
    </TD>
  </TR>
  <TR>
    <TD width=107>
      <P align=center><FONT face=Verdana size=2>e-mail</FONT></P></TD>
    <TD width=458 colSpan=4>
      <P align=center>&nbsp;</P></TD>
  </TR>
  <TR>
    <TD width=107>
      <P align=center><FONT face=Verdana size=2>Date of Birth</FONT></P>
    </TD>
    <TD width=107>
      <P align=center>&nbsp;</P>
    </TD>
    <TD width=351 colspan="3">
      <P align=center><FONT face=Verdana size=2>(* if under 21 or in full-time education)</FONT></P>
    </TD>
  </TR>
  <TR>
    <TD width=107>
      <P align=center><FONT face=Verdana size=2>Occupation:</FONT></P>
    </TD>
    <TD width=220>
      <P align=center>&nbsp;</P>
    </TD>
    <TD width=107>
      <P align=center><FONT face=Verdana size=2>Previous Clubs:</FONT></P>
    </TD>
    <TD width=220>
      <P align=center>&nbsp;</P>
    </TD>
  </TR>
  </TBODY>
</TABLE>
</DIV>
<P align=center><FONT face=Verdana size=2><B><font bgcolor="#c0c0c0"><u>Family membership only</u></font></B>&nbsp;Details of other members at the same address.
</FONT>
<DIV ALIGN="CENTER">
<TABLE borderColor="#000000" cellSpacing=0 cellPadding=0 width="100%" border=1>
  <TBODY>
  <TR>
    <TD width=107>
      <P align=left><FONT face=Verdana size=2>Surname</FONT></P></TD>
    <TD width=107>
      <P align=left><FONT face=Verdana size=2>Forename(s)</FONT></P></TD>
    <TD width=100>
      <P align=center><FONT face=Verdana size=2>Telephone Number(s)<br>(Home,Work,Mobile)</FONT></P></TD>
    <TD width=100>
      <P align=center><FONT face=Verdana size=2>Type of Membership<br>(see above)</FONT></P></TD>
    <TD width=100>
      <P align=center><FONT face=Verdana size=2>Date of Birth<br>(see above)</FONT></P></TD>
  </TR>
  <TR>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
  </TR>
  <TR>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
  </TR>
  <TR>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
  </TR>
  <TR>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
  </TR>
  <TR>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=107 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
    <TD width=100 height=32>
        &nbsp;
     </TD>
  </TR>
</TBODY>
</TABLE>
<FONT face=Verdana color="#000000" size="1"><B>N.B.</B>&nbsp;&nbsp;Please complete a separate form for each application from a <u>different</u> address</FONT>
</DIV>
<P align=center><FONT face=Verdana size=2><B>I wish to become a member of <%= clubname %> and hereby agree, if accepted, to abide by
the <a href="clubrules.asp">rules of the Club</a>. I give permission for my membership details to be held on computer and for my contact details to be available to other members via the club web site.</B></FONT></P>
<DIV align=center>
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
<P align=center><FONT face=Verdana size=1>Please print this form, using the
print button on your browser, complete and sign and return it WITH YOUR CHEQUE
made out to "Hampton-in-Arden Sports Club Limited" to the Membership Secretary at the address below.</FONT></P>
<DIV align=center>
Membership Secretary: <%= thesecretary %>
</DIV>
<BR>
<P align=center><FONT size=2><A
href="juniors/joinus.html">[Back to Membership Page]</A></FONT></P>
<BR>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>

