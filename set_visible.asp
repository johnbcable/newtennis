<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Changing Visibility of a News Item");
// Now for any variables local to this page
var ConnObj, RstObj;
var dbconnect=Application("hamptonsportsdb");
var theid;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
theid = new String(Request.Querystring("id"));
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("members.asp");
if (theid=="null" || theid=="undefined")
	Response.Redirect("members.asp");
visibility = new String(Request.QueryString("visibility")).toString();
if ( visibility == "" || visibility == "null" || visibility == "undefined")
{
	visibility = new Form(Request.QueryString("visibility")).toString();
	if ( visibility == "" || visibility == "null" || visibility == "undefined")
		Response.Redirect("lst_news.asp");
}
visibility = visibility.toUpperCase();		
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("update news set visible='"+visibility+"' where newsid = "+theid);
RstObj = ConnObj.Execute(SQLStmt);
RstObj = null;
ConnObj = null;
Response.Redirect("lst_news.asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
			<h3>The visbility of the requested fixture has been modified</h3>
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