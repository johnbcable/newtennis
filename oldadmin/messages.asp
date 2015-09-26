<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member-to-Member Communication");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
	 <!--#include file="tickertape.asp" -->
<br>
	<h2>Members Communication Area</h2>
<table  width="80%" border="1" cellspacing="2" cellpadding="5">
	<tr>
		<td >
			<a href="article.asp"><img src="images/article.gif" width="35" height="35" alt="Submit a news item"></a>
		</td>
		<td >
			submit a news item for inclusion on the site
		</td>
	</tr>
	<tr>
		<td >
			<a href="sendmail.asp"><img src="images/email.gif" width="35" height="35" alt="Send Email"></a>
		</td>
		<td >
			send Email
		</td>
	</tr>
	<tr>
		<td >
			<a href="readmail.asp"><img src="images/openmail.gif" width="35" height="35" alt="Check Incoming Email"></a>
		</td>
		<td >
			here you can check your incoming Email basket
		</td>
	</tr>
	<tr>
		<td >
			<a href="postmess.asp"><img src="images/postmess.gif" width="35" height="35" alt="Leave a message"></a>
		</td>
		<td >
			 here you can leave a message on the site for another club member to pick up next time they visit
		</td>
	</tr>
</table>
</font>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
