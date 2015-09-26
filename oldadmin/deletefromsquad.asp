<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="squadfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Deleting a Member from a Squad");
// Now for any variables local to this page
var ConnObj, RstObj;
var dbconnect=Application("hamptonsportsdb");
var theid, thesquad;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
theid = new String(Request.QueryString("member")).toString();
if (theid == "" || theid == "null" || theid == "undefined")
{
	theid = new String(Request.Form("member")).toString();
	if (theid == "" || theid == "null" || theid == "undefined")
		Response.Redirect("members.asp");
}
thesquad = new String(Request.QueryString("squad")).toString();
if (thesquad == "" || thesquad == "null" || thesquad == "undefined")
{
	thesquad = new String(Request.Form("squad")).toString();
	if (thesquad == "" || thesquad == "null" || thesquad == "undefined")
		Response.Redirect("members.asp");
}
if (! isSquadOwner(thesquad))
	Response.Redirect("notowner.asp");
// if (! isFixtureEditor())
// 	Response.Redirect("services.asp");
if (theid=="null" || theid=="undefined")
	Response.Redirect("members.asp");
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt = new String("delete from squadmembers where uniqueref = "+theid+" and squadid = "+thesquad);
RstObj = ConnObj.Execute(SQLStmt);
// End of page start up coding
Response.Redirect("lst_squad.asp?squad="+thesquad);
%>