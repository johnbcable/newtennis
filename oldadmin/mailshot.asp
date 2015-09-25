<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club").toString();
var pagetitle = new String("Circulating Email").toString();
// Now for any functions and variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Circulating Email</h3><hr align=left width=650>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<td>
			<form action="tome2.asp" method="POST">
				<table  width=650 border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0">
							From:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<SELECT NAME="whofrom">
								<OPTION selected>secretary@hamptontennis.org.uk
								<OPTION>support@hamptontennis.org.uk
							</SELECT>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0">
							To:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
						<table class="tdfont">
							<tr>
						        <td>Circulation List</td>
						        <td>
		<select name="query">
		<option value="AdultMaleMembers">Adult Members - Males Only
		<option value="adultmembers">Adult Members - Men and Women
		<option value="AdultFemaleMembers">Adult Members - Women Only
		<option value="Arden92004">Arden 9 - 2004 Runners
		<option value="Arden92005">Arden 9 - 2005 Runners
		<option value="Under7s">Children Under 7
		<option value="CourseOnly">Children Who Only Attend Course
		<option value="Year7andOver">Children Year 7 and Over
		<option value="CourseRenewals">General Junior Coaching Renewals
		<option value="ExMembers">Ex-Members
		<option selected value="members">Full Members List
		<option value="JuniorMembers">Junior Members
		<option value="LadiesFirstTeamSquad">Ladies First Team Squad
		<option value="LadiesSecondTeamSquad">Ladies Second Team Squad
		<option value="MensFirstTeamSquad">Mens First Team Squad
		<option value="MensSecondTeamSquad">Mens Second Team Squad
		<option value="MensThirdTeamSquad">Mens Third Team Squad
		<option value="NonMembers">Non-Members
		<option value="SocialMembers">Social Members
		<option value="teamcaptains">Tennis Team Captains
		</select>
&nbsp;&nbsp;<font color="red"><b>OR</b></font>&nbsp;&nbsp;<br>
								</td>
							</tr>
							<tr>
						        <td>Personal Email Address</td>
						        <td>
									<input type="text" name="whotopersonal" size="50" maxlength="50" class="tdfont" ID="whoto" value=""><br><font size=1>e.g.johnsmith@hotmail.com</font>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0">
							Subject:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<input type="text" name="thesubject" size="50" maxlength="150" value="">
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0">
							Title:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
							<input type="text" name="title1" size="60" maxlength="60" value="">&nbsp;&nbsp;Line 1 of the title<br>
							<input type="text" name="title2" size="60" maxlength="60" value="">&nbsp;&nbsp;Line 2 of the title<br>
							<input type="text" name="title3" size="60" maxlength="60" value="">&nbsp;&nbsp;Line 3 of the title
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0">
							Message:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
<textarea name="para1" rows="8" cols="50">
</textarea>&nbsp;&nbsp;First paragraph<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
							&nbsp;
						</td>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
<textarea name="para2" rows="8" cols="50">
</textarea>&nbsp;&nbsp;Second paragraph<br>
						</td>
					</tr>
					<tr>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
							&nbsp;
						</td>
						<td class="tdfont" bgcolor="#c0c0c0" border=0>
<textarea name="para3" rows="8" cols="50">
</textarea>&nbsp;&nbsp;Third paragraph
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