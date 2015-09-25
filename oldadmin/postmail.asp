<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Email Confirmation");
// Now for any variables local to this page
var sTo, sFrom, sSubject, sMessage;
sTo = new String(Request.Form("whoto"));
sFrom = new String(Request.Form("whofrom"));
sSubject = new String(Request.Form("thesubject"));
sMessage = new String(Request.Form("themessage"));
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var objNewMail = Server.CreateObject("CDONTS.NewMail");
objNewMail.Send(sFrom,sTo,sSubject,sMessage);
objNewMail=null;
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
	<font size="4" color="#000000" face="Verdana">
	<b>
		Your email has been sent.
	</b>
	</font>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
