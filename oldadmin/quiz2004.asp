<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("2004 Spring Quiz");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td>
<table border="0" cellspacing="2" cellpadding="5" width="567">
	<tr>
		<td align="center" valign="center" width="95">
			<img border="0" src="images/quiz1.gif">
		</td>
		<td align="center" valign="center">
            <p><font color="#FF0000" size="6"><u>Tennis Section Quiz Night</u></font></p>
            <p><b><u><font size="5" color="#0000FF">on Saturday 24th April</font></u></b></p>
            <p><u><font size="5" color="#0000FF"><b>at the Sports Club from 7:30 
            pm</b></font></u><b><font color="#0000ff" size="6"><br></font></b><br>
            You may enter in teams of 4 - 6 people. The cost is <b>£7.50</b> per 
            person including a finger buffet served during the evening. Proceeds 
            from the quiz will go towards the tennis court refurbishment.</p>
            <p>All teams must be registered in advance!</p>
            <p>Contact <b>Sandie Wasse</b> on <b>01675 442184</b><br><b>
            <font color="#FF0000" size="5">Everyone is welcome!</font></b></p>
        </td>
	</tr>
</table>
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
