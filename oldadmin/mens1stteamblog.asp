<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 1st Team Diary");
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
		<h1>Captains Log  - Mens 1st Team 2012</h1>
		<img src="images/tonyeccleston.jpg" border="0" width="100" height="100" alt="Tony Eccleston - Mens 1st Team captain" />
		<p>
			Welcome to the diary from the Mens 1st Team for the 2011 season. 
			Captain Tony (Eccleston - see photo on left) returns to inspire his team once again! Read, knowingly (or befuddled-ly) smile 
			(or wince - as appropriate) while Tony stirs up your supporting spirit with some stirring dialogue. He has a lot to live up to 
			 - the blagging in the past that went on was worthy of a Pullitzer!
			But you're not going to miss out this year - Oh no! If anyone writes about the Mens 1st Team then you can read it here.<br /><br />
			Organised with earliest stuff first - scroll down to see later reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />
				<h2>Beechwood 1 (Home) - Monday 30/4/2012</h2>
				<p class="result">
					<span>Result:</span>4 : 0   WIN
				</p>
				<p class="team">
					<span>Team:</span>Daniel Eccleston &amp; Rich Westman<br />Oli Plaskett &amp; Tony Eccleston.  
				</p>
				<p class="matchreport">
					 Well played all the above!!!
				</p>
				<p class="matchreport">
					 We won 48 games to 19 so great to get decent points on the board against
					last year's winners.
				</p>
				<p class="matchreport">
					Nothing out of the ordinary to report i.e. no broken racquets, no punch
					up's...but plenty of banter and some decent tennis...plus we got into the
					club house in time to have a beer and watch the 2nd half of City v Utd! 
				</p>
				<p class="articleauthor">Tony Eccleston</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Warwick Boat Club 2 (Away) - Thursday 10/5/2012</h2>
				<p class="result">
					<span>Result:</span>0  :  4      WIN
				</p>
				<p class="team">
					<span>Team:</span>Rich Westman &amp; Rich Allen<br />Daniel Eccleston &amp; Tony Eccleston  
				</p>
				<p class="matchreport">
					 I won't even try and compete with Chester's match report...but here's how our outing against 
					WBC 2 unfolded Thursday night...
				</p>
				<p class="matchreport">
					Smashing it down with rain on a Thursday night at the picturesque WBC, we arrive to be greeted 
					by fellow Hamptonian Mr M Joannides. After 30 mins of rubbish weather MJ left and the weather 
					cleared and we got to play on their new astro courts, after the match courts flooded.
				</p>
				<p class="matchreport">
					In typical Boat Club manner, they fielded a 1st team pair in their 2nd team...but hey ho, 
					we've been doing it so we just got on with it.
				</p>
				<p class="matchreport">
					Rich 'I've got a massive backhand' Westman partnered Rich 'Can I take the ball any earlier' Allen 
					against an over 45 Leicestershire county pair was no competition. Rich &amp; Rich found their 
					serving &amp; volleying was too good for the opposition and moved them aside 6-4, 6-2.
				</p>
				<p class="matchreport">
					Daniel 'How many times can I hit someone at the net' Eccleston and Tony 'I've found my ball toss' 
					Eccleston played their 1st team pair to begin. The Eccleston's didn't lose their serve once 
					dismissing the very unhappy pairing 6-3, 6-2.
				</p>
				<p class="matchreport">
					The 1st team pairing were then damaged goods and dropped out of their second match against the 
					Rich's and left the Eccleston's to take apart the second pair 6-1, 6-3...even though we managed 
					to lose track of the score in the 2nd set.
				</p>
				<p class="matchreport">
					 So 4-0!
				</p>
				<p class="matchreport">
					 The 1st pair left and didn't stay for dinner, which meant there was plenty of 'meat' lasagne 
					and wedges, followed by 3 flavours of ice cream for din dins. This was accompanied by a decent 
					pint of 'Slaughterhouse' which finished the evening off appropriately.  
				</p>
				<p class="articleauthor">Tony 'I've found my ball toss' Eccleston</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Virgin Active 2 (Home) - Monday 14/5/2012</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>Daniel Eccleston and Tony Eccleston<br />Oliver Plaskett and Richard Allen  
				</p>
				<p class="matchreport">
					 4-0 was the only option and that is what we achieved, though one pair from the opposition 
					weren't to be pushed over so easily.
				</p>
				<p class="matchreport">
					 Daniel &amp; Tony won their first match 6-2, 6-4 against an OK pair, although the younger 
					guy on their team did have a massive lefty serve it didn't always hit the spot.  Rich &amp; 
					Ollie went all guns blazing in their first match winning the first set 6-4 with Rich teaching 
					Ollie the art of playing league doubles and Ollie showing Rich how to smash down a first serve!  
					Their opposition knew how to play doubs though and had great 'hands' allowing them to take the 
					second set 6-4.  This led to an exciting climax in the champ tie-break with Rich &amp; Ollie having 
					3 match points eventually winning 13-11 having properly stepped up to the mark.
				</p>
				<p class="matchreport">
					Rich &amp; Ollie then cruised through their second match winning 6-1, 6-1.  In Daniel and Tony's 
					second match they carried on as they started in the first match winning the first set 6-2. Then 
					3-2, 40-15 up in the second set and in control, what can best be described as a 'lapse' in 
					concentration occurred eventually resulting in a second set tie break.  But true to form the 
					Eccleston's dropped only one point winning the tie-break 7-1 and the match 6-2, 7-6. 
				</p>
				<p class="matchreport">
					Everyone stayed for tea, including all the opposition and even though it wasn't homemade (respect Andy F!!) 
					we enjoyed Tesco's finest curry and well and truly stunk out the clubhouse.  God I love a good curry!
				</p>
				<p class="articleauthor">Tony Eccleston</p>
				<p class="matchreport">
					<strong>P.S. from Steve Ray</strong>: The nose bleeds come from being hit by one of your own team.
					Apparently this was Daniel hitting Ollie on match night ...
				</p>
			</li>

			<li>
				<a name="match4" id="match4" />
				<h2>Stratford (Away) - Wednesday 23/5/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Richard Westman and Daniel Eccleston<br />Josh Crisp-Jones and Mark Joannides  
				</p>
				<p class="matchreport">
					Started off with a convincing 6-0/6-1 win with Pair 2 demolishing Stratfords weak 2nds before 
					Pair 1 had even finished the first set.
				</p>
				<p class="matchreport">
					Pair 1 got off to a great start breaking, then holding and having 2 break points for a double 
					break. Unfortunately to the amusement of Richard I lost all concentration to lose the 1st set 3-6. 
					Starting off well in the 2nd we took a 4-1 lead and tucked away the 2nd set comfortably 6-3 just 
					before I woke up to help Richard take the deciding tie break comfortably! (Sorry Richard!)
				</p>
				<p class="matchreport">
					So half way point were looking HOT at 2 zip to the mighty 1sts!
				</p>
				<p class="matchreport">
					Reverse pairs played each other with Pair 1 smashing up Stratford Pair 2 6-0 6-0 whilst Pair 2 
					were giving Stratford pair 1 a run for their money.
				</p>
				<p class="matchreport">
					The Comedy duo of MJ and JCJ were battling neck and neck until they broke at 4 games all to 
					serve for the set unfortunately Stratford Team 1 played some good tennis to win 3 games on the 
					row to take the 1st set 7-5. Similar trend in the 2nd with some good tennis played but not quite 
					good enough to get their own back and level at 1 all. So unfortunately to the annoyance of 
					MJ's racket and the back fence, pair 2 lost 5-7 5-7!
				</p>
				<p class="matchreport">
					MJ thanks for stepping up to the 1sts and filling in for Plazo!!!
				</p>
				<p class="matchreport">
					Good effort and a solid 3 - 1 win! Boom!
				</p>
				<p class="articleauthor">Daniel Eccleston</p>
				<p class="matchreport">
					<strong>Earlier Text from DE:</strong>&nbsp;OMG Comedy MJ just hit outrageous serve unreal volley and another 
					great volley misses a smash for not being in the right position and launches his racket from net to 
					top 3/4's of back fence! JCJ's remark, &quot;that's embarrassing!&quot; Comedy! x <br /><br />
					[Ed: can't wait for the official match report ...]
				</p>
			</li>

			<li>
				<a name="match5" id="match5" />
				<h2>Leamington 1 (Home) - Monday 28/5/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0   WIN
				</p>
				<p class="team">
					<span>Team:</span>Daniel Eccleston and Tony Eccleston<br />Richard Westman and Richard Allen  
				</p>
				<p class="matchreport">
					The tennis was fairly straight forward with Tony &amp; Daniel winning their first match 6-2, 6-2 
					and the two Rich's winning theirs 6-3, 6-2.
				</p>
				<p class="matchreport">
					This form continued into the second match with the Eccleston's winning 6-1, 6-1 and R &amp; R winning 6-3, 6-4.
				</p>
				<p class="matchreport">
					All in all a very convincing win adding another 4-0 to the tally - well played all!!
				</p>
				<p class="matchreport">
					The best part of the night though was saved until after the match when we were treated to 
					the culinary skills of Richard &quot;Chilli&quot; Allen. Our guests had their breath taken 
					away by his homemade chilli, with skinny chips and garlic bread. But the look on their faces 
					when he pulled out the bottle of red was priceless!! A 'little' glass of red each even 
					impressed the frenchman from the opposition leading him into saying...&rhquot;This is 
					&apos;Come dine with me&apos Cov &amp; Wark league style!!.&lhquot; 
				</p>
				<p class="matchreport">
					Desert was rounded off with chocolate mousse accompanied by chocolate fingers.
				</p>
				<p class="matchreport">
					Mr Frith...the gauntlet has been thrown down!!
				</p>
				<p class="articleauthor">Tony &quot;Hi-tec Toss&quot; Eccleston</p>
			</li>

			<li>
				<a name="match6" id="match6" />
				<h2>Virgin Active 1 (Away) - Monday 11/6/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Richard Allen and Josh Crisp-Jones<br />Tony Eccleston and Daniel Eccleston  
				</p>
				<p class="matchreport">
					With VA1 being our closest rivals, this was going to be our toughest match of the season so far. 
					In their last match against WBC 1 they put out Dan Evans, so we were expecting some decent tennis.
				</p>
				<p class="matchreport">
					Having arrived at 5pm to watch a surprisingly good England team walk away with a draw against 
					France, we went on court at 7pm.  Rich &amp; Josh played their 1st pair playing some fantastic 
					tennis which was not short on banter...even if some of it was pretty poor from the opposition.  
					With Tricky Dicky's in form doubles game coupled with his great returning, as well as some 
					delightful tennis from Josh 'The Californian doubles specialist' Crisp-Jones, they proved too 
					much for their 1st pair who up until recently were both full time players on the tour.  Result 6-4, 7-6.
				</p>
				<p class="matchreport">
					Daniel &amp; Tony also played well against their second pair winning in straight sets 6-3, 6-3.  
					One of their 2nd pair had played full time up until recently, but his partner wasn't so strong 
					(although he thought he was!).
				</p>
				<p class="matchreport">
					o 2-0 to the good at the halfway point.
				</p>
				<p class="matchreport">
					Rich &amp; Josh then shot through their second match winning 6-1, 6-1 without taking a breath which 
					secured us the win.
				</p>
				<p class="matchreport">
					Daniel &amp; Tony unfortunately didn't fare as well!  4-3 up on serve in the 1st set having nearly 
					broken them on two occasions they were looking good.  Then with a few unusual antics from one of 
					their players, only Daniel will be able to tell you what happened...Result 4-6, 2-6.
				</p>
				<p class="matchreport">
					3-1 win!!!
				</p>
				<p class="articleauthor">Tony Eccleston</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Warwick Boat Club 1 (Home) - Monday 18/6/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    LOSS
				</p>
				<p class="team">
					<span>Team:</span>Tony Eccleston and Daniel Eccleston<br />Josh Crisp-Jones and Richard Westman  
				</p>
				<p class="matchreport">
					WBC 1 turned out with their strongest team of the season so far, but undeterred we still believed 
					we could get a win having beaten this group of players before.  The Eccleston's started off slow 
					against their first pair but ended up taking a 3-2 lead ultimately losing the first set 6-4.  The 
					second set was also a close affair, with D &amp; T going 4-5 up and 30-40 with a point for the 
					second set, but it wasn't to be and they lost 6-4, 7-5.  Daniel played some good tennis, but Tony's 
					head wasn't even on the path down to the tennis courts! 
				</p>
				<p class="matchreport">
					Josh &amp; Rich started well against the second pair playing some good doubs in their first match 
					taking the first set 6-4.  Their good tennis continued into the second which was again very close, 
					but they found themselves edged out losing it 6-4.  So to a championship tie break, 8-8, opportunities 
					came and went for our boys but it didn't go our way and they lost 10-8. 
				</p>
				<p class="matchreport">
					Tony didn't play any better in their second match against their second pair which resulted in a 6-4, 
					6-4 loss.  Opportunities were there having got to 4-4 in the second, but Tony couldn't hold his serve. 
				</p>
				<p class="matchreport">
					So it came down to J &amp; R to salvage us a point, and valiantly they tried!  They lost the first 
					set 6-4, but then stepped it up a gear in the second set which saw them play some good tennis.  
					Some more good tennis from both sides took them into a tie-break where again opportunities came 
					and went but unfortunately our boys lost 11-9. 
				</p>
				<p class="matchreport">
					All in all it was a night of opportunities not taken.plus I was pretty cr*p!
				</p>
				<p class="articleauthor">Tony Eccleston</p>
				<p class="matchreport">
					Unlucky boys, occasionally you have nights like that where those one or two vital points just refuse 
					to fall your way. Still top at the halfway point of the season which is still a massive result and 
					worthy of a Daniel style BOOM!!!!!!!!
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Beechwood 1 (Away) - Monday 25/6/2012</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>Tony Eccleston &amp; Rich Westman and Rich Allen &amp; Mark Joannides 
				</p>
				<p class="matchreport">
					Rich Westman started his new job at Leicester Tigers rugby club yesterday and struggled to get to 
					Beechwood on time.  But due respect to Rich who turned up ready to play even though he and Tony had 
					to start from a set down against their second pair.  That aside, they managed to win the second set 
					6-3 to take the match into a championship tie-break. The momentum they had from winning the second 
					set carried through and they came up trumps in the championship tie-break winning 10-5.  Win 0-6, 6-3, 10-5. 
				</p>
				<p class="matchreport">
					Rich Allen and MJ started off well against their first pair running away with a 5-1 lead in the 
					first set.  The opposition then stepped their game up bringing it back to 5-4, but RA & MJ managed 
					to concentrate and finish off the first set 6-4.  The momentum then swung massively in the second 
					set with the opposition changing up their game and RA/MJ just losing the touch they had in the first 
					set.  This resulted in Beechwood taking the second set 6-1.  So, to a championship tie-break.  
					RA/MJ started off well and kept getting a point ahead but couldn't convert that into a two point lead.  
					This came back to haunt them and they eventually lost it 10-6.  Loss 6-4, 1-6, 6-10. 
				</p>
				<p class="matchreport">
					TE &amp; RW then took on their first pair and started off well.  They managed to break serve and found 
					themselves 4-2 up, 15-0, but couldn't hold serve to capitalise.  Beechwood broke back and held and then 
					managed to break again taking the first set 6-4.  TE &amp; RW dug deep and pulled back the momentum in 
					their favour and played a decent second set to win it 6-3.  So, yet another championship tie-break! 
					TE/RW started off well and found themselves 5-3 up but it wasn't to be their night and they went on to 
					lose the next 7 points losing 10-5.  Loss 4-6, 6-3, 5-10.  
				</p>
				<p class="matchreport">
					RA &amp; MJ then managed to lift their heads for their match against the second pair playing some good 
					tennis and ultimately not going into a championship tie-break!  They won both sets 6-4 to end the night.  
					Win 6-4, 6-4  
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<a name="match9" id="match9" />
				<h2>Warwick Boat Club 2 (Home) - Monday 2/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Tony Eccleston &amp; Daniel Eccleston and Josh Crisp-Jones &amp; Oliver Parry  
				</p>
				<p class="matchreport">
					It was Oli Parry's first outing in the 1st's this season and he made a good account of himself partnering 
					JCJ. They made quick work of WBC's second pair winning 6-2, 7-5. Oli managed to pull off an outrageous through 
					the legs shot while at the net winning the point and stopping play on both courts!
				</p>
				<p class="matchreport">
					Daniel and Tony played an over 45's Leicestershire County pair in their first match who knew their way 
					around the court. After a slow start against their first pair they came through winning 6-4,6-4.
				</p>
				<p class="matchreport">
					Josh &amp; Oli then had a very close match playing some quality tennis against Boat Club's first pair. After 
					taking the first set 6-4, the second set went down to a tie-break. JCJ &amp; OP gained the mini break, but 
					WBC came back to level it. It was then a point here and a point there, but our boys came through winning 6-4,7-6. 
				</p>
				<p class="matchreport">
					Daniel &amp; Tony then finished the night off beating Boat Club's second pair 6-3,6-3.
				</p>
				<p class="articleauthor">Tony Eccleston</p>
			</li>

			<li>
				<a name="match10" id="match10" />
				<h2>Virgin Active 2 (Away) - Tuesday 10/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0   WIN
				</p>
				<p class="team">
					<span>Team:</span>Josh Crisp-Jones &amp; Daniel Eccleston and Rich Allen &amp; Rich Westman   
				</p>
				<p class="matchreport">
					Got off to a shaky start with Virgin 2 trying to cancel the match due to weather and telling 
					Richard Allen a false team which then back fired with the player they didn't say was playing, 
					turning out to be a complete no show. (Thanks David O'leary)
				</p>
				<p class="matchreport">
					So 2 matches were played all night with Joshua &amp; Daniel taking out their first pair with 
					a convincing 6-4 6-1 win with some very basic tennis being played! With the 1st set and a break 
					being played outside we then retired to the 'taped' up indoor carpet courts losing just one game 
					and setting Richard x 2 up nicely!
				</p>
				<p class="matchreport">
					Richard &amp; Richard got off to a good start taking an early break. At 3-2 first set were 
					broken back only to produce some good returning to break hold and break to take the 1st set 
					comfortably. The 2nd set followed suit with an early break followed by Virgin 2 breaking back 
					at 2-3. Staying on serve until 5-6 where some good returning once again took its toll on Virgin's 
					2nd pair to hand out a 6-3 7-5 win and a 4 nil thrashing on the night to the mighty 1sts!! 
				</p>
				<p class="articleauthor">Daniel Eccleston</p>
			</li>

			<li>
				<a name="match11" id="match11" />
				<h2>Stratford (Home) - Monday 16/7/2012</h2>
				<p class="result">
					<span>Result:4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Daniel Eccleston &amp; Josh Crisp-Jones and Oliver Plaskett and Richard Allen 
				</p>
				<p class="matchreport">
					 The 1st Team were at home on Monday vs the in form Stratford 1 - a team that had beaten 
					WBC 1 4-0 and VA1 3-1 in the last 10 days.
				</p>
				<p class="matchreport">
					In the absence of our Captain - in the name of fatherhood we had: Dan, JCJ, Plaso and myself. 
					Mindful of Dans niggling shoulder injury we placed both Ol Parry and even little Harvey on 
					standby - neither were required but we appreciated them turning up just in case.
				</p>
				<p class="matchreport">
					Stratford named an unchanged side after recent successes, but looked as keen to compete as VA2 
					did the week before them! The home side were bouyed by Dan passing a late fitness test and a 
					capacity crowd - which actually turned out to be the local choir club who were using the venue 
					to screen 'A night at the proms'. The calibre of the tennis did turn a few heads though as both 
					home pairs got out of the blocks quickly - both breaking in the 1st games. Dan and Josh went on 
					to win 6-2, with Plas and Rich taking theirs 6-1.
				</p>
				<p class="matchreport">
					While the visitors 2nd pair crumbled to Olly and Rich in the 2nd 6-1, their 1st pair - unbeaten 
					this season started to find their feet and were putting up a solid effort in the 2nd set. Dan 
					and JCJ raised the bar with some desirable doubles and relentless returns. This lead to a break 
					at the business end of the 2nd set and they took the 2nd set 6-4.
				</p>
				<p class="matchreport">
					With the visitors heads dropping and HiA 2-0 up at the turn, the home side  continued where they 
					left off in the return rubbers, again breaking early. Dan and JCJ made light work of their opponents 
					winning 6-2 1st set. They were a little more easy going in the 2nd set and did have a few scary 
					moments as complacency set in, but completed the win with a 6-4 2nd much to Harvey's delight!!
				</p>
				<p class="matchreport">
					Rich and Plaso however made a meal of their 1st set, relinquishing the break after serving for it 
					at 5-3, eventually taking it 7-6 - 7-0 tiebreak. With the wind behind them in the 2nd set the lads 
					closed the match out 6-2 in convincing fashion.
				</p>
				<p class="matchreport">
					The supper was full of tales and the usual JCJ banter, and the menu was supplemented by the generous 
					choir club who gave surplus fish and chips, cake and strawberries to some very grateful tennis players!
				</p>
				<p class="matchreport" style="text-align: center;">
					<span style="font-weight: bold; font-size: 110%; color: red;">
						Finally, congratulations to Tony and Jo on the birth of Luca Alexander Eccleston 12.07.12.
					</span>
				</p>
				<p class="articleauthor">Richard Allen</p>
			</li>

			<li>
				<a name="match12" id="match12" />
				<h2>Leamington 1 (Away) - Wednesday 25/7/2012</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
				</p>
				<p class="matchreport">
					With three matches remaining, a game in hand and a 2 point lead at the top of the table, Wednesday’s 
					game was nothing less than critical… Our soldiers for the evening were Josh, Dan, Rich and myself.
				</p>
				<p class="matchreport">
					Leamington, although with a 7 point cushion over bottom of the table, still felt relegation was 
					possible and fielded their strongest team possible.
				</p>
				<p class="matchreport">
					So no pressure on us to get the job done then…
				</p>
				<p class="matchreport">
					Josh &amp; Dan got off to a slow start with Dan still trying to get his shoulder warmed up as it wasn’t 
					100%.  Also, having only played together a couple of times it took a little time to get used to each other.  
					So, they lost the first 7-5 … but Dan’s shoulder soon warmed up and their tennis relationship blossomed 
					enabling them to take the second set 6-1.  So, into a champ tie-break but Josh &amp; Dan now had the momentum 
					and brushed the opposition aside 10-5.
				</p>
				<p class="matchreport">
					Rich &amp; Tony rekindled an age old doubles relationship for the first time this season, having played 
					together in the past many times.  They started off against their second pair and soon got into their 
					stride breaking in the first few games.  This continued on through the match with Rich &amp; Tony coming 
					out winners 6-2, 6-2.
				</p>
				<p class="matchreport">
					2-0 up at the halfway stage.
				</p>
				<p class="matchreport">
					Dan and Josh then made easy work of Leam’s second pair winning 6-3, 6-2.
				</p>
				<p class="matchreport">
					So to walk away with a 4-0 win, Rich &amp; Tony had to beat their first pair which would give us a 6 point 
					lead at the top of the table with two matches to go…
				</p>
				<p class="matchreport">
					Having gone 4-2 down in the first set, R &amp; T realised they needed to make more balls and were possibly 
					paying their opponents too much respect.  So it was agreed the tennis had to be simple and we had to take 
					control of the net.  It worked and they took the first set 6-4.  Unfortunately the momentum didn’t run 
					into the second set (even though they went 1-0 up and had break point in the second game) and eventually 
					lost the second set 6-3.
				</p>
				<p class="matchreport">
					So, to another champ tie-break.  This one was very close with the match finding itself at 6-6.  But Rich &amp; 
					Tony went 8-6 down and things looked ominous…
				</p>
				<p class="matchreport">
					They then proceeded to play 4 of the best points they’ve ever played winning the match 10-8 with both of them 
					jumping up in the air, shortly joined by Dan & Josh for a big group celebration!!!  Well done Rich on some 
					fantastic volleying and I even had to admit that I did play an outrageous shot during those final points that 
					helped us on our way to victory!! 
				</p>
				<p class="articleauthor">Tony &quot;Daddy&quot; Eccleston</p>
			</li>

			<li>
				<a name="match13" id="match13" />
				<h2>Virgin Active 1 (Home) - Monday 30/7/2012</h2>
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
				<h2>Warwick Boat Club 1 (Away) - Monday 6/8/2012</h2>
				<p class="result">
					<span>Result:</span>No result availebl
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
			<li><a href="mens1stteamblog2011.asp">Mens 1st Team diary from 2011</a></li>
			<li><a href="mens2ndteamblog.asp">Mens 2nd Team diary</a></li>
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
