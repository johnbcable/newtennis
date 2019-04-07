
<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Tournament Finals Days - 2019");
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
			<li class="active" id="nav_playing"><a href="playing.asp">Playing</a></li>
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

		<h1>Tournament:&nbsp;<b>Finals Days 2019</b></h1>

		<div id="finalsday2012collage" class="collage">
			 <img alt="Finals Days 2019" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>
		<p class="leader">
			 In 2019, we have two finals days. The first (the Challenger Tournament) is on Saturday 29<sup>th</sup> June; the second (the Open tournament) will take place in the early autumn. 
		</p>

		<h2>Challenger Finals Day - Saturday 29<sup>th</sup> June, 2019</h2>

		<p class="matchreport">
			We will publish an initial draw sheet available here when the draw is made.
		</p>

		<p class="matchreport">
			Summary results will be able to be displayed using the links below. 
		</p>

		<h2>Autumn Finals Day - date TBA</h2>

		<p class="matchreport">
			Lets see what the weather can do for us ... Well, it was a mixed bag &ndash; weather&ndash;wise &ndash; starting off cool but cloudy, graduating to rain for most of the matches at the end of the schedule.
		</p>


<!--		<div id="main2017orderofplay">
			<p>
				The scheduled order of play (and the summary results - winners highlighted in green) for the autumn finals day are shown below. 
			</p>

			 <img alt="October Finals Day 2017 Results" src="img/finalsresults2017.png" width="601" />
 			 <p style="clear: both;">
			 	Please note:
			 	<ol type="number">
			 		<li>Players should arrive in good time for play to commence promptly (1/2 hour early)</li>
			 		<li>Trophy presentations to take place at approx 6pm</li>
			 		<li>After the start of the first matches, subsequent timings are approximate</li>
			 		<li>For the court-side scoreboards, first named player/pair above is the &quot;Home&quot; team.
			 	</ol>
			 </p>
			 
 		</div>
-->
<!--
		<p class="matchreport" style="clear: both; padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the main September finals day was fine following on from the patchy weather on Friday 16<sup>th</sup>. Once again, another great Finals Day with loads of specators and a great sporting and inclusive atmosphere everywhere while we were treated to some cliffhanger and exhibition tennis on show across all award areas. 
		</p>


			<br /><br />
			Finals Day was made all the sweeter for knowing that our Mens 1st Team had regained their Inter-District title (playing against the Birmingham league winners Streetly) on the previous night. Hampton have now won this title twice in the last 3 years - way to go!
		</p>

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
			<span>Final score:  </span>6-3, 6-2
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

		<p class="team">
			<span>Ladies Super Veterans Doubles</span>Jenny Roberts and Kathy Hunt vs Pauline Morris and Chris Durbin
		</p>
		<p class="matchreport">
			A great 2-set encounter (which kept the scheduler happy) which, despite some serious pre-match liquid training, went the way of Jenny Roberts and partner Kathy Hunt. There was quite a bit of giggling on court ..
		</p>
		<p class="result">
			<span>Final score:  </span>6-4, 6-4
		</p>

		<p class="team">
			<span>Mens Singles</span>Tony Eccleston vs Rich Westman
		</p>
		<p class="matchreport">
			It really is great to see tennis at this level within the club. Manfully trying to recover after his sister&apos;s wedding and BBQ duties for all and sundry the previous day, Tont got off to a slow start against Richard ... and couldnt seem to make any impression against the barrage of shots from the other side of the court, leaving Richard to run out a worthy two sets to nil winner
		</p>
		<p class="result">
			<span>Final score:  </span>0-6, 0-6
		</p>


		<p class="team">
			<span>Mixed Doubles</span>Emma Shalley and Mark Joannides vs Sophie Cable and Jonny hunt
		</p>
		<p class="matchreport">
			Seasoned mixed doubles pairing Mark and Emma were pitted against the "no silverware" first-time pairing of Sophie Cable and Jonny Hunt. Both pairs had played well in the run-up to finals day, dismissing prior winners and other fancied pairings with ease so all eyes were focussed on how this one was going to pan out. Against the initial betting odds, Sophie and Jonny took a 3-1 lead in the first set. This obviously riled Emma and Mark who came back at them to take the first set 6-4 - percentage bets were looking safe. Unfortunately for Emma and Mark, finals day "newbies" Sophie and Jonny didnt know that this was supposed to be their cue to put their heads down and just stormed out of the blocks to take the second set 3-6. After Mark had given his racket the first (and second) of a few good talkings to, we were off into set number 3 with the schedule police nervously viewing their watches. They neednt have worried: Sophie and Jonny took a commanding 5-1 lead in the final set, let it slip back to 5-2 but then made sure and finished the match in fine style taking the third set 2-6 ... and Mark's racquet took another beating! A good-natured and tactical contest resulting in two new names to be added to the trophy! Well done Sophie and Jonny.
		</p>
		<p class="result">
			<span>Final score:  </span>6-4, 3-6, 2-6
		</p>

		<p class="team">
			<span>Mens Doubles</span>Andy Frith and Ted Frith vs Josh Crisp-Jones and Rich Westman  
		</p>
		<p class="matchreport">
			Into the last set of matches fore the day, and Ted canters back onto the court after going for a quick change after his second match of the day (against Rob Yates jnr) to partner his son Andy against two giants of the Mens Doubles at Hampton - Josh and Richard. As with most matches involving first team players, the "good hands" work around the net was as important or more so than the ability to rally from the back of the court. And so our first team pairing lead &quot;la famille Frith&quot; a merry dance on court two for an engaging two-set match, eventually running out winners. And the scheduler was pleased.
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 0-6
		</p>

		<p class="team">
			<span>Mixed Doubles Plate</span>James Straw and Karen Vithanage vs Savio Gaspar and Bonita Bryant
		</p>
		<p class="matchreport">
			Meanwhile on court 1, we had the finals of the mixed doubles plate where the likjes of old-stager Savio partnered Bonita (Bryant) against experienced finalist Karen (Vithanage) and James (Straw). An engaging mixed bag of tennis and quirks - did you really need 4 extra racquets James after your string broke? - but again the scheduler was a happy bunny as Savio and Bonita completed their conquest in two straight sets.
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 4-6
		</p>
		
		<p class="team">
			<span>Ladies Doubles</span>Louise Tomlin and Debbie Smart vs Wendy Jones and Catherine Eley
		</p>
		<p class="matchreport">
			Last up (and unfortunately on court 4 in the fading light so we all had to guess the scores), Louise and Debbie who had each played separately in earlier matches, now worked together to take on a fresh-as-a-daisy Wendy and a slightly more weary Catherine (who had played 5 sets already today). Was this one going to be over quickly or would it go the distance? Sadly for the scheduling (but great for the competitors and the audience) we had another 3 set&apos;er to close proceedings on Finals Day. Wendy and Catherine took the first set 3-6 and then Louise and Debbie immediately replied in kind, taking the sceond set 6-3. All down to the last set, but Louise and Debbie were in their element now and Wendy and Catherine had no answer for them, with Louise and Debbie taking the final set 6-2
		</p>
		<p class="result">
			<span>Final score:  </span>3-6, 6-3, 6-2
		</p>


 		<p class="matchreport" style="padding-top: 10px; margin-top: 10px; border-top: 1px solid black;">
			The weather for the September finals day was cool and overcast for much of the day, turning eventually to rain in the latter part of the afternoon, luckily after most of the matches had completed! Great atmosphere in the clubhouse and some good tennis on show across all award areas. 
		</p>
 -->
 		<p class="matchreport" style="clear:both;">
			Many thanks (in advance) to the hard-pressed bar staff for coping with us all and many thanks to all the players, volunteers and spectators for turning out and supporting our tennis finals days this year. See you all next year!
		</p>
		<div class="seealso" style="clear: both; margin-top: 10px; border-top: 1px solid black;">
			<h2>See Also:</h2>
			<ul>
<!--
				<li><a href="tours.asp?season=2017">2017 Summary results</a></li>
			
-->	
				<li><a href="https://www.flickr.com/photos/103781054@N07/albums/72157670890266898">Challenger  Finals Day Photos</a></li>

<!--
 				<li><a href="https://www.flickr.com/photos/103781054@N07/sets/72157655547638422">Challenger Finals Day photos</a></li>
-->
 				<li><a href="juniors/results.html?season=2019">Junior tournament results</a></li>
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
