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
		<h1>Mens 3rd Team 2010 - Climbing that Ladder</h1>
		<img src="images/stever2.jpg" border="0" alt="Steve Ray - Mens 3rd Team captain" />
		<p>
			Welcome to the diary from the merry men of our Mens 3rd Team for the 2010 season. Smile (or wince - as appropriate) 
			while you warm your cockles with some stirring match reporting. We hope that you're not going to miss out on 3rd team 
			match reports this year - Oh no! If anyone writes about the Mens 3rd Team then read it here.
		</p>
		<p>
			Organised in date order - scroll down to see most recent reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />
				<h2>Sphinx 2 (Away) - Tuesday 27/4/2010</h2>
				<p class="result">
					<span>Result:</span>3-1   Win
				</p>
				<p class="team">
					<span>Team:</span>Steve Ray &amp; Charlie Rickard; Graham Hollway &amp; Rob Yates  
				</p>
				<p class="matchreport">
					 Firstly thanks to Graham who stood in as a late replacement for Chester.
				</p>
				<p class="matchreport">
					 Having played the night before for the 4th team (coincidently also against Sphinx) could my body copy with two games in 24 hours!
				</p>
				<p class="matchreport">
					 There was a sense of deja vu from the previous evening as Steve &amp; Charlie went 0-3 down in the 1st set against their 2nd pair. 
					 Again this position was recovered to pinch the set 7-5 but this time the momentum was maintained as we took the 2nd set with relative 
					 comfort.
				</p>
				<p class="matchreport">
					 Rob &amp; Graham had a very competitive rubber against 2 Coventry University students. After taking the 1st set, Rob &amp; Graham used 
					 all of their experience to come from behind to edge the 2nd set and one of those rare occasions when both rubbers finished at exactly the 
					 same time!
				</p>
				<p class="matchreport">
					 Rob &amp; Graham duly went on to beat the Sphinx 2nd pair, leaving Steve &amp; Charlie to see if the team could get the clean sweep by 
					 beating their 1st pair! It was a competitive rubber with some excellent rallies but we were always playing catch up throughout both sets 
					 and we were eventually beaten to the finish line.
				</p>
				<p class="matchreport">
					 Nevertheless we would have settled for a 3-1 victory at the start of play, so an excellent start to the season. One down, 13 to go!
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Warwick Boat Club 4 (Home) - Monday 3/5/2010</h2>
				<p class="result">
					<span>Result:</span>4-0 win (no show)
				</p>
				<p class="team">
					<span>Team:</span>Mark Walker &amp; Savio Gaspar; Mike Jones &amp; Rob Yates.  
				</p>
				<p class="matchreport">
					 Unfortunately Warwick Boat Club failed to show up at Hampton on Monday night!
				</p>
				<p class="matchreport">
					 This is one of the fixtures affected by an original error in the handbook as issued by the league, but following consultation with 
					 Frank Wilson he was of the view that we had done everything that should reasonably have been expected and "Boat Club has no reason 
					 to expect the match to be re-arranged".
				</p>
				<p class="matchreport">
					 Whilst the preference is to play and win 4-0, Frank is not a person to argue with so we have claimed the 4-0 walkover!
				</p>
				<p class="matchreport">
					 Thanks to Mark Walker, Savio Gaspar (the only match he can make this season!), Mike Jones and Rob Yates for turning up on a Bank Holiday.
				</p>
				<p class="matchreport">
					 Extra gratitude to Mike Jones who went to the trouble of preparing the match supper, and normally Mike's match suppers are not to be missed!! 
				</p>
				<p class="matchreport">
					 <strong>Additional note from Savio:&nbsp;</strong>Mikes supper ( scampi ,chips and cheesecake!) was thoroughly enjoyed by our family , 
					 the girls especially liked the dessert so every cloud..........!!<br /><br />
					 Cheers<br />
					 Savio
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Beechwood 5 (Away) - Friday 14/5/2010</h2>
				<p class="result">
					<span>Result:</span>2-2 Draw
				</p>

				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Chester Barnes; Nigel Jones &amp; Rob Yates  
				</p>
				<p class="matchreport">
					Some great tennis played by both teams with both Hampton pairs beating the Beechwood 
					second pair, albeit Jonny & Chester having a tie break in the 1st set and Nigel & Rob 
					resorting to a 3rd set tie break!
				</p>
				<p class="matchreport">
					 The Beechwood 1st pair were a tougher nut to crack but they were run close by both 
					 Hampton pairs with Chester &amp; Jonny particularly disappointed to lose a 2nd set tie 
					 break from 6-4 up that would have lead to the lottery of the Championship tie-break. 
					 Not the best outcome, but watching from the sidelines there was some quality tennis 
					 played in a very high calibre match!
				</p>

				<p class="matchreport">
					 Nevertheless the 3rd team unbeaten run continues - 2 wins and now a draw...... 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>

				<a name="match4" id="match4" />
				<h2>Berkswell 3 (Home) - Monday 17/5/2010</h2>
				<p class="result">
					<span>Result:</span>2-2 Draw
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>

				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match5" id="match5" />
				<h2>Berkswell 4 (Away) - Monday 24/5/2010</h2>
				<p class="result">
					<span>Result:</span>2 - 2 Draw
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt and Steve Ray, Rob Yates and Nigel Jones
				</p>
				<p class="matchreport">
					Last week we staged a terrific comeback against Berkswell 3 with Steve &amp; Rob winning a 
					dramatic 3rd set tie break 14-12 against their 1st pair that contained at least one Berkswell 
					2 player.
				</p>
				<p class="matchreport">
					 This week we played Berkswell 4 but there were strange goings on!
				</p>

				<p class="matchreport">
					 Berkswell 3 were at home on the same night but rather bizarrely the Berkswell 3 team (against Sphinx) 
					 was a lot weaker than the Berkswell 4 team playing us with a member of their 1st pair last week 
					 supplemented by a player who openly admitted to normally playing Berkswell 1 and 2, although the 
					 standard of his play was more the latter! We think that privately they were more than a bit disappointed 
					 that they didn't win last week and were still smarting....
				</p>
				<p class="matchreport">
					 Jonny Hunt &amp; Steve Ray played as the 1st pair but, despite playing well, the Berkswell pair were stronger 
					 although at 4-4 in the 2nd set at least we gave them a bit to think about before going down 6-2 6-4.
				</p>
				<p class="matchreport">
					 Rob Yates &amp; Nigel Jones managed to nick the 1st set in their match on a tie break before winning the 2nd 
					 set more comfortably.
				</p>
				<p class="matchreport">
					 Hence, so long as the form book was maintained the odds were on a draw.
				</p>
				<p class="matchreport">
					 Having play pretty well in the 1st rubber despite losing, Jonny &amp; Steve were confident and completely 
					 relaxed in the 2nd rubber and had a bit of fun in winning 6-0 6-2.
				</p>
				<p class="matchreport">
					 Rob &amp; Nigel put up a brave fight in their reverse rubber but the heroics of the previous week couldn't 
					 be repeated!
				</p>
				<p class="matchreport">
					 Whilst Berkswell 4 didn't lose, the overall tactic backfired as Berkswell 3 did lose 3-1 to Sphinx!
				</p>
				<p class="matchreport">
					 Another week goes by without defeat - it's now 2 wins and 3 draws. 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match6" id="match6" />
				<h2>Leamington 6 (Away) - Tuesday 8/6/2010</h2>

				<p class="result">
					<span>Result:</span>4 - 0  Win
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Steve Ray; Nigel Jones &amp Rob Yates
				</p>
				<p class="matchreport">
					 As Leamington were bottom of the table having only won 2 rubbers from their first 
					 5 fixtures and with us joint 2nd, we went there expecting victory and that's 
					 what we got!
				</p>
				<p class="matchreport">
					 However, the standard of their first pair was much better than we were expecting and 
					 they took the first set against Jonny &amp; Steve 6-3. Hampton hit back to take the 2nd 
					 set 6-3 and so it was down to the 3rd set tie break (again)! Leamington regained their 
					 momentum in the tie break and at 5-9 down the dreams of a 4-0 victory were virtually over, 
					 or were they!! We clawed our way back to 9-9 but then went 9-10 before taking it in dramatic 
					 fashion 12-10! Whilst the quality of the tennis wasn't quite as high as the 14-12 victory 
					 achieved by Steve &amp; Rob against Berkswell a couple of weeks back, the drama of it was probably 
					 greater leaving the opposition absolutely gutted!				
				</p>
				<p class="matchreport">
					 Nigel &amp; Rob beat the Leamington 2nd pair who were more the standard we were expecting to be 
					 facing! Jonny &amp; Steve similarly beat the 2nd pair in reasonably quick time [before Rob &amp; Nigel 
					 had finished the 1st set of their 2nd rubber].
				</p>
				<p class="matchreport">
					So 3 rubbers on the board; could Rob &amp; Nigel beat their 1st pair?
				</p>
				<p class="matchreport">
					 They edged a very close 1st set 7-5 but then lost the 2nd set so it was down to another 3rd set 
					 tie break! Not sure how Rob &amp; Nigel felt but, stood on the sidelines, Jonny &amp; Steve were absolutely 
					 convinced we would win. Following the events earlier in the evening, the opposition looked beaten 
					 in the tie break before they had even started. Rob tried to prove us wrong by starting the tie 
					 break with a double fault (sorry for mentioning that Rob) but Hampton took the next 5 points in 
					 succession and subsequently closed out the match quite comfortably!
				</p>
				<p class="matchreport">
					Well played guys!
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Coventry and North Warwicks 3 (Home) - Monday 14/6/2010</h2>
				<p class="result">
					<span>Result:</span>3 - 1  Win
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Chester Barnes; Nigel Jones &amp; Rob Yates
				</p>
				<p class="matchreport">
					 A good win that was almost a 4-0 but unfortunately Nigel &amp; Rob lost out 
					 in a 3rd set tie break in the final rubber against their first pair!
				</p>
				<p class="matchreport">
					 The halfway stage of the season has been reached and the 20 points gained from 
					 the 7 matches represent an excellent tally that will certainly put us in one of 
					 the top two positions and, if repeated in the 2nd half of the season, would 
					 guarantee promotion!
				</p>
				<p class="matchreport">
					 The league tables still only show the positions after 5 matches where we were 
					 2 points adrift of the leaders Sphinx but with our last 2 results being a 4-0 
					 and a 3-1 we must be running them close 
				</p>

				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Sphinx 2 (Home) - Monday 21/6/2010</h2>
				<p class="result">
					<span>Result:</span>3 - 1  Win
				</p>
				<p class="team">
					<span>Team:</span>Graham Hollway &amp; Steve Ray; Rob Yates &amp; Nigel Jones
				</p>
				<p class="matchreport">
					 A good result but, to be fair, Sphinx were nowhere near as strong as the first 
					 match of the season now that the Coventry University students have returned home!
				</p>
				<p class="matchreport">
					Graham was having to carry a bit of a passenger tonight with the skipper not having 
					one of his better nights, particularly in the first rubber! We lost the first set 
					and although we convincingly won the 2nd set 6-1 the 3rd set tie break didn't 
					go our way! Sorry Graham!
				</p>
				<p class="matchreport">
					Meanwhile Rob &amp; Nigel had a very close battle against the Sphinx 2nd pair eventually 
					winning 7-6 6-4.
				</p>
				<p class="matchreport">
					I was a bit more consistent in the second rubber [but with Graham still doing more 
					than his fair share] as we won reasonably comfortably 6-2 6-2.
				</p>
				<p class="matchreport">
					So it was down to Rob &amp; Nigel to do what Steve &amp; Graham should have done and beat 
					their first pair. It was a classic game of momentum swing as Hampton took the first 
					set 6-2 but then lost the 2nd by the same score. As a team we don't do easy wins, 
					so it was all down to the 3rd set tie-break but the momentum changed again with 
					Rob &amp; Nigel triumphing 10-5; a win that improved the mood of the captain no end!
				</p>
				<p class="matchreport">
					So over the last two weeks we have beaten the two teams that, together with us were 
					joint top of the league after 6 fixtures. 
				</p>
				<p class="matchreport">
					Special mention for Rob Yates in playing 8 successive fixtures - normally we are 
					lucky if he does that many all year! However, he does have a diary clash next week 
					- can he organise himself to keep the run going? 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match9" id="match9" />
				<h2>Warwick Boat Club 4 (Away) - Tuesday 29/6/2010</h2>

				<p class="result">
					<span>Result:</span>2 - 2 Draw
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Matt Hunt; Mike Jones &amp; Steve Ray   
				</p>
				<p class="matchreport">
					A beautiful venue, an excellent match supper and, overall, a pretty good result to preserve 
					our unbeaten record!
				</p>
				<p class="matchreport">
					Warwick Boat put out a pretty strong team fielding 2 county veterans and a "last minute substitute 
					due to late withdrawal" who was arguably the best player of their four.
				</p>
				<p class="matchreport">
					However Jonny &amp; Matt were on fire tonight, regularly hitting the lines (instead on the back fence!!). 
				</p>
				<p class="matchreport">
					Despite the quality of the opposition, Jonny &amp; Matt only conceded 8 games all evening; a fantastic 
					performance (they played so well they were accused, in a polite way, of being far too good for this 
					Division which was a bit rich given their team).
				</p>
				<p class="matchreport">
					Mike and Steve played to a reasonable standard. In both matches they had their chances in very tight 
					first sets that on each occasion reached 4-4 before the standard and consistency of the opposition 
					eventually made the difference. 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match10" id="match10" />
				<h2>Beechwood 5 (Home) - Monday 5/7/2010</h2>
				<p class="result">
					<span>Result:</span>4 - 0  Win
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Chester Barnes; Mike Jones &amp; Steve Ray  
				</p>
				<p class="matchreport">
					We turned up tonight expecting a really tough match, as I believe that by the end of the season Beechwood 
					and Warwick Boat will be our closest challengers for promotion.
				</p>
				<p class="matchreport">
					The Beechwood faces were all familiar foes and after 45 minutes things were all finely balanced Jonny & 
					Chester at 5-5 in their first set and Nigel & Steve had clawed their way back from 0-3 to force a tie break 
					in their first set.
				</p>
				<p class="matchreport">
					The tie break wasn't going according to plan at 3-6 down but then the complexion of the whole evening changed. 
					Steve & Nigel won 5 consecutive points to steal the tie break and at the same time Jonny & Chester took the 
					last two games of the first set to take that 7-5. 
				</p>
				<p class="matchreport">
					The rest of the evening was remarkable for the surprising ease with which we won, with the Hampton boys just 
					playing good solid tennis! 
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match11" id="match11" />
				<h2>Berkswell 3 (Away) - Monday 12/7/2010</h2>
				<p class="result">
					<span>Result:</span>2 - 2  Draw
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Matt Hunt; Nigel Jones &amp; Rob Yates   
				</p>
				<p class="matchreport">
					 In spite of the best endeavours by Berkswell 3, who have been quickly climbing the table over the last 
					 few weeks, our unbeaten record has been preserved but it was a close run thing!
				</p>
				<p class="matchreport">
					Every time we play Berkswell, Graham (their skipper) seems to find a better partner to play with [he also 
					played for Berkswell 4 against us].
				</p>
				<p class="matchreport">
					Fortunately, we had Matt & Jonny in our side tonight and they were strong enough to win both their rubbers. 
					The second rubber was 11-9 in a 3rd set tie-break, recovering from 0-5 down!
				</p>
				<p class="matchreport">
					(Jonny got a bit excited and started celebrating at 9-9 and Matt claimed he was more focused after hearing Nigel 
					say to Rob that we were about to lose the match 3-1 and with that lose our unbeaten record - good psychology 
					Nigel, you can be captain next year with those motivational skills!!).
				</p>
				<p class="matchreport">
					Not such a great night on court for Rob & Nigel this evening (and a good match for the captain to have a rest!) 
					but no worries; given where we are in the league a 2-2 draw is a good result. 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match12" id="match12" />
				<h2>Berkswell 4 (Home) - Monday 19/7/2010</h2>

				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match13" id="match13" />
				<h2>Leamington 6 (Home) - Monday 26/7/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>

				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match14" id="match14" />
				<h2>Coventry and North Warwicks 3 (Away) - Thursday 5/8/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>

				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

		</ol>		
		<h2>See Also:</h2>
		<ul>
			<li><a href="mens3rdteamblog2009.asp">Mens 3rd Team diary from 2009</a></li>
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
