<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Membership Audit Results");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
if ( ! isSupport())
	Response.Redirect("services.asp");
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT * from member_audits order by action_date desc, action_time desc");
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>Column 1 reserved for navigation menu - not used here</comment>
		
		<td>
			<comment>Content for each page placed into middle column</comment>
<%
if (debugging)
{
%>
SQL statement = [<%= SQLStmt %>]<br>
<%
}
%>
<%
// execute the SQL statement
if (! current_debug_status())
	RstObj = ConnObj.Execute(SQLStmt);
%>
			<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
				<TH ALIGN="LEFT" COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000>
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						Member ID
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						Action
					</FONT>
				</TH>
				<TH COLSPAN=1 BGCOLOR=#c0c0c0 BORDERCOLOR=#000000 >
					<FONT SIZE=2 FACE="Arial" COLOR=#000000>
						When it happened
					</FONT>
				</TH>
<%
while (! RstObj.EOF)
{
%>
				<TR>
					<TD class="tdfont" align="center" valign="center"><%= RstObj("memberid") %></TD>
					<TD class="tdfont" align="center" valign="center"><%= RstObj("action") %></TD>
					<TD class="tdfont" align="center" valign="center"><%= RstObj("action_date") %>&nbsp;at&nbsp;<%= RstObj("action_time") %></TD>
				</TR>
<%
RstObj.MoveNext();
}
%>
</TABLE>
</DIV>
</td>
<comment>
Column 3 reserved for internal and external advertising not used here
</comment>
</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
ConnObj.Close();
ConnObj=null;
%>


