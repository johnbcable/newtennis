<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("My Details");
var v_memberid;
if (! signedin())
	Response.Redirect("login.asp");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
v_memberid=getUserCode();
Response.Redirect("editmemb.asp?code="+v_memberid);
%>

