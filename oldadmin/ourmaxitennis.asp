<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis Section");
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
		<h3>So, what <u>is</u> our club doing with MAXI-Tennis?</h3>
		<p>
			MAXI-Tennis arrived at 
            Hampton-In-Arden Tennis Club during the 2004/5 seasons as a series 
            of one-off (primarily social) team events designed specifically to 
            encourage everyone to get and play some tennis! Feedback from those 
            events was very encouraging and so 2006 saw the return of the 
            MAXI-Tennis format with more teams getting involved than before.
		</p>
		<p>
			All full paying adult members of the club together with top junior members (as 
            recommended by our coach, Ian Poole) are eligible to play. All 
            eligible members have been allocated each to one of the 6-Nations 
            rugby playing countries and fixtures between these tennis 'country' 
            teams are usually timetabled to run in parallel with the official 
            6-Nations rugby matches. 
		</p>
		<p>
			Each fixture between two of the 
            MAXI-Tennis teams last for roughly 90 minutes during which each team 
            member will take part in 2 doubles games and 2 singles games. Each 
            game is won by the first player (or pair in a doubles match) to 
            reach 10 points using tennis tie-break format. More details of how 
            each MAXI-Tennis event runs can be found <a href="maxitennisguide.asp">here</a>
		</p>
		<p>
			Fancy joining in? For further information, click&nbsp;<a href="joiningmaxitennis.asp">here</a>
		</p>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>
