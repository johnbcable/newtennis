<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mini-Tennis Section");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
	<h3>Welcome to the Mini-Tennis Area</h3>
	<table>
		<tr>
			<td width="75%">
			<!--#include file="minitennismap.htm" -->
		</td>
		<td width="24%">
			<IMG SRC="images/minitennis.gif" width="121" height="50" ALT="LTA Mini-Tennis Logo">
			<br />
			<br />
			For further information, visit either of the following links on the official LTA web site:<br /><br />
			<a HREF="http://www.lta.org.uk/PlayAndCompete/StartToPlay/Under10s/MiniTennis/">Starting to play</a><br />
			<a HREF="http://www.lta.org.uk/Community/Clubs/CoachingProgrammes/ArielMiniTennisProgramme/">Coaching programmes</a><br />			
			<br />
			Confused about where to go after Mini-Tennis? Then check out our information about the 
			<a HREF="juniors/minitennis.html">National Competition Framework</a> for further details.
		</td>
	</tr>
	<TR>
		<TD class="tdfont" colspan=2>
			<br />
			Click on the 'think bubbles' in the picture above for information about
			what mini-tennis is, how Hampton-In-Arden Tennis Club fits in with this,what mini-tennis activities
			your club engages in and how you and your child can get involved.
			<br />
		</TD>
	</TR>
</table>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">

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
