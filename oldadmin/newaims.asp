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
<font size="2" color="#000000" face="Verdana">
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
  <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <td>
    <comment>Content for each page placed into middle column</comment>
		<h2>Our Aims</h2><br>
<table  width="100%" border="1" cellspacing="2" cellpadding="5">
	<tr>
		<td class="tdfont" >
		<img src="images/ball1.gif" width="35" height="35" alt="">
		</td>
		<td class="tdfont" >
			to introduce our club as THE place for you to play tennis (of course!)
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
		<img src="images/ball1.gif" width="35" height="35" alt="">
		</td>
		<td class="tdfont" >
			to use the club and its web site to promote general tennis interest and awareness. We will do this by our own activities and by publicising what is going on elsewhere.
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
		<img src="images/ball1.gif" width="35" height="35" alt="">
		</td>
		<td class="tdfont" >
			to actively seek and encourage whole family participation in tennis at the club via our programme of activities and our fee structure.We neither wish you to feel unable to participate because there is no child provision nor if you feel that your adult interests will be swamped by youngsters.
		</td>
	</tr>
	<tr>
		<td class="tdfont" >
		<img src="images/ball1.gif" width="35" height="35" alt="">
		</td>
		<td class="tdfont" >
			 Hampton Tennis Club is active all year round : tennis is NOT just a summer game and we want you to share our all year enjoyment at the club.
		</td>
	</tr>
</table>
    </td>
    <comment>Column 3 reserved for internal and external advertising</comment>
    <!--#include file="adverts.asp" -->
  </tr>
</table>
</font>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>

