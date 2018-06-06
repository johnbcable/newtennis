<%@language="JScript" CODEPAGE="65001"%>

<%
var fname, city;

fname = new String(Request.Form("name")).toString();
city = new String(Request.Form("city")).toString();

Response.Write("Name received: " + fname +"<br />");
Response.Write("City received: " + city +"<br />");

%>
