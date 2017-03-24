<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Searching for emails");
var membername = new String("");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// End of page start up coding
%>
<!--#include file="clubhead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<DIV ALIGN=CENTER>
				<FORM NAME="EmailTextForm" METHOD="POST" ACTION="lst_email.asp">
					<TABLE BORDER=1 COLS=" 10%,10%,10%,10%,10%,10%" WIDTH=80% ALIGN=CENTER CELLPADDING=5 bgcolor="#c0c0c0">
						<TR>
							<td class="tdnine" VALIGN="CENTER" HEIGHT="10px">
								<FONT COLOR=#000000>
									<B>
										Email text to search for:   
									</B>
								</FONT>
							</TD>
							<td class="tdnine" VALIGN="CENTER" HEIGHT="10px">
								<INPUT class="tdnine" TYPE="text" NAME="emailtext" SIZE="30" MAXLENGTH="40" VALUE="">
							</TD>
						</TR>
					</TABLE>
					<BR>
					<INPUT NAME="cmdSubmit" TYPE="Submit" VALUE="Submit">
					&nbsp; &nbsp;
					<INPUT TYPE="Reset" VALUE="Reset">
				</FORM>
			</DIV>
		</td>
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.EmailTextForm.emailtext.Focus
End Sub
</SCRIPT>
</html>
<%
%>