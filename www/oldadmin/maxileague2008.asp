<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<div id="maxileaguetable">
		<table>
			<caption>&nbsp;</caption>
			<thead>
				<tr>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<!--#include file="maxi2008league.htm" -->
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
		<p class="centered">
			The basis of the league order is as follows: firstly, number of league points, <br>
			then by the number of games won, and finally by total tennis points.
		</p>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
				<li><a href="maxiresults2008.asp">Maxi-Tennis match results for current tournament</a></li>
				<li><a href="maxiscores.xls">Download blank score sheet</a></li>
			</ul>
		</div>		
	</div>
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
</body>
</html>
<%
%>
