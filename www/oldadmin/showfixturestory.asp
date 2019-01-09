<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="showXMLfuncs.asp" -->
<%
//
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Show Fixture Story");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var thefixture;
var fixturexml, fixturexsl;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
Response.Redirect("servervar.asp");
// Process QueryString
thefixture = new String(Request.QueryString("matchreport")).toString();
if (thefixture == "" || thefixture == "null" || thefixture == "undefined")
	Response.Redirect("fixtures.asp");
// End of page start up coding
fixturexml = new String(matchreport).toString();
fixturexsl = new String("fixturereport.xsl").toString();
showline = new String("showXML('"+fixturexml+"','"+fixturexsl+"')").toString();
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td width="650">
		<p src=<%= showline %>>
		</p>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>

