
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Tournament Finals Days - 2015");
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
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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

		<h1>Tournament:&nbsp;<b>Finals Days 2015</b></h1>

		<div id="finalsday2012collage" class="collage">
			 <img alt="Finals Days 2015" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>
		<p class="leader">
			 In 2015, we held two finals days. The first was held on Saturday 4<sup>th</sup> July (to coincide with the Village Festival). This covered the Box league play-offs and the Challenger Tournament finals. The second took place on Sunday September 27<sup>th</sup> and this covered the Mini-Tennis titles and the remainder of the adult tournament categories.
		</p>

		<h2>Challenger Finals Day - July 4<sup>th</sup> 2015</h2>

		<p class="matchreport">
			A packed schedule of tennis matches ran concurrently with the daytime festivities at the Hampton in Arden Village Festival featuring both singels and doubles titles and box league winners/runners-up play-offs.
		</p>

		<p class="matchreport">
			Summary results can be displayed using the links below; 
		</p>

		<h2>Autumn Finals Day - September 27<sup>th</sup> 2015</h2>

		<p class="matchreport">
			The weather was glorious to celebrate a packed schedule of tennis matches featuring both singles and doubles titles.
		</p>


		<div id="main2015orderofplay">
			<p>
				The scheduled order of play and the summary results for the autumn finals day is shown below. Names highlighted in green are the winners for that match.
			</p>

			 <img alt="September Finals Day 2015 Order of Play" src="img/orderofplay2015.png" width="601" />

<!--
 			 <p style="clear: both;">
			 	Please note:
			 	<ol type="number">
			 		<li>Players should arrive in good time for play to commence promptly (1/2 hour early)</li>
			 		<li>Trophy presentations to take place at approx 6pm</li>
			 		<li>After the start of the first matches, subsequent timings are approximate</li>
			 		<li>For the court-side scoreboards, first named player/pair above is the &quot;Home&quot; team.
			 	</ol>
			 </p>
-->
 		</div>



		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the main September finals day was gloriously sunny all day! Once again, another great Finals Day with loads of specators and a great sporting and inclusive atmosphere everywhere while we were treated to some cliffhanger and exhibition tennis on show across all award areas. 
		</p>

<!--
			<br /><br />
			Finals Day was made all the sweeter for knowing that our Mens 1st Team had regained their Inter-District title (playing against the Birmingham league winners Streetly) on the previous night. Hampton have now won this title twice in the last 3 years - way to go!
		</p>
-->
		<p class="team">
			<span>Veterans Mens Doubles</span>Paul Thomas and Ted Frith vs Savio Gaspar and Mark Walker
		</p>
		<p class="matchreport">
			Proceedings kicked off on Court 2 with this battle of the (slightly aging) giants. Betting on the club viewing area was evenly split and Mark and Savio took an early lead and the first set 6-2. Unfazed, and with original bets intact, the second set settled into the grind and one-mistake-is-all-you-need we&apos;ve come to expect from finals days and Paul and Ted eventually tying the match by taking the second set 7-5. Ted and Paul were now on a roll and Mark and Savio faltered under the onslaught in the third set eventually losing that set 6-1
		</p>
		<p class="result">
			<span>Final score:  </span>2-6, 7-5, 6-1
		</p>

		<p class="team">
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant vs Catherine Eley and Debbie Smart
		</p>
		<p class="matchreport">
			Another 3-set&apos;er and Steve (Ray) and his court schedule were already in melt-down! An early first set lead for Terri and Carol disappeared in the turnabout of set two - one set all and everything to play for. Terri and Carol needed to step up to avoid going under now the momentum was with Catherine and Debbie ... which they did and turned things around in set three to finish the set 6-2 winners of set three and the match
		</p>
		<p class="result">
			<span>Final score:  </span>6-2, 4-6, 6-2
		</p>

		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Louise Tomlin
		</p>
		<p class="matchreport">
			And now for another schedule-busting, drama-ridden 3-set&apos;er! Once again, reigning champion Jane and her opponent Louise opted for Court 4 well away from any audience participation, despite Steve&apos;s entreaties about his schedule. This was a high quality match, as expected, with Louise edging into a one set lead at about 60-mins in (yes Steve - the schedule!). Set two was a tough slog for both Jane and Louise but Jane eventually won through 9-7 in the tie-break to take the set 7-6. This was a turning point in the match and Jane went on to win the third set 6-2 to claim the title yet again.
		</p>
		<p class="result">
			<span>Final score:  </span>4-6, 7-6, 6-2
		</p>

		<p class="team">
			<span>Mens Singles Plate</span>Rob Yates jnr vs Ted Frith
		</p>
		<p class="matchreport">
			Ted was now playing in the second of three finals on the day and he was now up against last year's winner (albeit Rob is now appreciably taller and hitting the ball appreciably harder and more accurately). Would the voice of experience dampen the fire of youth ... not a bit of it: the winner was Rob Yates jnr. Great playing again Rob jnr! Ted then took a break to change ready for his third and final encounter later in the day.
		</p>
		<p class="result">
			<span>Final score:  </span>6-2, 6-3
		</p>


		<p class="team">
			<span>Veterans Mens Doubles (over 55&apos;s)</span>Joe Killeen and Phil Turpin vs Chris Barnes and Lorenzo DeFeo
		</p>
		<p class="matchreport">
			And now on to a contest dear to my heart. New finalist Lorenzo cantered out onto centre court with old stager Chris to take on the team that had seen off last year&apos;s champions in the semi-finals, Joe and Phil. Joe and Phil took too long to get going and lost the first set in a time to cheer up Steve (schedule, remember?) and off into set two for more of the same until Joe and Phil looked as if they could rally but to no avail and Chris and Lorenzo took the title, with Lorenzo making the winning smash
		</p>
		<p class="result">
			<span>Final score:  </span>2-6, 3-6
		</p>

 		<p class="team">
			<span>Ladies Singles Plate</span>Catherine Eley vs Alexa Goodyer 
		</p>
		<p class="matchreport">
			Final number two for Catherine after her tough 3-set&apos;er and Alexa was not about to take that into account when a title was at stake! After a tense cat and mouse match, Alexa ran out the winner for her first title in the open tournament.
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 4-6
		</p>


<!--

-->
<!--
		<p class="team">
			<span>Mixed Doubles Plate</span>Paul Thomas and Jayne Barnes vs Steve Ray and Deborah Jones
		</p>
		<p class="matchreport">
			Steve and Deborah see off the challenge from first-time finalist Jayne and partner Paul. The real stars of this encounter were Jayne and Deborah who managed to hold things together when their partners drifted at times between greatness and the other sort of tennis. Steve&apos;s competitiveness eventually gave he and Deborah the edge to convincingly take the final (3rd) set and seal the title.
		</p>
		<p class="result">
			<span>Final score:  </span>4-6, 6-3, 1-6
		</p>
		<p class="team">
			<span>Mens Singles</span>Daniel Eccleston vs Josh Crisp-Jones
		</p>
		<p class="matchreport">
			Once again a fantastic, exhibition-style match to watch on centre court. Last year&apso;s winner Josh (who had only slept since 6am I think before having to play his semi-final against Richard Westman earlier in the afternoon) was thoroughly warmed up by the time Daniel arrived for his match. After the usual, courteous knock-up period, Daniel signalled his intention very early on to regain his title, closing out the first set with a fantastic display of accurate, power tennis. Even the sound as proper tennis players hit the ball is quite different, dont you think? On into the second set, and it became very clear that Josh was not going to roll over and oblige Daniel in his quest for the title without a fight, and the second set went to Josh. At this time, they were playing under floodlights and both elected to play a Chamionship Tie-Break rather than a full 3rd set. Again this was a closely fought affair with the audience up by the clubhouse unwilling to leave for their dinners as the tennis was so good, but Daniel did eventually edge it 10-7 to reclaim his singles title from 2011. Well played both - great to watch.
		</p>
		<p class="result">
			<span>Final score:  </span>6-1, 3-6, 10-7 (CTB)
		</p>
		
		<p class="team">
			<span>Ladies Doubles</span>Terri Mason and Wendy Jones vs Jane Hodge and Carol Grant
		</p>
		<p class="matchreport">
			Tight 3-set'er but eventually a very tired pairing of Jane and Carol ran out worthy winners. the match has to go down as having the &quot;mis-hit of the finals&quot; point where a stylish skywards mishit shot from Wendy (I think) kerplunked just over the net right down into the tramlines much to the dismay of Jane and Carol, who tried in vain to get it back and keep it in play thereafter - you had to see it to believe it!
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 7-6, 3-6
		</p>

		<p class="team">
			<span>Mixed Doubles</span>Paul Thomas and Carol Grant vs Terri Mason and Savio Gaspar
		</p>
		<p class="matchreport">
			Yet another competitive 3-set match where Savio (the freshest competitor on the court at this stage!) and Terri grasped an early one set lead after a tense first set tie-break. Paul and Carol rallied during the second set to tie the match at one set each. Savio and Terri were having none of this and stormed back out into the third set taking it convincingly 6-1 to win the title.
		</p>
		<p class="result">
			<span>Final score:  </span>6-7, 6-4, 1-6
		</p>

		<p class="team">
			<span>Mens Doubles</span>Daniel Eccleston and Richard Allen vs Josh Crisp-Jones and Tony Eccleston  
		</p>
		<p class="matchreport">
			The last match of the day, this was played totally under floodlights and, as you would expect with such a raft of Mens 1st Team talent on display, was a very tight first set with Daniel and Richard just edging it from Tony and Josh. The lads must have been getting hungry or something during the second set and duly obliged the crowd with a high-speed run-through of how to play tennis with Daniel and Richard running out eventual winners in straight sets.
		</p>
		<p class="result">
			<span>Final score:  </span>7-5, 6-2
		</p>


 		<p class="matchreport" style="padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the September finals day was cool and overcast for much of the day, turning eventually to rain in the latter part of the afternoon, luckily after most of the matches had completed! Great atmosphere in the clubhouse and some good tennis on show across all award areas. 
		</p>
 -->
 		<p class="matchreport">
			Many thanks to all the players, volunteers and spectators for turning out and supporting our tennis finals days this year. See you all next year!
		</p>
		<div class="seealso" style="clear: both; margin-top: 10px; border-top: 1px solid black;">
			<h2>See Also:</h2>
			<ul>
				<li><a href="tours.asp?season=2015">2015 Summary results</a></li>
<!-- 				
				<li><a href="https://www.flickr.com/photos/103781054@N07/sets/72157648134437761/">September Finals Day Photos</a></li>
 -->
 				<li><a href="https://www.flickr.com/photos/103781054@N07/sets/72157655547638422">Challenger Finals Day photos</a></li>

 				<li><a href="juniors/results.html?season=2015">Junior tournament results</a></li>
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
