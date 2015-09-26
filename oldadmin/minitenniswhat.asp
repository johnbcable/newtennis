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
		<h3>So, what IS Mini-Tennis?</h3>
<table>
	<tr>
		<td width="75%">
			Mini-Tennis was an initiative launched by the Lawn Tennis Association (LTA) on a national basis in the UK. This has
			now been absorbed under the umbrella of the <a href="juniors/minitennis.html" alt="National Competition Framework">National 
			Competition Framework</a>&nbsp;from September 2007. It aims to provide a structure and progression for children to 
			begin and continue to play tennis - 'cos they enjoy it!<br /><br />
			Mini-Tennis is definitely NOT just about coaching - a key component of its approach is introducing children to
			competition. Techniques learned in club coaching sessions are put into practice as children take part in internal
			club tournaments and inter-club competitions appropriate for their Mini-Tennis skills. 
			<br />
			There are three age bands of children who can participate in Mini-Tennis. For children, sometimes even a one-year age
			difference can be huge in terms of playing ability and body development. Such 'unbalanced' competitions can dampen
			the enthusiasm of otherwise promising players. To help compensate for this, Mini-Tennis groups children into 3 age-bands
			(red, orange and green) and children work within the framework appropriate for their age (see below).
			<br /><br />
		</td>
		<td width="24%">
			<IMG SRC="images/minitennis.gif" width="121" height="50" ALT="LTA Mini-Tennis Logo">
			<br />
			<br />
			For further information, visit either of the following links on the official LTA web site:<br /><br />
			<a HREF="http://www.lta.org.uk/PlayAndCompete/StartToPlay/Under10s/MiniTennis/">Starting to play</a><br />
			<a HREF="http://www.lta.org.uk/Community/Clubs/CoachingProgrammes/ArielMiniTennisProgramme/">Coaching programmes</a><br />			
			<br />
			<br />
		</td>
	</tr>
</table>
<table  width=650 border="0" cellspacing="2" cellpadding="5">
	<tr>
		<td width=60>
			<font size="4" color="red"><b>RED</b></font>
		</td>
		<td class="tdfont" align=left>
			Red Mini-Tennis caters for the youngest group of children. For 2003, this means those children whose
			birthdays lie in 1995 or later. In this group, matches are played on half-sized courts using sponge balls
			(which do not hurt when they hit you, and) which travel far slower than adult match-play tennis balls. 
			The special rackets are appropriate for the size of the child. Nets are generally lower than standard nets and aim 
			to be at a height that most children in this band can comfortably see over.
			<hr>
		</td>
	</tr>
	<tr>
		<td align=center width=60>
			<font size="4" color=#ff8000><b>ORANGE</b></font>
		</td>
		<td class="tdfont" align=left>
			Orange Mini-Tennis caters for the next age range on from Mini-Tennis Red. For 2003, this means those children whose
			birthdays lie in 1994 or later. In this group, matches are played on three-quarter-sized courts using bright orange balls
			which are like a soft tennis ball and travel faster than the Mini-Tennis Red sponge balls (so you'll need to speed up a bit!). 
			Rackets, too, are getting bigger but are still not quite adult size.
			<hr>
		</td>
	</tr>
	<tr>
		<td align=center width=60>
			<font size="4" color=#509344><b>GREEN</b></font>
		</td>
		<td align=left class="tdfont">
			Green Mini-Tennis caters for the final Mini-Tennis age range before children move on up the <a href="juniors/minitennis.html">National Competition Framework</a>. 
			For 2003, this means those children whose birthdays lie in 1993 or later. In this group, matches are played on full-sized courts using 
			bright green tennis balls (which are only slightly softer than adult match-play balls), nearly full-size rackets and regular height/width tennis nets.
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
