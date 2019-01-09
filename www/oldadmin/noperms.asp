<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Member Access");
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
	<font size="4" color="#000000" face="Verdana">
	<b>
		Your membership web access level doesnt allow you to do this.<br><br>
		Click on a button on the left to go elsewhere in the site.
	</b>
	</font>
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




