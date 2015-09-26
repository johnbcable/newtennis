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
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Mens 3rd Team 2008 - Hitting the Campaign Trail</h3>
		<div id="markj020608" class="floatleft" style="height:230px; border:none;">
			<img src="images/geoffr.jpg" border="0" alt="Geoff Redfern - Mens 3rd Team captain" />
			<p class="caption">Geoff Redfern - Mens 3rd Team captain<br />... and part-time player!</p>
		</div>
		<p>
			Welcome to the diary from the genial Geoff and the merry men of our Mens 3rd Team for the 2008 season. This is the first season that commentary from the 3rd team 
			has seen the light of day but as uber-captain Mark (Joannides) is desperate for that Pullitzer with his 1st team reports, he&apos;s dragging other captains along
			with him into the publishing limelight! Smile (or wince - as appropriate) while Geoff or Mark warm your cockles with some stirring match reporting. 
			We hope that you're not going to miss out on 3rd team match reports this year - Oh no! If anyone writes about the Mens 3rd Team then read it here.<br /><br />
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Berkswell 5 (Thursday 7 August, 2008)</u></p>
			<p>
				2 - 2<br /><br />
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Sphinx 3 (Tuesday 29 July, 2008)</u></p>
			<p>
				Team:<br /><br />
				Simon Farrant &amp; Simon Stanley<br /><br />
				Geoff Redfern &amp; David Sabine<br /><br />
				So (me apart) strong team on paper.<br /><br />
				Unusual start as when we arrived there were not only no balls, but no nets.  Nets arrived about 6.35, balls (7 not 8 for some reason) about 6.45.  
				Due to the late start, some close matches and something approaching 2 shed loads of deuces we didn’t finish until just after 10.30.  We’re not 18 anymore you know!<br /><br />
				Simon &amp; Simon are magnificent in their consistency.  They lost their first set of the evening but then only 11 more games all night taking their next 4 
				sets fairly comfortably.<br /><br />
				Myself &amp; David. Well it was v close. David’s first match for the 3 rd team this year and plenty of deft touches and volleys were put away.  
				But we were pipped at the post.  We couldn’t believe it.  Two three set matches, and lost both in a third set tie-break.  We must need penalty shoot-out practice!!!  
				Our games scores in each set read 5, 7, 6, 6, 4, 6.  34 games won and we still lost. We (particularly me) were gutted.  I’m not going to give any details about Simon F 
				receiving a serve from behind him on the ear.  Or one of the opposition volleying a ball into their own eye.  I’m not mentioning serious score confusion in one set 
				where an inexperienced opposition fella claimed it was 6-4 when it was 4-4.  Lots of other incidents, but you know what it’s like! <br /><br />
				After a season where every player involved in the 3rd team has played better than I’ve seen them play before, I think we may still just miss promotion as we are 
				a point behind the team in 2nd place.  However, one slip from Rugby, plus a 4-0 from us next week and you never know.  I’m hoping for an unchanged team next week.<br /><br />
				Supper was chips and a sandwich assortment, beer was pleasant!  Regards,<br /><br />			</p>
			<p class="articleauthor">Geoff.</p>
		</div>				
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Coventry and North Warwicks 4 (Thursday 17 July, 2008)</u></p>
			<p>
				<br /><br />
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Warwick Tennis Club 3  (Thursday 3 July, 2008)</u></p>
			<p>
				Last weeks match report: Hampton 3rd (3 -1) Warwick TC 3rd<br /><br />
				The third team are currently third in the league with Beechwood on 20 points, LMRCA on 20 points and Hampton on 19.  Beechwood also have a match in hand.  
				This win takes Hampton up to 22 points keeping us up in the promotion race.  Whereabouts depends on the other team results.<br /><br />
				The match itself was a marathon, Warwick TC put up an almighty fight with the matches both finishing after 10.30 pm!!  Everyone getting their money’s worth.  
				The team was Simon Farrant (captain) &amp; Simon Stanley who won both their rubbers, they remain still undefeated although each match was 2 hours long.  
				Very well played!  Second pairing was Jacob Pratt and Mike Jones who were very solid again playing for over 4 and a quarter hours and gaining the win for the 
				team by achieving a 1-1 rubbers score.  There was a little problem on catering front although I believe that this was made up for, to some extent, by additional 
				procurement of beer.  I received a late night text from vice captain Farrant &quot;they left late, hungry and defeated, that’ll teach 'em!&quot;  <br /><br />
				With several of the team away with work, on holiday or at Wimbledon it was a great team effort to get the team together and get the win. Well played everyone.  
				A special mention to Xander Barnes too, who lined up for his first ever league match (as reserve) but everyone was able to play.  I’m sure that he’ll make the 
				team before the end of the season. <br /><br />
				After the last match &quot;marathon&quot; <span style="color:red; font-weight:bold;">THIS WEEK IS A WEEK OFF!!</span>  And well earned.  Our next match is at 
				home against Coventry &amp; North Warwicks on Thursday 17th July.  Plenty of time yet, but please let me know your availability.<br /><br />
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>										
		<div class="bordertop">
			<p class="blueheading"><u>Away versus LMRCA  (Monday 23 June, 2008)</u></p>
			<p>
				Unfortunately the third team were taught a lesson in percentage tennis and consistency last night at LMRCA.<br /><br />
				Simon Stanley (who had been ill all day but was v keen to play) teamed up with Mike Jones (who hasn’t played much tennis 
				lately but was also v keen to play) for their first match together.  Their first rubber was against their 1st pair and consistency 
				ruled from a very solid opposition pair, Simon &amp; Mike losing in 2 sets, but not without a battle.  Simon regained some of the colour 
				back to his face and Mike got more into the second match, with them clinching a well earned win 7-6 6-3. This unfortunately was our 
				only success of the night.  But well done to them both.<br /><br />
				I teamed up with Shakey again as the 2nd pair, we were currently 4 rubbers played together, won 2, lost 2.  We both played as well 
				as we have lately, and couldn’t have done much more than we did, but we were volleyed off the court.  It reminded me of playing against 
				Steve &amp; Chester, no matter what we did, the ball nearly always came back.  Our shots needed to be v good to win.  We did some good passing 
				shots and Shakeys serve really got going in the 2nd rubber, but it wasn’t enough.  Particularly the 1st pair that were net-rushers against us, 
				Shakey &amp; I had several conversations but we were often unaware of just how to beat them.<br /><br />
				Full credit to LMRCA who put out 2 solid pairs against us, especially their 1st pair who Simon commented that he &quot;hit one out the court but 
				still thought that the ball might come back&quot;!<br /><br />
				So a 3-1 loss, but a crucial point gained.  The match was played in a good spirit (as usual) and chip butties and a pint followed.  
				Next week is a home match on Thursday against Warwick, this is now a must win!  Simon Farrant is back in the team next week.  I’ve got lots of 
				practising to do otherwise I’ll be dropped!  Well played Simon, Mike &amp; Shakey.  We’ll get them next time.  
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>								
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Berkswell  (Monday 16 June, 2008)</u></p>
			<p>
				Simon Farrant and Simon Stanley (the Simons) were once again in imperious form and retain their places as the third teams top ranked pairing!  
				Their rather large serves didn’t give the opposition much chance and good returns and net play really finished off a great performance.  Once they were 
				fully used to the surface, only winning the first set 7-6, they only lost a couple more games for the rest of the evening.  Very well played, stylish and 
				consistent.<br /><br />
				David Margetts and myself started well taking the first rubber against the second pairing but just couldn’t win the important points in our second match 
				against their first pair losing in straight sets to their talented youngsters 6-4 &amp; 6-3.<br /><br />
				Result a solid 3-1 win.  Retaining our position at the top of the league and moving up to 15 points.  LMRCA are currently second, our opponents in our 
				away match on Monday 23rd. <br /><br />
				Well played to the team(s).
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>								
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Beechwood 5  (Friday 6 June, 2008)</u></p>
			<p>
				Tonight’s team is:<br /><br /> 
				David Margetts & Steve Ray<br />
				Jacob Pratt & Geoff Redfern<br /><br />
				Unlike the second team which was pretty strong, this team’s fairly strong but not pretty! <br /><br />
			</p>
			<p class="articleauthor">Geoff.</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Coventry and North Warwicks 4 (Thursday 22 May 2008)</u></p>
			<p>
					4 - 0 win<br /><br />
			</p>
			<p class="articleauthor">???</p>
		</div>

		<div class="bordertop">
			<p class="blueheading"><u>Away versus Warwick Tennis Club 3 (Tuesday 6 May 2008)</u></p>
			<div id="markj050508" class="floatright" style="height:230px;">
				<img src="images/markj.jpg" width="122" height="211" alt="Mark slums it with the thirds" />
				<p class="caption">1st team interloper tries his hand <br />at 3rd team matches</p>
			</div>			
			<p>
			Morning all,<br /><br />
			I know that you probably all bored of my many match reports already, But quite frankly it's tough because you going to get 
			them anyway!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!<br /><br />
			Last night was our 3rd Teams second match of the season against Warwick TC away at Warwick.<br /><br />
			With yet another perfect evening for tennis we managed to scrape together a slightly unorthodox team for the night with 
			Matt Hunt & Colin playing 1st pair and Myself and Rob Yates playing 2nd's.<br /><br />
			It was a very good evening's tennis and a great start for Matt, Colin & Rob who where playing in their 1st league match of the 
			season, to come out with a straight 4-0 win in straight sets is always a great confidence boost.<br /><br />
			Apart from Rob & Myself taking the first 20 mins to really pick up the pace of the game and find our range in a slightly 
			swirling wind and with an even worse sunspot on the courts than Hampton, it was then business as usual with us playing sensible 
			and solid tennis and not giving away many silly points we went on to win the first rubber in just under 45 mins, conveniently 
			Matt & Colin did exactly the same and looked to be playing really good doubles together and Colin was looking as if he was 
			finding his form with some great serves and volley's.<br /><br />
			The second match was same again for both pairs only dropping another 9 games overall and we were off court and back in the bar 
			before 8.30pm.<br /><br />
			So a great result with the 3rd team now with 7 rubbers out of a possible 8 and up at the top end of the table, Let's keep it up 
			and make sure we are still up top at the halfway point.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Home versus LMRCA 1  (Thursday 1 May, 2008)</u></p>
			<p>
				Good morning all,<br /><br />
				Another night and yet another good result result for Hampton's Men's teams, This time just without the swimming.<br /><br />
				A beautiful evening for league tennis blessed the 3rd last night with their 1st match of the 2008 season, and what a start 
				too with a 3-1 win against a team who had come down from a league above and whom had some very steady and accomplished players.<br /><br />
				The 2 Simon's (Stanley and Farrant) had a great night and although they dropped the opening rubber it wasn't through lack of trying as some of the 
				rally's seemed to be never ending and the court coverage and support for one another was truly amazing, it was just their final 
				shot that seemed to elude them. However against the no. 1 pair they to found their range and managed a great result to take the 
				rubber in the 3rd set,  Again it was down to lots of hard work and many miles back on forth across the tennis court as neither 
				of them seemed to stay in the same spot for more than a second.<br /><br />
				Myself and Geoff on the other hand were obviously enjoying the night too much and decided that making both rubbers into 3 set 
				matches was going to be fun. Luckily enough we managed to keep our composure when required and took the important points when 
				we needed to.  As a whole we played some very good tennis with Geoff's big forehand pushing the opposition back and leaving 
				some with some very easy volleys and a very solid serving performance from Geoff which was the most consistent of any ones on 
				the night and saving us on more than one occasion. So we managed to stay calm and win the 3rd set in both matches to take the 
				overall victory on what had been another good evenings tennis.<br /><br />
				2 matches down and 2 wins, just the 1st teams rematch to play to hopefully make it a perfect 3 to start the season.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
				<li><a href="mens2ndteamblog.asp">Mens 2nd Team diary</a></li>
			</ul>
		</div>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
