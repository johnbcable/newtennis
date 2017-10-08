<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Easter Fun and Games!");
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
			<div align="center">
			<img src="images/duck.gif" width="245" height="190" alt="">
<br>	
<font size="4" face="Comic Sans">
<b>EASTER FUN AND GAMES!</b><br><br>
<b>Fun and Games (inc Easter Egg Hunt)</b><br>
Friday 5 April, 10 - 12 noon<br>
4 - 7 year olds   £4<br>
<br>
<b>Easter Tournament, Saturday 6 April</b><br>
11 years and under, 10 - 12 noon £3<br>
16 years and under, 12 - 2 pm £3<br>
<br>
<b>Pay and Play Sessions, Friday 12 April</b><br>
Mini Transition, 4.15 - 4.45 £2<br>
Mini Tennis 1, 4.45 - 5.30 £2 <br>
Mini Tennis 2, 5.30 - 6.15 £2<br>
Introduction Tennis, 6.15 - 7.00 £2<br>
<br>
<b>Pay and Play Sessions, Saturday 13 April</b><br>
Beginners (Davis Cup), 9.30 - 10.15 £2<br>
Advanced (Wimbledon), 10.15 - 11.15 £3<br>
Top Squad, 11.15 - 12.15 £3<br>
</font>
<br>
Please contact Jane Hodge for further details on 01675 443197
<br>
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
