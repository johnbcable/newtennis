<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("New Coach for Hampton-In-Arden Tennis Club");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="overlayboxquote" class="boxright">
		<div class="boxheader">
		    Interview with Ian
		</div>		
		<img src="images/interview.gif" alt="Interview with the coach" width="80" height="56" />
		<p class="question">
			How old were you when you started playing tennis and how did you become interested in the sport?
		</p>
		<p class="answer">
			I was 9 and became interested when I played in Cliff Richard tournaments
		</p>
		<p class="question">
			Who has been your biggest sporting inspiration ?
		</p>
		<p class="answer">
			There have been several including Tim Henman, Roger Federer, David Beckham and Lewis Hamilton
		</p>
		<p class="question">
			Why did you decide to become a tennis coach?
		</p>
		<p class="answer">
			I had a real passion for tennis and I enjoy teaching
		</p>
		<p class="question">
			Would you recommend tennis coaching as a career ?
		</p>
		<p class="answer">
			Definitely!  It's very rewarding - I get huge job satisfaction
		</p>
		<p class="question">
			Should only naturally good tennis players bother with the sport?
		</p>
		<p class="answer">
			Not at all, there are huge opportunities for players at all levels and ages
		</p>
		<p class="question">
			What are your ambitions for Hampton-in-Arden Tennis Club?
		</p>
		<p class="answer">
			I want to produce a flexible programme for all ages and abilities, and I want the members to have fun!
		</p>
		<p>Junior Committee</p>
	</div>
	<div id="mainimage">
		<a href="show_jpic.asp?photo=ian1&caption=Our new tennis coach is ..... Ian Poole!">
			<img class="floatleft" src="images/tn_ian1.jpg" width="150" height="200" ALT="Our new tennis coach is ... Ian Poole" />
		</a>
		<p class="caption">Ian Poole</p>
	</div>
	<h3>Say Hi to our new tennis coach - Ian Poole</h3>
	<p>
	Alan's replacement as our coach at Hampton Tennis Club is ..... Ian Poole. Ian has recently been working at David Lloyd, 
	Solihull and is due to start full-time at our club after autumn half-term. Ian is 27, currently lives in Olton and enjoys
	football, golf and socialising when he is not coaching. He has the following tennis qualifications: DCA (Development Coach Award);  
	CCA (Club Coach Award) - Performance. We've conducted a brief interview with him (see breakout box)  
	</p>

	<p>
	Whilst Ian is going to do as much coaching as possible at Hampton, he has to honour existing commitments for 
	the next few weeks.  So, until half term there are some interim arrangements for coaching shown in the 
	<a href="juniors/coaching_schedule.html">coaching schedule</a>&nbsp;on this site.
	</p>

	<p class="bordertop">
	In the meantime, lets have a look back at what our outgoing, hugely popular coach, Alan Cutts, has brought to the club.
		<h3>Choice Cutts</h3>
		<img id="minialan" class="floatright" src="images/alancutts.jpg" alt="Alan Cutts" width="204" height="218" />
		<p>
			Alan has had two periods of residence at the club, the latest commencing when Alan rejoined the club in 
			February, 2005. Since then, Alan has worked very hard to streamline and bring on all the junior members via 
			his extensive coaching programme, even tempting otherwise good tennis juniors back onto court who may 
			have 'strayed' to other clubs or, goodness me, even the squash courts. With his fun yet structured 
			coaching programme the club now enjoys its largest junior membership in conjunction with its status 
			in national initiatives e.g. as an accredited Mini-Tennis centre.
		</p>
		<p>
		But junior tennis is not the whole story - far from it. Alan has led the return into club tournaments of 
		the senior club players, notching up a memorable mixed doubles championship (alongside Carol Grant) 
		in 2006. He has also helped the Mens 1st Team in the last two seasons culminating in the promotion of that 
		team at the end of the 2007 season. Alan has always been supportive of club social events ranging from 
		Thursday coffee-morning tennis classes, school tennis link-ups, 
		MAXI-Tennis (where Alan was (hurtfully) classified as a 'purple nasty') and of club initiative days - his 
		tireless work on numerous Play Tennis days (frying pan challenge + all the kids paraphenalia that they love) 
		have helped further the reputation of this club as a friendly and professional place to join.
		</p>
		<p>
		It is now time for Hampton to welcome a new coach and to wish Alan well 'up North'. Alan, the new 
		coach will have a difficult act to follow - all the very best to you and yours for the future
		<p>(Ro, Jayne, Carol, Chester, Steve and everyone at the club)</p>
	</p>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->

</div>
<!--#include file="textnav.asp" -->
<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="jnewspanel.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>

