<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("2004 Club Tournaments");
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
    <!--#include file="mixd2004.htm" -->
    </td>
  </tr>
  <tr>
  	<td align="center">
  		<br>
		<font size="2"><a href="atourney.asp"><b>Back to 2004 Tournament draw page</b></a></font>
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
