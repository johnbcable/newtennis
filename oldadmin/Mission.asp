<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Our Aims and Objectives");
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
		<h2>Our Aims</h2><br>
			We are working on the information for this page and will make it available as soon as we can.<br><br>
			<Div align="center"><img src="images/Construc.gif" width="69" height="69" alt="Working on it!"></div>
    <comment>Column 3 reserved for sponsors/adverts</comment>
    <!--#include file="adverts.asp" -->
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>

