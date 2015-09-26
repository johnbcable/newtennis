<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Mini-Tennis: Red Team Champions!!");
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
			<br>
			The Mini-Tennis Red Team for this season were (in alphabetical order):
			<div align=center>
			<br>
			<b>Emily Cable, Oliver Davies*, Ronan Jones, Charlotte Ray and Jordan Salmon</b>
			<br>
			</div>
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
						<a href="show_pic.asp?photo=rmt2002a&caption=The Winning Team">
							<img src="images/tn_rmt2002a.jpg" alt="The grinning winners!" align="center">
						</a>
					</td>
					<td class="tdfont" align="center" valign="center">
						They know they've won ... and <b>aren't</b> they pleased about it!
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						<a href="show_pic.asp?photo=rmt2002b&caption=Formal Team Photo">
							<img src="images/tn_rmt2002b.jpg" alt="Steve Ray and Team pose for the camera" align="center">
						</a>
					</td>
					<td class="tdfont" align="center" valign="center">
						Posing for the cameras ..  with some guy in a tracksuit!?
					</td>
				</tr>
			</table>
			<br>
			*&nbsp;<b>N.B.</b>&nbsp;Oliver Davies was also a vital member of the team throughout the season 
			but could not play in the final match and so missed out on the photos above.
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







