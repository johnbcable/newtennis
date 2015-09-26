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
<H3>
	So, what is our club doing with Mini-Tennis?
</H3>
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
	<tr>
		<td class="tdfont" width=500 nowrap>
			Hampton-In-Arden Tennis Club provides both Mini-Tennis coaching and the 
			opportunity to take skills learned in coaching sessions into competitive Mini-Tennis matches.
		</td>
		<td bgcolor=#fafcb6 align=center class=tdfont>
			<IMG SRC="images/minitennis.gif" width="121" height="50" ALT="LTA Mini-Tennis Logo">
			<br />
			<br />
			For further information, visit either of the following links on the official LTA web site:<br /><br />
			<a HREF="http://www.lta.org.uk/PlayAndCompete/StartToPlay/Under10s/MiniTennis/">Starting to play</a><br />
			<a HREF="http://www.lta.org.uk/Community/Clubs/CoachingProgrammes/ArielMiniTennisProgramme/">Coaching programmes</a><br />			
			<br />
			<br />
			Confused about where to go after Mini-Tennis? Then check out our information about the 
			<a HREF="juniors/minitennis.html">National Competition Framework</a> for further details.
		</td>
	</tr>
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
