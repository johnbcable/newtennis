<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("North Warwickshire Doubles - Rules");
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
	<div id="rules" class="borderboth">
		<h3><%= pagetitle %></h3>
		<ol>
			<li>Each team comprises 1 pair (the players may be changed) & will play approx. 5 matches in sections.</li>
			<li>All junior members of your club are eligible to play.</li>
			<li>A club may enter as many teams as they wish per event.</li>
			<li>A player may only play in one team within an age group, but may represent different teams in different age groups for the same club or another club if eligible. Players may also play in both boys/girls doubles and mixed doubles teams for the same club or another club if eligible.</li>
			<li>Could you please show your players names & ratings on the entry form. This is very important as seeding of teams based on rating or alternatively in the event of many entries being received the events being split up by rating to provide more even competition for players. Also it will ensure a player is not identified by more than one club for the same event before fixtures are arranged.</li>
			<li>Matches will be best of 3 sets - tie break at 6-6 in all 3 sets.Third set could be 1 match tie break by mutual consent. All section matches to be completed by a notified date in July.</li>
			<li>Section winners & runners up will progress to a knockout stage with finals probably during September. Winners of North Warwicks leagues premier divisions will play the winners of South Warwicks leagues, if they operate a similar league, probably during October.
			<li>Considerable problems are caused to organisers and players when clubs seek to rearrange matches. Matches may only be rearranged by mutual consent and this should only be done in special circumstances. All clubs must name a parent of one of the players who will play regularly as contact for each team on the attached form. The parent will be able to, deal with requests for rearrangements personally. In this way speedy decisions can be made and junior organisers will not be inconvenienced unduly.</li>
		</ol>
	</div>
	<p>
		If you wish to enter please return the form to M Sidwell in the early part of January. Entry fees per team will be charged - see latest information for current prices.
		An evening meeting to arrange the dates of matches will usually be held during January commencing at 6.30pm at Edgbaston Archery &amp; Lts,14a Westbourne Rd, Edgbaston, B'ham. All clubs entering teams must send a representative to this meeting who must stay and arrange dates of all matches. The representative should have familiarised themselves with players availability and court availability beforehand to attempt to minimise rearrangements.
		Your cooperation in this is requested as considerable difficulties have arisen in the past from clubs failing to attend or leaving without arranging matches.
	</p>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="nwdoublesinfo.asp">General information about the North Warwickshire Doubles League</a></li>
				<li><a href="nwcontactguide.asp">Guide for club contacts for this league</a></li>
				<li><a href="nwwinners.asp">Past winners and runners up</a></li>
				<li><a href="nwdblsleague.asp">Current club contacts and provisional fixtures</a></li>
			</ul>
		</div>	
	</div>
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="jnewspanel.asp" -->
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

