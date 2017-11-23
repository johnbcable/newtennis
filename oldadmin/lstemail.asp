<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Email List");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var myid;
var mUnique;
var myaccess, theiraccess;
var callinguser;
var editline;
var toclick;
var therealname, themembername, searchtype;
var thesearchtext, thesorttext, thetypetext;
var themembertype, thesortorder;
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var memberknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("SELECT uniqueref, memberid, surname, forename1, initials, email from members where email not like '' order by email, surname, forename1");
// execute the SQL statement
RstObj = ConnObj.Execute(SQLStmt);
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu - not used here
		</comment>
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>

			<TABLE border="2" WIDTH="100%" BGCOLOR="#ffff80" CELLPADDING="5" COLS="2">
<%
while (! RstObj.EOF)
{
%>
				<TR>
				<td class="courtcirc" ALIGN="LEFT" VALIGN="CENTER">
					<B>
						<%= RstObj("surname") %> - [<%= RstObj("email") %>]
					</B>
				</td>
                 		</TR>
<%
RstObj.MoveNext();
}
%>
			</TABLE>
		</TD>
	</TR>
</table>
<br>
<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
ConnObj.Close();
ConnObj=null;
%>


