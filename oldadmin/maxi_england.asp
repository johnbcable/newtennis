<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("MAXI-Tennis Team Profile");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<<div id="content">
	<div id="mainContent">
		<h3><%= pagetitle %></h3>
		<div id="england_summary">
			<img  class="boxleft" src="images/englishflag.gif" width="250" height="151" alt="England team flag" style="margin-right: 2em;"/>
			<p>
				<span class="bigblueheading">England</span>
				<ul>
					<li>Team colours are predominantly white. </li>
					<li>Purple nasty for 2008 is Mark Joannides. </li>
				</ul>
			</p>
		</div>
		<p>
			<table id="maxitenniscaptaindetails">
				<caption>Current Captains - 2008 Season</caption>
				<thead>
					<tr>
						<th>Name</th>
						<th>Contact Details</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Sandy Wasse</td>
						<td>
							148 Old Station Road<br />
							Hampton-In-Arden<br />
							Solihull<br />
							B92 0HF<br />
							<br />
							Telephone:  01675 442184 (07958 569290)<br />
							Email:      sandywasse@hotmail.com
						</td>
					</tr>
					<tr>
						<td>Sarah White</td>
						<td>
							4 Bellemere Road<br />
							Hampton-In-Arden<br />
							Solihull<br />
							B92 0AP<br />
							<br />
							Telephone:  01675 442817 (07748 082151)<br />
							Email:      sarah.cooper@heartofengland.nhs.uk
						</td>
					</tr>								
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>
		</p>
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
		<div id="maxitennisteambanner" class="centered">
			<img src="images/maxitennisteambanner.gif" width="400" height="43" alt="England,France,Ireland,Italy,Scotland and Wales" />
		</div>
<!--#include file="textnav.asp" -->
</div>
</div>
</body>
</html>
<%
%>
