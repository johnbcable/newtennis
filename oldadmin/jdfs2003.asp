<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Juniors at the DFS Classic");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<h3>Juniors at the DFS Classic, 2003</h3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td class="tdfont" align=center>
		<img src="images/dfs2003.jpg" width="601" height="451" alt="Juniors at the DFS"><br>
<br>
As is normal, a group of juniors were able to go to the recent DFS Classic Ladies Tournament at the Priory Club in Edgbaston,
receive some valuable coaching tips from Warwickshire LTA staff and watch some superb grass-court tennis. <br>
<br>
The lucky
juniors this year were (from left to right): Bethan Martin, Zoe Hemington, Emily Hodge, Emily Cable, Maria Barnes and Simon Turpin

    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
