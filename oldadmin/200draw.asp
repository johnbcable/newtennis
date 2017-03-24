<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Recording 200 Club Draw Results");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="200head.asp" -->
<h3>
	Recording 200 Club Draw Results
</h3>
<FORM ACTION="set200Draw.asp" METHOD="POST">
	<table  width=650 border=0 cellspacing=0 cellpadding=0 height="95">
		<tr>
			<td width="69" height="28">
				&nbsp;
			</td>
			<td width="515" height="28">
				Recording results for the&nbsp;&nbsp;
				<SELECT NAME="drawtype">
					<OPTION selected>
					MONTHLY
					<OPTION>
					ANNUAL
				</SELECT>
				&nbsp;&nbsp;draw for
				<SELECT NAME="drawmonth">
					<OPTION>
					January
					<OPTION>
					February
					<OPTION>
					March
					<OPTION>
					April
					<OPTION>
					May
					<OPTION>
					June
					<OPTION>
					July
					<OPTION>
					August
					<OPTION>
					September
					<OPTION>
					October
					<OPTION>
					November
					<OPTION>
					December
				</SELECT>
				&nbsp;&nbsp;
				<SELECT NAME="drawyear">
					<OPTION selected>
					2003
					<OPTION>
					2002
				</SELECT>
			</td>
			<td width="60" height="28">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td width="69" height="102">
				&nbsp;
			</td>
			<td>
				<table  width="515" border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td width=115 align=center>
							<b>
								&nbsp;
							</b>
						</td>
						<td width=200 align=center>
							<b>
								<i>Prize Value</i>
							</b>
						</td>
						<td width=200 align=center>
							<b>
								<i>Winning Number</i>
							</b>
						</td>
					</tr>
					<tr>
						<td>
							<b>
							1st Prize	
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="firstprize" SIZE="3" MAXLENGTH="3" VALUE="50">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="firstwinner" SIZE="3" MAXLENGTH="3" VALUE="">
						</td>
					</tr>
					<tr>
						<td>
							<b>
								2nd Prize
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="secondprize" SIZE="3" MAXLENGTH="3" VALUE="30">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="secondwinner" SIZE="3" MAXLENGTH="3" VALUE="">
						</td>
					</tr>
					<tr>
						<td>
							<b>
							3rd Prize	
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="thirdprize" SIZE="3" MAXLENGTH="3" VALUE="15">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="thirdwinner" SIZE="3" MAXLENGTH="3" VALUE="">
						</td>
					</tr>
					<tr>
						<td>
							<b>
							4th Prize	
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="fourthprize" SIZE="3" MAXLENGTH="3" VALUE="10">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="fourthwinner" SIZE="3" MAXLENGTH="3" VALUE="">
						</td>
					</tr>
				</table>
			</td>
			<td width="60" height="102">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td width="69" height="67">
				&nbsp;
			</td>
			<td align="center" width="515" height="67">
				<input type="submit" value="Submit">
				&nbsp;&nbsp;&nbsp;
				<input type="reset" value="Reset">
			</td>
			<td width="60" height="67">
				
				
			</td>
		</tr>
	</table>
</form>
<br>
<!--#include file="textnav.asp" -->
<%
%>
