<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Confirm 200 Club Draw Results");
// Now for any variables local to this page
var debugging = true;
var ConnObj;
var RS,RS2,RS3;
var SQL1, SQL2, SQL3, SQL4;
var dbconnect=Application("hamptonsportsdb");
var owner1, owner2, owner3, owner4;
SQL1 = new String("select ownersname from 200club where drawnumber = " + Request.Form("firstwinner")).toString();
SQL2 = new String("select ownersname from 200club where drawnumber = " + Request.Form("secondwinner")).toString();
SQL3 = new String("select ownersname from 200club where drawnumber = " + Request.Form("thirdwinner")).toString();
SQL4 = new String("select ownersname from 200club where drawnumber = " + Request.Form("fourthwinner")).toString();
// Do DB enquiries
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
RS = ConnObj.Execute(SQL1);
owner1 = new String(RS("ownersname"));
RS = ConnObj.Execute(SQL2);
owner2 = new String(RS("ownersname"));
RS = ConnObj.Execute(SQL3);
owner3 = new String(RS("ownersname"));
RS = ConnObj.Execute(SQL4);
owner4 = new String(RS("ownersname"));
RS.Close();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>200 Club results for the <%= Request.Form("drawtype") %> draw for <%= Request.Form("drawmonth") %>&nbsp;<%= Request.Form("drawyear") %>:</h3>
<FORM ACTION="post200Draw.asp" METHOD="POST">
	<table  width=650 border=0 cellspacing=0 cellpadding=0 height="95">
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
						<td width=100 align=center>
							<b>
								<i>Prize Value<br>(£)</i>
							</b>
						</td>
						<td width=100 align=center>
							<b>
								<i>Winning Number</i>
							</b>
						</td>
						<td width=200 align=center>
							<b>
								<i>Winning Owner</i>
							</b>
						</td>
					</tr>
					<tr>
						<td align=center>
							<b>
							1st Prize
							</b>
						</td>
						<td align=center>
							<INPUT ALIGN="right" TYPE="text" NAME="firstprize" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("firstprize") %>">
						</td>
						<td align=center>
							<INPUT ALIGN="right" TYPE="text" NAME="firstwinner" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("firstwinner") %>">
						</td>
						<td>
								<%= owner1 %>
						</td>
					</tr>
					<tr>
						<td align=center>
							<b>
								2nd Prize
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="secondprize" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("secondprize") %>">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="secondwinner" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("secondwinner") %>">
						</td>
						<td>
								<%= owner2 %>
						</td>
					</tr>
					<tr>
						<td align="center">
							<b>
							3rd Prize
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="thirdprize" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("thirdprize") %>">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="thirdwinner" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("thirdwinner") %>">
						</td>
						<td>
								<%= owner3 %>
						</td>
					</tr>
					<tr>
						<td align="center">
							<b>
							4th Prize
							</b>
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="fourthprize" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("fourthprize") %>">
						</td>
						<td align=center>
							<INPUT TYPE="text" NAME="fourthwinner" SIZE="3" MAXLENGTH="3" VALUE="<%= Request.Form("fourthwinner") %>">
						</td>
						<td>
								<%= owner4 %>
						</td>
					</tr>
				</table>
			</td>
			<td width="60" height="102">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td width="69">
				&nbsp;
			</td>
			<td align="center" width="515">
				<input type="hidden" name="drawyear" value="<%= Request.Form("drawyear") %>">
				<input type="hidden" name="drawmonth" value="<%= Request.Form("drawmonth") %>">
				<input type="hidden" name="drawtype" value="<%= Request.Form("drawtype") %>">
				<br><p><input type="submit" value="Confirm"></p>
			</td>
			<td width="60">
				&nbsp;
			</td>
		</tr>
	</table>
</form>
<br>
<%
if (debugging)
{
	Response.Write(SQL1);
	Response.Write("<br>");
	Response.Write(SQL2);
	Response.Write("<br>");
	Response.Write(SQL3);
	Response.Write("<br>");
	Response.Write(SQL4);
	Response.Write("<br>");
}
%>
<br>
<!--#include file="textnav.asp" -->
<%
%>
