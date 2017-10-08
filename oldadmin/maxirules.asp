<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis - Rules");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>MAXI-Tennis <b>Rules 2011</b></h1>
		<div id="maxitennisteambanner">
			<p>
				Click on a flag (below) to see who is in this team 
			</p>
			<!--#include file="maxitennisflags.htm" -->	
		</div>
		<p style="clear:both;">&nbsp;</p>
		<h2>MAXI-Tennis Rules</h2>
		<p>
			The current rules for MAXI-Tennis at Hampton-In-Arden Tennis Club are shown below along with the responsibilities
			for each captain (home and away teams).
		</p>
		<div class="borderboth">
			<div id="matchrules" class="borderbottom">
				<h3>Rules for Each Match</h3>
				<p class="leftindent">
					<ol>
						<li>Games will be played on a tie break basis until the winning player reaches ten points</li>
						<li>Singles games played between players from different pools the match start with a handicap of -2 +2 (or -4 +4 if purple nasty involved)</li>
						<li>Singles games played between players from the same pools the match start with no handicap (or -2 +2 if purple nasty involved)</li>
						<li>Doubles games where players are from the intended pools the match start with no handicap (or -2 +2 if purple nasty involved)</li>
						<li>Doubles games where players are NOT from the intended pools start with a handicap of -1 +1</li>
						<li>The winner of the toss shall have the choice of ends or whether to serve first</li>
						<li>Players shall change ends every six points</li>
						<li>The scores from each match e.g. 10-9 shall be entered onto the score sheet for the fixture</li>
						<li>The winning team shall be the team with most points won over the eighteen games. If both teams have the same number of points in total the winning team will be the team winning the most games</li>
						<li>The home team is responsible for entertaining the opposition after the match.</li>
					</ol>
				</p>
			</div>
			<div id="tournamentrules">
				<h3>Rules for the Tournament</h3>
				<p>
					Fixtures to be played mainly on the same weekend as the corresponding 2010 Six Nations rugby games as shown below:
					<br />
					<table id="maxitennisfixtures">
						<caption>MAXI-Tennis Fixtures for 2011</caption>
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>1.00pm to 2.30pm</th>
								<th>2.40pm to 4.10pm</th>
								<th>4.20pm to 5.50pm</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Sunday 6 February</td>
								<td>Wales v England</td>
								<td>Italy v Ireland</td>
								<td>France v Scotland</td>
							</tr>
							<tr>
								<td>Sunday 13 February</td>
								<td>England v Italy</td>
								<td>Scotland v Wales</td>
								<td>Ireland v France</td>
							</tr>							
							<tr>
								<td>Sunday 20 February</td>
								<td colspan="3" class="centered"><span class="bluetext">------------------- Half Term - No Matches -------------------</span></td>
							</tr>						
							<tr>
								<td>Sunday 27 February</td>
								<td colspan="3" class="centered"><span class="bluetext">------------------- Half Term - No Matches -------------------</span></td>
							</tr>	
							<tr>
								<td>Sunday 6 March</td>
								<td>Italy v Wales</td>
								<td>England v France</td>
								<td>Scotland v Ireland</td>
							</tr>							
							<tr>
								<td>Sunday 13 March</td>
								<td>Italy v France</td>
								<td>Wales v Ireland</td>
								<td>England v Scotland</td>
							</tr>							  
							<tr>
								<td>Sunday 20 March</td>
								<td>Scotland v Italy</td>
								<td>Ireland v England</td>
								<td>France v Wales</td>
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
				<p>
					2 points for a win, 1 point for a draw.  Positions in the event of a tie to be determined by results between the teams.	
				</p>
				<p>					
					The final will take place as follows:
					<ul>
						<li>2.40pm to 4.10pm, Sunday April 10<sup>th</sup>&nbsp;1st place v 2nd place</li>
					</ul>
				</p>
				<p>
					Teams to play in country colours.  If there is a colour clash (Scotland, France and Italy) home team plays in white.
				</p>
				<p>
					Postponement of fixtures is discouraged as squads should be big enough for all teams to field enough players.  
					If it is unavoidable then the postponing captain is responsible for rearranging an appropriate time convenient for the other team 
					and for ensuring the courts are booked in the booking sheets held in the clubhouse.  If no time is convenient to the opposition the 
					match shall be conceded by a score of 160 to 140.	
				</p>
				<p>
					Captains should select 1 player from each of the 6 pools.  If availability problems dictate, then a player from Pool A may represent 
					Pool B and vice versa, a player from Pool C may represent Pool D and vice versa and a player from Pool E may represent Pool F and vice versa.  
					If this happens then the handicaps should be adjusted. A player from Pool E may represent Pool B. Loans of players between consenting captains is not a problem in times of player shortages.		
				</p>
				<p>
					<b>Responsibilties of the Home Captain</b><br />
					<ul>
						<li>&nbsp;-&nbsp;Ensure that the away team is properly entertained after the match.</li>
					</ul>
				</p>
				<p>
					<b>Responsibilties of the Away Captain</b><br />
					<ul>
						<li>&nbsp;-&nbsp;Confirm with the opposition captain that the match will be played.</li>									
						<li>&nbsp;-&nbsp;<a href="maxiscores.xls">Download score sheet</a> from the Hampton Tennis Club web site and complete the order of play.</li>									
						<li>&nbsp;-&nbsp;Email completed score sheet to <a href="mailto:support@hamptontennis.org.uk">John Cable</a> or return to 124 Old Station Road.</li>
					</ul>
				</p>
				<p>
					<b>Other Responsibilities</b>
					<br />
					<ul>
						<li>&nbsp;-&nbsp;Geoff Redfern to ensure that the home captain of the first match has three tubes of new balls.</li>
					</ul>
				</p>
			</div>	
		</div>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="maxileague2011.asp">Current Maxi-Tennis league table</a></li>
				<li><a href="maxiresults2011.asp">Maxi-Tennis match results for current tournament</a></li>
				<li><a href="maxiscores.xls">Download blank score sheet</a></li>
			</ul>
		</div>		
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>
