<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club").toString();
var pagetitle = new String("Circulating Email").toString();
var uniqref, sender;
var dbconnect;
var SQL1, SQL2;
var RS;
var connObj;
// Now for any functions and variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// Check captaincy credentials of logged-in user
uniqref = getUserCode();
uniqref = uniqref.toString();
dbconnect=Application("hamptonsportsdb");
connObj = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
connObj.Open(dbconnect);
SQL1 = new String("SELECT teamname from tennisteams where uniqueref = "+uniqref).toString();
RS = connObj.Execute(SQL1);
if (RS.EOF)
{
	RS.Close();
	Response.Redirect("members.asp");
}
// Get user email details
SQL2 = new String("SELECT email from members where uniqueref = "+uniqref).toString();
sender = new String("NOT FOUND").toString();
RS = connObj.Execute(SQL2);
if (! RS.EOF)
	sender = Trim(new String(RS("email")).toString());

// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Circulating Email</h3><hr align=left width=650>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<form action="mail2me.asp" method="POST">
				<table  width=650 border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">
							From:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<%= sender %>
							<input type="hidden" name="sender" value="<%= sender %>">
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">
							To:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
						<table class="tdfont">
							<tr>
						        <td><strong>Circulation:</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List</td>
						        <td>
									<select name="query" tabindex="1">
										<option value="LadiesFirstTeamSquad">Ladies First Team Squad
										<option value="LadiesSecondTeamSquad">Ladies Second Team Squad
										<option value="MensFirstTeamSquad">Mens First Team Squad
										<option value="MensSecondTeamSquad">Mens Second Team Squad
										<option value="MensThirdTeamSquad">Mens Third Team Squad
										<option value="teamcaptains">Tennis Team Captains
										<option value="maxicaptains">MAXI-Tennis Team Captains
									</select>
									&nbsp;&nbsp;<font color="red"><b>OR</b></font>&nbsp;&nbsp;<br>
								</td>
							</tr>
							<tr>
						        <td>Personal Email Address</td>
						        <td>
									<input type="text" name="whotopersonal"  tabindex="2" size="50" maxlength="50" class="tdfont" ID="whoto" value=""><br><font size=1>e.g.johnsmith@hotmail.com</font>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">
							Subject:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<input type="text" name="thesubject"  tabindex="3" size="50" maxlength="150" value="">
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">
							Main Title:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<input type="text" name="bodytitle" tabindex="4" size="60" maxlength="120" value="">
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">
							Message:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<textarea name="para1"  tabindex="5" rows="8" cols="50">
							</textarea><br>
							&nbsp;&nbsp;First paragraph (will show in <b>bold</b> in the email)
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" border=0 style="width: 18%">
							&nbsp;
						</td>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
							<textarea name="para2" tabindex="6" rows="8" cols="50">
							</textarea>
							&nbsp;&nbsp;Second paragraph<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" border=0 style="width: 18%">
							&nbsp;
						</td>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
							<textarea name="para3"  tabindex="7" rows="8" cols="50">
							</textarea>
							&nbsp;&nbsp;Third paragraph
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" border=0 style="width: 18%">
							&nbsp;
						</td>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
							<textarea name="footertext" tabindex="8" rows="4" cols="50">
							</textarea><br>
							&nbsp;&nbsp;Text to appear in the footer of the email
						</td>
					</tr>
			        <tr>
        				<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">First attachment</td>
					    <td class="tdfont" bgcolor="#c0c0c0" width="70%">
					        <p style="margin-left: 2">
					        <input type="text" name="attach1" size="60" tabindex="9" class="tdfont">
					    </td>
					 </tr>
			        <tr>
        				<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">Second attachment</td>
					    <td class="tdfont" bgcolor="#c0c0c0" width="70%">
					        <p style="margin-left: 2">
					        <input type="text" name="attach2" size="60" tabindex="10" class="tdfont">
					    </td>
					 </tr>
			        <tr>
        				<td class="tdfont" bgcolor="#c0c0c0" style="width: 18%">Third attachment</td>
					    <td class="tdfont" bgcolor="#c0c0c0" width="70%">
					        <p style="margin-left: 2">
					        <input type="text" name="attach3" size="60" tabindex="11" class="tdfont">
					    </td>
					 </tr>
				</table>
				<div align="center">
					<input type="submit" value="Send">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="Cancel">
					<br>
				</div>
			</form>
		</td>
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>