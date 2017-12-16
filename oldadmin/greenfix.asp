<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, greeting, d,usermotd;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Green Fixtures Page";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = timegreeting();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tdfont" valign="TOP" align="LEFT" width=650>
			<!--#include file="greenfix.htm" -->
		</td>
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>

































