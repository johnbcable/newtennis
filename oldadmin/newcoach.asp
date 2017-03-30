<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
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
	<div id="mainContent">
	<h3>Say Hi to our new tennis coach - Ian Poole</h3>
	<div id="coachimage">
		<a href="show_jpic.asp?photo=ian1&caption=Our new tennis coach is ..... Ian Poole!">
			<img class="floatleft" src="images/tn_ian1.jpg" width="150" height="200" ALT="Our new tennis coach is ... Ian Poole" />
		</a>
		<p class="caption">Ian Poole</p>
	</div>
	<div id="overlayboxquote" class="boxright">
		<div class="boxheader">Interview with Ian</div>		
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
		<p class="boxsignature">Junior Committee</p>
	</div>
	<p>
		<h5>
		Ian Poole<br />
		LTA CCA Performance coach<br />
		Fully Licensed<br />
		07968 451956<br />
		£25 per session (1 hour)<br />
		</h5>
	</p>
	<p>
	Our new coach at Hampton Tennis Club is ..... Ian Poole. Ian is 27, currently lives in Olton and enjoys
	football, golf and socialising when he is not coaching. He has the following tennis qualifications: DCA (Development Coach Award);  
	CCA (Club Coach Award) - Performance. We've conducted a brief interview with him (see breakout box)  
	</p>	
	<p>
		Ian is the new head coach here at Hampton Tennis Club. For the past few years he has been working at David Lloyd 
		Leisure Centre as a full time pro where he coached a wide range of players scaling all ages and abilities. Ian is 
		a former county coach and whilst at David Lloyd he has instructed a variety of junior players that have performed 
		well under his instruction (to county standard). Ian himself is a former county level player and played for 
		Staffordshire County as a junior. Ian is a fully qualified LTA Performance coach and has an active coaches licence.
	</p>
	<p>
		Ian has left David Lloyd to look for a new challenge here at Hampton and he is very keen to expand the clubs 
		coaching programme with more groups and squads at all ages. He also prides himself on giving top quality tennis 
		lessons in a fun friendly environment for all his students. For any further information or to book a lesson 
		then call lan directly on the above number and he will be happy to speak to you.
	</p>
	<p>
		Ian's new junior coaching schedule for Spring 2008 can be found <a href="juniors/coaching_schedule.html">here</a>. This will soon be 
		joined by further coaching information for adults.
	</p>
	<p>
		Ian will be joined at Hampton by LTA DCA Qualified Coach David Mountford and between them they 
		will develop and deliver well-balanced, fun but structured coaching across a broad range of ages. For some further information 
		about David, including how to get in contact with him, can be found <a href="newcoach2.asp">here</a>.
	</p>	
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">

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