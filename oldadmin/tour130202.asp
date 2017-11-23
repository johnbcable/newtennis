<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Adult Tournament - 13 July 2002");
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
					Winners Photo Gallery
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
					<td class="tdfont" align="left" colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210" align="center">
						<b><u>Mens Singles</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=msgl2002w&caption=Mens Singles Champion 2002 - Tony Eccleston">
							<img src="images/tn_msgl2002w.jpg" width="150" height="112" alt="Mens Singles Champion 2002 - Tony Eccleston" align="center">
						</a>
						<br>
						Winner: Tony Eccleston
					</td>
					<td class="tdfont" width="210" align="center">
						<b><u>Ladies Singles</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=lsgl2002w&caption=Ladies Singles Champion 2002 - Jane Hodge">
							<img src="images/tn_lsgl2002w.jpg" width="150" height="112" alt="Ladies Singles Champion 2002 - Jane Hodge" align="center">
						</a>
						<br>
						Winner: Jane Hodge
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210" align="center">
						<b><u>Mens Singles Plate</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=mplt2002w&caption=Mens Singles Plate Champion 2002 - Simon Lynn">
							<img src="images/tn_mplt2002w.jpg" width="150" height="112" alt="Mens Singles Plate Champion 2002 - Simon Lynn">
						</a>
						<br>
						Winner: Simon Lynn
					</td>
					<td class="tdfont" width="210" align="center">
						<b><u>Ladies Singles Plate</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=lplt2002w&caption=Ladies Singles Plate Champion 2002 - Rachel Finch">
							<img src="images/tn_lplt2002w.jpg" width="150" height="112" alt="Ladies Singles Plate Champion 2002 - Rachel Finch">
						</a>
						<br>
						Winner: Rachel Finch
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="210" align="center">
						<b><u>Mixed Doubles</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=mixd2002w&caption=Mixed Doubles Champions 2002 - Bert Bodfish and Julie Williamson">
							<img src="images/tn_mixd2002w.jpg" width="150" height="112" alt="Mixed Doubles Champions 2002 - Bert Bodfish and Julie Williamson" align="center">
						</a>
						<br>
						Winners: Bert Bodfish &amp; Julie Williamson
					</td>
					<td class="tdfont" width="210" align="center">
						<b><u>Ladies Doubles</u></b>
						<br>
						<br>
						<a href="show_pic.asp?photo=ldbl2002w&caption=Ladies Doubles Champions 2002 - Kathy Hunt and Terri Mason">
							<img src="images/tn_ldbl2002w.jpg" width="150" height="112" alt="Ladies Doubles Champions 2002 - Kathy Hunt &amp; Terri Mason">
						</a>
						<br>
						Winners: Kathy Hunt &amp; Terri Mason
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" colspan="2" bgcolor="#c0c0c0">
						Profuse appologies to Graham Hollway and Chris Barker (who won both the Mens Doubles and the Mens Veterans titles) - we havent been given a picture to put up on the site. Sorry guys!
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="left" colspan="2">
						<hr>
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
