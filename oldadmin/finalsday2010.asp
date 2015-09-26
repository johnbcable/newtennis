<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Home Page");
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
		<h1>Tournament:&nbsp;<b>Finals Day 2010</b></h1>
		<div id="finalsday2010collage" class="collage">
			 <img alt="Finals Day 2010" src="Images/finalsday2010_collage.jpg" width="694" height="200">
		</div>
		<p class="leader">
			Third singles title for Chester; new ladies singles champion; mega-length matches, mid-match scratches 
			and the last match standing finishing after everyone had gone (well, not quite)! And, the juniors show us
			how it really should be done!
		</p>
		<p class="matchreport">
			The weather was kind to us again this year on club Finals Day - warm and dry with some (welcome) 
			occasional clouding over as the afternoon turned to evening. The (as it turned out, purely aspirational) order of 
			play for the day was:
		</p>
		<div id="finalsday2010orderofplay">
			 <img alt="Finals Day 2010 Order of Play" src="Images/orderofplay2010.jpg" width="601" height="303">
		</div>
		<p class="matchreport">
			Proceedings kicked off in good time with the Ladies Singles on court 1, the mens super-veterans, over 55 doubles, 
			challenge Wayman match on centre court and the finals of the Mixed Doubles Plate on court 3. No match was without 
			its drama. 
		</p>
		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Katie Marsdin  
		</p>
		<p class="matchreport">
			Ladies Singles challenger, Katie Marsdin, moved ahead from mid-way in the first set against Jane Hodge 
			to close out that set at 6-3. At this stage the tennis was quite tentative but Katie managed to up 
			her game again in the second set, eventually winning in two straight sets.
		</p>
		<p class="result">
			<span>Final score:  6 - 7, 6 - 3, 6 - 1</span>
		</p>
		<p class="team">
			<span>Veteran Mens Doubles (Over 55)</span>Joe Killeen and Ian Wasse vs Wayman Morris and Ray Barnett  
		</p>
		<p class="matchreport">
			Not so short-lived for the other two finals in progress at the same time. The Veterans Mens Doubles (Over 55) 
			saw Joe Killeen and Ian Wasse take an early one-set lead on a tie-break, only to lose out in the second set 
			6 - 3 to Wayman Morris and Ray Barnett. All to play for then in the final set. The final set was more 
			straightforward for Wayman and Ray, completing their victory 6 - 1 after over 2 hours on court.
		</p>
		<p class="result">
			<span>Final score:  6 - 3,  6 - 0.</span>
		</p>
		<p class="team">
			<span>Mixed Doubles Plate</span>Carol Grant and Campbell Oswald vs Geoff Redfern and Catherine Eley
		</p>
		<p class="matchreport">
			The action on court 3 (the Mixed Doubles Plate finals) was also no picnic, taking close to 3 hours to 
			complete. Injured Carol Grant saw herself and Campbell Oswald take the first set 6 - 4, despite Carol 
			taking a (tapped) volley in the face during a particularly length exchange with Geoff Redfern and 
			Catherine Eley. The second set was hard fought for again, eventually seeing Geoff and Catherine take it 7 - 6
			on a tie break. Again, all to play for in  the third set, as this appeared to be going with serve (from the 
			long-distance vantage point of the club terrace) encompassing some great reflex actions from Campbell in a
			3 hit exchange with Geoff right at the net, the point eventually going to Carol and Campbell. In the end, 
			only one break of serve was necessary for Carol and Campbell to see off Geoff and Catherine at 6 - 4.
		</p>
		<p class="result">
			<span>Final score:  6 - 4, 6 - 7, 6 - 4.</span>
		</p>
		<p class="matchreport">
			At this stage, the scheduling logistics for the day were seriously under threat - the awards ceremony slated
			to be at 5.30pm wasnt looking on the cards. Another drink, I think.
		</p>
		<p class="team">
			<span>Mens Singles</span>Chester Barnes and Rob Yates
		</p>
		<p class="matchreport">
			Next up on centre court was the second premier event of the day (the first being the Ladies Singles final) 
			which was, unsurprisingly, the Mens Singles Final. Contested this year by twice-winner (2004 and 2005), 
			Chester Barnes, along with fellow league team player Rob Yates. Both players were good technically and each had 
			a grab-bag of amusing little trickery that they have uleashed on us poor mortals in the past - a good, tightly 
			contested match was in the offing. However, it was not to be. Both players seemed to concentrate on not-losing 
			rather than on winning which resulted in a long (3-hours+) match with little to commend it to the faithful 
			who were watching. Chester eventually ran out the winner in 3 long sets, Rob sustaining a leg injury when he 
			was up 6 - 5 in the final set. Both men were knackered when they came off court. When receiving his award, 
			Chester did apologise profusely to the audience for the lack of spectacle in this match. You do what you need 
			to do, I imagine.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 4 - 6, 6 - 8.</span>
		</p>
		<p class="team">
			<span>Ladies Singles Plate</span>Ruth Fennell vs Gill Lewis
		</p>
		<p class="matchreport">
			Meanwhile, another close encounter was in progress on court 4 - the Ladies Singles Plate match contested 
			this year between Ruth Fennell and Gill Lewis. While the audience remained enthralled with the Mens Singles 
			Final, this match was running it close for longevity. Gill took a closely fought first set before losing the 
			second set to Ruth and setting us up for yet another 3-set'ter. The finale set was eventually won by Ruth after 
			she and Gill had been on court for over two hours.
		</p>
		<p class="result">
			<span>Final score:  5 - 7, 6 - 3, 6 - 2.</span>
		</p>
		<p class="matchreport">
			The schedule! The schedule!
		</p>
		<p class="team">
			<span>Veterans Mens Doubles</span>Rob Yates and Nigel Jones vs Mark Walker and Savio Gaspar
		</p>
		<p class="matchreport">
			Centre court next hosted the Veterans Mens Doubles final between league pair Rob Yates and Nigel Jones 
			(after Rob had a few minutes rest!) and last year's winning pairing of Mark Walker and Savio Gaspar. You 
			almost wanted this to complete in two sets so we could get back on track - and the guys didn't disappoint. 
			Rob and Nigel took too long to get into their normal rhythmn, losing the first set 6 - 0 before rallying 
			a little as the second set got nunder way. But it was a short-lived recovery as they eventually lost the 
			second set 6 - 2.
		</p>
		<p class="result">
			<span>Final score:  6 - 0, 6 - 2.</span>
		</p>
		<p class="team">
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant vs Wendy Jones and Colette Thomson
		</p>
		<p class="matchreport">
			Meanwhile, on court 3, the Veteran Ladies Doubles final got under way. Terri Mason and Carol Grant (who were 
			the existing title holders from 2009 and 2008) faced opposition from fellow league pairing Wendy Jones and
			Colette Thomson. Despite Carol's injury and the usual crop of spectacularly failed shots (well, it is usual 
			at Hampton finals days) Carol and Terri moved into a one-set lead closing the first set at 7 - 5. The 
			second set moved along briskly with the existing champions once again running out worthy winners.
		</p>
		<p class="result">
			<span>Final score:  7 - 5, 6 - 0.</span>
		</p>
		<p class="team">
			<span>Mens Doubles</span>Ian Poole and Tony Eccleston vs Sam Peace and Jonny Hunt
		</p>
		<p class="matchreport">
			Court 1 now played host to the &quot;Battle of the Titans&quot; that was the Mens Doubles final. The two coaches 
			(Ian Poole and Sam Peace) were each partnered by other 1st and 2nd team players - Tony Eccleston (with Ian) 
			and Jonny Hunt (with Sam). Now this was proper tennis - no need to set your alarm for a wake-up call. Both 
			sides went at it with gusto, with both outright power shots and extremely accurate pushes - and hardly a 
			tantrum in sight! Ian and Tony had a difficult job in the first set, eventually closing it out at 7 - 5. Jonny 
			and Sam werent able to generate the same level of trouble for Ian and Tony in the second set, eventually 
			losing that one 6 - 1.
		</p>
		<p class="result">
			<span>Final score:  7 - 5, 6 - 1.</span>
		</p>
		<p class="team">
			<span>Ladies Doubles</span>Carol Grant and Jane Hodge vs Lucy Wasse and Katie Marsdin
		</p>
		<p class="matchreport">
			While this was under way, Jane Hodge and Carol Grant (injured and in her third final of the day) were facing 
			new challengers (Katie Marsdin and Lucy Wasse) for the Ladies Doubles title. Carol and Jane had won this title 
			in 2008 and 2009 but were no match this time around for their challengers, losing the first set 6 - 3. During 
			the second set, Carol sustained a further injury (to add to her initial wrist problems and the earlier in the 
			day volley-in-the-face), this time to her leg/ankle. This time, the damage was too much and Carol had to withdraw 
			from this match at 2 - 2 in the second set, therefore ceding the match to Katie and Lucy.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 2 - 2 (scratched after injury).</span>
		</p>
		<p class="team">
			<span>Mixed Doubles</span>Lucy Wasse and Mark Joannides vs Ian Poole and Emma Shalley
		</p>
		<p class="matchreport">
			The single positive outcome from Carol having to withdraw from the Ladies Doubles final was that this then released 
			Lucy Wasse to take part in the final of the Mixed Doubles (with Mark Jonnides) against Ian Poole and Emma Shalley. 
			This match looked as if it had legs as well, the first set only being resolved at 7 - 5 to Lucy and Mark. 
			Surprisingly, the scond set was to be fairly plain sailing for Lucy and Mark who eventually ran out winners at 6 - 0.
		</p>
		<p class="result">
			<span>Final score:  7 - 5, 6 - 0 (scratched after injury).</span>
		</p>
		<p class="team">
			<span>Mens Singles Plate</span>Paul Thomas vs Charlie Rickard
		</p>
		<p class="matchreport">
			At this point, already almost an hour late with the awards, it was decided to present the awards for most of 
			the matches - leaving only the Mens Singles Plate wending it lonely way onwards on court 1, between Paul Thomas 
			and Charlie Rickard. And wouldnt you know it, this one also turned out to be a 3 set'ter, despite the best efforts 
			of Paul Thomas in the second set tie-break to close it out. In front of a dwindling (dwindled?) crowd, Charlie and 
			Paul treated us to a good mix of serve and volley, passing shots and lobs throughout the match, culimnating in 
			Paul taking the third set (and the match) at approaching 8.00pm!
		</p>
		<p class="result">
			<span>Final score:  7 - 5, 6 - 7, 6 - 3.</span>
		</p>
		<div class="seealso" style="clear: both; margin-top: 10px; border-top: 1px solid black;">
			<h2>See Also:</h2>
			<ul>
				<li><a href="tours.asp?season=2010">Summary results</a></li>
				<li><a href="http://www.flickr.com/photos/103781054@N07/sets/72157636092720576/">Photo gallery</a></li>
				<li><a href="tour2010.asp">The route to the finals</a></li>
				<li><a href="juniors/results.html?season=2010">Junior tournament results</a></li>
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
	
