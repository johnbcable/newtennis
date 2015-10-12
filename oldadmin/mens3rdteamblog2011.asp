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
		<h1>Mens 3rd Team 2011 - Climbing that Ladder</h1>
		<img src="images/stever2.jpg" border="0" alt="Steve Ray - Mens 3rd Team captain" />
		<p>
			Welcome to the diary from the merry men of our Mens 3rd Team for the 2011 season. Smile (or wince - as appropriate) 
			while you warm your cockles with some stirring match reporting. We hope that you're not going to miss out on 3rd team 
			match reports this year - Oh no! If anyone writes about the Mens 3rd Team then read it here.
		</p>
		<p>
			Organised in date order - scroll down to see most recent reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />

				<h2>Esporta Health and Rackets Club 3 (Away) - Wednesday 27/4/2011</h2>
				<p class="result">
					<span>Result:</span>2 : 2   (Draw)
				</p>
				<p class="team">
					<span>Team:</span>Nigel Jones &amp; Rob Yates; Mark Joannides &amp; Xander Barnes  
				</p>
				<p class="matchreport">
					 After promotion last year, a solid start to the new season was required!
				</p>
				<p class="matchreport">
					 The first match was away at Esporta - never an easy place to go and always a bit of 
					 uncertainty as to the quality of the opposing team, particularly at the start of the season.
				</p>
				<p class="matchreport">
					 The Esporta team was solid but no coaches or county players, so all was set for a close contest!
				</p>
				<p class="matchreport">
					 Unfortunately not as close as Rob and Nigel would have preferred - comfortably back in the bar 
					 with a beer watching Barcelona v Real Madrid before 9pm!
				</p>
				<p class="matchreport">
					 However Mark and Xander were still battling away winning two close rubbers, sealing the 2nd with 
					 a 10-6 third set tie break win - well done to Xander who played particularly well, making it 4 
					 rubbers out of 4 across two matches this week.
				</p>
						So overall a 2-2 draw which represents a good start in this higher league.
				</p>
				<p class="articleauthor">Steve Ray</p>

			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Leamington 5 (Home) - Monday 2/5/2011</h2>
				<p class="result">
					<span>Result:</span>2 : 2   (Draw)
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Stephen Ray; Nigel Jones &amp; Savio Gaspar  
				</p>
				<p class="matchreport">
					 Leamington arrived with a strong team and, although the quality of tennis from the 
					 Hampton guys was good, the first two rubbers went to the away team.
				</p>
				<p class="matchreport">
					 Jonny &amp; Steve then started very well against the Leamington 2nd pair but then 
					 lost their way in the second set, so it was down to a 3rd set tie break. We experienced 
					 quite a few successful tie breaks last year - I wouldn't quite describe it as completely 
					 nerveless, but two match points against were saved before Hampton triumphed 12-10!
				</p>
				<p class="matchreport">
					 So if we were going to lose our long unbeaten run that led to promotion last year, at 
					 least we were going down with a fight!
				</p>
				<p class="matchreport">
					 Fortunately, Savio &amp; Nigel hadn't read that script and were successfully mixing it 
					 up enough to give the Leamington first pair a few problems and managed to take their 
					 match into a 3rd set tie break which they won brilliantly 10-7!
				</p>
				<p class="matchreport">
					 Well done guys and a 2-2 draw was grabbed from the jaws of defeat! 
				</p>
				<p class="matchreport">
					 Next match is away at Berkswell &amp; Balsall Common on Monday.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Berkswell 2 (Away) - Monday 9/5/2011</h2>
				<p class="result">

					<span>Result:</span>0 : 4   (Defeat) 
				</p>
				<p class="team">
					<span>Team:</span>Nigel Jones &amp; Savio Gaspar, Steve Ray &amp; Chester Barnes
  
				</p>
				<p class="matchreport">
					 For the first time since 31 July 2009 the 3rd team lost and boy did we take a beating!
				</p>
				<p class="matchreport">
					 Berkswell were relegated into this Division and we were promoted into it. We didn't play 
					 that badly (in the context that Berkswell went out and won it, rather than lots of unforced 
					 errors) but a combination of better quality players and a surface much quicker than we are 
					 used to playing on produced a pretty one-sided scorecard!
 				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>

				<a name="match4" id="match4" />
				<h2>Warwick Tennis Club 2 (Home) - Monday 16/5/2011</h2>
				<p class="result">
					<span>Result:</span>0 : 4   (Defeat)
				</p>
				<p class="team">
					<span>Team:</span>Nigel Jones &amp; Rob Yates; Chester Barnes &amp; Xander Barnes  
				</p>

				<p class="matchreport">
					 Warwick TC top of the table now with 15 out of 16 rubbers!
				</p>
				<p class="matchreport">
					 That said, I watched the last 1/2 hour and was encouraged by how competitive the 
					 tennis was. It was quite literally the odd mistake here and there - the scoreline 
					 in games was pretty close and on another night we might have bagged a couple of rubbers!
				</p>
				<p class="matchreport">
					 Thanks to Xander and Chester for stepping in to replace Jonny (1st team came calling) 
					 and me (injured).
				</p>
				<p class="matchreport">
					 A difficult couple of weeks but, based on how the league is shaping up, we have just 
					 played the best two teams!
				</p>
				<p class="matchreport">
					 Now we need to kick on and get a few more points on the board.
				</p>

				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match5" id="match5" />
				<h2>Warwick Boat Club 4 (Home) - Monday 23/5/2011</h2>
				<p class="result">
					<span>Result:</span>1 : 3   (Defeat)
				</p>

				<p class="team">
					<span>Team:</span>Chester Barnes &amp; Nigel Jones, Savio Gaspar &amp; Rob Yates
  
				</p>
				<p class="matchreport">
					 A run of tough matches against the top 3 teams in the Division came to an end 
					 with a 3-1 defeat with Nigel &amp; Chester nicking an important rubber, recovering 
					 from a set and 3-5 down!
				</p>
				<p class="matchreport">
					 We can now look forward to a run of 5 matches against the teams around us and we 
					 need to start picking up a few more rubbers!
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<a name="match6" id="match6" />
				<h2>Kenilworth 3 (Away) - Wednesday 8/6/2011</h2>

				<p class="result">
					<span>Result:</span>1 : 3   (Defeat)
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Steve Ray, Nigel Jones &amp; Rob Yates
				</p>
				<p class="matchreport">
					 For the first time this year, we got the team out that did so well last year in getting promoted.
				</p>
				<p class="matchreport">
					 Kenilworth admitted that a strategy of fielding some younger &amp; inexperienced players in earlier 
					 matches hadn't worked and they were fielding their strongest team of the season.
				</p>
				<p class="matchreport">
					 The first couple of rubbers demonstrated that ability wise the teams were evenly match but Kenilworth 
					 benefited from home advantage, serving well on reasonably quick courts to take the first two rubbers 
					 both in straight sets. Jonny &amp; Steve's first rubber was a very "professional" match with just one break 
					 of serve in each set (we lost one each!).
				</p>
				<p class="matchreport">
					 Having acclimatised, Nigel &amp; Rob went on to do well against the Kenilworth 1st pair taking them to a 3rd 
					 set tie break but unfortunately "fell at the final hurdle".
				</p>
				<p class="matchreport">
					 Jonny &amp; Steve were fairing less well - a set and 3-1 down and getting a bit frustrated. Jonny endeavoured to 
					 smack a loose ball against the back fence but, indicative of the evening, he missed with the ball sailing 
					 across the deserted club. Happens regularly but it led to a moment of confrontation with the Kenilworth pair 
					 "insisting" that one of us immediately went to fetch the ball! Backed into a corner we politely refused and 
					 suggested they carried on with the game.
				</p>
				<p class="matchreport">
					 We lost the next game to go 4-1 down but our minds had been focused, fresh motivation applied and we reeled of 
					 5 successive games to get to a 3rd set tie break that we won 11-9. That sounds close but we were always ahead 
					 and some pretty blatant "gamesmanship" attempts to disrupt our serving [that were considerably worse than tubing 
					 a ball] had no effect on us.
				</p>
				<p class="matchreport">
					 All was well in the bar afterwards....
				</p>
				<p class="matchreport">
					 A defeat but it finished on a high, the quality of our tennis has been improving week-on-week and we would be 
					 pretty confident about beating them on home soil.... 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
			<li>
				<a name="match7" id="match7" />
				<h2>Beechwood 4 (Home) - Monday 13/6/2011</h2>
				<p class="result">
					<span>Result:</span>1 : 3   (Defeat)
				</p>
				<p class="team">
					<span>Team:</span>Nigel Jones &amp; Rob Yates, Jonny Hunt &amp; Steve Ray   
				</p>
				<p class="matchreport">
					 Beechwood turned up with a first pair who last week were involved in despatching our 
					 first team 0-4 (albeit we were without Daniel &amp; Tony).
				</p>
				<p class="matchreport">
					 It was reasonably evident that probably a 2-2 draw was the best we would get out of 
					 the evening!
				</p>
				<p class="matchreport">
					 To freshen things up Steve &amp; Jonny played as the 2nd pair and had first crack at the 
					 Beechwood 2nd pair - we played well and won pretty comfortably 6-3 6-3.
				</p>
				<p class="matchreport">
					 Nigel &amp; Rob then had a long battle against their 2nd pair, narrowly losing the first set 
					 on a tie break. Nigel &amp; Rob then gained the momentum to take the 2nd set 6-3, including 7 
					 consecutive hard &amp; searching forehands from Nigel followed by a blinding 2-handed back 
					 hand winner down the tramlines [Nigel asked me to mention that point!].
				</p>
				<p class="matchreport">
					 A tight 3rd set championship tie break followed and at 7-8 it could have gone either way 
					 but 2 Beechwood volleys later it was all over.
				</p>
				<p class="matchreport">
					 A tough first half of the season but, apart from the odd rogue pairings [like tonight], 
					 the playing standard is no different from that which we can achieve and no reason why some 
					 of the tight draws &amp; defeats experienced so far can't be converted into wins as the season 
					 progresses.
				</p>
				<p class="matchreport">
					 A good time to start would be next Monday at home to Esporta with whom we drew on the first 
					 day of the season.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Esporta Health and Rackets Club 3 (Home) - Monday 20/6/2011</h2>
				<p class="result">
					<span>Result:</span>1 : 3   (Defeat)
				</p>
				<p class="team">
					<span>Team:</span>Matthew Hunt &amp; Jonny Hunt; Steve Ray &amp; Nigel Jones
				</p>
				<p class="matchreport">
					 Unfortunately the story of the season so far - very competitive but a defeat!
				</p>
				<p class="matchreport">
					 We approached the match with confidence with Matt joining the team, but Esporta also turned up 
					 with a pretty strong four.
				</p>
				<p class="matchreport">
					 Matt & Jonny struggled in their first set and lost it, while Nigel & Steve lost a close first 
					 set from 5-4 up!
				</p>
				<p class="matchreport">
					 Unfortunately Nigel & Steve then lost the momentum and went down to the Esporta 2nd pair but 
					 Jonny & Matt responded magnificently to beat a very good Esporta pair 10-8 in the 3rd set tie 
					 break.
				</p>
				<p class="matchreport">
					 Steve & Nigel actually played some good tennis in the 2nd rubber; 3-3 in the 1st set and a 2-0 
					 lead in the 2nd but the brutal truth was that their 1st pair were considerable better than us!
				</p>
				<p class="matchreport">
					 As the rain started to come down, Jonny & Matt were cruising at a set up and 2-0 in the 2nd so 
					 I went to put the pizza's in. However, the Esporta pair responded well fighting back in the 2nd 
					 set before taking the 3rd set tie break [and we don't normally lose those!]
				</p>
				<p class="matchreport">
					 Oh well, we will just have to try again next <strong>Thursday (30th June) away at Leamington</strong>.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match9" id="match9" />
				<h2>Leamington 5 (Away) - Thursday 30/6/2011</h2>

				<p class="result">
					<span>Result:</span>2  -  2  (Draw)
				</p>
				<p class="team">
					<span>Team:</span>Steve Ray &amp; Jonny Hunt, Paul Thomas &amp; Tim Jones.  
				</p>
				<p class="matchreport">
					 We arrived full of optimism, we plumbed the depths of despair after losing the first two 
					 rubbers but came home happy after bouncing back, showing lots of character, to get a much 
					 needed draw.
				</p>
				<p class="matchreport">
					 It was a tale of lots of tie-breaks!
				</p>
				<p class="matchreport">
					 Jonny &amp; Steve lost their first set on a very tight tie-break that could have gone either 
					 way - although we didn't play badly, we did miss a couple of chances! We started the following 
					 set badly and and were always playing catch up!
				</p>
				<p class="matchreport">
					 Paul &amp; Tim had an equally close first match that ended in defeat; 10-8 in a 3rd set tie-break. 
					 0-2 down but it could so easily have been 2-0 up.
				</p>
				<p class="matchreport">
					 A bit of deja vu for Jonny &amp; Steve in the second rubber as again they lost the 1st in a close 
					 tie-break. Meanwhile, as Steve and Jonny were taking their time, Paul &amp; Tim seemed to be racing 
					 through their match and had managed to take the Leamington 1st pair into a 3rd set tie break 
					 before upsetting the odds and pinching it 12-10! Well done guys!
				</p>
				<p class="matchreport">
					 That put the pressure on Steve &amp; Jonny to turn their match round. All was going well; 2nd set 
					 in the bag 6-3 and cruising through the 3rd set tie break 8-3 up. However, whilst we always win 
					 our 3rd set tie breaks, we tend not to do it the easy way; 8-3, 8-4, 8-5, 8-6, 8-7, 8-8!   
				</p>
				<p class="matchreport">
					 Believe it or not we were staying pretty cool (we won at Leamington from 5-9 down last year!), 
					 but Tim &amp; Paul were looking a bit nervous on the side lines! Two points later and the win was 
					 in the bag!
				</p>
				<p class="matchreport">
					 It was one of those nights where we could have lost 4-0 or won 4-0; so perhaps 2-2 was a fair 
					 result and it is always a good draw when you recover from losing the first two rubbers!
				</p>
				<p class="matchreport">
					 Thanks to Paul &amp; Tim for stepping up from the 4th team and playing so well.
				</p>
				<p class="articleauthor">(a much relieved) Steve Ray</p>
			</li>

			<li>
				<a name="match10" id="match10" />
				<h2>Berkswell 2 (Home) - Monday 4/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match11" id="match11" />
				<h2>Warwick Tennis Club 2 (Away) - Tuesday 12/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>

				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match12" id="match12" />
				<h2>Warwick Boat Club 4 (Away) - Tuesday 19/7/2011</h2>

				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<h2>Kenilworth 3 (Home) - Monday 25/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<h2>Beechwood 4 (Away) - Thursday 4/8/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>

				<p class="team">
					<span>Team:</span>No team selection available  
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
