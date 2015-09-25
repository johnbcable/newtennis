<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Tournament Finals Day - 2011");
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
			 &nbsp;
		</p>
		<p class="matchreport">
			&nbsp;
		</p>
		<div id="finalsday2011orderofplay">
			 <img alt="Finals Day 2011 Order of Play" src="Images/orderofplay2011.jpg" width="601" />
		</div>
		<p class="matchreport">
			Proceedings kicked off in good time in good weather (alternately sunny and cloudy but no rain (HooRay!). 
		</p>
		<p class="team">
			<span>Mens Singles Plate</span>Phil Turpin v Campbell Oswald
		</p>
		<p class="matchreport">
			Seasoned campaigner Phil Turpin took on Mens Singles Plate finalist-newbie, Campbell Oswald on Court 1
			as the first match of the day. A pretty even first set went to Phil with (effectively) a single break of 
			serve, but the second set saw Campbell falter a little under the relentless onslaught of spin (slice or topspin) 
			and thunderous serve to eventually conceed 6 - 2. 
		</p>
		<p class="result">
			<span>Final score:  6 - 4, 6 - 2.</span>
		</p>
		<p class="team">
			<span>Mixed Doubles Plate</span>Mark Joannides and Karen Vithanage v Dave Betts and Jane Hodge
		</p>
		<p class="matchreport">
			The action on court 3 (the Mixed Doubles Plate finals) was a tense, if ultimately undecided, 
			cat and mouse affair as Mark and Karen edged a first set (6 - 4) but were down 2 - 3 in the 
			second set when Dave's hamstring twanged and he had to retire.
		</p>
		<p class="result">
			<span>Final score:  6 - 4, 2 - 3 (ret).</span>
		</p>
		<p class="team">
			<span>Mens Doubles</span>Sam Peace and Craig Gordon v Mark Joannides and Ian Poole  
		</p>
		<p class="matchreport">
			In action for the second time on the day (actually, third, as Mark and Karen had to play their
			semi-final against Paul Thomas and Deborah Jones earlier in the day) Mark and Ian started an excellent 
			tussle against Sam and Craig, full of good quality tennis (and obligatory tantrums!) - a treat for
			the spectators. Full of all sorts of shots and triockery (yes, there was one through the legs) Sam 
			and Craig eventually edged it in a close second set to win in two. 
		</p>
		<p class="result">
			<span>Final score:  6 - 4,  7 - 5.</span>
		</p>
		<p class="team">
			<span>Ladies Doubles</span>Carol Grant and Jane Hodge vs Kathy Hunt and Terri Mason
		</p>
		<p class="matchreport">
			Back again this year (but still injured!) Carol and Jane were determined this time to complete 
			this match. This year saw them again take on old rivals for this title, Kathy and Terri, and 
			although there were moments, particularly in the second set, when a turnaround looked achievable, 
			Carol and Jane did eventually run out straight sets winners this year.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 6 - 4.</span>
		</p>
		<p class="team">
			<span>Veterans Mens Doubles (over 55's)</span>Malcolm Brumwell and Graham Hollway v Wayman Morris and Ray Barnett
		</p>
		<p class="matchreport">
			Wayman and Ray confidently approached this match hoping to retain the crown they were awarded last year ... but
			they reckoned without the combined might of messrs. Brumwell and Hollway. Malcolm and Graham (both league players 
			in the day) made short work of their opposition in often quite clinical fashion to romp to a straight two-sets
			victory.
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 6 - 2.</span>
		</p>
		<p class="team">
			<span>Ladies Singles Plate</span>Gill Lewis v Jo Oswald
		</p>
		<p class="matchreport">
			After last year's close encounter in this final (with Ruth Fennell) Gill was determined that this year 
			was to be her year and set about first-time finalist Jo right from the start. Played out on Court 3 the 
			superficial pit-pat and politeness hid genuine competitiveness from both ladies whihc ended up giving 
			us (spectators) another match-to-watch. Gill eventaull ran out a straight sets winner.
		</p>
		<p class="result">
			<span>Final score:  6 - 1, 6 - 0.</span>
		</p>
		<p class="matchreport">
			Mid-way through the day, the scheduling logistics for the day were once again under threat - 
			the awards ceremony slated to be at 5.30pm wasnt looking on the cards at all. Maybe a drink, I think?
		</p>
		<p class="team">
			<span>Mixed Doubles</span>Terri Mason and Savio Gaspar v Mark Joannides and Catherine Eley
		</p>
		<p class="matchreport">
			This one was predicted to be close whether in two or three sets, &quot;Super&quot; Mark (Joannides) 
			was again back in action for his third title challenge of the day. Partnered in this match by 
			Catherine who was Mixed Doubles Plate champion along with Paul Roper in 2007, Mark took an early lead 
			in a convincing first-set performance (6 - 2). However, Terri and Savio were made of sterber stuff than 
			that, refusing to roll-over, they just as convincingly rallied and took the second set (6 - 3). Game on! 
			The third set (championship tie break - as used in the Coventry league) didnt disappoint with the lead 
			ding-dong'ing around with serve (mainly) until Savio and Terri just clinched the match at 10 - 8.
		</p>
		<p class="result">
			<span>Final score:  2 - 6, 6 - 3, 10 - 8.</span>
		</p>
		<p class="team">
			<span>Ladies Singles</span>Jane Hodge vs Maria Barnes  
		</p>
		<p class="matchreport">
			The Ladies Singles challenger this year, Maria Barnes, had overcome pretty stiff opposition to reach 
			the finals so a fine match was in prospect against Jane Hodge (in action again!). Despite advice 
			from Chester about how to structure a game against Jane, Maria was determined to play the modern,
			base-line rallying game in her final. The match was played out on Court 4 well away from the clubhouse 
			but the quality and competitiveness of the game looked to disgaree with the eventual scoreline, both players 
			confessing they'd really enjoyed the match when they had finished. 
		</p>
		<p class="result">
			<span>Final score:  6 - 0, 6 - 1</span>
		</p>
		<p class="team">
			<span>Mens Singles</span>Daniel Eccleston v Tony Eccleston
		</p>
		<p class="matchreport">
			After last year's final, between Chester Barnes and Rob Yates, I think it was fair to say that everyone was 
			hoping for a somewhat different type of encounter this time around. Well, they got it! Both Eccleston 
			brothers are superb tennis players and relish the opportiunity to play against each other competitively. 
			The terrace was quite crowded for this one. Both brothers got off to a storming start playing the sort of
			tennis that social players are in awe of - the power and accuracy is quite astonishing and made for an 
			intriguing first half of the first set. One break of serve was all Daniel needed to clinch the first set and we 
			were off into the second. Daniel was quite relaxed and settled in now and his older brother (Tony) couldnt find 
			a chink in his armour, finally losing the second set 6 - 1. Tremendous match - thanks guys!
		</p>
		<p class="result">
			<span>Final score:  6 - 3, 6 - 1.</span>
		</p>
		<p class="team">
			<span>Veterans Ladies Doubles</span>Terri Mason and Carol Grant v Kathy Hunt and Chris Durbin
		</p>
		<p class="matchreport">
			Meanwhile, on a tennis court far, far away, the Veteran Ladies Doubles final got under way. Terri Mason and 
			Carol Grant (who were the existing title holders from 2008, 2009 and 2010) faced opposition from fellow 
			league pairing Kathy Hunt and Chris Durbin. And Kathy and Chris showed that they were to be no pushovers for 
			the current champions by taking a brisk first set 6 - 3. However, Carol and Terri were champions for good 
			reason and promptly replied by taking the second set 6 - 2. All square as we prepared ourselves for a gruelling 
			third set. However, with their momentum recovered, Carol and Terri were not to be denied running out 
			comfortable winners 6 - 0 in the third set.
		</p>
		<p class="result">
			<span>Final score:  3 - 6, 6 - 2, 6 - 0.</span>
		</p>
		<p class="matchreport">
			Last match of the day on Court 1 ... and only over an hour late! Some presentations were done so that 
			players who had evening commitments could get away at a reasonable time. That just left ...
		</p>
		<p class="team">
			<span>Veterans Mens Doubles</span>Mark Walker and Savio Gaspar v Chester Barnes and Steve Ray
		</p>
		<p class="matchreport">
			The old firm of Barnes and Ray (title holders from 2005 - 2008 inclusive) had made an incisive return to 
			lay claim to their old trophy; Mark and Savio (champions since 2009) obviously had other ideas and made 
			sure Steve and Chester knew this in no uncertain terms by taking the first set 6 - 4. Some real grit and 
			determination kicked in for Steve and Chester in the second set and they determinedly took that set 7 - 5 
			after a significantly tiring tussle. A brief debate ensued and then, despite the hour, both sides agreed 
			to play a full third set, not a championship tie-break to get this sorted! And so off we went careering 
			into the third set. Some deft net work by Savio and powerful, accurate serving from Mark eventually took 
			its toll and Steve and Chester collapsed into a third set defeat of 6 - 1 to close the match. 
		</p>
		<p class="result">
			<span>Final score:  6 - 4, 5 - 7, 6 - 1.</span>
		</p>
		<p class="matchreport">
			And so endeth yet another Finals Day. See you all again next year!
		</p>
		<div class="seealso" style="clear: both; margin-top: 10px; border-top: 1px solid black;">
			<h2>See Also:</h2>
			<ul>
				<li><a href="tours.asp?season=2011">Summary results</a></li>
<!--				
				<li><a href="thumbnails.asp?gallery=8">Photo gallery</a></li>
-->				
				<li><a href="tour2011.asp">The route to the finals</a></li>
				<li><a href="juniors/results.html?season=2011">Junior tournament results</a></li>
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
	
	
