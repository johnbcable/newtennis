<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Frequently Asked Questions");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Frequently Asked Questions</h3>
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <td>
			As with many organisations, we are often asked many of the same questions. We have tried to do our best with
        some fo the more obvious ones in our 'Welcome Pack' (sent to new members), but we also intend this page to 
	     contain some of the more popular questions concerning tennis at Hampton-In-Arden Tennis Club - and their answers!
        <br><br>
        <p align=center>
        	<img src="images/construc2.gif" width="100" height="105" alt="We're working on it - please check later">
		  </p>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
