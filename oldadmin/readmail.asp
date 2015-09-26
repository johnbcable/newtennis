<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Reading Email");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
Response.Redirect("http://webmail.hamptonsports.org.uk/");
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
<br>
	<h2>Reading My Email</h2>
<table  width="80%" border="1" cellspacing="2" cellpadding="5">
	<tr>
		<td>
			This facility is currently being tested and we hope to release it onto this site in the near future.
		</td>
	</tr>
</table>
<br>
<div align="center">
<img src="images/Construc.gif" width="69" height="69" alt="We're working on it - check back later">
</div>
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
