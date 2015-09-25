<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "Tournaments";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
	<td>
		<h2>Club Tournaments</h2><br>
		Hampton-In-Arden Tennis Club runs a number of internal tournaments every year for both senior and junior members.<br><br>
		The main adult tournament draw for 2007 has now been made. You can find a copy of the initial draw <a href="tour2007.asp">here</a>.<br><br>
		Please visit the <A HREF="juniors/index.html">Juniors section</A> of the web site for more information on their tournaments for the 2006 season.<br><br>
		Past winners of Hampton-In-Arden Sports Club Tennis Titles are listed <a href="winners.asp">here</a>.<br><br>
	</td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
