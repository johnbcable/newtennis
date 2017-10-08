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
<h3>Junior Art Competition - Results</h3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
  <tr>
    <td class=tdfont>
		<IMG SRC="/images/junart.gif" width="150" height="137" ALT="" border=0 align=left alt="Junior Art Competition">
		<br>Winners of the recent Junior Art Competiton are as follows:<br><br>
<table  width=450 border="1" cellspacing="2" cellpadding="5">
	<tr>
		<td class=tdfont>
			Joint Winners
		</td>
		<td  class=tdfont>
			<b>Barnaby Jones</b> and <b><a href="jartmb2003.asp">Maria Barnes</a></b>
		</td>
	</tr>
	<tr>
		<td  class=tdfont>
			Runner-Up
		</td>
		<td  class=tdfont>
			<b>Harriet Ryland</b>
		</td>
	</tr>
</table>
<br><br>
Barnaby and Maria each receive Junior membership to the LTA which includes:<br>
					<div align=left>
						<ul>
							<li>
							FREE T-Shirt
							<li>
							FREE Autograph Book
							<li>
							Membership Card
							<li>
							Membership Pack with tennis info
							<li>
							Monthly Newsletter
							<li>
							Postermag 4 times a year
							<li>
							LTA Player Rating
							<li>
							Chance to get FREE tickets to selected LTA tournaments
							<li>
							Discounts
							<li>
							More competitions and prizes to win!
						</ul>
					</div>
<br><br>
Harriet receives a funky tennis cap!
<br><br>
Well done to all entrants. Click on one of the names above to see their submissions. More artwork will be displayed on the site over the coming weeks.
    </td>
  </tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>






