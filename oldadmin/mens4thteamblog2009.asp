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
		<h1>Mens 4th Team 2009 - Inaugural season</h2>
		<img src="images/geoffr.jpg" border="0" alt="Geoff Redfern - Mens 4th Team captain" />
		<p>
			Welcome to the diary from genial Geoff and the merry men of our Mens 4th Team from their 2009 (inaugural) season. This is the first season 
			that commentary from the 4th team has seen the light of day. Smile (or wince - as appropriate) while you warm your cockles with some stirring match reporting. 
			We hope that you're not going to miss out on 4th team match reports this year - Oh no! If anyone writes about the Mens 4th Team then read it here.<br /><br />
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol style="clear: both;">
			<li>
				<h2>Nuneaton 4 (Home) - Monday 20 July, 2009</h2>
				<p>
					It’s great to have the first team and the 4th team playing on the same night! They are inspirational!  We all agree with Mark 
					that the support from the spectators makes a big difference too, actually willing everyone on – on the court.  Thank you to 
					everyone that comes to watch!
				</p>
				<p>
					The 4th team in their first ever season are now heading for mid (ish) table respectability. Last night’s match against Nuneaton 
					was drawn 2-2.  After some disappointing scores recently we all fought well to gain a well deserved draw. Next week, with Guy 
					making his debut, we are hoping for a win! Nuneaton’s 1st pair proved too strong for either of our teams last night, one of them 
					with a particularly “unreturnable” serve. However, both Hampton teams beat the Nuneaton 2 pair.   
				</p>
				<p class="articleauthor">Geoff Redfern</p>
			</li>
			<li>
				<h2>Leamington 6 (Home) - Monday 13 July, 2009</h2>
				<p>
					Dear tennis fans!!  
				</p>
				<p>
					Our home match vs Leamington 6. They’re top of the league, have won every match so far 4-0 and yes, we lost.  But it was a great match! 
					We all enjoyed it.
				</p>
				<p>
					Charlie &amp; Geoff lost 6-2 6-2 &amp; 6-3 6-4 but there were opportunities that we just couldn’t take. First time that we’d met but 
					we played very well together and only my second match in a year. So we should improve further next week.					
				</p>
				<p>
					Xander &amp; Wade didn’t quite manage to win a set either but got very close losing 6-3 6-4 &amp; 6-3 7-5. The matches were (mostly) 
					in good spirit all night and they are a very good team, all aged about 18 to 20 years old. 
				</p>
				<p class="articleauthor">Geoff Redfern</p>
			</li>
			<li>
				<h2>Nuneaton 4 (Away) - Friday 5 June, 2009</h2>
				<p>
					First time editor for a match report so here goes:
				</p>
				<p>
					Hampton pairs – Will Knight & David Margetts, Savio & Charlie
				</p>
				<p>
					Result – draw        Sets – 2:2          Games – 33 vs 34 against
				</p>
				<p>
					A draw unfortunately was a fair result on the night. Had the rain not set in for the duration of the second match I feel we would have won.
				</p>
				<p>
					Both our pairs beat their second pair comfortably, however their first pair comprised a useful teenager and a rather useful yet a little 
					unsporting older gent. When I mean unsporting, he continued to foot fault badly every serve after we pleasantly noted this a few times. 
					He then accused me of foot faulting which was not the case, and I am glad to say that the next point I aced him.
				</p>
				<p>
					The other highlight of the evening was the rain which was very heavy at stages followed by the after match supper where we drove to a 
					local sports club for a cold buffet just in time to catch the last ball of England losing the 20 20 cricket to Holland!
				</p>
				<p>
					Cheers Guys
				</p>
				<p class="articleauthor">Charlie (Rickard)</p>
			</li>
			<li>
				<h2>Leamington 6 (Away) - Wednesday 20 May, 2009</h2>
				<p>
					Very pleasant, sunny evening only spoiled by the 4th's first defeat of this season. The current leaders of Division 6 proved why they 
					are there - and on this form they are there to stay.
				</p>
				<p>
					Both Hampton pairs were totally outclassed. I think we only picked up 12 games over all 4 rubbers! To reiterate: I know now why they are 
					top of the this division even though they are a new Leamington team – strength in depth. Reminded me of the disturbing thrust into the 
					league that was Stratford some years ago - starting out as required in the bottom division, they have raced through to now being the
					current leaders of Division 1!
				</p>
				<p>
					The Leamington pairs were fairly evenly matched and were all young lads (less than mid twenties). I recognised two of them that I had
					played against before some years ago - but they are better now!
				</p>
				<p>
					On the plus side, the after-match chilli was nice! And, we must make the best of the surface difference when they come to our club
					for the return fixture in the second half of the season.
				</p>
				<p class="articleauthor">JC</p>
			</li>
			<li>
				<h2>Whitnash (Home) - Tuesday 12 May, 2009</h2>
				<p>
					The first match on the new courts was a 2-2 draw against Whitnash last night!  I only saw the last 25 minutes so you may get a full 
					report from someone who knows the whole story later.
				</p>
				<p>
					1st pair Jonny &amp; Matt Hunt trying out the courts in readiness for their 2nd team match later this week, and 2nd pair Nigel Jones 
					with Steve Phelps-Jones playing together for the first time. 
				</p>
				<p>
					From what I saw both matches were relatively close, closer than I thought they would be.  There were a few oohs and aahs plus the 
					occasional **~#** here and there as the court didn’t always do what was expected, but I believe that the surface will be a useful 
					advantage for our home teams once we are used to them.  Jonny &amp; Matt managed to win both of their rubbers with “The Jones team” narrowly
					losing both of theirs.  Everyone appeared to play well as I watched from the new grandstand although Nigel was a little disenchanted 
					as he wants to win every time (can’t fault him!). After this the usual retiring to the bar was complimented by one of Jonny’s excellent 
					chillies, this was unfortunately greeted with I’m a veggie by one of the opposition, so, baked beans and rice for him! Classic! If 
					anyone is missing a tin of baked beans from the club kitchen, send the me the bill. 
				</p>
				<p class="articleauthor">Geoff Redfern</p>
			</li>
			<li>
				<h2>Warwick Tennis Club 3 (Away) - Tuesday 5 May, 2009</h2>
				<p></p>
			<p>
				The Hampton team was Chris Barnes &amp; Simon Farrant and Joe Killeen &amp; John Cable. 
			</p>
			<p>
				Each of the 4th team pairs won one rubber and lost one rubber last night – their first pair had one player who managed to be the difference 
				they needed to get their 6-0, 6-1 win over each Hampton pair.
			</p>
			<p>
				Mine and Joe’s first match was all over before Chester and Simon were barely starting their 2nd set. This didn’t affect their tennis thankfully 
				as they motored comfortably to a 6-2, 6-2 win over their first Warwick Tennis Club opponents. 
			</p>
			<p>
				Next match and it was turn about for Chester and Simon being on the receiving end of a 6-0, 6-1 defeat and then having to kill time till tea 
				watching Joe and I. We started badly losing the first set of this second rubber 6-1. Thankfully we woke up a bit in the 2nd set to lead 4-1 
				at one point only to fail to close out the set and having to enter a 6-6 tie-break. Again this didn’t go to plan as we watched our opponents 
				rack up two match points against us before we managed to pull it back to one set all by winning the tie break 8-6. Then on to the ‘championship 
				tie break’ that is the third set. This was a much more orderly affair progressing with serve for the most part until we reached 8-7 (to us). 
				From then, our opponents rallied and took the next two points to give them a third match point at 9-8. By this time it was nearly dark but we 
				managed to hold it all together to take the next 3 points and finish the tie break off in style at 11-9.
			</p>
			<p>
				So 2-2 on the night. The good news is that we played on the Euro-clay surface there (that we are getting) and it was fine – a little slower 
				than we had been led to believe (spins either die or skid off) – but a very nice surface overall to play on, even with the gratuitous orange 
				tennis shoe soles at the end! Still, in for tea just in time to see Ronaldo’s second goal for Man Utd!
			</p>
			<p class="articleauthor">John Cable</p>
			</li>
			<li>
			<h2>Sphinx 2 (Away) - Monday 27 April, 2009</h2>
			<p>The first points of the new season are on the board!</p>
			<p>
				The morning rain cleared to provide a reasonably pleasant evening for the new Hampton 4 to play Sphinx, albeit that the Sphinx courts were 
				very greasy and slippy; not conducive to my "scampering" tennis!!
			</p>
			<p>
				The Hampton team was David Margetts &amp; Stephen Ray and Steve Phelps-Jones &amp; Wayman Morris. Sphinx equally had a couple of players "playing down" 
				(old 2nd team adversaries) so it was predictably a very close contest.
			</p>
			<p>
				DM &amp; SR had a very close 1st set against their no 1 pair which Hampton just edged 7-5; thereafter we were able to relax and the rest of the 
				evening was relatively comfortable! SPJ &amp; WM battled bravely including taking the Sphinx 1st pair to a 1st set tie-break but unfortunately 
				they just lost out!
			</p>
			<p>
				The final score was 2-2 in matches, 4-4 in sets and 39-39 in games - so a draw which ever way you look at it.....  
			</p>
			<p>
				So the new Hampton 4th team are on their way and will be looking to extend their unbeaten record next week at Warwick TC.
			</p>
			<p>
				Good luck to the rest of the teams this week!
			</p>
			<p class="articleauthor">Steve Ray</p>
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
