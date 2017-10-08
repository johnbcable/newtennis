<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Junior Art Competition");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junhead.asp" -->
<h3>Junior Art Competition - Maria Barnes (Joint Winner)</h3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td class="tdfont" align=center>
		<img src="images/jartwinner.jpg">
		<br>
		<br>
		Maria Barnes' winning entry is shown above. Drawing on images of real life tennis players (guess who) and from 
		other LTA-inspired logo material, Maria has created a 'collage' type symetrical display full of colour and 
		life. Well done, Maria.
		<br>
		<br>
		P.S. Keep an eye on the Junior section of the web site - we will be using some of the artwork from
		the competition to perk the pages up a bit!
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>





