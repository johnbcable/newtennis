<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("2002 Club Tournaments");
// Now for any variables local to this page
var debugging=false;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
    <comment>Content for each page placed into middle column</comment>
    <!--#include file="mixd2002.htm" -->
    </td>
  </tr>
</table>
<br>
<div align="center">
<font size="3"><a href="tours.asp?season=2002">Back to 2002 Tournaments page</a></font>
</div>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
