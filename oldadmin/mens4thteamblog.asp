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
		<h1>Mens 4th Team 2012 - Third season</h2>
		<img src="images/geoffredfern1.jpg" border="0" alt="Geoff Redfern - Mens 4th Team captain" />
		<p>
			Welcome to the diary from genial Geoff and the merry men of our Mens 4th Team from their 2012 season. 
			Smile (or wince - as appropriate) while you warm your cockles with some stirring match reporting. 
			We hope that you're not going to miss out on 4th team match reports this year - Oh no! If anyone writes about the Mens 4th Team then read it here.<br /><br />
			Organised starting with the earliest first - scroll down to read most current reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />
				<h2>Rugby 3 (Home) - Thursday 3/5/2012</h2>
				<p class="result">
					<span>Result:</span>4 : 0   DEFEAT
				</p>
				<p class="team">
					<span>Team:</span>Charlie Rickard &amp; Mike Durkin<br />Chris Barnes &amp; Gabor Prudencio  
				</p>
				<p class="matchreport">
					 Sorry to buck the trend.  We were dumped 4-0 by Rugby who I thought were good enough to win 
					division 6 with their squad.  
				</p>
				<p class="matchreport">
					 We play at Warwick Boat next Friday - they came up with Rugby and were the only team to take 
					a rubber off Rugby last year. (They had 11 4-0&apos;s and a solitary 3-1).  Need some points there I think.
				</p>
				<p class="matchreport">
					Lasagne and garlic bread was definitely the highlight of the evening......not to mention the rain 
					and lots of it.  Play was quite difficult by the end especially when the floodlights reflected off 
					the puddled water. Such fun. 
				</p>
				<p class="articleauthor">Chris Barnes</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Warwick Boat Club 5 (Away) - Friday 11/5/2012</h2>
				<p class="result">
					<span>Result:</span>2 :  2     DRAW
				</p>
				<p class="team">
					<span>Team:</span>Andy Frith and Jonny Hunt<br />Chris Barnes and Charlie Rickard  
				</p>
				<p class="matchreport">
					 Fresh from a 4-0 mauling at the hands of Rugby 3 in week 1, we set out to play the other promoted 
					side at what must be the most picturesque of tennis clubs in the Midlands and probably in the UK too.  
					We had a strong team out too - possibly the strongest ever fielded by a Hampton 4th team.  Pair 1 was 
					the undefeated third team pairing of Andy and Jonny Boy (thanks for helping guys) with myself and 
					Charlie as second pair. Unfortunately navigation skills in the team were a little lacking and one of 
					our number went on an (un)guided tour of most of the tennis courts and clubs in Warwick before 
					arriving in the right place in the nick of time. 
				</p>
				<p class="matchreport">
					Charlie and I got off to a steady start against the Boat's international crew of Funsho (from Nigeria) 
					and Jo (from Sweden).  Always in control, a 6-3, 7-5 win was put on the board.  However things didn't 
					go to plan in the top match. Our boys, thinking they were in for a nice evening of practice in division 6, 
					got a bit of shock against the Boat's ex first teamer (Nigel) and revision week Bath Uni student Josh. 
					In control of the tie break at 8-4 they unfortunately went down 9-11.
				</p>
				<p class="matchreport">
					So 1-1 but could we get to a 3-1 win?  Jonny and Andy had a spot of trouble at 1-5 down against their 
					international opposition.  After having lost the first rubber they must have wondered where they were 
					at that point, but suddenly then remembered that they weren't at a practice match after all and showed 
					the Boat Crew who knew how to play tennis best by winning 12 of the next 13 games to win 7-5, 6-1 - phew!  
					Unfortunately Charlie and I weren't ever in the running to beat the no 1 boat crew although we did put 
					in a creditable performance in going down 3-6, 4-6 and even managed to break Nigel's serve once, which 
					was no mean feat.  We almost managed a second break at the end of the match at 4-5 and 0-40, but our 
					friend then put in a display worthy of Goran Izzywizzywizzy and sent down five unreturnable first serves 
					on the bounce to close out the match.
				</p>
				<p class="matchreport">
					Given the standard of the two teams we have played so far I would say that we need our strongest team 
					out regularly if we are to achieve our goal of a top 2 finish this year. Where have you been when we 
					have needed you Steve, Nigel, Rob, Savio, Matt?  I know you have all had very good excuses but 2 points 
					out of 8 is relegation not promotion form, even if we have played what are likely to be two of the best 
					sides in the division.
				</p>
				<p class="matchreport">
					We finished with an entertaining hour in the bar afterwards with chief chef Funsho (who lived up to 
					his name) putting in a chef's performance worthy of Hampton by taking nearly an hour to produce what 
					turned out to be an excellent vegetarian lasagne with potato wedges.  Luckily (for us) Charlie's pass 
					out ran out about five minutes before the food arrived so we were able to have some second helpings.
				</p>
				<p class="articleauthor">Chris 'expanded waistline' Barnes (Charlie's fault)</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Warwick County Council (Home) - Thursday 17/5/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Craig Gordon and Savio Gaspar<br />Matthew Hunt and Chris Barnes  
				</p>
				<p class="matchreport">
					 Short report today as it's bed time - 4-0 to the 4's and 16-0 over the week.  Hampton have 
					definitely never done that before.  
				</p>
				<p class="matchreport">
					 An inspiring pre match team talk which went along the lines of &quot;we can't let the other 
					boys down by not winning 4-0, so there's no food for anyone who drops a rubber&quot; did the trick.  
					So well done to Craig and Sav who cruised it 24-10 and to me and Matt who bruised it via 3 winning 
					tie breaks ending up 25-24!  
				</p>
				<p class="articleauthor">Chris &quotRip van Winkle&quot; Barnes</p>
			</li>

			<li>
				<a name="match4" id="match4" />
				<h2>Nuneaton 4 (Away) - Wednesday 23/5/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0   LOSS
				</p>
				<p class="team">
					<span>Team:</span>Charlie Rickard and Steve Ray<br />Gabor Prudencio and Steve Phelps-Jones  
				</p>
				<p class="matchreport">
					Things didn't quite go our way at Nuneaton last night with 2 very close rubbers for Steve Ray 
					and I which could have gone either way - one going down to the wire in a Championship Tie break
				</p>
				<p class="matchreport">
					 Gabor and Steve PJ battled hard but a good youthful Nuneaton side came out winners
				</p>
				<p class="matchreport">
					 Nuneaton club is improving with the &quot;new&quot; courts playing well and the club house 
					having an extension, meaning that this year could be the last of shooting off to the local 
					Attleborough sports club for a very good cold buffet with the locals. 
				</p>
				<p class="articleauthor">Charlie Rickard</p>
			</li>

			<li>
				<a name="match5" id="match5" />
				<h2>Offchurch (Home) - Monday 28/5/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1   WIN
				</p>
				<p class="team">
					<span>Team:</span>Nigel Jones and Savio Gaspar<br />Matt Thompson and Andy Frith  
				</p>
				<p class="matchreport">
					Steady progress by the team. Andy and Matt narrowly lost their first match 
					with a tiebreak first set 7-6, 6-3
				</p>
				<p class="matchreport">
					They made amends in their second rubber winning in straight sets.
				</p>
				<p class="matchreport">
					Nigel and Sav took a set to warm up before coming thru in a championship 
					tiebreak in their first match.
				</p>
				<p class="matchreport">
					However they were more consistent in their second winning in straight sets
				</p>
				<p class="matchreport">
					A fine meal followed courtesy of Wendy and good to see some fantastic tennis 
					from the first team again - well done guys !
				</p>
				<p class="articleauthor">Savio Gaspar</p>
			</li>

			<li>
				<a name="match6" id="match6" />
				<h2>Coventry and North Warwicks 4 (Home) - Monday 18/6/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Steve Ray and Chris Barnes<br />Savio Gaspar and Charlie Rickard  
				</p>
				<p class="matchreport">
					The evening didn't start too well, as the four of us looked at each other before played had 
					even started asking who had prepared match supper!!
				</p>
				<p class="matchreport">
					Chester &amp; Steve played as first pair (based on the spin of a racket!). The opposition 
					started by banging down a couple of un-returnable serves and we started to question how 
					easy the evening was going to be!
				</p>
				<p class="matchreport">
					We quickly bucked up our ideas to reel off 9 games without reply before they were lucky to 
					win the penultimate game as we strolled to a 6-1 6-1 victory in the first rubber.
				</p>
				<p class="matchreport">
					With the 1st team alongside us (top of the table clash versus Warwick Boat) discarding rackets, 
					balls and verbal abuse on a regular basis, we didn't really notice what was happening to Charlie 
					&amp; Savio on court 4. When they finished only a few minutes after us, the hoped for 2-0 was 
					actually 1-1 as it became evident that Cov &amp; NW had not only played the pairs in the wrong 
					order but that their 2nd pair were a pretty decent standard!
				</p>
				<p class="matchreport">
					Unfortunately, having lost the first rubber, Savio &amp; Charlie made a slow start to the 2nd 
					rubber dropping the 1st set. They successfully turned around the 2nd set but then lost the lottery 
					of the 3rd set tie break 7-10.
				</p>
				<p class="matchreport">
					No excuses for Chester &amp; Steve about confidence being lost from the first match. We always felt 
					like we were about to gain control of the 2nd match but then never did! In the 2nd set we got 4-1 
					up and 5-4 up but to be fair, just as we thought they were likely to give in to the pressure created, 
					they responded positively eventually closing out the final game in style with 4 service winners for 
					a 7-5 set! It transpired afterward that as a pair they hadn't lost a rubber this year with some of 
					their matches being two divisions higher. It didn't stop me &amp; Chester being a little depressed 
					as it leaves the 4th team with a lot to do to get promoted.
				</p>
				<p class="matchreport">
					The fish and chips from Meriden were apparently pretty good although I had to leave just as they were 
					arriving!
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Rugby 3 (Away) - Wednesday 27/6/2012</h2>
				<p class="result">
					<span>Result:</span>2  -  2    DRAW
				</p>
				<p class="team">
					<span>Team:</span>Chris Barnes &amp; Paul Thomas and Nigel Jones &amp; Tim Jones  
				</p>
				<p class="matchreport">
					3 of us managed to arrive in time for a 10 minute warm up on an unfamiliar astroturf surface. Nigel 
					however had other ideas and citing an accident on the M6 as his excuse arrived in time to get on the 
					court at about 6.45 - so a bit earlier than Rich Westman on Monday.  But still a bit late really .....
				</p>
				<p class="matchreport">
					Chester and Paul started off against Rugby's first pair comprising Liam (a young lad who was a very 
					good player indeed) and a new partner as his normal sidekick Roger was unavailable. In steps Martin 
					who is one of Grahams's Warwickshire geriatric over 95 team mates and played like a passable imitation 
					of the Hampton legend that is Hollway.  You get the gist; we struggled.....big time actually and were 
					duly trounced 6-1, 6-1 and also had time to play most of a friendly third set where we were also being 
					trounced before the Jones boys admitted defeat against the Rugby 2nd pair 6-3, 6-3.  The Jones boys 
					were grumpy.
				</p>
				<p class="matchreport">
					So 0-2 at half time.  Paul and I wished the Jones boys good luck without warning them of the standard 
					of the opposition (ha!), except to suggest mischievously that they might finish before we did.  Paul &amp; 
					I promptly had an awful start against Rugby 2 pair going 0-3 down.  However things started to go rather 
					better after that and despite chucking away two set points at 5-4 up ran out winners of the first set 7-6 at 
					which point the Jones boys finished their second match against Rugby's excellent first pair, going down by 
					6-2, 6-2..  The Jones boys were still grumpy. As the sun started to set, Paul and I finished off the job 
					against Rugby 2nd pair by 7-6, 6-2. 
				</p>
				<p class="matchreport">
					The evening finished off with an excellent curry while watching Spain win the penalty shoot out against 
					Portugal.  Comment of the evening in the pub was from Tim who thought we had lost 4-0 having spent the 
					whole of the time after the Jones boys had finished their second match surgically attached to his Blackberry. 
					Oh well. 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Warwick Boat Club 5 (Home) - Monday 2/7/2012</h2>
				<p class="result">
					<span>Result:</span>1  -  3    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Chris Barnes &amp; Paul Thomas and Steve Ray &amp; Rob Yates  
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
				<h2>Warwick County Council (Away) - Monday 9/7/2012</h2>
				<p class="result">
					<span>Result:</span>0  -  4    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Steve Ray &amp; Mike Jones and Xander Barnes &amp; Chris Barnes  
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
				<h2>Nuneaton 4 (Home) - Monday 16/7/2012</h2>
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
				<h2>Offchurch (Away) - Tuesday 24/7/2012</h2>
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
				<h2>Coventry and North Warwicks 4 (Away) - Wednesday 8/8/2012</h2>
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
			<li><a href="mens4thteamblog2011.asp">Mens 4th Team diary from 2011</a></li>
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
