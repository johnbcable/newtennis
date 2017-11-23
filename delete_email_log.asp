<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Deleting a Log of an Email Send");
// Now for any variables local to this page
var ConnObj, RstObj;
var dbconnect=Application("hamptonsportsdb");
var theid;
var debugging = false;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
theid = new String(Request.Querystring("id"));
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("index.asp");
if (theid=="null" || theid=="undefined")
	Response.Redirect("index.asp");
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("delete from emails where emailid = "+theid);
RstObj = ConnObj.Execute(SQLStmt);
if (! current_debug_status())
	Response.Redirect("email_list.asp")
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
			<h3>The requested event has been deleted from the event calendar</h3>
			<br><br>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
