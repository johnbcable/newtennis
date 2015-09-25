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
			<form action="mailall.asp" method="POST">
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
						        <td>Distribution List</td>
						        <td>
								<SELECT NAME="whotolist">
								<OPTION selected>-- All members --
								<option>Adult members
								<option>Junior members
								<option>Student members
								<option>Under 7's
								<option>Non-Members
								<option>Ex-Members
								<option>Social members
								</SELECT>&nbsp;&nbsp;<font color="red"><b>OR</b></font>&nbsp;&nbsp;<br>
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
							Message:
						</td>
						<td class="tdfont" bgcolor="#c0c0c0">
<textarea name="themessage" rows="15" cols="60">
</textarea>
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
