<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 2nd Team Diary");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Diary of a Promoted Team  - Mens 2nd Team 2008</h3>
		<div id="steveray" class="floatright" style="height:230px; border:none;">
			<img src="images/stever.jpg" border="0" alt="Steve Ray - Mens 2nd Team captain" />
			<p class="caption">Steve Ray - Mens 2nd Team captain<br />... who plays whenever he selects himself!</p>
		</div>		
		<p>
			Welcome to the commentary from the Mens 2nd Team for the 2008 season. Read and inwardly smile (or wince - take your pick) 
			as the minutiae of league tennis life slip in front of your eyes. Yes sirree, if any of them write anything about their 
			journey, you'll get to see it! Most recent stuff first - scroll down to see earlier reports.
		</p>
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Warwick Boat Club 4 (Wednesday 6 August, 2008)</u></p>
			<p>
				With Chester suffering from "tennis elbow" there was a late call up for Daniel Eccleston for the final game of the season!<br /><br />
				Hence the team to play Warwick Boat was:<br /><br />
				Steve Ray &amp; Dan<br /><br />
				Mark Walker &amp; Dave Mountford<br /><br />
				As it was 2nd against 3rd, and with Warwick Boat being one of the larger clubs, there was an element of doubt as to what sort of team they would put out.<br /><br />
				Whilst it was a completely different 4 from the first match, they hadn't suddenly found a couple of premiership standard players to turn out!<br /><br />
				As a consequence we ran out 4-0 winners. Mark &amp; Dave had a very tight 1st set tie break win but thereafter it was a relatively straight forward win.<br /><br />
				Two great advantages from Dan playing:<br /><br />
				1. I didn't have to work as hard as normal to make up for my technical shortcomings!<br /><br />
				2. Rosalia (Dan's mom) put on a fantastic spread for the match supper - Thanks Ro!<br /><br />
				This win (presuming the scorecard doesn't get lost!!) will put us clear in 2nd place securing promotion to Division 3.<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>			
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Atherstone 2 (Tuesday 29 July, 2008)</u></p>
			<p>
				4-0 "walkover" win due to Atherstone being unable to field a team!<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Sphinx 1 (Wednesday 23 July, 2008)</u></p>
			<p>
				Our team of Steve Ray &amp; Rob Yates / Savio Gaspar &amp; Mike Jones all played well but Sphinx demonstrated why they are well ahead at the top of the table!<br /><br />
				The only rubber that their 1st pair have lost all season was against Ian Poole &amp; Dave Mountford so there was no disgrace in our 4-0 defeat.<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Warwick Tennis Club (Wednesday 16 July, 2008)</u></p>
			<p>
				A good 3-1 win following on from the 4-0 v Nuneaton the previous week, putting us back into 2nd place.<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Nuneaton 2 (Sunday 13 July, 2008)</u></p>
			<p>
				Rearranged match played on Sunday following a complete wash out on Wednesday.<br /><br />
				A 4-0 victory avenging our 4-0 defeat in the first half of the season!<br /><br />
				One of the Nuneaton guys didn't take defeat too well but that was his problem!<br /><br />
				I always say to my daughter, win or lose try and learn something....<br /><br />
				The lesson from this evening's match - don't serve underarm to Dan without warning and when he's not looking!<br /><br />
				The poor guy (referred to above) spent the rest of the match nailed to the back fence (not literally) as Dan let his tennis do the talking!<br /><br />
				Well played guys!<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Beechwood 4 (Tuesday 1 July, 2008)</u></p>
			<p>
				Beechwood had a pretty strong team out with at least 2 of the 4 owning up to being stuck on playing 3 matches for higher teams (1 away from being tied).<br /><br />
				Mark Walker partnered Colin Naismith and for the 3rd week in succession Mark had the experience of beating the oppositions first pair but losing to their second pair.<br /><br />
				To be fair, in all 3 weeks there has probably not been a lot to choose between the 1st and 2nd pairings!<br /><br />
				Steve Ray and David Margetts were our 2nd pair and, despite playing well, lost both rubbers.<br /><br />
				Therefore a 3-1 defeat, but the single rubber won may prove crucial as Beechwood are likely to do well in the second half of the season.<br /><br />
				They would be pretty close to the top but for losing 5 points for failing to submit 2 scorecards on time!<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Leamington 5 (Wednesday 25 June, 2008)</u></p>
			<p>
				The run up to the game didn't start too well with Ian Poole having to step into the 1st team on Monday (due to Tony 
				getting stuck in traffic) therefore he couldn't play for the 2nd's as he is now "tied" and Dangerous Dave not seeing 
				the e-mail confirming his selection for the match (therefore committing himself to something else).<br /><br />
				The team ended up being Chester &amp; Mark W and late call up's for Steve &amp; Colin (giving us the same team that got a valiant 
				draw at Warwick Boat the week before) to play against a Leamington team that are also in the promotion hunt!<br /><br />
				The match score only tells half the story:<br /><br />
				Rubbers 2:2<br /><br />
				Sets 6:6<br /><br />
				Games 58:57<br /><br />
				Winning draw to Hampton (although there was a bit of debate when Leamington realised there was only one game in it about 
				one of the set scores!!).<br /><br />
				Both the first rubbers went the distance with Mark &amp; Chester winning their third set but Steve &amp; Colin going down!<br /><br />
				So Chester &amp; Mark had to beat their 2nd pair to guarantee at least a draw but at 9.50pm they had only got to 1 set all. Rather 
				than come back just for one set the players agreed to play a tie break to resolve matters but, as can happen, this didn't pay 
				off for Hampton.<br /><br />
				As this match finished, Colin was serving to save our match against their 1st pair at 5-6 down in the 3rd set!<br /><br />
				Colin and I battled through that game and then we held our nerve to run away with the tie break 7-1, beating the no. 1 pair 
				after losing to the no. 2 for the second week running.<br /><br />
				On the one hand a little frustrating as we felt we should have won both tonight but on the other it was a good achievement 
				to bounce back again!<br /><br />
				Overall, as the games score suggest, a draw was probably a fair result but a chance was lost to put a bit of distance between 
				us and one of our challengers for promotion.<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Warwick Boat Club 4 (Tuesday 17 June, 2008)</u></p>
			<p>
				Score was 2-2 though not achieved quite how we expected.  CB/MW started off with a routine 3 and 2 win over their first 
				pair while Steve and Colin struggled badly against their second pair (score not to be disclosed).  Colin once again was 
				considering hari kari at end of this rubber and Steve feared for the worst in the second match while wondering if Colin 
				had somehow managed to avoid drowning himself in the Avon while taking some personal time out - but AMAZING things happened 
				at half time.  Colin drank some of that elixir as advertised in Shrek II and came back like donkey turned into stallion 
				AND with his superman underpants carefully worn outside of his normal tennis shorts for the second match.  So against their 
				first pair our gallant boys stormed through to a magnificent 6-0 win in the third set and so did the beer taste like vintage 
				wine and honey (IP coaching manual book 2 verse 3).  So all was set for a 3-1 win until (oh NOOOOOOOOOOO) we managed to lose 
				7-5, 7-5 to their second ("Mr Consistents") pair.<br /><br />
				So a losing draw but we have 17 points which is probably exactly half way to a promotion total in a tight division - and all 
				to play for then in the reverse fixtures.<br /><br />
				Minor correction in that the 3rd set was 6-1 but it was after having lost the 2nd set 6-1 (and after a run losing 9 out of the 
				11 previous games from being 5-1 up in the first).<br /><br />
				It was certainly one of the more surprising winning rubbers I've been involved in over the years, just to show that sporting 
				shocks are possible! <i>(We know that Steve - just look at Wimbledon this year!  Ed.)</i><br /><br />
				The beer did taste good but was limited by having to drive!<br /><br />
				Well played Colin - it was a great turnaround!<br /><br />
				Steve<br /><br />
				(NB We did get a game in both sets of the first rubber, but I admit we didn't play that well!!)<br /><br />
			</p>
			<p class="articleauthor">Cocoa and Slippers Boy/Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Atherstone 2 (Wednesday 11 June, 2008)</u></p>
			<p>
				An excellent week for Hampton men's teams!<br /><br />
				The 2nd team won 4-0 against bottom of the table &amp; struggling Atherstone.<br /><br />
				Well done to Chester Barnes, Ian Poole, Mark Walker &amp; Dave Mountford!<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Sphinx 1  (Wednesday 4 June, 2008)</u></p>
			<div id="stever040608" class="floatleft" style="height:230px;">
				<img src="images/chesterb.jpg" width="125" height="211" alt="2nd team captain makes journalistic debut" />
				<p class="caption">2nd team captain makes journalistic debut<br />...after good match with the 3rd's!</p>
			</div>		
			<p>
				Last week's (this) match was a high quality 2-2 draw as 2nd in the table (us) played 3rd in the table (Sphinx)!<br /><br />
				Ian and Dave managed to win both their rubbers but needed 3 sets to dispose of Sphinx's 2nd pair.<br /><br />
				Mark and Chester played very well, particularly taking Sphinx's 1st pair to 3 close sets, but narrowly went down in both rubbers.<br /><br />
				Next week is a good chance to get back on the winning trail after 2 consecutive draws...<br /><br />
			</p>
			<p class="articleauthor">Steve Ray</p>
		</div>								
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Warwick Tennis Club 2 (Wednesday 21 May, 2008)</u></p>
			<div id="markj050508" class="floatright" style="height:230px;">
				<img src="images/chesterb.jpg" width="120" height="211" alt="Tedious 2-2 draw grates on even the irrepressible Chester" />
				<p class="caption">Tedious 2-2 draw grates on even the irrepressible Chester</p>
			</div>			
			<p>
				Weather report = perfect<br /><br />
				Food report = forgot to put oven on so long wait for gourmet food (pizza) - good job we had the footy to distract us.  
				Boys did better with their greens this week but Walker forgot the dressing.  He has promised not to forget next time. 
				Lets see.<br /><br />
				IP coaching tip of the day = when you finish your first match long before your fellow team mates try watching 30 minutes 
				of the champions league final before you go straight back on court to play your second opponents who were in the groove.  
				You then have an excuse for losing several games in a row at the beginning of the first set of your second match.  
				PS but United were good in the first half were n't they!<br /><br />
				Result = a disappointing 2-2, won by virtue of us having won six more games.  We went for the attacking 4-2-4 formation by 
				splitting up our best pair of IP and Walker in the hope of at least a 3-1 win.  Unfortunately our tactics did not work and 
				unlike messrs Grant and Ferguson we were not able to change formation half way through.  The Warwick first pairing ended up 
				winnning both their matches with a long drawn out 3 setter to start with against Sav and Ian followed by a long drawn out 
				2 setter against me and Walker. It was a good job it did not go to three sets as we finished pretty close to 10pm as it was.  
				When Ian and Sav finished their 3 set win against the Warwick second pair our match stood at 7-6, 1-1 - that tells you how 
				tedious it was!  I have to say that even I found our second match rather boring and not a little frustrating as we failed to 
				convert three set points in the first set and stormed into a 3-0 lead in the second set only to lose 6 on the trot to a pair 
				well adapted to hard court play (ie consistent).  First time I have ever met someone who tried all the time to run round his 
				backhand so that he could play his double handed backhand - presumably he was a left hander forced to play with his right 
				hand when young.<br /><br />
				Injury report - Mia did not break her elbow two weeks ago and was back trampolining within a couple of days.<br /><br />
				That's all for now.<br /><br />
			</p>
			<p class="articleauthor">Chester B</p>
		</div>				
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Nuneaton (14 May 2008)</u></p>
			<div id="markj050508" class="floatleft" style="height:230px;">
				<img src="images/chesterb.jpg" width="120" height="211" alt="Chester tries his hand at journalism" />
				<p class="caption">Cocoa boy dozes on court<br />and watches Rangers on TV</p>
			</div>			
			<p>
				Hello all,<br /><br />
				Weather report excellent.  Court surface report - tarmac.<br /><br />
				Unfortunately it was not such a cheery night as previous weeks so the report will be short - we lost 0-4 to a Nuneaton 
				side who were pretty competent without being exceptional - Rob and I came nearest to earning a point when losing 6-4 
				in the third set in our first match but the other matches were all straight sets so we were able to watch the end of the 
				Rangers match and surprise our respective wives with an early return.<i>(Is that a good thing - you have to ask.  Ed.)</i><br /><br />
				Scout report says that Atherstone are fielding their first team for second team matches at the moment........<br /><br />
				Colin was seen on court after the end of his second match defeat on his mobile phone alledgedly trying to call the 
				Samaritans.......David Margetts provided the moral support.<br /><br />
				Finally, here is the IP Helpful Hint of the Day - when you are following the opposition back from the courts to the after 
				match refreshments pub make sure you don't lose the car you are following (Colin!) unless that is you want to drive round 
				most of Nuneaton looking for a pub next to a canal!<br /><br />
				Cheers boys<br /><br />
				Chester<br /><br />
				PS I am looking forward to Walker's salad dressing kit next week.<br /><br />
			</p>
			<p class="articleauthor">Cocoa and slippers boy</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Beechwood 4 (7 May 2008)</u></p>
			<div id="markj050508" class="floatright" style="height:230px;">
				<img src="images/chesterb.jpg" width="120" height="211" alt="Chester tries his hand at journalism" />
				<p class="caption">Cocoa and Slippers boy tries his hand <br />at journalism- watch out Mark J!</p>
			</div>			
			<p>
			Evening all,<br /><br />
			A second succesful mission for the 2's this evening in beating 3-1 a Beechwood team who finished third in this league last year.  
			So a great start with 7 rubbers out of 8 to date.<br /><br />
			Mark &amp;amp; Colin got great value out of their evening by playing non stop from 6.30 till 9.55.  End result of their labours was 3 sets 
			won and 3 sets lost in two very close three setters and a valuable point earned.  They were disappointed to lose the first match 
			having led by a set and 3-0 - only to lose 8 games on the trot, evntually losing by 7-5 in the third to the Beechword first pairing.  
			Getting good value from their match fee was clearly top of their agenda as they once again had a close third set in the second match - 
			this time coming out on top to make their beer taste nice.  Most important news of the evening for Mark though was a trampolining 
			accident at home which left Mia with a broken elbow having been landed on by her sister - so I hope Mia gets herself well plastered 
			and gets better soon. Hugs.<br /><br />
			Ian and I spent rather less time on court than Mark/Col and so were able to witness Nadal losing (on clay!) to Ferrero and Barcelona 
			getting thumped 4-0 by Real Madrid.  Rijkyard was looking pretty grumpy by the end.  Our first match was straight forward (quote to 
			IP from the oppo after the first game "this is division 4 you know" and "will you be playing the away match".  The second match was 
			more competitive and was a valuable coaching lesson from me on a number of points.  In particular I learnt a few new words of which 
			Gordon ******** Ramsey would be proud not to mention how to show emotion properly following a double fault - I also enjoyed 
			considerably spectating from the back while IP gave a spectacular display of how to volley - one low backhand cross court volley at 
			4-5 in the first set was fabulous.  I feel that my major contibution to the evening was actually the production of a gourmet meal 
			(well pizza and garlic bread actually - and no one ate the greens either - quote from Walker - "well there was no dressing" - so 
			he is bringing it next time).  This spectacular display of chefing required me to heat the kitchen (not just the oven) to saunalike 
			temperature levels largely as a result of the great value which Mark and Col got out of their evenng but also because I had it 
			cranked up to warp factor 7.  Thanks very much to Steve for doing the shopping. As usual the domino boys finished everything - 
			except the greens.....<br /><br />
			Hope you enjoy the report.<br /><br />
			Off for my cocoa and slippers now.<br />
			</p>
			<p class="articleauthor">Chester</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Leamington 5 (30 April 2008)</u></p>
			<p>
				The 2nd team did manage to get their first match against Leamington 4 played last night although we did get a little wet 
				(Understatement of the year). <br /><br />
				The team was Myself &amp; Mark W and then Tony &amp; Chester. As mentioned the rain was intermittent all night and very heavy in a few 
				spells but once your wet your wet so we managed to swim our way around the courts and even better to come out with a 4-0 win.
				So that's the start we wanted Although it wasn't as easy as we may have been expecting with some very close sets and it shows that no matter what 
				league your in, when your away from  home and the weather is against you the standard of the opposition and the advantage of the courts can make 
				things tricky for us.<br /><br />
				Considering the awful conditions last night Tony &amp; Chester seemed to be having a right old tussle with both of the opposition pairings and had some 
				of best the Rallys of the night.  Where as on the other court it was Mr Walker's time to shine with some of the best tennis I've seen him play since 
				last season, Although I haven't seen him practise since last season he must have been doing it in secret as he was solid all night and his serves 
				were faultless so well done to Mr Walker.
				<br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
				<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
			</ul>
		</div>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
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
