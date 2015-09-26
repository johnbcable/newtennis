<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Updating Members Fees Paid Status");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RS, SQL1, SQL2, SQL3;
var ids = new String("").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
ids = new String(Request.QueryString("paid")).toString();
// End of page start up coding

	SQL1 = new String("UPDATE members SET paid = 'Y' WHERE uniqueref in  ("+ids+")").toString();
	RS = ConnObj.Execute(SQL1);

	Response.Redirect("/lst_unpaid.asp");
%>		
