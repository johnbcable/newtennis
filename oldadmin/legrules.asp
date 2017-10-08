<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Rules of the Coventry and District Lawn Tennis League");
// Now for any variables local to this page
var debugging=false;
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
		<h1>Playing:&nbsp;<b>League Rules</b></h1>
		<p>
			Hampton-in-Arden Tennis Club has entered 4 mens and 3 ladies teams into the Coventry &amp; District Lawn Tennis League for 2009. The rules of the 
			league are to be found in the handboo (issued to league team captains) and are summarised below:
		</p>
		<h2>League Rules 2009</h2>
		<ol>
			<li>The League shall be named the Coventry &amp; District Lawn Tennis League.</li>
			<li>Membership of the League is open to all Tennis Clubs in Coventry and District, who are affiliated to the W.L.T.A., subject to the approval of the Committee.</li>
			<li>The Annual Subscription is &pound;7.50 for each team entered in the League and this Annual Subscription may be reviewed at any Annual General Meeting.</li>
			<li>The Annual Subscription must accompany the entry of teams for the next season and is not returnable if teams are withdrawn. Any clubs withdrawing a registered team or altering their match night after 1st January following the A.G.M. will be fined. The amount of the fine will be fixed by the committee and notified to the club not less than 14 days before the A.G.M.</li>
			<li>All Clubs not represented at the A.G.M. will be fined. The amount of the fine will be fixed by the Committee and notified to all Clubs not less than fourteen days before the A.G.M.</li>
			<li>The League shall elect a President at the Annual General Meeting.</li>
			<li>The League shall be governed by a Committee comprising a Chairman, General Secretary, Hon.Treasurer and eight ordinary members of the Committee,who shall be elected annually.</li>
			<li>Election to the Committee shall be by Nomination Form and Ballot. Each Club may submit nominations for the Presiden tial and ex-officio positions and for one Committee vacancy.</li>
			<li>The General Secretary shall send approved Nomination Forms to all Clubs not less than six weeks before the Annual General Meeting, which must be returned to the General Secretary within fourteen days of receipt. The General Secretary shall send a full list of nominations to all Clubs not less than fourteen days before the Annual General Meeting.</li>
			<li>Any member of the League Clubs may attend the Annual General Meeting and contribute to discussion, but each Club shall have one vote only for each team entered in the League in the previous season, with the exception that in voting on any matter which, based on the Committee's decision, relates solely to the Men's Divisions, each Club shall have one vote for each Mens Team entered in the League in the previous season, or relates solely to the Ladies Divisions, each Club shall have one vote for each Ladies Team entered in the League in the previous season.</li>
			<li>The League shall consist of one or more divisions playing men's doubles and one or more divisions playing ladies doubles. The divisions will consist of not more than eight teams. Each team will play all the other teams in the same division twice during the season. At the conclusion of each season, the top two teams in each division will be promoted to the next higher division and the bottom two teams in each division will be relegated to the next lower division.</li></li>
			<li>Notwithstanding the foregoing, promotion shall not take place if it would result in more than two teams from any one club playing in the top division of the ladies or men's leagues. In that situation, the third placed team will be promoted to the top division.</li>
			<li>In the event of the withdrawal of a team after the commencement of the season, a Club which has more than one team in the League must withdraw the lowest placed team, with the fixtures of any higher placed team being completed by the available and registered players of that Club.</li>
			<li>The Committee shall arrange all fixtures, the Secretary shall send a fixture list to each Club not later than 1st April.</li>
			<li>All matches must be played at the Ground Location shown in the League Fixture Book (unless mutually agreed otherwise), on the date fixed, the only reason acceptable for postponement being the unfit condition of the courts. Both teams must turn up unless they have been advised that conditions will not allow play. The Home Captain shall decide upon the fitness for play, and if the match is abandoned or postponed, the Home Club must notify the Results Secretary within 6 days, giving reasons. In the case of abandoned matches, close of play scores must be submitted at the same time. The visiting team shall not refuse to play or continue a match, but may lodge a protest against any decision by the Home Captain, under this rule, with the Secretary within 6 days. Unfinished matches shall be continued from the point of interruption. Postponed or abandoned matches must be played or continued on the original ground within fourteen days of the original date. It is the responsibility of the home team Captain to offer two dates for the match to be completed within the 14 day period.</li>
			<li>The dates offered must not clash with scheduled Coventry &amp; District league fixtures of the away team and not include the break week for rearrangement. The Results Secretary must be advised of the new play date within 6 days of the original play date. In exceptional circumstances, by agreement between the two Captains and with the consent of the Results Secretary, one substitute player can be fielded by either or both teams in order to permit completion of unfinished matches within the fourteen day rule. Any rubber in which the substitute players take part must be commenced from scratch. A substitute player shall not be allowed in the event of illness or injury preventing a player completing a match on the fixed date and the rubber or rubbers involved shall be forfeited. Any team which fails to fulfil a fixture shown in the Handbook for any reason other than provided for in Rule 13, shall be liable at the discretion of the Committee to have its record expunged and to be expelled from the League. The Committee's ruling shall be final.</li>
			<li>Each team shall consist of two pairs and both pairs will play each opposing pair. Each match is worth four points, one point is awarded for each rubber won.</li>
			<li>The Wimbledon tie-break system shall be used at six games all in the first two sets. The tie-break is started by the player whose turn it is to serve and he or she serves the first point only. Thereafter each player serves two points in sequence. The tie-break is won by the first pair to score seven points with</li>
			<li>a 2 point advantage i.e. 7-5, 8-6, 9-7, etc. The third set shall comprise a Championship tie-break which will be won by the first pair to score ten points with a 2 point advantage, i.e. 10-8, 11-9, 12-10, etc.</li>
			<li>When Clubs have an equal number of points, the positions in the League Table shall be determined by the percentage of sets won, and if still level, by the percentage of games won.</li>
			<li>The Championship tie-break shall count as one set, and also as one game.</li>
			<li>The Home Club shall provide two outdoor courts for each match. The choice of courts shall be made by the Home Captain. The Committee stipulates that a change of surface during a match must be made by mutual consent of both captains. The match must continue under floodlights if they are available.</li>
			<li>The Home Club shall provide eight new balls, authorised by the LTA, and from a manufacturer nominated by the League Committee, for each match.</li>
			<li>Players representing a Club in the League must be bona fide members of the Club. Each player must be registered by his or her Club not less than fourteen days before playing in a League match, except with the approval of the Results Secretary. Registration must be made in writing to the Results Secretary.</li>
			<li>The Committee shall have power to refuse to accept any registration.</li>
			<li>No player can play for more than one Club in the League during one season. All members of a team playing in a league match must wear recognised tennis clothing at all times.</li>
			<li>Any player having played in more than three matches in higher divisions shall not be permitted to play in a lower division during the same season. When a Club has more than one team in the same division, no player may play more than three times for a higher ranking team and then a lower ranking team, but a member of a lower ranking team may play for a higher ranking team, irrespective of the number of times he has played for the lower ranking team.</li>
			<li>Clubs playing ineligible players shall forfeit the rubbers in which ineligible players play, but their opponents shall only be entitled to the rubbers they have won plus any rubbers lost against an ineligible player.</li>
			<li>All matches shall commence not later than 6.30pm and any pair not ready to commence play by this time shall forfeit the first set. Any pair not ready to commence by 7.00pm shall forfeit the first rubber by two love sets, and that rubber shall not be played.</li>
			<li>Any rubber not completed because of retirement shall be forfeited.</li>
			<li>Scorecards must be provided by the Home Team for every match. It is the responsibility of the Home team to submit the scorecard to the Results Secretary within six days of the date of the match. The Results Secretary must also be advised within six days of the date of the match of any uncompleted matches and the arrange ments made for completion. Failure to submit a scorecard within the prescribed time shall result in forfeiture of the match by the winners.</li>
			<li>All League fixtures shall be completed by 31st August each year.</li>
			<li>All disputes shall, (not later than fourteen days after the match in which the problem arises) be referred to the General Secretary or the appropriate Results Secretary, in writing, who shall bring them before the Committee for discussion. Officials and players of Clubs may be called to appear before the Committee in cases of dispute.</li>
			<li>Any Club changing its Secretary shall inform the General Secretary immediately</li>
			<li>All Match courts are subject to inspection by the League Committee and all grounds are to be open to League Officials while matches are in progress. All Match courts must be clearly marked and free from dangerous objects. The nets must be undamaged and a net band must be provided on each court. The League Committee has the right to inspect the courts of any Club which applies to join the League before admitting that Club to membership</li>
			<li>The Committee shall have the power to impose a fine on any Club violating these rules, and/or to award the points for any match involved against the offending Club, and/or to declare such a match void. I addition, the Committee shall impose a fine of &pound;5 (Five pounds) on any Club failing to return any of the League trophies by the date shown in the Rules and Fixtures Handbook.</li>
			<li>Any proposed alteration to the Rules must reach the General Secretary in writing not less than twenty-one days before the Annual General Meeting. The General Secretary will then advise the Club Secretaries of the proposals not less than fourteen days before the A.G.M. Following the circulation of the proposals, any amendments to the proposals should reach the General Secretary no later than seven days before the A.G.M. who will circulate them to all clubs immediately. Any proposed alteration or addition to the Rules shall be passed at the A.G.M. if the proposal is approved by more than fifty percent of the total number of votes cast on the proposal.</li>
			<li>Any matter arising not provided for in the Rules shall be dealt with by the Committee</li>
		</ol>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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

