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
		<h1>Captains Log  - Mens 1st Team 2009</h1>
		<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st Team captain" />
		<p>
			Welcome to the diary from the Mens 1st Team for the 2009 season - the first in the Premier Division for some time. 
			Captain Mark (Joannides - see photo on left) returns to inspire his dedicated readership once again! Read, knowingly (or befuddled-ly) smile 
			(or wince - as appropriate) while Mark stirs up your supporting spirit with some stirring dialogue - the blagging in the past 
			that went on to do with after-match food and then Mark Walker's performance at golf was worthy of a Pullitzer!
			But you're not going to miss out this year - Oh no! If anyone writes about the Mens 1st Team then you can read it here.<br /><br />
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol>
			<li>
				<h2>David Lloyd, Solihull 1 (Away) - Monday 3 August, 2009</h2>
				<p>		
					Result:  
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Leamkngton 1 (Home) - Monday 27 July, 2009</h2>
				<p>
					Team: Rich Brindley and Tony Eccleston, Ian Poole and Mark Joannides
				</p>
				<p>
					Result:  Loss  3-1
				</p>
				<p>
					Hi Guys,
				</p>
				<p>
					Last nights 1st team match was at Hampton against Leamington 1 (3rd in the Prem) and was yet another highly important match 
					for us to make sure we stay in contention with the 2 teams above us if we hold any hope of catching them in the final week to 
					try and avoid relegation.
				</p>
				<p>
					The night started off hard for Ian &amp; myself with Ian still with nursing a sore ankle from a roll he had last week trying to take it 
					easy and not get injured. The pair were not big hitters but just very experienced doubles players who use the angles and their 
					volleys to make you stretch for every ball meaning that with the less pace and more ground to cover you rarely got into a rally 
					that you could put them under pressure. That said after losing the first set we managed to dig in and take the 2nd on the tie-break. 
					Going into the Championship tie-break it could have been anyones match but unfortunately we trailed quite badly early on but managed 
					the claw back to 6-8 but only to lose it 10-8.  A disappointing result after a great fight back.
				</p>
				<p>
					Tony &amp; Rich also had their share of tie-breaks but like Ian &amp; myself got narrowly pipped at the post to lose to a very similar score 
					in the C/tie-break. Another close match that could quite easily have turned in our favour on a couple of occasions.
				</p>
				<p>
					The second set of rubbers didn't get much better, Rich &amp; Tony had similar problems to us against the 2nd pair and struggled to get 
					into rallies against the troublesome pairing and ended the night losing both rubbers which came as a big shock to me and Ian who were 
					really hoping they got the point of the night and took a little pressure off our match.
				</p>
				<p>
					Luckily enough though Ian &amp; I found our form and managed, against the odds to beat the strongest pair from leamington in what was an 
					extremely close match with several breaks and again a tie-break and the C/tie-break which we eventually won to much relief 10-8. 
					Probably some of the best tennis we have played in a while and has certainly lifted my spirits about our competitiveness in this 
					division even without our strongest player.
				</p>
				<p>
					I must admit that the crowd that were supporting us really did help and kept us positive.  I'd just like to thank everyone that has 
					come and supported all of the teams this year but especially on Monday nights when the 1st team has been at home, The tennis is gaining 
					in followers every week and it's such a shame that the season is almost over. I've seen many social members watching as well as tennis 
					players from our other teams supporting most weeks with the regulars who deserve a special mention being Matt &amp; Jonny Hunt and the rest 
					of the Tea coseys. Daniel Eccleston who although can't play due to injury has come and cheered/occasionally heckled us to keep us going 
					and Chester &amp; Jayne who have been spotted on several occasion willing us on and also a huge thanks to the girlfriends/wife that put up 
					with us every week making them sit and watch whether rain or shine.
				</p>
				<p>
					The 1st team now only have 1 match left which is against David Lloyd Solihull away next Monday and we now need 4-0 and the other closest 
					two opposition teams to have a bad week. Maybe a stretch too far but we are not out of it yet and will do everything we can to stay in 
					this Division.
				</p>
				<p class="articleauthor">Mark-y Mark</p>
			</li>
			<li>
				<h2>Warwick Boat Club 2 (Home) - Monday 20 July, 2009</h2>
				<p>
					Team: Mark Joannides and Tony Eccleston, Ian Poole and Rich Brindley
				</p>
				<p>
					Result:  Win  3-1
				</p>
				<p>
					Last night we played hosts to the team that gained promotion with us last year Boat Club 2. We know that they have a very solid team 
					and have done well this year being in 4th place - with this year being almost wiped out by player availability for us it great to start 
					seeing full 1st team squads playing and doing well and it shows that with 3 of our preferred 4 playing and me in reserve we can do very 
					well in this league as we found out last night.
				</p>
				<p>
					The tone for the night was definitely set from the start with Ian &amp; Richie B holding their nerves (just) in a marathon first match 
					that ended up 14-12 in the Championship Tiebreak to clinch the first rubber of the night and definitely one of the closest matches I've 
					seen this season. Whereas Tony &amp; Myself managed to fight back in both sets and hold nerve to win both of our sets in a tiebreak to 
					give Hampton a 2-0 lead at the half way point.
				</p>
				<p>
					By this time quite a crowd had gathered to watch both ourselves and our 4th team who were also having quite a good night, It's great to 
					see both Social members as well as several of our players and friends from our other teams - Matt &amp; Jonny, Dan, Chester, Nigel to name a few
					- out on the terrace. Thanks guys its greatly appreciated.
				</p>
				<p>
					The second leg didn't disappoint, Rich &amp; Ian showed their skills that has seen them victorious every week when they have played together 
					and managed to secure their win in two straight sets.
				</p>
				<p>
					Tony &amp; I playing against the stronger pair had our work cut out for us and went a break down early on but managed to make a good recovery 
					to pull back to 5-4 (from 5-2 down) but unfortunately lost the opening set 6-4. Again in the second set it was close and some of our best 
					tennis started to be played but in the end the awesome returning of our opponents was where we lost the match as we really struggled on 
					every service game to hold. Ultimately we made our chances and were only ever a point or so away from a turnaround but again we just got 
					pipped at the end 6-4 to give them a win but us the overall 3-1 win.
				</p>
				<p>
					With those points (16 in total this season) we still have a chance of escaping relegation and with Leamington 1 at Home next Monday, 
					if we can field our best 3/4 players we have another chance of picking up some more rubbers leaving only the last match against David Lloyd's 
					who are slowly getting closer to the relegation battle week by week.
				</p>
				<p>
					Thanks to Ian, Rich &amp; Tony for playing so well last night and finding the time to fit in these matches (especially Rich who is getting 
					married this weekend - best of luck to you from us all at Hampton) and thanks again to all the spectators who are supporting us and making 
					the nights even more enjoyable - Hopefully you can all be there for our last home match next Monday.
				</p>
				<p class="articleauthor">Mark-y Mark</p>
			</li>
			<li>
				<h2>Warwick Health and Rackets Club 1 (Home) - Monday 29 June, 2009</h2>
				<p>		
					Result:  
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Kenilworth 1 (Home) - Monday 22 June, 2009</h2>
				<p>		
					Result:  
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>David Lloyd (Solihull) 1 (Home) - Monday 15 June, 2009</h2>
				<p>		
					Result:  Draw 2-2 (technical win for Hampton 5 sets to 4)
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Leamington 1 (Away) - Tuesday 9 June, 2009</h2>
				<p>		
					Result:   Hampton lost 3-1
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Warwick Boat Club 2 (Away) - Monday 18 May, 2009</h2>
				<p>		
					Result:   Hampton lost 3-1
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Warwick Boat Club 1 (Home) - Monday 18 May, 2009</h2>
				<p>		
				</p>
				<p>
					See you all soon
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Beechwood 1 (Away) - Monday 11 May, 2009</h2>
				<p>		
					Good Morning All,
				</p>
				<p>
					Another difficult night for the 1st team away against last years winners Beechwood 1.
				</p>
				<p>
					We knew this was going to be a difficult match to come out with much and still without Dan or Ian it's more 
					about trying to pick up bonus rubbers than actually looking to win.  We managed to have some great rally's but 
					were unable to put enough pressure on them to force many mistakes or to draw any easy winners and although there 
					were many closely contested games we were inevitably always on the wrong end of the game point. I managed to roll 
					my ankle quiet severely at 2-2 in the first set and that basically ended my night as although I played on it was 
					more to keep me from being sat on the sideline for the rest of the night as I could hardly move and had to hope they 
					played the ball straight to me - they are rarely so obliging in this division .
				</p>
				<p>
					See you all soon
				</p>
				<p class="articleauthor">Mark J</p>
			</li>		
			<li>
				<h2>Warwick Health and Rackets Club 1 (Away) - Monday 4 May, 2009</h2>
				<p>		
					Hmmmm,
				</p>
				<p>
					Not quite the result we wanted and definitely one we did not expect but we got royally turned over 4-0.
				</p>
				<p>
					The Esporta lads definitely aren't going to be at the top of the Premier so to lose was a real disappointment and especially 
					not to pick up any points at all but these things do happen.
				</p>
				<p>
					On the Night the team was Charlie and Tony's Body (his mind was still somewhere in between Apres Solihull and the Kings Fryer 
					at 2.30am on Monday morning) They struggled really to find their rhythm and lost both rubbers even though in the first match 
					we were convinced they were winning. The other pair was myself and Mark Walker, We put up a strong fight in both matches and 
					were up in every set by at least 1 break but just couldn't close out the sets which was our undoing as we went down 7-6 6-3 
					and then against there first pair 7-6 6-4, We should have been a set up in both matches and then it could have been a much 
					better ending result.
				</p>
				<p>
					Anyway, we need to put that match out of our mind and focus on the next 2 matches which are against last years winners and 
					runners up (Beechwood and Warwick Boat Club).
				</p>
				<p>
					Lets hope we can pick up a couple of surprise rubbers to pull us back up the table
				</p>
				<p class="articleauthor">Mark J</p>
			</li>
			<li>
				<h2>Kenilworth 1 (Away) - Tuesday 28 April, 2009</h2>
				<p>		
					Morning all,
				</p>
				<p>
					Yes it's this time of year again!!!!!!!!!!!  Match reviews/updates
				</p>
				<p>
					The 1st team had it's first match in the Coventry & N. Warwickshire Premier Division for the first time in over a decade and it 
					was a good start to the season. Like Geoff's 4th team we came away with a good 2-2 (5-4 sets loss - 35-43 games) draw which is 
					great to get some points on the board and settle some nerves going into the higher division.
				</p>
				<p>
					Apart from the 45-min down pour that almost put an end to our night it was a very good evenings tennis with several close sets 
					and one ridiculously close Championship Tie Break where Hampton's 1st pair came back from 8-4 down to win 11-9 including saving 
					a match point with a mishit return which manages to loop over our opponents heads and right onto the baseline. (Oh yes the Gods 
					were watching out for us!!!)
				</p>
				<p>
					It was definitely a good sign though as it shows that even without Daniel, Ian or Richie B we still have a squad strong enough 
					to compete with the other teams in the division and with the mentioned players being available in a few weeks I look forward to 
					some even better results to move us up the table.
				</p>
				<p>
					Our team for this encounter was: ????.
				</p>
				<p class="articleauthor">Mark J</p>
			</li>
		</ol>
		<h2>See Also:</h2>
		<ul>
			<li><a href="mens1stteamblog2008.asp">Mens 1st Team diary from 2008</a></li>
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
