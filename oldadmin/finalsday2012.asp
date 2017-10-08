<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Tournament Finals Day - 2012");
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
		<h1>Tournament:&nbsp;<b>Finals Day 2012</b></h1>

		<div id="finalsday2012collage" class="collage">
			 <img alt="Finals Day 2012" src="Images/finalsday2012_collage.jpg" width="700" height="200">
		</div>
		<p class="leader">
			 &nbsp;
		</p>

		<p class="matchreport">
			&nbsp;
		</p>
		<div id="finalsday2012orderofplay">
			<p>
				The order of play for the 2012 finals and the on-the-day report is shown below
			</p>
			 <img alt="Finals Day 2012 Order of Play" src="Images/orderofplay2012.jpg" width="601" />
		</div>
		<p class="matchreport">
			Proceedings kicked off in good time in good weather (alternately sunny and cloudy but no rain (HooRay!). 
		</p>
		<p class="team">
			<span>Ladies Singles Plate</span>Sally Leach vs Jo Oswald
		</p>
		<p class="matchreport">
			Opening proceedings on Court 3 (after losing the toss to Jane Hodge and Carol Grant as to who should
			remain out of sight on Court 4), this year once again saw last year finalist, Jo Oswald, take on a new 
			challenge this year in the form of Sally Leach. Despite very close games with multiple deuces (and an 
			impromptu success dance from Jo after a winning shot she was particularly proud of), Sally 
			eventually ran out a straight sets winner over second-time finalist Jo.
		</p>
		<p class="result">
			<span>Final score:  6 - 1, 6 - 4.</span>
		</p>
		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Carol Grant  
		</p>
		<p class="matchreport">
			The legendary ladies doubles pairing were set to face each other this year in the Ladies Singles final.
			Electing to play on Court 4, it was level pegging at 2-2 in the first set but, from then on, although 
			all games were difficult and each player did make mistakes (nice temper tantrum after one particular forehand
			into the net, Jane!), Jane ran out the eventual winner in straight sets.  
		</p>
		<p class="result">
			<span>Final score:  6 - 2, 6 - 0</span>
		</p>
		<p class="matchreport">
			At this point in the day, the threatened rain descended with a vengeance and the next matches withdrew to the 
			safety of the clubhouse for a while. Anyway, tea, coffee and cakes were on the go so no-one really minded taking 
			a break and watching Serena Williams bulldoze her way through the first set in the Wimbledon Ladies Singles final. 
			With the old courts, after a downpour like this one, we would not have been in a position to play again that day 
			as the surface puddling would not have drained away. With our new Euroclay court surface, however, we were able to 
			resume approx. 40 minutes behind schedule.
			<br /><br />
			Next up: Men's Singles Plate, Mixed Doubles Plate and Ladies Veterans Doubles.
		</p>
		
		<p class="team">
			<span>Mens Singles Plate</span>Mark Walker vs Andy Frith
		</p>
		<p class="matchreport">
			This year's tournament has seen a return of quality players competing for all titles. This title was no exception. 
			Mark Walker, the seasoned league campaigner for the Mens teams, was taking on the "gourmet of the league" in Andy 
			Frith (very nice ribs, by the way). Relegated to Court 4 as there was an amount of umm'ing and aah'ing around 
			deciding how best to use Court 1, the qaulity of the tennis on display in this match definitely raised the bar 
			for the Mens Singles Plate for next year. A close fought contest but Mark mercilessly ground Andy down 
			to run out the winner in 3 (long) sets. 
		</p>
		<p class="result">
			<span>Final score:  5 - 7, 6 - 3, 6 - 1</span>
		</p>
		<p class="team">
			<span>Mixed Doubles Plate</span>Emma Shalley and Gabor Prudencio vs Karen Vithanage and Paul Thomas
		</p>
		<p class="matchreport">
			The action on centre court (Court 2) was a tactical cat and mouse affair much the same as last year's final. 
			Last year's Winners (Mark and Karen) were challenged from the off by the "Young Guns" - Emma and Gabor.
			Emma and Gabor eventually ran out winners in a ding-dong match that see-sawed between the pairs, Emma and Gabor 
			taking the first, Mark and Catherine strongly coming back and storming through the second set but then eventually 
			succumbing to the one-break-of-serve pitfall in the third set. Well played to Emma and Gabor.
		</p>
		<p class="result">
			<span>Final score:  7 - 5, 2 - 6, 6 - 4</span>
		</p>
		<p class="team">
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant vs Kathy Hunt and Wendy Jones
		</p>
		<p class="matchreport">
			Meanwhile, on Court 3, the Veteran Ladies Doubles final got under way. Terri Mason and 
			Carol Grant (who were the existing title holders since 2008) faced opposition from fellow 
			league pairing Kathy Hunt and Wendy Jones. However, Carol and Terri were champions for good 
			reason and were not to be denied running out eventual winners in straight sets.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 6 - 1</span>
		</p>
		<p class="team">
			<span>Veterans Mens Doubles (over 55's)</span>Malcolm Brumwell and John Cable vs Wayman Morris and Ray Barnett
		</p>
		<p class="matchreport">
			Due to the slightly late arrival of Daniel (Eccleston) for his Wayman and Ray confidently approached this match hoping 
			that with Graham (Hollway) gone this would be an easy one to claim in order to win back the crown that they lost last year
			 ... but messrs. Brumwell and Cable were having none of that and raced to a 3-0 lead in the first set, which thereafter went 
			almost with serve to end up 6-3 to Malcolm and John. The second set resumed with business as usual (seemingly) from the 
			first set winners and then Wayman and Ray started to gel, eventually running out set winners in the second set. 
			With Malcolm being the oldest of the bunch on court, and John being by far the laziest, you can imagine that this was 
			unwelcome news for the first set winners. After a brief comfort break, and an "if it isn't broke don't fix it" type of 
			tactical talk, Malcolm and John tore into Wayman and Ray (who for some reason had gone all tentative again) and took 
			the third set reasonable comfortably .. and everyone then headed off to the bar!
			victory.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 4 - 6, 6 - 1.</span>
		</p>
		<p class="team">
			<span>Mens Singles</span>Josh Crisp-Jones vs Daniel Eccleston
		</p>
		<p class="matchreport">
			After last year's final, between Daniel and Tony, I think it was fair to say that everyone was geared up
			for another display of tennis prowess in the Men's Singles Final. Josh had put Tony (Eccleston) out earlier in 
			the competition and Daniel also had to go past 1st team colleague, Rich Westman, on his way to the glory day that is 
			Hampton Mens Singles Final. And the match did not disappoint. Both players are fiery and talented but each kept the lid 
			on it when shots didn't go the way they would have wished. If anyone thought this was going to be the year exclusively 
			of baseline rallies between these two, then they were sadly mistaken, both players making use of drop shots (even the 
			famous Murray Dink at times) to provide us all with a brilliant display of tennis. Power, accuracy and subtlety - all
			there in equal measures from both players. Josh managed to take the first set and then moved into a higher confidence level
			for the second set, eventually running out as winner in two straight sets. Tremendous match - thanks guys!
		</p>
		<p class="result">
			<span>Final score:  7 - 6, 6 - 3</span>
		</p>
		
		<p class="team">
			<span>Ladies Doubles</span>Terri Mason and Wendy Jones vs Jane Hodge and Carol Grant
		</p>
		<p class="matchreport">
			Back again this year Carol and Jane were determined this time to make sure and regain the title. 
			This year saw them again take on old rival Terri Mason now partnering Wendy Jones in the final
			for this title and although there were moments Terri and Wendy did eventually run out straight sets 
			winners this year.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 6 - 4</span>
		</p>
		<p class="team">
			<span>Mixed Doubles</span>Terri Mason and Savio Gaspar vs Mark Joannides and Catherine Eley
		</p>
		<p class="matchreport">
			A re-run of the 2011 final, this was always going to be close as Savio and Terri fought to take 
			the crown won last year by Mark and Catherine. This one was predicted to be close whether in two 
			or three sets, Mark (Joannides) was in action for his first title challenge of the day. Resuming 
			last year's successful partnership with Catherine, Mark attempted to stamp his authority on the match 
			in a hard fought 1st set. However, Terri and Savio were made of sterner stuff than 
			that, they weathered this storm and settled in for a hard-fought cat and mouse affair, eventually 
			running out winners in three sets.
		</p>
		<p class="result">
			<span>Final score:  2 - 6, 6 - 3, 6 - 3</span>
		</p>
		<p class="team">
			<span>Veterans Mens Doubles</span>Graham Hollway and Paul Thomas vs Mark Walker and Savio Gaspar
		</p>
		<p class="matchreport">
			Not in the Over 55's this year, Graham Hollway set about proving that he didnt need to play the age 
			card to get a title. Playing with fellow league player Paul Thomas, they set about last years winners 
			right from the off. Must have frightened them as they took the first set quite comfortably. Mark and 
			Savio rallied during the second set which was a much more even affair, although Graham and Paul did 
			run out winners in the end.
		</p>
		<p class="result">
			<span>Final score:  6 - 2, 7 - 5</span>
		</p>
		<p class="team">
			<span>Mens Doubles</span>Josh Crisp-Jones and Ollie Plaskett vs Richard Allen and Richard Westman  
		</p>
		<p class="matchreport">
			The last tournament match to complete and what a cracker it was. Showcasing the wealth of talent Hampton 
			now has in its 1st team squad, Josh and Ollie were determined to put in good showing against the Richards 
			... and we were off! Josh must have been tired from his earlier workout with Daniel but that wasnt at all
			obvious as he and Ollie ground their way to the tile, completing at nearly 7.00pm. Again no baseline rallies 
			and the surreal view of these 4 top hitters gradually getting closer to the net and then trying to trick 
			each other with deft flicks of the racquet, each pair reluctant to go for the lob in case it was smashed back 
			or the passing shot in case it went long/live. Doubles is supremely tactical and, when played with this skill 
			and power, a joy to watch. Who needs Wimbledon - we'll sell tickets for this next year! Thanks for the 
			display guys - truly awesome.  
		</p>
		<p class="result">
			<span>Final score:  6 - 4, 7 - 5</span>
		</p>
		<p class="matchreport">
			And so endeth yet another Finals Day - everybody happy but late again! A quick thank you to everyone who 
			helped organise and run the day - incl. super chef Andy Frith for another sterling performance 
			on the BBQ (your culinary supremacy remains intact!) and everyone who made and supplied the delicious cakes 
			- we were all VERY greedy with them 'cos they were great! See you all again next year!
		</p>
		<div class="seealso" style="clear: both; margin-top: 10px; border-top: 1px solid black;">
			<h2>See Also:</h2>
			<ul>
				<li><a href="tours.asp?season=2012">2012 Summary results</a></li>
				<li><a href="http://www.flickr.com/photos/103781054@N07/sets/72157636080968576/">Photo gallery</a></li>
				<li><a href="tour2012.asp">The route to the 2012 finals</a></li>
				<li><a href="juniors/results.html?season=2012">Junior tournament results for 2012</a></li>
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
	
	
