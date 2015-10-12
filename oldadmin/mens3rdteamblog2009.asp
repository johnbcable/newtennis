<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 3rd Team Diary");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Supporting variables and lists
var mylist = new Array("Not Allocated","Maxi-Tennis: England","Maxi-Tennis: France","Maxi-Tennis: Ireland","Maxi-Tennis: Italy","Maxi-Tennis: Scotland","Maxi-Tennis: Wales");
var mSurname, mForename, mInitials, mTitle, mMyChoice, mHidden1, mHidden2;
mSurname = "";
mForename = "";
mInitials = "";
mTitle = "";
mMyChoice = new String("Not Allocated").toString();
mHidden1 = new String("hidden1").toString();
mHidden2 = new String("hidden2").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
var debugging = current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
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
		<h1>Mens 3rd Team 2009 - Climbing that Ladder</h1>
		<img src="images/stever2.jpg" border="0" alt="Steve Ray - Mens 3rd Team captain" />
		<p>
			Welcome to the diary from the merry men of our Mens 3rd Team for the 2009 season. Smile (or wince - as appropriate) 
			while you warm your cockles with some stirring match reporting. We hope that you're not going to miss out on 3rd team 
			match reports this year - Oh no! If anyone writes about the Mens 3rd Team then read it here.
		</p>
		<p>
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol style="clear: both;">
			<li>
				<h2>Coventry &amp; North Warwicks (Home) - Thursday 6 August, 2009</h2>
				<p>
					Team: Nigel Jones &amp; Mike Jones, Jacob Pratt &amp; Savio Gaspar
				</p>
				<p>
					Result:  4-0 win!
				</p>
				<p>
					A rousing end to the season and a great solid performance from the team. Well done! No real problems with 
					both pairs serving well and closing out games, sets &amp; rubbers as necessary. C&amp;NW not winning any 
					sets and no more than 2 games in any set. 
				</p>
				<p class="articleauthor">Nigel Jones</p>
			</li>
			<li>
				<h2>Beechwood (Away) - Friday 31 July, 2009</h2>
				<p>
					Team: Steve Ray &amp; David Margetts, Savio Gaspar &amp; John Cable
				</p>
				<p>
					Result: 4-0 loss (Tie-break nightmare!)
				</p>
				<p>
					Not for the first time this season a tale of lost Championship tie-breaks, losing 3 on the night with David and I
					suffering twice! This was even more frustrating as in both rubbers for David and I we lost the first sets but 
					then gained the momentum in the 2nd sets!
				</p>
				<p>
					Savio &amp; John played really well against the Beechwood 1st pair shocking them by taking the 1st set 7-6 and also 
					getting to 8-8 in the Championship tie break before eventually going down 10-8.
				</p>
				<p>
					With only one of last week’s Hampton four turning out this week it was always going to be a tough challenge against 
					one of our promotion rivals. Everyone played exceptionally well but ultimately we paid the price of not having 
					regular pairings (an issue throughout the season) in that at the pressure points the opposition have, with a few 
					exceptions, just had the edge!
				</p>
				<p>
					In the players defence, I should point out that both pairs won very tight normal tie breaks in the full sets so we 
					don’t have a complete aversion to tie break tennis! <i>(In addition, I should point out that the Beechwood club 
					deployed their midge offensive at the same time, both pairs being severely bitten by swarms of flying insects 
					during key times in the matches. One player ended up with bruised shins after banging his tennis racket against them
					repeatedly to stop the itching!  Ed.)</i>
				</p>
				<p>
					Unfortunately, with one match to go (against bottom of the league), we cannot get promoted this season. Nevertheless 
					it has been a good effort and, with the number of tie breaks that have gone against us, we should certainly be fighting 
					it out at the top of the league again next year! 
 				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Warwick Tennis Club (Home) - Thursday 23 July, 2009</h2>
				<p>
					Team: Steve Ray &amp; Chester Barnes, Nigel Jones &amp; Mike Jones
				</p>
				<p>
					Result:  Lost 3-1
				</p>
				<p>
					We lost 4-0 to them in the first half of the season with the result being very harsh with Steve &amp; Nigel losing a couple 
					of tie-breaks. There was a danger of the same again last night with 4 tie-breaks on the evening! Mike &amp; Steve started 
					really well taking their first set 6-1 but Warwick fought back well to win a 2nd set tie break and then played good solid 
					tennis to win the Championship Tie Break!
				</p>
				<p>
					Meanwhile Chester &amp; Nigel also started very well but narrowly lost their 1st set again the Warwick 1st pair 7-5 and, although 
					the games were extremely competitive, the 6-1 loss of the 2nd set didn’t show it on the score card.
				</p>
				<p>
					Not a great start but in the 2nd set of rubbers Mike &amp; Steve started well against their first pair with Mike serving to a very 
					high quality. We took the 1st set 6-3 but Warwick came back strongly to edge the 2nd set 7-5 giving Mike &amp; Steve their 3rd tie 
					break of the evening! Fortunately this one had a happier ending with a 10-7 victory!
				</p>
				<p>
					Chester &amp; Nigel then had a marathon against their 2nd pair sharing the first 2 sets 5-7, 7-5 leading to another tie-break! This 
					could have gone either way but Warwick TC edged it 11-9 – you can’t get a much closer match!
				</p>
				<p>
					Defeat but a good night’s tennis and another point better than the first half of the season. We are still in with a shout of 
					promotion but Beechwood and LMRCA remain ahead of us with games running out (although Beechwood’s last 2 games are against 
					us and Warwick TC!).
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>LMRCA (Home) - Thursday 16 July, 2009</h2>
				<p>
					Team: Steve Ray &amp; Chester Barnes, Jacob Pratt &amp; Mike Jones
				</p>
				<p>
					Result:  Draw 2-2
				</p>
				<p>
					It rained from 6pm until 10pm and we all got very, very wet!
				</p>
				<p>
					Both Hampton pairs beat the LMRCA 2nd pair but their 1st pair played very solidly. Nothing spectacular but very few mistakes!
				</p>
				<p>
					A respectable result against the team just ahead of us in 2nd place in the league but we could have done with a win to close the gap!
				</p>
				<p>
					N.B.  Mike provided a fantastic match supper – any volunteers for next week with just two home games left?
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Coventry and North Warwicks 3 (Away) - Thursday 9 July, 2009</h2>
				<p>
					Team: Steve Ray &amp; Chester Barnes, David Margetts &amp; Mike Jones
				</p>
				<p>
					Result:  3-1 win!
				</p>
				<p>
					Another good result with Chester &amp; Steve playing solid tennis to win both their rubbers with impressive scores that 
					belied how competitive the tennis was!
				</p>
				<p>
					David &amp; Mike played well in both rubbers winning their first 11-9 in the 3rd set Championship Tie-Break with David very 
					proud of his service ace at 9-9 (we will not mention how they were previously 9-6 up!!).
				</p>
				<p>
					All to play for with 4 fixtures to go and the next 3 matches being against the other promotion chasing teams. Next up it’s 
					LMRCA who before this week’s results are in 2nd place, 2 points ahead of us. Team to be announced over the weekend.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Berkswell 4 (Home) - Thursday 2 July, 2009</h2>
				<p>
					Team: Steve Ray &amp; Nigel Jones, Colin Naismith &amp; Mike Jones
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Warwick County Council (Away) - Monday 22 June, 2009</h2>
				<p>
					Team: Steve Ray &amp; Chester Barnes, Colin Naismith &amp; Mike Jones
				</p>
				<p>
					Result:  3-1 win!
				</p>
				<p>
					A welcome back to Colin playing his first match of the season and definitely getting his monies worth (talking of which 
					I forgot to collect the subs!!).
				</p>
				<p>
					Steve &amp; Chester played some good solid tennis and secured two wins that on paper looked reasonably comfortable but they 
					were hard work! Mike &amp; Colin went for the more conventional approach in that if you are going to have a close match make 
					sure the scorecard fully reflects the nights work! The first rubber they lost 13-11 in the 3rd set tie break after sharing 
					two close sets. In the second rubber they held their nerve after again sharing two close sets and bounced back to win another 
					3rd set tie break 10-8 (which looked very unlikely at 6-8 down!). Well done guys!
				</p>
				<p>
					Overall a pretty good few days for the 3rd team - whilst Warwick Tennis Club have gone a few points clear at the top of 
					the table, the rest of the league remains pretty close.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Coventry and North Warwicks (Away) - Thursday 18 June, 2009</h2>
				<p>
					Team: Chester Barnes &amp; Nigel Jones, David Margetts &amp; Jacob Pratt 
				</p>
				<p>
					Result:   2-2 draw
				</p>
				<p>
					Cov &amp; NW had one good pair who won both their matches and one not-so-good pair who [comfortably] lost both their matches!
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Beechwood 5 (Home) - Thursday 11 June, 2009</h2>
				<p>
					Team: 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Warwick Tennis Club (Away) - Wednesday 3 June, 2009</h2>
				<p>
					Team: Nigel Jones & Steve Ray,  Mike Jones & Simon Farrant
				</p>
				<p>
					Result: Loss 0-4
				</p>
				<p>
					The 3rd team's first defeat of the season but the scoreline was very harsh! 
				</p>
				<p>
					Nigel & Steve probably played their best tennis of the year in a high quality match (especially for Div 5) 
					against the Warwick 1st pair narrowly losing 4-6 6-7. There was quite a contrast in styles between the 2 Warwick 
					pairs with the 2nd pair being experienced "nudgers & pushers" feeding off opposition mistakes. At 3-6 3-5 down we 
					were staring down the barrel before rediscovering the qualities demonstrated in the 1st match, reeling off 4 games on 
					the bounce in a pressure situation to take the 2nd set 7-5! The match was seemingly ours for the taking but then we 
					proceeded to go 5-0 down in the Championship Tie Break - too big a mountain to claw back from!
				</p>
				<p>
					Mike & Simon playing together for the first time (with Mike stepping in at short notice) got better as the night wore 
					on and may have faired better if they could have played their matches the other way round. 
				</p>
				<p>
					An enjoyable evening with some good tennis by everyone but it would have been good to pick up a "scruffy" rubber against 
					promotion rivals who were level on points with us prior to the start of play....
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>LMRCA (Away) - Thursday 18 May, 2009</h2>
				<p>
					The team that played away to LMRCA was Nigel Jones and Rob Yates, Steve Ray and Chester Barnes 
				</p>
				<p>
					Result: Draw 2-2
				</p>
				<p>
					&nbsp;
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Coventry &amp; North Warwicks (Home) - Thursday 14 May, 2009</h2>
				<p>
					The report from the beach .....
				</p>
				<p>
					The team that played at home to Coventry &amp; North Warwicks was Chester Barnes, Steve Ray, Charlie Rickard,  John Cable.
				</p>
				<p>
					Result: Win 3-1
				</p>
				<p>
					Week 3 and the 3rd team remain undefeated adding a 3-1 win to their previous draw and 3-1 win! Chester &amp; Steve stayed 
					in control of both their matches for the loss of only 8 games. Charlie &amp; John won a great 3rd set tie break 11-9 against 
					their 2nd pair. Having not met before tonight it took a set for Charlie &amp; John to get going but they did well to recover 
					from the loss of the first set and then went on to run the Cov &amp; NW's first pair pretty close as well! 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Berkswell 4 (Away) - Monday 4 May, 2009</h2>
				<p>
					The team that played away at Berkswell was Rob Yates &amp; Nigel Jones and Charlie Rickard &amp; David Margetts.
				</p>
				<p>
					The first rubbers were shared one a piece, leaving very evenly matched 2nd rubbers. Both Hampton pairs recovered 
					from losing their 1st sets to reach the drama of the 3rd set Championship tie breaks! After 2 close sets and a 
					tight start to the tie break, Rob &amp; Nigel took control and ended up comfortable winners with solid tennis at the end!
				</p>
				<p>
					Charlie &amp; David endured more what you might expect in this situation - a bit of a nervy ding-dong of a battle 
					that could have gone either way. Unfortunately the breaks just favoured Berkswell at the end so the overall match 
					score finished 2-2!
				</p>
				<p>
					Not a bad result with Charlie and Nigel both making their Hampton debuts....it could have been a 3-1 win but could 
					just as easily been a 3-1 defeat.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<h2>Warwick County Council Tennis Club (Away) </h2>
				<p>
					Hello to you all,
				</p>
				<p>
					Well, on the back of a great week for Hampton Men's tennis the 3rd team of Jonny Hunt, Chester Barnes, Rob Yates and myself 
					managed to continue Hampton's good first week form and got a 3-1 win over Warwick CC Tennis club.
				</p>
				<p>
					The opposition were a wily old group of regulars who make nothing easy and give very few points away so even Jon &amp; myself 
					had a close call in the 1st tie having to claw back to 7-5 7-5 winners from 5-2 down in both sets (I really would have no excuses 
					for losing this one). While their 2nd pair, arguably the more modern styled players, were more easily beaten by Chester and Rob 6-3 6-3.
				</p>
				<p>
					The second rubber started well and finished quickly for Jon &amp; I as we won comfortably 6-0 6-2 and ended up watching the next 
					45mins tennis on the other court. Chester and Rob ended up losing that rubber but not for lack of determination.
				</p>
				<p>
					So it was another good start for our team and even better to see 3 of our team who haven't had chance to play much tennis over the 
					off season, either through injury or lack of free time. Even better that they were playing well and dusting off the old cobwebs. 
					And I think Jonny deserves a big congrats winning both opening matches in the leagues in what has been a 10 year lay off. 
					Well done mate!!!
				</p>
				<p>
					Lets keep this momentum going into week two and have more great results,
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
		</ol>		
		<h2>See Also:</h2>
		<ul>
			<li><a href="mens3rdteamblog2008.asp">Mens 3rd Team diary from 2008</a></li>
			<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
			<li><a href="mens2ndteamblog.asp">Mens 2nd Team diary</a></li>
			<li><a href="mens4thteamblog.asp">Mens 4th Team diary</a></li>
		</ul>
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
