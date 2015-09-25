<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Deleting email from Arden 9 cirulations");
// Now for any variables local to this page
var m_email;
var ConnObj;
var RS,RS2,RS3;
var SQLStmt, SQL1, SQL2, SQL3, SQL4, SQL5, SQL6, SQL7, SQL8;
var kount;
var memberknt;
var dbconnect=Application("hamptonsportsdb");
var debugging=false;
var updating=true;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
// Initialise update variables
m_email = Trim(new String(Request.QueryString("email")));

// Do DB update
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
// Create SQL update string
	SQL1 = new String("UPDATE arden9runners set email='' WHERE email = '"+m_email+"'").toString();
if (debugging)
{
	Response.Write("current_debug_status()<br />");
	Response.Write("m_email = ["+m_email+"]<br />");
	Response.Write("<br />SQL1 = ["+SQL1+"]<br />");
}
if (updating)
	RS = ConnObj.Execute(SQL1);
// set real unique id
RS=null;
ConnObj.Close();
ConnObj=null;

%>

