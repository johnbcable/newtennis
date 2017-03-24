<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Mini-Tennis Tournament - 29 June 2002");
// Now for any variables local to this page
var debugging=false;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<comment>
			Column 1 reserved for navigation menu
		</comment>
		
		<td>
			<comment>
				Content for each page placed into middle column
			</comment>
			<h3>
				<b>
					Photo Gallery
				</b>
			</h3>
			<table  width="440" border="0" cellspacing="2" cellpadding="5">
				<tr>
					<td class="tdfont" align="left" colspan="2">
						Click on any of the photographs below to see a bigger image
						<br>
						<br>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						<a href="show_pic.asp?photo=mt280202p&caption=The Mini-Tennis Competitors">
							<img src="images/tn_mt280202p.jpg" width="150" height="112" alt="The starting line-up!" align="center">
						</a>
					</td>
					<td class="tdfont" align="center" valign="center">
						We who are about to compete, salute you!
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						<a href="show_pic.asp?photo=mt280202b&caption=The Mini-Tennis tournament in full swing">
							<img src="images/tn_mt280202b.jpg" width="150" height="112" alt="Friendly competition" align="center">
						</a>
					</td>
					<td class="tdfont" align="center" valign="center">
						In the heat of competition (and the June sun!)
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						<a href="show_pic.asp?photo=mt280202a&caption=Mini-Tennis Winners: Emily Hodge and Maria Barnes">
							<img src="images/tn_mt280202a.jpg" width="150" height="112" alt="Mini-Tennis Winners">
						</a>
					</td>
					<td class="tdfont" align="center" valign="center">
						The eventual winners
						<br>
						Winner: Emily Hodge
						<br>
						Runner Up: Maria Barnes
					</td>
				</tr>
			</table>
		</td>
		<comment>
			Column 3 reserved for internal and external advertising
		</comment>
		<!--#include file="adverts.asp" -->
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
