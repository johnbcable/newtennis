<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 4th Team Diary");
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
		<h1>Mens 4th Team 2010 - Second season</h2>
		<img src="images/geoffr.jpg" border="0" alt="Geoff Redfern - Mens 4th Team captain" />
		<p>
			Welcome to the diary from genial Geoff and the merry men of our Mens 4th Team from their 2010 (second) season. This is the second season 
			that commentary from the 4th team has seen the light of day. Smile (or wince - as appropriate) while you warm your cockles with some stirring match reporting. 
			We hope that you're not going to miss out on 4th team match reports this year - Oh no! If anyone writes about the Mens 4th Team then read it here.<br /><br />
			Organised starting with the earliest first - scroll down to read most current reports.
		</p>
		<ol id="blog" style="clear: both;">
			<li>
				<a name="match1" id="match1" />
				<h2>Sphinx 3 (Home) - Monday 26/4/2010</h2>

				<p class="result">
					<span>Result:</span>1-3   Defeat
				</p>
				<p class="team">
					<span>Team:</span>Steve Ray and Xander Barnes; Steve Phelps-Jones and John Cable   
				</p>
				<p class="matchreport">
					 Steve &amp; Xander recovered from a slow start (0-3) to pinch the 1st set versus their number one pair on a tie break. 
					 Sphinx responded well taking the second set and keeping the momentum going into the 3rd set tie break which they 
					 won 10-6.
				</p>
				<p class="matchreport">
					 However Steve &amp; Xander recovered from the disappointment beating their 2nd pair dropping just 3 games in the process.
				</p>
				<p class="matchreport">
					 Unfortunately, despite battling hard, John &amp; Steve had little success on the night - maybe next time! 
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Warwick County Council (Away) - Monday 3/5/2010</h2>
				<p class="result">
					<span>Result:</span>  2-2   Draw
				</p>
				<p class="team">
					<span>Team:</span>  Chester Barnes and Xander Barnes; Charlie Rickard and John Cable   
				</p>
				<p class="matchreport">
					 The mens 4th team earned a 2-2 draw in week 2 in the first league match to be played on the splendidly resurfaced 
					 courts at Warwick CC - though isn't tarmac a hard surface to play on - nice new surface or not!
				</p>
				<p class="matchreport">
					 Warwick were smarting after a 4-0 loss last week against Cov &amp; NW 4's in their first match - or was it really 
					 Cov &amp; NW 2's/3's that they played.  Anyway Warwick weren't too happy - good job we are playing Cov &amp; NW 
					 towards the half way mark when all their 2's should be tied.
				</p>
				<p class="matchreport">
					 A good evening for Chester and Xander who despatched the opposition 3 and 5 in the first match.  Looking at the 
					 other court we were a bit surprised that Charlie and John had lost 2 and 2 while appearing to win every point that 
					 we had time to watch.  Strange.  Charlie and John then lost a much closer encounter in the second game leaving Chester 
					 and Xander to salvage a draw in a 10-4 championship tie break win in fading light.  Good job we took advantage of the 
					 bank holiday to start at 6pm.! 
				</p>
				<p class="matchreport">
					 Food was much better than normal for Warwick CC as it was on site and tasty - chilli baked potatoes.  Just what was 
					 required to finish off a cold night.
				</p>
				<p class="matchreport">
					 Onwards to next week.
				</p>
				<p class="articleauthor">Chester Barnes</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Nuneaton 4 (Home) - Monday 10/5/2010</h2>
				<p class="result">
					<span>Result:</span>1-3 Defeat
				</p>
				<p class="team">
					<span>Team:</span>Chetser Barnes &amp; Steve Ray; Nigel Jones &amp; Mike Jones (no relation)  
				</p>

				<p class="matchreport">
					 Hampton 4 had a strong looking line up - Chester Barnes, Steve Ray, Mike Jones & Nigel Jones. 
					 A team confident of doing well as a 3rd team line up, playing as Hampton 4. Victory was expected!
				</p>
				<p class="matchreport">
					 Unfortunately Nuneaton 4 hadn't read our script, turning up with one first team player and at least 
					 one other who confessed to playing regularly for higher teams!
				</p>
				<p class="matchreport">
					 Chester & Steve went down 4 & 4 against their 1st pair, with Nigel & Mike also narrowly losing their first rubber.
				</p>
				<p class="matchreport">
					 Nigel & Mike then were beaten by their no. 1's but put up a brave fight in the 2nd set leading 4-1 at one stage!
				</p>
				<p class="matchreport">
					 The Nuneaton 4 team had won their previous 2 fixtures 4-0 so it was down to Steve & Chester to see if they could 
					 prevent a further clean sweep.
				</p>
				<p class="matchreport">
					 When Steve & Chester raced to a 5-0 lead in the first set there didn't seem to many problems in at least securing 
					 a rubber, but we lost the momentum holding on to the first set 6-3 before going down in the 2nd set 3-6.
				</p>
				<p class="matchreport">
					 It all went to the 3rd set tie-break. We were expecting a nervy conclusion but we raced to a 5-0 lead, 
					 eventually winning 10-4!
				</p>
				<p class="matchreport">
					 So at least we were 1st to take a point off them this season.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match4" id="match4" />
				<h2>Berkswell 5 (Away) - Monday 17/5/2010</h2>
				<p class="result">
					<span>Result:</span>2-2 Draw
				</p>
				<p class="team">
					<span>Team:</span>Chester Barnes &amp; John Cable; David Margetts &amp; Geoff Redfern   
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
				<h2>Warwick Tennis Club 3 (Home) - Monday 24/5/2010</h2>
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
				<a name="match6" id="match6" />
				<h2>Whitnash (Home) - Monday 7/6/2010</h2>
				<p class="result">
					<span>Result:</span>2 - 2  Draw
				</p>
				<p class="team">
					<span>Team:</span>Chester Barnes &amp; Xander Barnes; Geoff Redfern &amp; John Cable   
				</p>
				<p class="matchreport">
					After another 2-2 draw this week with superb consistent performances from Xander &amp; Chester, 
					plus some pit-a-pat rubbish from John and myself, Hampton 4th's are now officially the draw 
					specialists of the division!
				</p>
				<p class="articleauthor">Geoff Redfern</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Coventry and North Warwicks (Away) - Thursday 17/6/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>Joe Killeen, Gary Lawrence, Guy Hemington and Charlie Rickard   
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
				<a name="match8" id="match8" />
				<h2>Sphinx 3 (Away) - Tuesday 22/6/2010</h2>
				<p class="result">
					<span>Result:</span>4 - 0 Win
				</p>
				<p class="team">
					<span>Team:</span>Chester &amp; Xander Barnes; David Margetts &amp; Mike Durkin
				</p>
				<p class="matchreport">
					A great result but, to be fair, Sphinx were nowhere near as strong as the first 
					match of the season now that the Coventry University students have returned home! 
					(I copied that from Steve's match report from last night - but it is as true for 
					our opposition)
				</p>
				<p class="matchreport">
					Xander and Chester got the team off to a great start against two returning 
					University students winning the first 11 games but just failing in a double bagel quest.  
					6-0, 6-1 was a great result though.
				</p>
				<p class="matchreport">
					Mike and David then came through a tight encounter eventually winning 6-4, 6-0 with Mike 
					delighted with the result as it was his league debut. 
				</p>
				<p class="matchreport">
					Chips were great afterwards to fill us up while watching Argentina beat Greece. 
				</p>
				<p class="matchreport">
					If Geoff <i>(he's the captain - Ed.)</i>has read down this far we did not lie to you when 
					we called to say excitedly that we had won 4-0 by 8.45 but it is only fair to confess that 
					the opposition only managed one pair - but who remembers that when the score says 4-0! 
				</p>
				<p class="articleauthor">Chester Barnes</p>
			</li>

			<li>
				<a name="match9" id="match9" />
				<h2>Warwick County Council (Home) - Monday 28/6/2010</h2>
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
				<a name="match10" id="match10" />
				<h2>Nuneaton 4 (Away) - Friday 9/7/2010</h2>
				<p class="result">
					<span>Result:</span>1 -2  match incomplete   
				</p>
				<p class="team">
					<span>Team:</span>Chester Barnes &amp; Xander Barnes; Tim Jones &amp; David Margetts
				</p>
				<p class="matchreport">
					A great scrap for Chester and Xander saw us pinch only the third rubber that Nuneaton 
					have conceded this season - and one of the other two was also to Hampton at the beginning 
					of the season.  It was a close run thing mind as Nuneaton served for the match at a set 
					and 5-4 up getting as far as 40-0 - unfortunately it was all downhill from there on in for 
					Stewart and Dan  who never quite recovered from losing the three match points such that the 
					championship tie break was a bit one sided in our favour. 
				</p>
				<p class="matchreport">
					Undaunted (and unaware of time) we carried on into the second rubber against Nuneaton's 
					first pair (known to Geoff as Pirate Dave & Deano) contriving to lose the first set on a 
					tie break having been 5-3 up at one point.  Unfortunately having reached 5-6 and deuce 
					having already saved one match point the lights went out as the clock ticked past 10pm - 
					so we now have to work out whether it is worth while going all the way to Nuneaton for 
					potentially two points - watch this space!
				</p>
				<p class="matchreport">
					David and Tim did not spend quite as long as court so have therefore escaped the return 
					trip to Nuneaton.  Well done guys.
				</p>

				<p class="articleauthor">Chester Barnes</p>
			</li>

			<li>
				<a name="match11" id="match11" />
				<h2>Berkswell 5 (Home) - Monday 12/7/2010</h2>
				<p class="result">
					<span>Result:</span>4 - 0  Win
				</p>
				<p class="team">
					<span>Team:</span>Chester Barnes &amp; Xander Barnes; Tim Jones &amp; Charlie Rickard   
				</p>
				<p class="matchreport">
					 A third 4-0 win in four games in the second half of the season sees the team who got to 
					 second bottom with 9 points looking forward to getting involved with the promotion 
					 fight (maybe).  Great result chaps without conceding a set - and thanks to Jayne for once 
					 again producing an excellent lasagne and to Geoff for organising the side.
				</p>
				<p class="articleauthor">Chester Barnes (I presume)</p>
			</li>

			<li>
				<a name="match12" id="match12" />
				<h2>Warwick Tennis Club 3 (Away) - Tuesday 20/7/2010</h2>
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
				<h2>Whitnash (Away) - Tuesday 27/7/2010</h2>
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
				<h2>Coventry and North Warwicks (Home) - Monday 2/8/2010</h2>
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
			<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
			<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
			<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
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
