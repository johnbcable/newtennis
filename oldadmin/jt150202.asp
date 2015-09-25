<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Junior Tournament - 15 June 2002");
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
					Winners 2002 Photo Gallery
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
					<td class="tdfont" align="left" bgcolor="#c0c0c0" colspan="2">
						&nbsp;&nbsp;&nbsp;
						<b>
							<u>
								BOYS
							</u>
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						To Year 6 - Davis Cup
						<br>
						<br>
						<a href="show_pic.asp?photo=by6dc2002&caption=Boys to Year 6 Davis Cup Winners 2002: Michael Bransbury and Oliver Davies">
							<img src="images/tn_by6dc2002.jpg" width="150" height="112" alt="Boys to Year 6 Davis Cup" align="center">
						</a>
						<br>
						Winner: Michael Bransbury
						<br>
						Runner Up: Oliver Davies
					</td>
					<td class="tdfont" width="210">
						To Year 6 - Open
						<br>
						<br>
						<a href="show_pic.asp?photo=by6o2002&caption=Boys to Year 6 Open Winners 2002: Alex Hollway and Jon Hollway">
							<img src="images/tn_by6o2002.jpg" width="150" height="112" alt="Boys to Year 6 Open" align="center">
						</a>
						<br>
						Winner: Alex Hollway
						<br>
						Runner Up: Jon Hollway
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						To Year 7 and above - Open
						<br>
						<br>
						<a href="show_pic.asp?photo=by7o2002&caption=Boys Year 7 and Above Open Winners 2002: Andy Williamson and Simon Lynn">
							<img src="images/tn_by7o2002.jpg" width="150" height="112" alt="Boys Year 7 and above Open">
						</a>
						<br>
						Winner: Andrew Williamson
						<br>
						Runner Up: Simon Lynn
					</td>
					<td class="tdfont" width="210">
						To Year 7 and above - Plate
						<br>
						<br>
						<a href="show_pic.asp?photo=by7p2002&caption=Boys Year 7 and above - Plate Winners 2002: Harry Finch and Tom Minton">
							<img src="images/tn_by7p2002.jpg" width="150" height="112" alt="Boys Year 7 and above - Plate">
						</a>
						<br>
						Winner: Harry Finch
						<br>
						Runner Up: Tom Minton
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" bgcolor="#c0c0c0" colspan="2">
						&nbsp;&nbsp;&nbsp;
						<b>
							<u>
								GIRLS
							</u>
						</b>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210">
						To Year 6 - Open
						<br>
						<br>
						<a href="show_pic.asp?photo=gy6o2002&caption=Girls to Year 6 Open Winners 2002: Emily Hodge and Sophie Cable">
							<img src="images/tn_gy6o2002.jpg" width="150" height="112" alt="Girls to Year 6 Open" align="center">
						</a>
						<br>
						Winner: Emily Hodge
						<br>
						Runner Up: Sophie Cable
					</td>
					<td class="tdfont" width="210">
						To Year 7 and above - Open
						<br>
						<br>
						<a href="show_pic.asp?photo=gy7o2002&caption=Girls Year 7 and above Open Winners 2002: Rachel Finch and Lara Bates">
							<img src="images/tn_gy7o2002.jpg" width="150" height="112" alt="Girls Year 7 and above Open">
						</a>
						<br>
						Winner: Rachel Finch
						<br>
						Runner Up: Lara Bates
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
