<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Sending Email");
// Now for any functions and variables local to this page
var emailalias;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
emailalias=new String("");
emailalias=getClubEmailAlias();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<script language="JavaScript">
function FormHandler() {
var sFrom, sTo, sSubject, sMessage;
var errmess, kount;
sFrom = new String(document.forms[0].whofrom.value).
sTo = new String(document.forms[0].whoto.value);
sSubject = new String(document.forms[0].thesubject.value);
sMessage = new String(document.forms[0].themessage.value);
errmess = new Array[4];
kount = -1;
if (sFrom.length() < 1) {
	kount=kount+1;
	errmess[kount] += "Who from missing"
}
if (sTo.length() < 1) {
	kount=kount+1;
	errmess[kount] += "Who to missing"
}
if (sSubject.length() < 1) {
	kount=kount+1;
	errmess[kount] += "No subject text"
}
if (sMessage.length() < 1) {
	kount=kount+1;
	errmess[kount] += "No message specified"
}
// If any errors, display an alert message. Otherwise send the mail
if (kount > 0) {
alert("Problems\n\n"+errmess[0]+"\n"+errmess[1]+"\n"+errmess[2]+"\n"+errmess[3]+"\n\nPlease go back and fill in the missing details");
return false;
}
else
	return true;
}
</script>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
	<form onSubmit="FormHandler()" action="postmail.asp" method="POST">
    <table  width="95%" border="1" cellspacing="2" cellpadding="5" bgcolor="#c0c0c0">
	<tr>
		<td class="tdfont" >
			From:
		</td>
		<td class="tdfont" >
			&nbsp;&nbsp;&nbsp;&nbsp;<%= emailalias %>&nbsp;&nbsp;<i>(your club email account)</i>
			<input type="hidden" name="whofrom" size="50" maxlength="50" value="<%= emailalias %>">
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
			To:
		</td>
		<td class="tdfont" >
			<input type="text" name="whoto" size="50" maxlength="50" value=""><br>
			<font size="1" color="#000000" face="Verdana">N.B. This is the full internet email address of the person you wish to send the email to. For example, <b>joe.bloggs@dodgymotors.co.uk</b></font>
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
			Subject:
		</td>
		<td class="tdfont" >
			<input type="text" name="thesubject" size="50" maxlength="50" value="">
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
			Message:
		</td>
		<td class="tdfont" >
			<textarea name="themessage" rows="15" cols="50"></textarea>
		</td>
	</tr>
</table>
<div align="center">
<input type="submit" value="Send">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="Cancel">
</div>
</form>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
