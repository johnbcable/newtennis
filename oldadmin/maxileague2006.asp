<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td align=center>
		<!--#include file="maxi2006league.htm" -->
    </td>
  </tr>
  <tr>
    <td align=center>
    	<br><br>
    	<hr>
    	<br>
		<a href="maxiresults2006.asp">Spring 2006 MAXI-Tennis Match Results</a>
		<br>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
