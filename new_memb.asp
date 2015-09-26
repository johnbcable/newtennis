<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("New Member");
// Now for any variables local to this page
var mUnique;
var maxmemb;
var dummymemb;
var newmember="Y";
var ConnObj, RS, SQLStmt, dbconnect;
dbconnect=Application("hamptonsportsdb");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("services.asp");
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// Firstly we need to determine the next memberid
SQLStmt = new String("SELECT (max(uniqueref)+1) as biggest from members");
RS = ConnObj.Execute(SQLStmt);
while (! RS.EOF)
{
	maxmemb = new String(RS("biggest"));
	RS.MoveNext();
}
dummymemb = "newZYZ" + maxmemb;
SQLStmt=new String("insert into members(memberid,membergrade,surname) values('"+dummymemb+"','Adult','New members surname')");
RS=ConnObj.Execute(SQLStmt);
SQLStmt=new String("select uniqueref from members where memberid = '"+dummymemb+"'");
RS=ConnObj.Execute(SQLStmt);
mUnique="-1"
while (! RS.EOF)
{
	mUnique=new String(RS("uniqueref"));
	RS.MoveNext();
}
if (mUnique=="-1")
	Response.Redirect("chk_memb.asp");
RS=null;
ConnObj.Close();
ConnObj=null;
Response.Redirect("editmemb.asp?code="+mUnique+"&new=Y");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<!--#include file="dateval.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
<form action="new_memb.asp" method="post">
<table  width=440 border="1" cellspacing="2" cellpadding="5" bgcolor="#c0c0c0">
	<tr>
		<td >
			<b>
				Member ID
			</b>
		</td>
		<td >
			<b>
				Member Type/Grade
			</b>
		</td>
		<td >
			<b>
				Surname
			</b>
		</td>
	</tr>
	<tr>
		<td >
			<%= dummymemb %>
		</td>
		<td >
			Adult
		</td>
		<td >
			SURNAME
		</td>
	</tr>
</table>
<input type="hidden" name="newone" value="Y">
<div align="center">
<br>
Click on Submit (below) to complete/alter the new member details, or Cancel to return to Services page<br><br>
<input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Cancel">
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
