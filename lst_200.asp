<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Allocated 200 Club Numbers");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var thenumber;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var memberknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
if (! is200ClubEditor())
	Response.Redirect("services.asp");
numberknt=0;
toclick=0;
thenumber = new String(Request.Form("club200number"));
if (thenumber=="null" || thenumber=="undefined")
	thenumber="0";
// End of page start up coding
%>
<!--#include file="200head.asp" -->
<H3>Currently Allocated 200 Club Numbers</H3>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
<TABLE border="2" WIDTH=650 BGCOLOR="#c0c0c0" CELLPADDING="5" COLS="2">
	<tr>
		<td class="tdfont" bgcolor="#c0c0c0" colspan="2" align=center>
			Click on a number in the list below to change its ownership
		</td>
	</tr>
</table>
<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
<TH width=100 ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
<FONT SIZE=2 FACE="Arial" COLOR=#000000>Number</FONT></TH>
<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 align=left>
<FONT SIZE=2 FACE="Arial" COLOR=#000000>
Owners Name</i></FONT></TH>
<%
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
if (thenumber=="0")
	SQLStmt = new String("SELECT * from 200club where ownersname is not null and ownersname not like 'NOBODY' order by drawnumber");
else
	SQLStmt = new String("SELECT * from 200club where drawnumber="+thenumber);
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
mynumber=new String(RstObj("drawnumber"));
%>
	<tr>
		<td class="tdfont">
			<a href="edit_200.asp?drawnumber=<%= mynumber %>"><%= mynumber %></a>
		</td>
		<td class="tdfont">
			<%= RstObj("ownersname") %>
		</td>
	</tr>
<%
	RstObj.MoveNext();
}
%>
	<tr>
		<td class="tdfont" bgcolor="#c0c0c0" colspan="2">
			Click on a number in the list above to change its ownership
		</td>
	</tr>
</table>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
