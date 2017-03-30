<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club Administration");
var membername = new String("");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("services/asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
<DIV ALIGN=CENTER>
<h2>200 Club Number Search</h2>
<FORM NAME="Club200Form" METHOD="POST" ACTION="lst_200.asp">
<TABLE BORDER="1" WIDTH="80%" ALIGN="CENTER" CELLPADDING="5" CELLSPACING="2" bgcolor="#c0c0c0">
    <TR>
        <td class="tdfont" VALIGN="CENTER">
            <FONT COLOR=#000000><B>200 club number to check:   </B></FONT>
        </TD>
        <td class="tdfont" VALIGN="CENTER">
            <INPUT TYPE="text" NAME="club200number" SIZE="3" MAXLENGTH="3" VALUE="">
        </TD>
    </TR>
</TABLE>
<BR>
<INPUT NAME="cmdSubmit" TYPE="Submit" VALUE="Submit">&nbsp; &nbsp;
</FORM>
</DIV>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.Club200Form.club200number.Focus
End Sub
</SCRIPT>
</html>
<%
%>
