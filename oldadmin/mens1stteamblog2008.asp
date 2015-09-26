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
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Captains Log  - Mens 1st Team 2008</h3>
		<div id="markj020608" class="floatright" style="height:230px; border:none;">
			<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st Team captain" />
			<p class="caption">Mark Joannides - Mens 1st Team captain<br />... and part time journalist</p>
		</div>				
		<p>
			Welcome to the diary from the Mens 1st Team for the 2008 season. To be fair, Captain Mark (Joannides - see photo on right) has sent all his copy in on 
			time since the start of last season but it is only now that his public has demanded to see it! Read, knowingly (or befuddled-ly) smile 
			(or wince - as appropriate) while Mark stirs up your supporting spirit with some stirring dialogue - the blagging last season 
			that went on to do with after-match food and then Mark Walker's performance at golf was worthy of a Pullitzer!
			But you're not going to miss out this year - Oh no! If anyone writes about the Mens 1st Team then you can read it here.<br /><br />
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Berkswell 1 (Monday 4 August 2008)</u></p>
			<p>		
				Hi All,<br /><br />
				The 1st team have officially done it!!! Winning 4-0 over Berkswell yesterday night at home means we have secured our promotion for next season into the 
				premier division.<br /><br />
				It turned out to be a great night for tennis with good weather and a competitive game, The team was Tony &amp; Ian and then Matt &amp; Myself and I think it's fair 
				to say that we played really well and managed to get the perfect result. The after match entertainments went down very well with a great BBQ to keep us all 
				entertained until close to Midnight.<br /><br />
				I'd like to say a big thank you to everyone who came down last night to support us and to join in with the entertainments,  And a big thank you to John &amp; 
				Ro Eccleston who did the BBQ and other preparations for the dinner that everyone enjoyed so much.<br /><br />
				Also, many thanks to Graham Hollway and Chris Barker for raiding their cellars for the after-match wine.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Stratford (Wednesday 30 July 2008)</u></p>
			<p>		
				Well a very difficult night for us last night,<br /><br />
				Stratford whom we beat 4-0 at home earlier in the season put out a much stronger side last night than previous and with their home court advantage made things extremely difficult for us.<br /><br />
				The team was Dan &amp; Matt (1st pair) &amp; Ian and Myself (2nd pair) so on face value it was a strong team and should have been a convincing result.<br /><br />
				Ian and Myself who are unbeaten as a pair all season lost our first rubber 6-4 6-2 and not only did the opposition not miss a shot all night but also used the net to devastating effect on many occasions and twice on important points that ended up costing us big. Unfortunately we just couldn't seem to find any rhythym and the match was over before we even got into things.<br /><br />
				Our second match against a team that have played in the premiership started off well with everyone holding serve taking the 1st set to a tie break, we managed to get a 3-0 lead before things started to go against us. With the opposition hitting 2 amazing aces and a quick couple of break points they were ahead and that was the end of our challenge. The second set didn't go great with Ian having his serve broken twice ( the only 2 times all season I can remember him being broken) and us dropping to another 2 set defeat 7-6 6-3.<br /><br />
				Dan &amp; Matt played well in their 1st rubber to dismiss the stronger pair 6-3 7-6 with a lot of close points and amazing pickup's and gets from all over the court and for the record that was the 1st loss that pair had suffered all season or last so a great result for the lads.<br /><br />
				Their second match didn't go quite as well with the boys dropping the 1st set against a very tricky pair who by their team mates admission were having the game of their lives as they don't normally play that well. Lucky enough Matt &amp; Dan really dug into their reserves and kept their heads to battle back and win the 2nd set in a tie-break before sealing the draw with a great 3rd set to save our chances of promotion. Well done lads!!!!<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Beechwood 3 (Thursday 24 July 2008)</u></p>
			<p>		
				Last night we hard our 3rd from last match and a match that we couldn't slip up on so that the last 2 matches of the season are a little less stressful.<br /><br />
				Their team for the night was Tony &amp; myself as 1st pair and Mark W &amp;Steve R as our 2nd pair and it turned out to be a good night all round with a 
				very fair 2-2 draw.<br /><br />
				Tony &amp; myself managed to overcome both of the opposition pairs just dropping 1 set to their stronger pair but coming back to finish off strongly and 
				playing some very entertaining tennis, especially for the spectators who had gathered in the fine weather to watch.  Both of the Beechwood pairs were much 
				stronger players than they looked (technically speaking).<br /><br />
				Mark &amp;Steve also had a good nights tennis and played well in both matches especially bearing in mind it's only the 2nd time this season that they have 
				played up at the pace of Division 1.<br /><br />
				Unfortunately they couldn't quite win a few of the important points even though most games went to deuce but it was good to see that they enjoyed themselves 
				and pushed the opposition all the way with a very close 2nd match that could have gone their way with just a couple of points here and there.<br /><br />
				Well done team<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Coventry and North Warwicks 1 (Wednesday 16 July 2008)</u></p>
			<p>		
				Hi Guys,<br /><br />
				Hope everyone is well.<br /><br />
				Wednesday night was the 1st teams match against Cov &amp; N Wars and it was quite an important match as they are only 1 point behind us in the league.<br /><br />
				Unfortunately for us it turned out to be another difficult evening as Tony, Matt, Pete, Ian all unavailable and Dave, and Mark W already playing an 
				important 2nd team match so just Dan &amp; Myself ventured over needing to win both of our matches just to keep us ahead of them.<br /><br />
				Lucky enough we managed to do it but we did have a lapse of concentration during the 2nd rubber and dropped the second set but managed to re-compose 
				and get a 6-1 win in the 3rd set to finish the night 6-3 6-2 in the first rubber and 6-3 5-7 6-1 in the second.<br /><br />
				Although there is only 1 point between us in he leagues we have the advantage of having already played Warwick Boat club who are by far the 
				strongest team in the division apart from ourselves and Cov &amp; N Wars have the pleasure of entertaining them next week. Unless Warwick put out 
				a substantially weaker ream than usual they should hopefully take 3-4 points off Cov and hopefully give us a bit of a clear run to the end of the 
				season as we have 2 of the bottom teams left to play.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>										
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Leamington 2 (Monday 7 July 2008)</u></p>
			<p>		
				Well yesterday was shaping up to be a dismal day for tennis with the weather changing between rain, more rain and thunder showers all day long, 
				but at the last minute the rain dispersed and out came the sun.<br /><br />
				Dan &amp; Myself played as the 1st pair and started the night off very well with a quick and convincing 6-2 6-1 to put us on the right track.<br /><br />
				Unfortunately just as Dan &amp; I were finishing our match Tony &amp; Matt were just losing the first set of their match. All credit to Matt &amp; Tony as 
				they managed to slug out the rest of the match in what looked to be a very difficult and tyring match to come through victorious in the 3rd set just 2 1/2 hrs 
				after they started it!!!!!!!!!!!!!!!<br /><br />
				With the clouds starting to edge their way back towards Hampton we quickly got stuck into our second matches. Again Dan &amp; I made quick progress playing 
				a very good young pairing whom were scared to death of giving Dan any forehand shots as he almost impaled one of them off a return of serve in the 1st game. 
				Even scared to death they still played well and the end result didn't do justice to their efforts as we came out winners 6-2 6-2.<br /><br />
				Again Tony &amp; Matt had to claw their way back into the match after dropping the 1st set they managed to take the second in a tie brake to set up a 3rd set 
				decided, But as it was already 10.30 and lights should be off at 10pm and the fact that the clouds had truly rolled in and the rain was now lashing down it 
				was decided that the best way forward was to play a championship tie break to decide the outcome of the match.<br /><br />
				Tony &amp; Matt had a great start leading 4-1 and looking strong but then a sudden shift occurred and they didn't win another point losing 10-4 in the tie 
				break.<br /><br />
				All in all a great night and a good result 3-1 that puts Leamington out of the promotion race and keeping us firmly in the top 2 with Warwick Boat club.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>										
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Warwick Boat Club 2 (Thursday 3 July 2008)</u></p>
			<p>		
				Well a disappointing night for the 1st team. We were not able to get a team available due to Illness and other league commitments and 
				ended up with just Myself and our resident "ringer" Mr Jonathan Hunt going over to the strongest team in the divison.<br /><br />
				The first match against Warwicks 1st pair was over in record time with with both Jon and myself playing and serving well but with every 
				return being hit with so much power and acurracy that we struggled to string together a rally. We had to admit that we were well off the 
				pace losing 6-0 6-1.<br /><br />
				The second match was much more competitive and although we lost it 6-2 6-3 the game was much closer than the score suggests with every 
				game going to deuce and again Jon and myself hitting some great serves and just losing on the odd misplaced shot. It was a shame that the 
				luck hadn't been with us and then we could very well have taken them to a 3rd set.<br /><br />
				Never mind though as we are still in second place and next week have our strongest team yet available against the 3rd place Leamington.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>								
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Atherstone 1 (Monday 23 June 2008)</u></p>
			<p>		
				Good morning all,<br /><br />
				Last night the 1st team kicked off the second half of the season against Atherstone and what a start it was.<br /><br />
				The pairing's were Matt & Pete playing as our 1st Pair and Myself and Ian as the 2nd pair, the first match was possibly the quickest on record with 
				both pairs being finished and getting the half time drinks by 7.15pm and only dropping 1 game between us.<br /><br />
				The second match took a little longer but again it was a quick and very convincing win and a good 4-0 win to put us back into the top 2 in the 
				division and keep leamington and Beechwood a couple of rubbers behind.
			</p>
			<p class="articleauthor">Mark J</p>
		</div>						
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Berkswell 1 (Monday 16 June 2008)</u></p>
			<p>		
				Hi Guys,<br /><br />
				We faced our old friends this week at Berkswell and narrowly got a win (On sets albeit)!!!<br /><br />
				Ian and Pete played as our 1st pair and had a great night winning both of their matches and looking consistent and strong throughout the night. 
				They did manage to get sucked into Hollway and Barker's banter and drop a few silly games but managed to block out the taunts and win without 
				dropping a set, Well done boys.<br /><br />
				Dave and Myself played as the 2nd's and managed to have a dreadful night. Firstly Dave would have been better in the 1st match playing on his 
				own as I just couldn't find any consistency on the fast courts and having played Chester the night before for 2 and half hours my shoulder wasn't 
				in great shape anyway. Dave did play well and managed to keep us in the games but we just couldn't seem to win many games on the night.<br /><br />
				Second match however we started to get back into things and played some much better tennis. Late on in the 3rd set we managed to get back on a roll 
				and break serve to get back to 4-4 and with Dave serving very well things were looking great until Dave slipped over after a serve and fell really 
				badly on his elbow. After 5 mins of trying to stretch his pains away he bravely decided to continue on but struggled with his elbow and we unfortunately 
				dropped the last two games.<br /><br />
				So another draw on rubbers and win on sets to keep the promotion dream alive.<br /><br />
				Dave - Hope your arms gets better and thanks for continuing on bravely.
			</p>
			<p class="articleauthor">Mark J</p>
		</div>				
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Stratford 1 (Monday 9 June 2008)</u></p>
			<p>		
				4 - 0 to Hampton - 'nuff said!
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Beechwood 3  (Monday 2 June, 2008)</u></p>
			<p>
			Afternoon all,<br /><br />
			Our 1st team had our match against Beechwood 3 last night at home on what turned out to be a reasonable night for tennis, it was only 
			spoilt a little by 10 mins of light rain which we managed to play through.<br /><br />
			The team on the night consisted of Ian P &amp; myself and then Dave M and Matt H which was in my opinion a strong team and even without 
			Tony,Pete &amp; Dan who were playing for Solihull we still have to go into our matches looking for a draw minimum and a win if possible 
			and being quietly confident about a positive result.<br /><br />
			Ian &amp; myself started off the proceedings playing for the first time as a pairing with a rock solid performance with some great moments 
			of finesse, what worked the best was our near perfect volley's and dominance at the net managing to defeat a very experienced and big 
			hitting opponents 6-3 6-2.<br /><br />
			Matt &amp; Dave, again playing together for the first time looked to be playing well hitting some great ground strokes and looking as if 
			they were the more attacking side but somehow were struggling to break down their opponents and win any games, Looking at the match from 
			the spectators perspective they looked like the more physical, strong and more skilled team but still weren't winning the points and 
			unfortunately that was the story of their match eventually losing in 2 long sets.<br /><br />
			Onto the second match and again Ian &amp; myself came out revved up from our victory in the 1st match and although it took us a couple 
			of games to steady our strokes against a much slower pace of game we kept our consistency and our impeccable finishing and managed to 
			round off the night with a quick 6-1 6-1 victory and proved that this could be another strong pairing going forward into some of our 
			big matches towards the second half of the season.<br /><br />
			Again Matt and Dave came out guns blazing and looked to be playing the best tennis I have seen either of them ever play, whether forehand 
			or backhand they were unbeatable from the baseline matching their opponents perfectly but again the tale of the night was that the only 
			place they were lacking was the dominance at the net and that killer volley needed to win them games. It was a real shame with the lads 
			really testing Beechwood's 1st pair and pushing them all the way to the finish but again not even a set to show for their hard work which 
			was the least they deserved taking into account the standard of their play.<br /><br />
			So a 2-2 draw but a win by 2 games was the overall result and against strong opposition, I think that was a good result. Well played to 
			Ian for a solid and near perfect performance and well done to Matt &amp; Dave for managing to keep their heads and still play some 
			outrageously good tennis even when on the night the luck isn't with you.<br /><br />
			Good luck to the 2nd and 3rd teams and see you all soon,<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>				
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Coventry and North Warwicks. 1 (Thursday 22 May 2008)</u></p>
			<p>		
				Last night was possibly the best evening yet for team tennis with it being bright and warm weather with no direct sun (to blind you) 
				and a lovely cool breeze, Couldn't have been any better!<br /><br />
				The opponents were our friends &amp; pre season warm up team Coventry &amp; North Warwicks 1.<br /><br />
				The matches started off perfectly for us with all 4 of us playing well and not giving away many points at all, Matt &amp; Myself playing 
				our usual strong return game took the opening game and set about taking the initiative and making a clear gap between us and the 
				opposition. It continued on with us comfortably taking the rubber in straight sets 6-2 6-4 all with some really strong finishing and 
				great play and covering from the back of the court.<br /><br />
				Tony &amp; Pete resumed normal business and again took control of their match and although the score was an exceptionally convincing 6-2 6-2, 
				the quality of play and some of the shot making from both Tony &amp; Pete was amazing to say the least and even with their opponents playing 
				some great tennis they managed a quick result and taking the match to 2-0 at the halfway point.<br /><br />
				Tony &amp; Pete's second match seemed to be slightly more competitive than their 1st with a lot more close games and great rally's and possibly 
				some of the most sublime passing backhands I've ever seen (Mr French in particular).<br /><br />
				Again though the lads played well and deservedly took the match in straight sets and made it off court in time to figure out how to 
				use and oven!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!<br /><br />
				Matt &amp; Myself coming off the back of the successful 1st rubber and playing well went into the second rubber confident of our game and 
				looking to get revenge for the pre season friendly where we lost to this pair 6-1 and hardly managed to trouble them at all.<br /><br />
				At 5-3. up in the 1st set all was looking close but still comfortable, and then it all went horribly wrong!!!!! with the balls getting 
				slower and slower and the oppositions very flat shots not giving much kick or pace of the courts my timing started to desert me and even 
				with Matt's best part of his game(Return of serve) being played beautifully and holding almost every point against him I couldn't seem to 
				either get past the man at the net of even get it over and after a hellish 20 point deuce game we lost our advantage and back to 5-5.<br /><br />
				After that we somehow kept playing well but just couldn't seem to win any points against them and even with our best shots or volleys they 
				managed to get them back with help from the frame or net and we were undone losing 7-5 6-2.<br /><br />
				Overall it's another great result and should keep us in 1st place in the division. Being a team we know well it had turned out to be a 
				very good evening with some great sportsmanship and a little bit of banter too.<br /><br />
				<span style="color:red; font-weight:bold;">Word to the wise!!!!!!!!!!!!!!!! </span>We have two potential arsonists in our midst and if 
				anyone sees either Pete or Tony entering (or even in the vicinity of) a kitchen/Oven/Microwave or even a lonely match please do not 
				approach them but call the emergency services immediately.<br /><br />
				Next week we have a break as it's the bank holiday so an Ideal time to start playing your tournament matches while the courts are free.<br /><br />
				Speak to you all soon, <br /><br />
				Well done to everyone who's represented the 1st team so far for a great start to our season.
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Leamington 2  (Thursday 15 May 2008)</u></p>
			<p>
				Morning all,<br /><br />
				Well last night unfortunately went the same way as our 2nd team's match earlier in the week and not the result we had hoped for.<br /><br />
				With a team of Tony & Myself and the Steve R & Jonny Hunt it wasn't quite the team we would have liked to field against the club 
				a the top of our division, Sayin that a big thanks to Jonny for playing after 9 years out of the tennis teams and Steve for playing 
				at less than a hours notice(And  to Geoff who had agreed to play if needed even thought he would have got shot by "her that must be 
				obeyed" when he got home!!!!)<br /><br />
				It didn't start well with me breaking my strings on my favourite racket while we were still warming up and then to find that my other 
				racket that I just got turned out to be a fake and no where near as nice as my other one. The 1st match for Tony & Myself was a real 
				shame as Tony (as usual) was on great form and hardly missed a shot all night, whereas I hardly got one over the net and only really 
				started to play well in the last 2 games of the match which was some what late as we lost 7-5 6-3. Jonny & Steve seemed to be playing 
				well against the 2nd pairing with Jonny's magicall serves coming back to him quickly and serving a couple of aces and Steve seemed to 
				be as solid as ever and some great touches around the net. Unfortunately the 2 talented teenagers managed to wrap it up in the 2 sets 
				so that's 2 rubbers down and 2 lost!!!!!!<br /><br />
				Finally in the 2nd rubber and I managed to find some form (6 racket changes later) and against the 2 big hitting teens who are more 
				singles players, Mine & Tony's doubles experience paid dividence and we managed to close them out relatively easily 6-3 6-2 although 
				a note of congrats to Tony for holding serve at 2-2 in the second set on his serve in a game that must have had in the region of 30 
				deuce points, For part of the match we did decide to drop the scoring procedure and favoured the who owed who an apology for how many 
				balls we could get to clip the net and dribble over offering the opponent no chance of getting the ball whatsoever but when both teams 
				got to double figures we got bored and went back to actual scoring.<br /><br />
				Again Steve & Jonny played well and made the opposition work for every point and game and forced the opposition to really go and and 
				have to win the match. Unfortunatly it was another straight sets defeat but it had been enjoyable and it was god to see Mr Hunt back 
				on the courts after so long away.<br /><br />
				So 3-1 loss but at least thats another rubber that may help us towards the end of the season.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Atherstone 1  (Monday 12 May 2008)</u></p>
			<p>
				Hello,<br /><br />
				At last we have completed what should have been our first match of the season against Atherstone.<br /><br />
				Last night our 1st team managed to complete our match against atherstone, The team consisted of Tony (Captain for the night) 
				and Pete, Matt and Mark W.<br /><br />
				It all started off relatively normal with a couple of difficult sets but a really good result winning both of the openning rubbers, 
				One of the oppositions 1st pairing managed to injure his right arm late on in the match and although trying to play the second rubber 
				he was forced to pull out after only a few games and hand the win by default to Matt & Mark.<br /><br />
				Tony and Pete then had the same result with one of the 2nd pairing injuring his stomach and also retiring handing Hampton a 4-0 win 
				and all by 8.45pm.<br /><br />
				To add to the nights festivities I believe that 2 of the Atherstone players then had a little row after the match with one leaving 
				and going home without as much of a goodbye so by the sounds of things quite an entertaining evening.<br /><br />
				Well done to the lads though for another great result and lets try and keep the momentum going into our next couple of Matches.<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>				
		<div class="bordertop">
			<p class="blueheading"><u>Home versus Warwick Boat Club  (Monday 5 May 2008)</u></p>
			<p>
			Morning to you all and hope everyone is well,<br /><br />
			Last night was in effect our first match of the season as the previous match got rained off and has yet to be re-played. 
			The weather was most definitely on our side with a perfect evening for tennis, No glaring sun over the tree's, bright and warm 
			and just a light cool breeze to cool you down, Ahhhhh what a joy after some of the other matches we have played recently!!!!!!!!! 
			The opposition for the night was Warwick Boat 2 who have come down from the premiership so will most definitely be in the chase to 
			get promoted again this year and no easy opponents.<br /><br />
			Tony (Eccleston) and Pete (French) played as our 1st pairing and set the standards exceptionally high dismissing their 1st pair in 
			straight sets dropping only 5 games against a tough and very strong doubles pairing which makes the win even more emphatic. Watching 
			from the other court it did seem to be more closely contested than the score represents with some amazing skill from all four players 
			but from the comments made from our opponents both Tony's & Pete's volleying was the difference between the teams with us being the 
			dominant team at the net. The boys then went on to do exactly the same in their second rubber dropping only 5 games again and being 
			back in the club house for an early pint.<br /><br />
			Dave (Mountford) and Myself played as the second pairing and decided that it was too lovely an evening to go in early and after dropping 
			the 1st set we managed to compose ourselves and start playing some great doubles as opposed to great individual shots as in the 1st set. 
			The difference was quick to show and we managed to take the 2nd set comfortably. The 3rd set was going to be close and although both Dave 
			and myself were very much on form and hitting some amazing returns we struggled to win games even from being 15-40 up on more than one 
			occasion and this was our downfall, We outplayed them all over the court and then dropped the advantage and then gave them the opportunity 
			to hold and they did. Credit to the opposition who took there chances on the big points and it paid of for them winning the 3rd set 6-4.<br /><br />
			It was much of the same story in the 2nd match, Dave & myself playing some of the shots of our season and returning to the point of forcing 
			such a usually composed pairing to almost self destruction. But yet again it was our finishing of big games that seemed to elude us when 
			the heat was on. Again over a long 3 set match it came down to 3/4 deuce and break points that we shouldn't have dropped but cost us the 
			match. A shame to lose to both when we played some of the best tennis I can remember playing but a massive boost to our confidence to know 
			we can compete against the teams in this division and possible the one above too.<br /><br />
			So overall we managed to Win the match on sets with the scores being 2 rubbers each but a 6-4 win on sets.<br /><br />
			So well done team, a great first result against difficult opposition and the boost we need to go on and hopefully when outright some 
			off the fixtures ahead.<br /><br />
			Well done<br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>
		<div class="bordertop">
			<p class="blueheading"><u>Away versus Atherstone 1  (Tuesday 29 April, 2008)</u></p>
			<p>
				Hello,<br /><br />
				Well we are officially back into the season and the British weather, as usual is truly against us!!!!!!!!!!!!!!!!!!!!!!!<br /><br />
				The 1st Team match away at Atherstone was stopped just 4 games in due to the worsening weather conditions and the very slippery courts 
				so the whole match is to re arranged.  <i>(now re-arranged for Monday 12 May     Ed.)</i><br /><br />
			</p>
			<p class="articleauthor">Mark J</p>
		</div>		
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="mens2ndteamblog.asp">Mens 2nd Team diary</a></li>
				<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
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
