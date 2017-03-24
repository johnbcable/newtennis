<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Additional Coach for Hampton-In-Arden Tennis Club");
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
	<h3>Also joining the coaching team at Hampton - David Mountford</h3>
	<div id="coachimage">
		<img class="floatleft" src="images/tn_david1.jpg" width="137" height="216" ALT="David Mountford joins the coaching team at Hampton" />
		<p class="caption">Dave Mountford - Assistant Coach</p>
	</div>
	<p>
		<h5>
		David Mountford<br />
		LTA DCA Qualified coach<br />
		Certified PTR Academy Professional<br />
		Fully Licensed<br />
		07825 293163<br />
		£19 per session (1 hour)<br />
		</h5>
	</p>
	<p>
		David is another new coach here at Hampton. David has been working at Billesley Indoor tennis Centre 
		and Stratford-Upon-Avon tennis club for the past few years spending a lot of time in the development 
		of players of all ages at various levels. David is currently a DCA qualified coach with an active 
		coaches licence, also a PTR (Professional tennis registry) Academy professional coach, David was at 
		the time of attaining this qualification the youngest coach to achieve the level of Academy pro 
		(highest level qualification awarded by the PTRUK)
	</p>
	<p>
		David has lately been looking toward higher level coaching and in 2005 attended the international 
		coaches symposium in Italy where he worked on advanced bio mechanics and fitness with Juan Bosch Salord 
		(Carlos Moya's fitness trainer), Bob Brett (former coach to Boris Becker, Goran Ivanisevic,Monica seles) 
		and Tim Mayotte (former top 10 player and USA Davis cup team member)
	</p>
	<p>
		As a player David played for a variety of clubs as a junior and in 2004 won the Lew Hoad international 
		doubles event in Spain. David believes that you never stop improving whether that is as a coach or a player 
		and is always looking to develop his players to their full potential in an enjoyable atmosphere. For further 
		information or to book a private lesson call David on the above number as he is keen to hear from you.
	</p>
	<p>
		Ian's current junior coaching schedule for Spring 2008 can be found <a href="juniors/coaching_schedule.html">here</a>. 
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
