<<<<<<< HEAD
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
			 <img alt="Finals Days 2014" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>
		<p class="leader">
			 AS in 2014, we will have two finals days. The first will be on Saturday 4<sup>th</sup> July (to conicied with the Village Festival) which covers the Box league play-offs and the Challenger Tournament finals. The second will take place on Sunday September 27<sup>th</sup> and this will covered the Mini-Tennis titles and the remainder of the adult tournament categories.
		</p>

		<p class="matchreport">
			&nbsp;
		</p>

		<div id="main2014orderofplay">
			<p>
				The scheduled order of play and the summary results for the finals days will be shown below. Names highlighted in yellow are the winners for that match.
			</p>

<!-- 			 <img alt="September Finals Day 2014 Results" src="Images/results2014.jpg" width="601" />
 -->
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
<!-- 
		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the main September finals day was again cool and overcast for much of the day, but luckily this did NOT turn to rain as it did in June! Once again, another great Finals Day with loads of specators (could be to do with the tea and cakes that were flowing!) and a great sporting and inclusive family atmosphere atmosphere everywhere while we were treated to some cliffhanger and exhibition tennis on show across all award areas. 
			<br /><br />
			Finals Day was made all the sweeter for knowing that our Mens 1st Team had regained their Inter-District title (playing against the Birmingham league winners Streetly) on the previous night. Hampton have now won this title twice in the last 3 years - way to go!
		</p>
 -->
<!--
		<div id="challenger2014orderofplay">
			<p>
				The scheduled order of play for the 28<sup>th</sup> June 2014 finals (along with summary results) is shown below. 
			</p>

			 <img alt="June Finals Day 2014 Order of Play" src="Images/orderofplay2013.jpg" width="601" />

		</div>


		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the June finals day was cool and overcast for much of the day, turning eventually to rain in the latter part of the afternoon, luckily after most of the matches had completed! Great atmosphere in the clubhouse and some good tennis on show across all award areas. 

		</p>
-->

<!--
		<p class="team">
			<span>Ladies Singles Plate</span>Sally Leach vs Catherine Eley
		</p>
		<p class="matchreport">
			What a long time on court! I thought the Mens Over-55 Veterans final would easily be the longest of the first 3 matches, but I was seriously wrong. Neither Sally nor Catherine were going to give up on this title, with one set apiece after 90-minutes or so. On into the third set and this was a grueller, once again with there being no quarter from either side. Sally was determined to retain her title from last year and eventually, after about two and a half hours on court, Sally did eventually succeed in breaking down Catherine&apos;s resolve and claim the title for a second year in a row.
		</p>
		<p class="result">
			<span>Final score:  </span>6-4, 1-6, 7-5
		</p>
-->
<!-- 		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Louise Tomlin  
		</p>
		<p class="matchreport">
			Jane and Louise have played together in the ladies league team this year but this title was about the individual and any previous team camaraderie was long gone! They set about each other with great basleine-slogging gusto from the word Go! It is great to watch a match being contested by two quality players. It all hinges on a knife-edge - one mistake being enough to sink you. Despite great rallying, Louise eventually succumbed to Jane&apos;s onslaught in both sets for Jane to retain the title.
		</p>
		<p class="result">
			<span>Final score:  </span>6-3, 6-4
		</p>
		<p class="team">
			<span>Mens Singles Plate</span>Rob Yates vs Rob Yates (jnr)
		</p>
		<p class="matchreport">
			... and the winner was: Rob Yates (junior that is)! Having thanked Rob Yates senior for seeing off Chester in an earlier round - no-one can forget (or want a repeat of) their epic mens singles finals day match in 2010 - Rob Yates (jnr) proved too much of a handful on the day and youth won out! Great playing Rob jnr.
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 3-6
		</p>
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
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant vs Alison Lowe and Kathy Hunt
		</p>
		<p class="matchreport">
			Terri and Carol win the day against new club member Alison and Kathy, Alison displaying almost Mark Joannides-like annoyance with herself after one particular miss - very entertaining. I am sure Alison and Kathy will be back to challenge again next time around - dont get too comfortable on those laurels, Terri and Carol!
		</p>
		<p class="result">
			<span>Final score:  </span>6-3, 6-0
		</p>
		<p class="team">
			<span>Veterans Mens Doubles (over 55's)</span>Malcolm Brumwell and John Cable vs Chris Barnes and Ian Wasse
		</p>
		<p class="matchreport">
			Otherwise known as the Salt 'n' Pepper doubles, 130 years old played 124 years old on this 
			court! New boy Chris &quot;Sledger&quot; Barnes played some fine tennis including 3 (or was it 4?) aces against John [Ed. - all in the same place in the service box. Do try and learn next time John!] but his new boy dynamism was insufficent in the end to deny the old stagers from retaining their trophy after a long match that delayed every other match thereafter so that &quot;main event&quot; matches had to be played under floodlights late into the evening.
		</p>
		<p class="result">
			<span>Final score:  </span>4-6, 6-1, 6-2
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
			<span>Veterans Mens Doubles</span>Steve Ray and Chris Barnes vs Paul Thomas and Grahgam Hollway
		</p>
		<p class="matchreport">
			Long-standing solid doubles pairing, Chris &quot;sledger&quot;Barnes and Steve &quot;net chomper&quot; took on the might of Graham and Paul and were a little slow to get off the mark, sinking without a trace 6-0 in the first set. In the second set, Chris seemingly abandoned sledging and Steve likewiae abandoned chomping, and concentrated on tennis to take an intriguing 3-1 lead in the second set, with Paul and Graham now committing more unforced errors and looking decidedly under pressure. However, Graham and Paul gradually regained some of their momentum from the first set and ran out eventual winners in two straight sets.
		</p>
		<p class="result">
			<span>Final score:  </span>0-6, 5-7
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
				<li><a href="https://www.flickr.com/photos/103781054@N07/sets/72157645428322765/">Challenger Finals Day photos</a></li>
 -->
 				<li><a href="juniors/results.html?season=2015">Junior tournament results for 2015</a></li>
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
	
	
=======
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
			 As in 2014, we will have two finals days. The first will be on Saturday 4<sup>th</sup> July (to coincide with the Village Festival) which covers the Box league play-offs and the Challenger Tournament finals. The second will take place on Sunday September 27<sup>th</sup> and this will covered the Mini-Tennis titles and the remainder of the adult tournament categories.
		</p>

		<h2>Challenger Finals Day - July 4<sup>th</sup> 2015</h2>

		<p class="matchreport">
			A packed schedule of tennis matches ran concurrently with the daytime festivities at the Hampton in Arden Village Festival featuring both singels and doubles titles and box league winners/runners-up play-offs.
		</p>

		<p class="matchreport">
			Summary results can be displayed using the links below; 
		</p>

<!-- 
		<div id="main2015orderofplay">
			<p>
				The scheduled order of play and the summary results for the finals days will be shown below. Names highlighted in yellow are the winners for that match.
			</p>

			 <img alt="September Finals Day 2014 Results" src="Images/results2014.jpg" width="601" />
 -->
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
 		
<!-- 
		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the main September finals day was again cool and overcast for much of the day, but luckily this did NOT turn to rain as it did in June! Once again, another great Finals Day with loads of specators (could be to do with the tea and cakes that were flowing!) and a great sporting and inclusive family atmosphere atmosphere everywhere while we were treated to some cliffhanger and exhibition tennis on show across all award areas. 
			<br /><br />
			Finals Day was made all the sweeter for knowing that our Mens 1st Team had regained their Inter-District title (playing against the Birmingham league winners Streetly) on the previous night. Hampton have now won this title twice in the last 3 years - way to go!
		</p>
 -->
<!--
		<div id="challenger2014orderofplay">
			<p>
				The scheduled order of play for the 28<sup>th</sup> June 2014 finals (along with summary results) is shown below. 
			</p>

			 <img alt="June Finals Day 2014 Order of Play" src="Images/orderofplay2013.jpg" width="601" />

		</div>


		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the June finals day was cool and overcast for much of the day, turning eventually to rain in the latter part of the afternoon, luckily after most of the matches had completed! Great atmosphere in the clubhouse and some good tennis on show across all award areas. 

		</p>
-->

<!--
		<p class="team">
			<span>Ladies Singles Plate</span>Sally Leach vs Catherine Eley
		</p>
		<p class="matchreport">
			What a long time on court! I thought the Mens Over-55 Veterans final would easily be the longest of the first 3 matches, but I was seriously wrong. Neither Sally nor Catherine were going to give up on this title, with one set apiece after 90-minutes or so. On into the third set and this was a grueller, once again with there being no quarter from either side. Sally was determined to retain her title from last year and eventually, after about two and a half hours on court, Sally did eventually succeed in breaking down Catherine&apos;s resolve and claim the title for a second year in a row.
		</p>
		<p class="result">
			<span>Final score:  </span>6-4, 1-6, 7-5
		</p>
-->
<!-- 		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Louise Tomlin  
		</p>
		<p class="matchreport">
			Jane and Louise have played together in the ladies league team this year but this title was about the individual and any previous team camaraderie was long gone! They set about each other with great basleine-slogging gusto from the word Go! It is great to watch a match being contested by two quality players. It all hinges on a knife-edge - one mistake being enough to sink you. Despite great rallying, Louise eventually succumbed to Jane&apos;s onslaught in both sets for Jane to retain the title.
		</p>
		<p class="result">
			<span>Final score:  </span>6-3, 6-4
		</p>
		<p class="team">
			<span>Mens Singles Plate</span>Rob Yates vs Rob Yates (jnr)
		</p>
		<p class="matchreport">
			... and the winner was: Rob Yates (junior that is)! Having thanked Rob Yates senior for seeing off Chester in an earlier round - no-one can forget (or want a repeat of) their epic mens singles finals day match in 2010 - Rob Yates (jnr) proved too much of a handful on the day and youth won out! Great playing Rob jnr.
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 3-6
		</p>
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
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant vs Alison Lowe and Kathy Hunt
		</p>
		<p class="matchreport">
			Terri and Carol win the day against new club member Alison and Kathy, Alison displaying almost Mark Joannides-like annoyance with herself after one particular miss - very entertaining. I am sure Alison and Kathy will be back to challenge again next time around - dont get too comfortable on those laurels, Terri and Carol!
		</p>
		<p class="result">
			<span>Final score:  </span>6-3, 6-0
		</p>
		<p class="team">
			<span>Veterans Mens Doubles (over 55's)</span>Malcolm Brumwell and John Cable vs Chris Barnes and Ian Wasse
		</p>
		<p class="matchreport">
			Otherwise known as the Salt 'n' Pepper doubles, 130 years old played 124 years old on this 
			court! New boy Chris &quot;Sledger&quot; Barnes played some fine tennis including 3 (or was it 4?) aces against John [Ed. - all in the same place in the service box. Do try and learn next time John!] but his new boy dynamism was insufficent in the end to deny the old stagers from retaining their trophy after a long match that delayed every other match thereafter so that &quot;main event&quot; matches had to be played under floodlights late into the evening.
		</p>
		<p class="result">
			<span>Final score:  </span>4-6, 6-1, 6-2
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
			<span>Veterans Mens Doubles</span>Steve Ray and Chris Barnes vs Paul Thomas and Grahgam Hollway
		</p>
		<p class="matchreport">
			Long-standing solid doubles pairing, Chris &quot;sledger&quot;Barnes and Steve &quot;net chomper&quot; took on the might of Graham and Paul and were a little slow to get off the mark, sinking without a trace 6-0 in the first set. In the second set, Chris seemingly abandoned sledging and Steve likewiae abandoned chomping, and concentrated on tennis to take an intriguing 3-1 lead in the second set, with Paul and Graham now committing more unforced errors and looking decidedly under pressure. However, Graham and Paul gradually regained some of their momentum from the first set and ran out eventual winners in two straight sets.
		</p>
		<p class="result">
			<span>Final score:  </span>0-6, 5-7
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
	
	
>>>>>>> 5e2603788b1e1b648e9d0dc4bdaf5a7d06d41b61
