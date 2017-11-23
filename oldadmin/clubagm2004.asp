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
<!--#include file="clubhead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
	<h3>Sports Club Annual General Meeting<br>Wednesday 25 February 2004</h3>
	<br>
	<table width=550 align=center border="0" cellpadding="2" cellspacing="5" style="border-collapse: collapse" bordercolor="#111111" width="100%">
   <tr>
     <td width="50%">Agenda and Nomination Form</td>
     <td width="50%"><a href="clubagm2004a.htm">View</a></td>
   </tr>
   <tr>
     <td width="50%">Sports Club AGM Minutes - 26 March 2003 Meeting</td>
     <td width="50%"><a href="clubagm2004b.htm">View</a></td>
   </tr>
 </table>

    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
