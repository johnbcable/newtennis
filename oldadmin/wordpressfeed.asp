<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="wordpress.asp" -->
<!--#include file="qmfuncs.asp" -->
<%
	var wpJSON = getBlogEntriesJSON("hamptontennis",3);
	Response.Write(wpJSON);
%>
