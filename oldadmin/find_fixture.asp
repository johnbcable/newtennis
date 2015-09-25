<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Resulting Fixtures");
var theseason = new String("");
var fxituretype = new String("");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (!isFixtureEditor())
	Response.Redirect("services.asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<DIV ALIGN=CENTER>
				<br>
				<FORM NAME="FixtureForm" METHOD="POST" ACTION="lstfixtures.asp">
					<TABLE BORDER=1 COLS=" 10%,10%,10%,10%,10%,10%" WIDTH=80% ALIGN=CENTER CELLPADDING=5 bgcolor="#ffffff">
						<tr>
							<td class="tdfont" colspan="2" align="center">
								<br>
								In the form below, select the season and the team/type of fixture you wish to
								locate, click on submit and you will be taken to the appropriate list of
								fixtures available for you to choose which one to 
                                work with.
								<br>
								<br>
							</td>
						</tr>
						<TR>
							<td class="tdfont" VALIGN="CENTER" bgcolor="#c0c0c0">
								<FONT COLOR=#000000>
									<B>
										Season:   
									</B>
								</FONT>
							</TD>
							<td class="tdfont" VALIGN="CENTER" bgcolor="#c0c0c0">
								<select name="season">
									<option selected>
									2007
									<option>
									2006
									<option>
									2005
									<option>
									2004
									<option>
									2003
									<option>
									2002
								</select>
							</TD>
						</TR>
						<TR>
							<td class="tdfont" VALIGN=TOP bgcolor="#c0c0c0">
								<FONT COLOR="#000000">
									<B>
										Team:   
									</B>
								</FONT>
							</TD>
							<td class="tdfont" VALIGN=TOP bgcolor="#c0c0c0">
								<select name="theteam">
									<option>
									FRIENDLY
									<option>
									Ladies 1st Team
									<option>
									Ladies 2nd Team
									<option>
									Mens 1st Team
									<option>
									Mens 2nd Team
									<option>
									Mens 3rd Team
								</select>
							</TD>
						</TR>
					</TABLE>
					<BR>
					<input type="hidden" name="acclevel" value="9">
					<INPUT NAME="cmdSubmit" TYPE="Submit" VALUE="Submit">
					&nbsp; &nbsp;
					<INPUT TYPE="Reset" VALUE="Reset">
				</FORM>
			</DIV>
		</td>
		<comment>
			Column 3 reserved for internal and external advertising
		</comment>
		<!--#include file="adverts.asp" -->
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
<SCRIPT LANGUAGE="VBScript">
Sub Window_onLoad()
    Document.FixtureForm.season.Focus
End Sub
</SCRIPT>
</html>
<%
%>