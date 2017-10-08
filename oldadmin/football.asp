<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
var strtime, strdate, greeting, d,usermotd;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Home Page";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = timegreeting();
// Define alternate startup pages
setVisit();      // set permanent cookie on PC to indicate has visited before
// End of page start up coding
//			<!--#include file="tickertape.asp" -->
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="tdfont" valign="TOP" align="LEFT" width=650>
			<!--#include file="firstone.asp" -->
		</td>
	</tr>
</table>
<table border="0" cellspacing="2" cellpadding="2" width="650">
	<tr>
		<td width=650>
			If you would like to sponsor our site, and have your organisation credited, we
			will be pleased to discuss this with you. Please contact us at 
			<a href="mailto:secretary@hamptontennis.org.uk">
				secretary@hamptontennis.org.uk
			</a>
			 using the word "Sponsor" in the subject line.
		</td>
	</tr>
</table>
</body>
</html>
<%
%>

































