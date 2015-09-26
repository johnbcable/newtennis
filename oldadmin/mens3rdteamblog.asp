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
		<h1>Mens 3rd Team 2012</h1>
		<img src="images/steveray1.jpg" border="0" alt="Steve Ray - Mens 3rd Team captain" />
		<p>
			Welcome to the diary from the merry men of our Mens 3rd Team for the 2012 season. Smile (or wince - as appropriate) 
			while you warm your cockles with some stirring match reporting. We hope that you're not going to miss out on 3rd team 
			match reports this year - Oh no! If anyone writes about the Mens 3rd Team then read it here.
		</p>
		<p>
			Organised in date order - scroll down to see most recent reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />
				<h2>Berkswell 3 (Home) - Wednesday 2/5/2012</h2>
				<p class="result">
					<span>Result:</span>3 : 1   WIN
				</p>
				<p class="team">
					<span>Team:</span>Andy Frith &amp; Jonny Hunt<br />Mark Walker &amp; Savio Gaspar  
				</p>
				<p class="matchreport">
					 Andy Frith and Jonny Hunt won both in tie breaks.
				</p>
				<p class="matchreport">
					 Mark Walker and Sav won one straight sets and lost one on a tie break
				</p>
				<p class="matchreport">
					 Pizza and chips ( bit late ) enjoyed by all 
				</p>
				<p class="articleauthor">Savio Gaspar</p>
			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Beechwood 5 (Away) - Tuesday 8/5/2012</h2>
				<p class="result">
					<span>Result:</span>2  -  2    DRAW
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt and Andy Frith<br />Savio Gapsar and Rob Yates  
				</p>
				<p class="matchreport">
					 Well done to Jonny and Andy who win both games and remain unbeaten.
				</p>
				<p class="matchreport">
					 Sav and Rob lost the first match in straight sets and were then unlucky to 
					lose their second in a championship tiebreak
				</p>
				<p class="matchreport">
					 Captain Steve made an appearance to console us( ?!)  afterwards ! 
					 [ED: I don't even want to think about that!]
				</p>
				<p class="articleauthor">Sav G.</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Whitnash (Home) - Wednesday 16/5/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt and Andy Frith<br />Matthew Hunt and Savio Gaspar  
				</p>
				<p class="matchreport">
					The 3rd team surged to the top of the league with an impressive and comfortable 4-0 
					victory over Whitnash.
				</p>
				<p class="matchreport">
					Jonny Hunt &amp; Andrew Frith maintained their 3rd team unbeaten record, only dropping 
					6 games in the process (shame that they couldn't keep the 100% winning record for the 
					season when playing for the 4th team on Friday night!).
				</p>
				<p class="matchreport">
					Matt Hunt &amp; Savio made a pretty comfortable start against the Whitnash 2nd pair. 
					They then found it a bit trickier closing out victory against the Whitnash first pair 
					but eventually got across the winning line 7-5.
				</p>
				<p class="matchreport">
					So far in this Division, everyone has been taking points off each other, so a 4-0 win 
					makes a big difference.
				</p>
				<p class="matchreport">
					A great week with the 1st, 2nd and 3rd teams all winning 4-0 and all topping their 
					respective Divisions.
				</p>
				<p class="matchreport">
					A great week with the 1st, 2nd and 3rd teams all winning 4-0 and all topping their 
					respective Divisions.
				</p>
				<p class="articleauthor">Steve Ray</p>
				<p class="matchreport" style="border-top: 1px solid black; padding-top: 10px;">
					<strong>From Rich Allen</strong>: Well done to steve and the 3rds.
				</p>
				<p class="matchreport">
					From where I was standing I thought Matt and Savio were just giving them a few games 
					to make them feel better after 2 heavy beatings. 
				</p>
				<p class="matchreport">
					Matt was teeing them up with his forehand and Savio knocking them off at the net at will! 
				</p>
				<p class="matchreport">
					One observation Steve: have Jonny and Andrew been excused from using the scoreboard on 
					the basis that their score is obvious!?
				</p>
				<p class="matchreport" style="border-top: 1px solid black; padding-top: 10px;">
					<strong>Right to Reply -  Andy Frith</strong>: We should probably start using the scoreboard 
					as twice now the opposition has tried to swindle us out of a game on change of ends...
				</p>
				<p class="matchreport">
					But disregarding that.... Yes...the score should be obvious!;-)
				</p>
				<p class="matchreport">
					From where I was standing I thought Matt and Savio were just giving them a few games 
					to make them feel better after 2 heavy beatings. 
				</p>
			</li>

			<li>
				<a name="match4" id="match4" />
				<h2>Warwick Tennis Club 3 (Away) - Wednesday 23/5/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Graham Hollway and Craig Gordon<br />Jonny Hunt and Matthew Hunt  
				</p>
				<p class="matchreport">
					 Match v Warwick by the race course. Graham and Craig won their first match at a 
					canter 6-0 6-0 just as Matt and Jonny started their second set and a large hurdle 
					started to loom before them. Jonny playing like a 'Gelding' who had just had his 
					............ chopped off got slower and slower while Matt's topspin forehand was 
					thrashing around like a mare at stud. After what seemed like 2 hours they just 
					lost the championship tie break 7-10 a great effort,  but like the Grand National, 
					second is nowhere!!
				</p>
				<p class="matchreport">
					Warwick racecourse could be viewed from the courts and the cheers of the crowd and 
					the sweating mares reminded us of what lay ahead. Within 25 mins Craig and Graham 
					had stuffed the opposition 6-1,6-0 and went and sat down on the Pavilion seats to 
					wait for the youngsters to finish off. At around 10pm two very weary Hampton players 
					having won 7-5 6-4.staggered off the courts. From our &quot;dug out&quot; it had been 
					very difficult to know if the boys had won or lost each game as their &quot;body&quot; 
					language never gave Graig and I a clue 'cos Jonny had had enough!! But Jonny and Matt 
					&quot;manned up&quot; and did the business, well done boys.
				</p>
				<p class="matchreport">
					 We all went to a local pub where platefuls of chips were served. Jonny was like a new 
					man and made a big impression on their consumption. A beautiful evening ( as Al Murray 
					would say) playing a &quot;beautiful game&quot; it was fun. 
				</p>
				<p class="articleauthor">Graham Hollway</p>
				<p class="matchreport" style="border-top: 1px solid black; margin-top: 10px; padding-top: 10px;">
					A special mention for Jonny, setting it in context, he had spent all morning in A&amp;E with 
					a fractured big toe. <br /><br />
					Doctors told him not to play sport for 4 weeks, but dosed up on pain killers and spray on 
					the big toe, he still turned out and won a rubber and only narrowly failed in the other 
					(I understand Matt played well!!) <br /><br />
					Respect! 
				</p>
			</li>

			<li>
				<a name="match5" id="match5" />
				<h2>Kenilworth 3 (Home) - Wednesday 30/5/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1   WIN
				</p>
				<p class="team">
					<span>Team:</span>Matt and Andy Frith<br />Graham Hollway and Mark Walker  
				</p>
				<p class="matchreport">
					Matt and Andy had a good tussle with their first match wining the championship tiebreak comfortably. 
					Graham and Mark had a 7-5 6-2 win with MW&apos;s power making it a stroll.
				</p>
				<p class="matchreport">
					Matt and Andy had an easy win in the next match while Mark and Graham raced away with the first set 
					6-1 but confusion on the second set score meant a 3-2 lead was reversed to be 2-3 down. A lesson here 
					is to call out the score after every game, without fail, even if you are winning easily. Sadly 
					Marks shoulder went, so after a great fight we lost 10-8 in the tie break.
				</p>
				<p class="matchreport">
					Supper was to die for. A 3 course meal of the highest standard by Andy, well done and thank you very much. 
				</p>
				<p class="articleauthor">Graham Hollway</p>
			</li>

			<li>
				<a name="match6" id="match6" />
				<h2>LMRCA (Home) - Wednesday 13/6/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Matthew Hunt and Mark Walker<br />Andy Frith and Jonny Hunt  
				</p>
				<p class="matchreport">
					 We were awesome and won 3-1.  They got lucky in one match and managed to pinch a rubber.
				</p>
				<p class="matchreport">
					 Food was equally as good.
				</p>
				<p class="matchreport">
					 Simples. 
				</p>
				<p class="articleauthor">Matt Hunt</p>
				<p class="matchreport">
					 <strong>Additional notes from Mark J.</strong> 
				</p>
				<p class="matchreport">
					The highlight for me was watching our 3rd team, especially Matt and Mark W who had 
					to brave the poor weather and ended up winning a nail biting Championship Tie break 
					10-8 at 9.58pm (2 mins to lights shutoff!!) to give our 3rd team a 3-1 win. Well done 
					guys and keep it going. 
				</p>
				<p class="articleauthor">Mark Joannides</p>
			</li>

			<li>
				<a name="match7" id="match7" />
				<h2>Berkswell 4 (Away) - Monday 18/6/2012</h2>
				<p class="result">
					<span>Result:</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Mark Walker and Matt Hunt<br />Jonny Hunt and Andy Frith  
				</p>
				<p class="matchreport">
					 A satisfying 3-1 win to Hampton! Well, almost satisfying as we should have really got 4-0 :(
				</p>
				<p class="matchreport">
					Berkswell put out a suspiciously strong looking team including one of their coaches Colin.
				</p>
				<p class="matchreport">
					Mark and Matt started off well winning their first match comfortably and started off 2nd match well 
					winning 1st set but somehow lost the 2nd set and then championship tie break. That wasn't in the 
					script! Mark played really well and very solid but unfortunately I didn't play so well in the 2nd 
					game as energy levels dipped! That'll teach me for having a heavy weekend! Ha! Sorry Mark - I'll 
					make it up to you in next match! Or it could have been Chris Barker on one of the other courts 
					shouting which put me off?!!!
				</p>
				<p class="matchreport">
					Jonny and Andy played amazing tennis - serving strongly and hitting all their shots on the fast 
					Astro surface. In this league it is easy to be dragged down to opponents level of hacking and lobbing 
					but they stuck to game plan and blasted their way to 2 great wins. Best I've seen either of them play 
					all season.
				</p>
				<p class="matchreport">
					Their first match was a tight one ending up winning on championship tie break 10-8. One of the funniest 
					and strangest things I have ever seen on a tennis court was Andy Frith serving at match point - 
					HE STOPPED AND PAUSED FOR A MOMENT, SHOOK HIS ARMS OUT, PUFFED OUT HIS CHEEKS AND THEN PROCEEDED TO SAY 
					I'M SORRY I AM REALLY NERVOUS TO THE OPPOSITION!!! Was hilarious and thank god he put in a heavy first 
					serve to seal the win otherwise he never would have lived that one down. Or he still might not live that 
					one down. Shall we call him 'Nervous Andy' from now on?! Sorry mate but had to be reported!!
				</p>
				<p class="articleauthor">Matt Hunt</p>
			</li>

			<li>
				<a name="match8" id="match8" />
				<h2>Berkswell 3 (Away) - Monday 25/6/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Andy Frith and Graham Hollway &amp; Nigel Jones
				</p>
				<p class="matchreport">
					 Well Andy &amp; I got off to a shocker in our 1st match! 5-1 down in no time at all. But we managed to 
					eventually start playing and won the next 6 games to take it 7-5. Then we fell asleep again losing the 
					second set 3-6 but held it together to take the championship tiebreak 10-8. Our second match was more 
					comfortable and we took it 6-4 6-1. Wasn't great tennis from us but both played well in patches and got 
					us over the finishing line!
				</p>
				<p class="matchreport">
					Graham &amp; Nigel got off to the same bad start as us in their 1st match being 4-1 down. But they also 
					pulled it out of the bag and won 5 straight games to take the 1st set 6-4! They then went on to take the 
					second set easily 6-1 playing some great tennis. Their second match was a close affair but they won it 
					in straight sets 6-4 6-4. A great effort especially as Graham turned up with a damaged hamstring which 
					he only made worse on the night so fair play Graham.
				</p>
				<p class="articleauthor">Jonny Hunt</p>
			</li>

			<li>
				<a name="match9" id="match9" />
				<h2>Beechwood 5 (Home) - Wednesday 4/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Andy Frith and Mark Walker &amp; Nigel Jones.  
				</p>
				<p class="matchreport">
					Just for a change, Jonny &amp; Andy avoided any 3rd set tie-breaks dropping only 
					10 games across the two rubbers.
				</p>
				<p class="matchreport">
					Nigel &amp; Mark clearly liked playing in the rain as they allowed their second 
					match to go to a 2nd set tie-break but they held their nerve to secure victory 
					in the worst of the conditions.
				</p>
				<p class="matchreport">
					The boys managed to maintain their concentration in spite of a very broken Mark 
					Joannides racket being projected over the perimeter fencing in a moment (or was 
					it 5 minutes) of frustration!
				</p>
				<p class="matchreport">
					Look forward to the explanation in the 2nd team match report.....
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match10" id="match10" />
				<h2>Whitnash (Away) - Tuesday 10/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Andy Frith; Matt Hunt &amp;Mark Walker.  
				</p>
				<p class="matchreport">
					With top of the table Hampton against bottom of the table Whitnash, the biggest threat to 
					our win tonight was the weather.
				</p>
				<p class="matchreport">
					A number of frantic phone calls about the weather in the hour before the match was as exciting 
					as it got, with straight sets victories all round for the loss of only 15 games in total. The 
					4-0 win preserves at least an 8 point gap over 2nd place and, other results permitting, possibly 
					a 12 point gap over 3rd place with 4 games to go.
				</p>
				<p class="articleauthor">Steve Ray</p>
				<p class="matchreport">
					The 3rd team match report forgot to document the catering at Whitnash, which I believe deserves 
					special mention.
				</p>
				<p class="matchreport">
					After the cold damp conditions on a tennis court which closely resembled the state of the British 
					roads we were "treated" to a rather old looking bottle of ketchup (it was however Heinz) and a tray 
					of white rolls (more of a granary man myself) with pig products inside (I hadn't eaten breakfast 
					that morning so although in reverse wasn't completely unwelcome), this was from the team whom I 
					believe we served up canapes.
				</p>
				<p class="matchreport">
					On the positive side, the beer was cold and my car didn't get broken into (which I thought it would be).
				</p>
				<p class="articleauthor">Andy Frith</p>
				<p class="matchreport">
					Rich,<br />
					<br />
					There comes a time when you are so far ahead in the league you can afford to let your star lefty canoe 
					his way across the States and still wind up champs!  Steve is going to make a star guest appearance over 
					the next few weeks seeing as he is our revered leader. [Huh? Ed.] MJ managed to miss Andy with his 
					racket chucking over court 1 last week so I don’t think he’s to bothered about getting &lhdquot;framed&rhdquot;
				</p>
				<p class="matchreport">
					Boom Boom.
				</p>
				<p class="articleauthor">Mark Walker</p>
			</li>
			<li>
				<a name="match11" id="match11" />
				<h2>Warwick Tennis Club 3 (Home) - Wednesday 18/7/2012</h2>
				<p class="result">
					<span>Result:&nbsp;</span>3  -  1    WIN
				</p>
				<p class="team">
					<span>Team:</span>Matt Hunt &amp; Jonny Hunt and Steve Ray &amp; Chris Barnes 
				</p>
				<p class="matchreport">
					With Mark Walker playing for the 2nd team and Andy Frith missing the first of 3 matches due to holidays (!!), 
					a chance for Steve &amp; Chester to step up to the challenge! [Surely you mean &quot;return to&quot;?  Ed. ]
				</p>
				<p class="matchreport">
					Matt &amp; Jonny were not at their best in the first rubber but were still able to come through in straight 
					sets 6-4 6-4.
				</p>
				<p class="matchreport">
					Steve &amp; Chester made their customary slow start unwinding from a tough day at the office ([We ARE talking 
					about you guys, right? Ed.]!!) but then found some form in the 2nd set to take it to a 3rd set tie-break. S&amp;C 
					[Lovin' the 1st team use of initials - well played. Ed.] haven't had a good 3rd set record this year and the 
					trend continued as we went down 10-6!
				</p>
				<p class="matchreport">
					In the reverse rubbers, Steve &amp; Chester seemed to be making lighter work of the Warwick 1st pair as they 
					raced through the 1st set 6-2 and 4-2 up in the 2nd with the opposition looking ready to wave the white flag. 
					Not sure what went wrong then but the opposition turned it around to win the 2nd set on a tie break.
				</p>
				<p class="matchreport">
					Meanwhile, Jonny &amp; Matt were having a real tussle with the Warwick 2nd pair nervously finding themselves at 
					8-8 in a 3rd set tie-break but they held steady to get across the finish line 10-8.
				</p>
				<p class="matchreport">
					So as 10pm approached could Steve &amp; Chester deliver the goods in the 3rd set tie break? No problem (?) as 
					they ran out comfortable 10-5 winners.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>

			<li>
				<a name="match12" id="match12" />
				<h2>Kenilworth 3 (Away) - Wednesday 25/7/2012</h2>
				<p class="result">
					<span>Result:</span>4  -  0    WIN
				</p>
				<p class="team">
					<span>Team:</span>Mark Walker &amp; Matt Hunt and Jonny Hunt &amp; Steve Ray  
				</p>
				<p class="matchreport">
					A beautiful evening for tennis and the quality of play was high from both teams, 
					with Hampton needing 3 rubbers to guarantee being promoted as Champions.
				</p>
				<p class="matchreport">
					Mark &amp; Matt seemed to be having really long high quality base line rallies against 
					the Kenilworth first pair and managed to ease to a 6-3 6-4 win, a scoreline that didn't 
					reflect how competitive the match appeared.
				</p>
				<p class="matchreport">
					Jonny &amp; Steve had an equally competitive match but with a scoreline of 6-2 6-3, 
					again it was a bit of an injustice on the Kenilworth pair. A pleasant change for me personally, 
					as we just kept winning the crucial points.
				</p>
				<p class="matchreport">
					Kenilworth were clearly a little frustrated and early in the second rubbers at one stage there 
					were vocal disputes of line calls on both courts at the same time - a bit out of character with 
					the rest of the evening!
				</p>
				<p class="matchreport">
					Jonny &amp; Steve were nicely relaxed after winning their first rubber and kept the momentum going 
					against the Kenilworth 1st pair taking the 1st set 6-2. Just as we were thinking about winning the 
					Championship clinching rubber, the opposition turned things around taking the 2nd set 6-4.
				</p>
				<p class="matchreport">
					Just as we were starting the 3rd set tie-break, Mark &amp; Matt closed out their second match 6-3 6-3 
					to secure the 3rd rubber and guarantee collection of the rather large trophy.
				</p>
				<p class="matchreport">
					It was just left to see whether Steve &amp; Jonny could finish the evening in style by taking the 3rd 
					set tie break, which they did 10-6!	
				</p>
				<p class="articleauthor">SDR</p>
			</li>

			<li>
				<a name="match13" id="match13" />
				<h2>LMRCA (Away) - Monday 30/7/2012</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>Jonny Hunt &amp; Steve Ray and Chris Barnes &amp; Xander Barnes  
				</p>
				<p class="matchreport">
					With promotion and the championship already in the bag, we travelled to 2nd placed LMRCA knowing that 
					it would be tough getting a result at a venue where home advantage was a considerable benefit (tarmac 
					courts with a nice greasy surface making a quick change in direction very difficult!).
				</p>
				<p class="matchreport">
					LMRCA had won their previous 3 home games 4-0, had their strongest team out and, no disrespect to the 
					team that played, we didn't have our strongest side out!
				</p>
				<p class="matchreport">
					As you may have gathered, I'm warming you up for bad news!
				</p>
				<p class="matchreport">
					Our team was Jonny Hunt &amp; Steve Ray and the father &amp; son combination of Chester &amp; Xander Barnes.
				</p>
				<p class="matchreport">
					After a great performance last week at Kenilworth, Jonny &amp; Steve failed to reach the same standard this 
					week with both rubbers very similar - comfortably winning the 1st set of each match, before "comfortably" 
					losing the the 2nd set (Jonny &amp; Steve a little frustrated by one of the opposition disappearing for 5 
					minutes at the end of the 1st set of the second match ruining the momentum!). Unfortunately, and unusually, 
					we then lost both 3rd set tie breaks. In the first, we came back from 3-8 to 8-8, prompting memories of a 
					famous come back at Leamington where we recovered from 4-9 to win, but it was not to be this time.
				</p>
				<p class="matchreport">
					On the other court, Xander and Chester started badly in the first rubber but reached a better level of 
					performance in the second rubber against the LMRCA 1st pair, saving multiple match points before taking 
					the 2nd set on a tie break as darkness descended. Jonny &amp; Steve stood to watch the drama of the 3rd 
					set tie break but I'm not sure why as at this stage we couldn't see the balls! As you may have gathered, 
					to go with the poor conditions underfoot there were no floodlights...
				</p>
				<p class="matchreport">
					It was a real lottery but Chester was adamant that he was not going to travel all the way back to Rugby 
					for a few points, so Chester &amp; Xander battled valiantly in the darkness only to go down narrowly in 
					the 3rd set tie break.
				</p>
				<p class="matchreport">
					Fortunately the result was not important in terms of league position but always very frustrating to lose 
					any 3rd set tie break, let alone 3 of them on one night!
				</p>
				<p class="matchreport">
					The other big downside is that the result virtually guarantees that LMRCA get promoted with us and we 
					will have to go back there again next year!!
				</p>
				<p class="matchreport">
					However, to brighten up the evening we phoned Tony on the way home who gave us news of the 1st team's 
					4-0 win to secure the Premier Division Championship for the first time in the history of Hampton Tennis Club.
				</p>
				<p class="matchreport">
					An absolutely fantastic achievement - well done to you all!
				</p>
				<p class="articleauthor">Steve &quot;Tie Break&quot; Ray</p>
			</li>

			<li>
				<a name="match14" id="match14" />
				<h2>Berkswell 4 (Home) - Wednesday 8/8/2012</h2>
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
			<li><a href="mens3rdteamblog2011.asp">Mens 3rd Team diary from 2011</a></li>
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
