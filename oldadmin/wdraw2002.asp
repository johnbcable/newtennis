<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Wimbledon Draw - 2002");
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
		<h2>Lucky Winners</h2>
		<br>
		This year, Hampton-In-Arden Tennis Club will receive 12 pairs of tickets for Wimbledon matches.<br>
		<br>Matches will include: Men's Final , 5 pairs for No. 1 court (various dates) and 1 pair for No. 2 court.<br>
<br>
		This years draw took place on&nbsp;<b> Play Tennis Day (May 4, 2002)</b>&nbsp;and the lucky winners are:<br>
<br>
<b>
Rosalia Eccleston<br>
John Cable<br>
Robert Bodfish<br>
David Margetts<br>
Chester Barnes<br>
Sarah Wells<br>
Steve Ray<br>
Sandy Wasse<br>
Teresa Mason<br>
Steve Tyson<br>
Steve or Sarah White (whichever one entered!), and<br>
Malcolm Brumwell<br>
</b>
<br>
Malcolm will be in touch shortly about which tickets, how to pay, what refreshment he likes (did I say THAT - shocking!) and other pertinent stuff about enjoying your day at the world's premier tennis tournament. Thanks once again to everyone for taking part - yes, including Malcom!
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
