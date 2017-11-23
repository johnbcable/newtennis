
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="userfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var debugging = false; // set to true if debug output reqd
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Membership Renewals Process");
// Now for any variables local to this page
var v_membername = new String("");
var v_memberid;
var v_acclevel;
var v_uniqueref;
var v_id;
var v_pin;
var dbconnect=Application("hamptonsportsdb"); 
var ConnObj, RS, sqlString, SQL1, SQL2, SQL3, SQL4;
var badSignIn=true;
var errMess;
var myusername, myaddress;
var refurl, onwardurl;
var onlinebookingid, onlinebookingpin;
var debugging = current_debug_status();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
v_uniqueref = -1;
v_memberid=new String("");
v_membername=new String("");
v_acclevel=0;
v_id = 0;
v_pin = 0;

//  Get back uniqueref if this user is signed-in
v_uniqueref = getUserCode();


// If we have a signed-in user, get back their User ID and PIN

ConnObj = Server.CreateObject("ADODB.connection");
ConnObj.Open(dbconnect);
RS = Server.CreateObject("ADODB.RecordSet");
SQL1 = new String("SELECT onlinebookingid, onlinebookingpin FROM members WHERE uniqueref = "+v_uniqueref);
RS = ConnObj.Execute(SQL1);
while (! RS.EOF) {
	v_id = new String(RS("onlinebookingid")).toString();
	v_pin = new String(RS("onlinebookingpin")).toString();
	RS.MoveNext();
}

// End of page start up coding

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Book A Court</title>
</head>
<body onload="submitform()">

	<div id="bookingdiv">
		<form id="bookingform" name="bookingform" method="post" action="https://ebookingonline.net/box/box3.php?id=29">
			<input type="hidden" name="user" value="<%= v_id %>"/>
			<input type="hidden" name="password" value="<%= v_pin %>"/>
			<input name="login_submitted" type="hidden" value="TRUE" />
			<!-- <input type="submit"/> -->
<!-- 			
				<a href="javascript: bookingform.submit();" style="display:block; width: 95%; margin: 0 auto;">Book a Tennis Court</a>

 -->
 		</form>
	</div>

	<script>
	function submitform() {

		document.bookingform.submit();

	}
	</script> 
</body>
</html>
<%
%>

