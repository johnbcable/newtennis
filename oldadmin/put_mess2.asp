<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var strgreeting;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Leaving a Message");
// Now for any functions and variables local to this page
var dbconnect=Application("hamptonsportsdb");
var whotocategory;
var whotomember;
var sender, senderuserid;
var thetext;
var ConnObj, RS, sqlString;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
strgreeting=timegreeting();
if (!signedin())
	Response.Redirect("login.asp");
whotocategory=new String("");
whotomember=new String("");
thetext=new String("");
senderuserid=getUserID();
sender = new String("");
// End of page start up coding
ConnObj = Server.CreateObject("ADODB.connection");
ConnObj.Open(dbconnect);
sqlString = new String("Select forename1, surname from members where memberid = '" + senderuserid + "'");
RS = ConnObj.Execute(sqlString);
// Now check if sign in was OK
while (! RS.EOF)
{
	sender = new String(RS("forename1"));
	sender += " " + new String(RS("surname"));
	RS.MoveNext();
}
RS=null;
ConnObj.Close();
%>
<!--#include file="pagehead.asp" -->
<script language="JavaScript">
function MessageChecker() {
var sFrom, sCategory, sTo, sSubject, sMessage;
var errmess, kount;
sCategory = new String(document.forms[0].category.value).
sFrom = new String(document.forms[0].whofrom.value).
sTo = new String(document.forms[0].whoto.value);
sMessage = new String(document.forms[0].themessage.value);
errmess = new Array[5];
kount = -1;
if (sFrom.length() < 1) {
	kount=kount+1;
	errmess[kount] += "Who from missing"
}
if (sCategory.length() < 1) {
	kount=kount+1;
	errmess[kount] += "Category missing"
}
if (sTo.length() < 1) {
	kount=kount+1;
	errmess[kount] += "Who to missing"
}
if (sSubject.length() < 1) {
	kount=kount+1;
	errmess[kount] += "No text in message"
}
if (sMessage.length() < 1) {
	kount=kount+1;
	errmess[kount] += "No message specified"
}
// If any errors, display an alert message. Otherwise send the mail
if (kount > -1) {
alert("Problems\n\n"+errmess[0]+"\n"+errmess[1]+"\n"+errmess[2]+"\n"+errmess[3]+"\n"+errmess[4]+"\n\nPlease go back and fill in the missing details");
return false;
}
else
	return true;
}
</script>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
	<form onSubmit="MessageChecker()" action="postmess.asp" method="POST">
    <table  width="95%" border="1" cellspacing="2" cellpadding="5" bgcolor="#c0c0c0">
	<tr>
		<td class="tdfont" >
			From:
		</td>
		<td class="tdfont" >
			<%= sender %>
			<input type="hidden" name="whofrom" size="50" maxlength="50" value="<%= sender %>">
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
			Who To:
		</td>
		<td class="tdfont" >
<select name="category">
<option>MEMBERS
<%
if (isAdministrator())
{
%>
<option>EVERYONE
<%
}
%>
</select>
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
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
