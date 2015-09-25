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
displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
		<h1>Diary of a Promoted Team (again) - Mens 2nd Team 2012</h1>
		<img src="images/markjoannides1.jpg" border="0" width="100" alt="Mark Joannides - Mens 2nd Team captain" />
		<p>
			Welcome to the commentary from the Mens 2nd Team for the 2012 season. Read and inwardly smile (or wince - take your pick) 
			as the minutiae of league tennis life slip in front of your eyes. Yes sirree, if any of them write anything about their 
			journey, you'll get to see it! Earliest stuff first - scroll down to see later reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />
				<h2>Beechwood 2 (Home) - Wednesday 2/5/2012</h2>
				<p class="result">
					<span>Result:</span>3 : 1   WIN
				</p>
				<p class="team">
					<span>Team:</span>Tony Eccleston and Ollie Plaskett<br />Craig Gordon and Mark Joannides  
				</p>
				<p class="matchreport">
					 Our 1st match of the season and our 1st win.
				</p>
				<p class="matchreport">
					 We were expecting a tough night as Beechwood were playing in the Prem last year and have 
					some very good players at their disposal, luckily enough we had Tony &amp; Ollie who had a 
					great night winning both matches in straight sets and looking every bit the Premiership players 
					that they are. Craig &amp; I made a great start to the night winning a tough opening match with 
					a good solid performance even if we did drop a 5-2 lead in the 2nd set and have to claw our way 
					to a 7-5 win in the tiebreak, but we did it and that's what counts!! Our 2nd match was a closely 
					fought affair against tough opposition but unfortunately for us a couple of missed points at 
					crucial times was our downfall but all in all a great first match and a well deserved win.
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Kenilworth 1 (Away) - Tuesday 8/5/2012</h2>
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
				<a name="match3" id="match3" />
				<h2>Coventry and North Warwicks 1 (Home) - Wednesday 16/5/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Mark Joannides and Richard Allen<br />Mark Walker and Oliver Plaskett  
				</p>
				<p class="matchreport">
					The enemy for the night where our old friends from Coventry &amp; North Warks, 
					a team we know very well as we have played against them for the last 10 years
					And even used to have pre-season warm-up matches against them.
				</p>
				<p class="matchreport">
					 The night started off on a frustrating note for Rich &amp; I playing against one of 
					the league’s oldest and most cunning doubles players &quot;Jit&quot; who managed to
					hit several winners that shouldn’t have been possible including 2 reaction volleys 
					behind his back that ended up being straight winners (it’s not every week you see skills 
					like that). We managed to stay solid though and grind out what proved to be a fairly 
					challenging win especially as there was no flow or rhythm to the match. On the other court 
					Ollie and Mark seemed to be having it all their own way and played a great couple of sets 
					of tennis to take the 1st set 6-1 and then took the 2nd set 6-4. Apparently their pre 
					tactics talk consisted of an agreement that anything that came over the net was Ollie’s 
					unless it was heading directly at Mr Walker but any running was definitely Ollie’s Job!!! 
					Ha ha (it worked perfectly)
				</p>
				<p class="matchreport">
					The 2nd rubbers seemed to follow suit with both teams winning in straight sets, So a 
					great result that puts us clear at the top of the table. 
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match4" id="match4" />
				<h2>David Lloyd Solihull 1 (Away) - Monday 21/5/2012</h2>
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
				<a name="match5" id="match5" />
				<h2>Beechwood 3 (Home) - Wednesday 30/5/2012</h2>
				<p class="result">
					<span>Result:</span>2  -  2   DRAW
				</p>
				<p class="team">
					<span>Team:</span>Oliver Plaskett and Mark Joannides<br />Tim Jones and Nigel Jones  
				</p>
				<p class="matchreport">
			 		After waiting for the monsoons to pass over Hampton we finally got going at about 7.30 in our match against Beechwood 3.
				</p>
				<p class="matchreport">
					Ollie and me got off to a good start getting an early break and held onto the lead with the help of Ollie's inch perfect serves, after taking the 1st set we
					Accidentally ended up returning from the wrong side which took us a couple of games to re adjust too. After the initial couple poorish returns we started to
					Adapt well and went on to win a the 2nd set. Every time I looked across to the other court Nigel &amp; Tim were playing well and having some very good rally's.
					From the back of the court the boys where looking strong but apparently the points I saw were apparently the highlights and although we won some great points
					We struggled to string the points together and lost the match.
				</p>
				<p class="matchreport">
					1-1 at the changeover.
				</p>
				<p class="matchreport">
					With the balls being extremely heavy and slow Ollie and I still managed to play a good 1st set and take a comfortable lead but in the 2nd set
					Ollie decided he was a little tired and thought a mid match power nap was the best course of action!!! Several games later and a break down he suddenly re awoke
					and we managed to break back and take the win 6-4, not the prettiest of matches but we dug in when required and got the result. Again Nigel & Tim fought valiantly
					against a strong Beechwood 1st pair who have been playing in the top 2 divisions for several years and although they lost the father & son duo managed to look
					competitive and pick up a few good games along the way which I think was very respectable.
				</p>
				<p class="matchreport">
					Overall a 2-2 draw, with the unfortunate amount of withdrawals this week it was a fair result, we need to try and get a couple of wins over the coming weeks
					To put us back clear at the top with a couple of rubbers between us and the rest but I'm sure we can do it.
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match6" id="match6" />
				<h2>Berkswell 1 (Home) - Wednesday 13/6/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Graham Hollway and Josh Crisp-Jones<br />Mark Joannides and Ian Poole  
				</p>
				<p class="matchreport">
					 Apologies for the late match report but Sergei my IT guru is 4 days late for work!!!!!!!
				</p>
				<p class="matchreport">
					Last week the 2nd team took on Berkswell 1 and our Ex team mate Mr Chris Barker. The team 
					for the night was Ian (Match Debut) &amp; Me, Josh &amp; of course ex Berkswell player Graham 
					(The Sledge) Hollway.
				</p>
				<p class="matchreport">
					The match started off well and our 1st Pair of Graham &amp; Josh made very quick work of Berkswell&#39s 
					1st pair, Josh&#39s pace and finishing and Graham&#39s typical consistency and angles paid dividends 
					with the loss of only 2 games; on the other court Ian and I weren&#39t far behind and with Ian adjusting 
					well back into match play we managed to take our rubber only a few minutes later again with an overwhelming score line.
				</p>
				<p class="matchreport">
					The 2nd matches followed suit and we won 4-0 and only at the loss of 10 games, a great night 
					for Hampton and still unbeaten.
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Knowle and Dorridge (Away) - Monday 18/6/2012</h2>
				<p class="result">
					<span>Result:</span>2  -  2    DRAW
				</p>
				<p class="team">
					<span>Team:</span>Mark Joannides and Oliver Parry<br />Matt Thompson and Time Jones  
				</p>
				<p class="matchreport">
					 The 2nd team were away to K&amp;D last night and with a slightly unorthodox 2nd team of 
					me &amp; Olly Parry, Tim Jones and Matt Thompson we knew it was going to be a difficult night.
				</p>
				<p class="matchreport">
					Tim &amp; Matt deserve a big thank you for showing up at late notice and chipping in, although 
					they had some good rallies and tried to play their game the more experienced pairings of K&amp;D 
					were too much. So all the pressure was firmly on Olly &amp; my shoulders.
				</p>
				<p class="matchreport">
					The 1st match was a toughie against John Blenkinsop and his new doubs partner Bruce, 6"4 with a 
					wicked leftie serve was a horror to return and with Blenkinsop outrageous touch at the net we were 
					having to serve huge just to stay level with them, we lost the first set with a single break of serve 6-3.
				</p>
				<p class="matchreport">
					The 2nd set continued in the same manner and with another break and 5-3 down on Big Leftie's serve we 
					were up against the ropes, somehow we managed to pull out the 4 best returns of the match to hold onto 
					some hope for a little longer and dragged things into a tiebreak. We took an early lead and started to
					find our attacking positions better than before and took the 2nd set 7-4. With the moment firmly behind 
					us the championship tie break was never in question and we rocked out a 10-4 win. The 2nd match was a 
					different affair altogether with 2 players who rely on spins and angles rather than any power and after 
					a slow start we managed to struggle through to a solid if not slightly drawn out win.
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Beechwood 2 (Away) - Tuesday 26/6/2012</h2>
				<p class="result">
					<span>Result:</span>1  -  3    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Mark Joannides &amp; Ian Poole and Matt Hunt &amp; Craig Gordon  
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
				<a name="match9" id="match9" />
				<h2>Kenilworth 1 (Home) - Wednesday 4/7/2012</h2>
				<p class="result">
					<span>Result:</span>2  -  2    DRAW
				</p>
				<p class="team">
					<span>Team:</span>Craig Gordon &amp; Ian Poole and Mark Joannides &amp; Tim Jones  
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
				<a name="match10" id="match10" />
				<h2>Coventry and North Warwicks 1 (Away) - Thursday 12/7/2012</h2>
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
				<h2>David Lloyd Solihull 1 (Home) - Wednesday 18/7/2012</h2>
				<p class="result">
					<span>Result:&nbsp;</span>1  -  3    LOSS
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
				</p>
				<p class="matchreport">
					 The 2nd team were at home last night against 2nd place David Lloyds who were one point ahead of us.
				</p>
				<p class="matchreport">
					Unfortunately because of commitments &amp; holidays we couldn't field the team we would have liked 
					and ended up with a 3-1 defeat. 
				</p>
				<p class="matchreport">
					We are still safely in 3rd position with 3 matches remaining so a good season and only 2 losses all 
					season. 
				</p>
				<p class="matchreport">
					A big thanks to Mark W for stepping back in to the 2nds and our newest player Bel for helping out 
					as well. 
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match12" id="match12" />
				<h2>Beechwood 3 (Away) - Tuesday 24/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Craig Gordon and Jonny Hunt and Time Jones &amp; Xander Barnes  
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
				<h2>Berkswell 1 (Away) - Monday 30/7/2012</h2>
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
				<h2>Knowle and Dorridge (Home) - Wednesday 8/8/2012</h2>
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
			<li><a href="mens2ndteamblog2009.asp">Mens 2nd Team diary from 2009</a></li>
			<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
			<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
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
