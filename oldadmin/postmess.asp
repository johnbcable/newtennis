<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Message Confirmation");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var sTo, sCategory, sFrom, sCategory, sMessage;
var sentTo = new String("");
sCategory = new String(Request.Form("category"));
sTo = new String(Request.Form("whoto"));
sFrom = new String(Request.Form("whofrom"));
sMessage = new String(Request.Form("themessage"));
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
sTo="";  // default for now until individual member stuff opens up
if (sCategory=="EVERYONE")
	sentTo="All visitors to the web site";
if (sCategory=="MEMBERS")
	sentTo = "All Hampton Tennis Club web members";
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("insert into messages(whoto, memberid, messagetext, sender) values('"+sCategory+"','"+sTo+"','"+sMessage+"','"+sFrom+"')");
// RstObj = ConnObj.Execute(SQLStmt);
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu
		</comment>
		
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>
			<font size="4" color="#000000" face="Verdana">
				<b>
					Your message has been accepted.<br><br>
					It will remain on the site for 28-days<br>
<%
if (sCategory=="MEMBER")
					Response.Write("unless removed by the member themselves<br>");
%>
<hr width="95%" align=center>
					<br>
					<table  width=650 border=0 cellspacing=0 cellpadding=0>
						<tr>
							<td >
								<b>
									Sender:
								</b>
							</td>
							<td >
								<%= sFrom %>
							</td>
						</tr>
						<tr>
							<td >
								<b>
									Sent To:
								</b>
							</td>
							<td >
								<%= sentTo %>&nbsp;<%= sTo %>
							</td>
						</tr>
						<tr>
							<td >
								<b>
									Message:
								</b>
							</td>
							<td >
								<%= sMessage %>
							</td>
						</tr>
					</table>
					<br>
<hr width="95%" align=center>
					<b>
						Please click on a menu choice on the left to go elsewhere in the site.
					</b>
				</font>
			</td>
			<comment>
				Column 3 reserved for internal and external advertising
			</comment>
			<!--#include file="adverts.asp" -->
		</tr>
	</table>
	<br>
  sql= [<%= SQLStmt %> ]<br>
	<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
