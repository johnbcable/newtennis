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
	Response.Redirect("oldwayin.asp");
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
