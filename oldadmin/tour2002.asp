<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Club Tournaments");
// Now for any variables local to this page
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<A NAME="thetop">
	<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
		<tr>
			<comment>
				Column 1 reserved for navigation menu
			</comment>
			
			<comment>
				Content for each page placed into middle column
			</comment>
			<td>
				<h2>
					Tournaments for Summer 2002
				</h2>
				<br>
				<table  width="100%" border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td class="tdfont" >
							Hampton-In-Arden Tennis Club runs several internal club tournaments each year.
  					      The tournaments for 2002 are as follows:
							<br>
							<br>
							<ul type="disc">
								<li>	<a href="msgl2002.asp">Mens Singles</a>
								<li>	<a href="lsgl2002.asp">Ladies Singles</a>
								<li>	<a href="mdbl2002.asp">Mens Doubles</a>
								<li>	<a href="ldbl2002.asp">Ladies Doubles</a>
								<li>	<a href="mixd2002.asp">Mixed Doubles</a>
								<li>	<a href="mixp2002.asp">Mixed Doubles Plate</a>
								<li>	<a href="vets2002.asp">Veterans Doubles</a>
							</ul>
						</td>
					</tr>
				</table>
				<br>
			Click on one of the links above to see the draw for that tournament
				<br>
			</td>
			    
			<comment>
				Column 3 reserved for internal and external advertising
			</comment>
			    
			<!--#include file="adverts.asp" -->
			  
		</tr>
	</table>
	<br>
	<!--#include file="textnav.asp" -->
</BODY>
</HTML>
<%
%>






