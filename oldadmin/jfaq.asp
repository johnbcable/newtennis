<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Frequently Asked Questions");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
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
<style type="text/css">
.question { font-weight: bold; }
.answer { margin-left: 10px; }
</style>
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
	<div id="faq">
		<div class="rounded">
			<h1>Juniors:&nbsp;<b><%= pagetitle %></b></h1>
			<p>
				We are sure that you will have many questions to ask about the club so here are some answers to the more frequently asked questions.
			</p>
		</div>
		<p class="question">
			Are junior members important to us?
		</p>
		<p class="answer">
			Of course!  Junior members and children of members are very welcome.  We are an 
			LTA accredited “mini tennis centre” which means that we offer Under 10’s great 
			opportunities to learn and play tennis.  We also offer 10+ year olds the chance to 
			improve their game. 
		</p>
		<p class="question">
			How do I book a court?
		</p>
		<p class="answer">
			Attached to your welcome letter was a schedule of typical court usage.  
			Further details about court availability and how to book courts are shown in the court booking sheets folder attached to the Tennis notice board in the clubhouse.
		</p>
		<p class="question">
			How do the floodlights work?
		</p>
		<p class="answer">
			The floodlights can be switched on using the keypads in the main bar area.  
			The codes are 9471 for court 1, 9472 for court 2 and 9473 for court 3.  
			No charge is made for using the floodlights but please conserve energy by remembering to switch them off when you have finished.  
			The same codes apply.  Please note that lights must be switched off by 10pm in consideration for local residents.
		</p>
		<p class="question">
			When can I play social "mix-in" tennis?
		</p>
		<div class="answer">
			<p>Adult club sessions are held 3 times a week as follows:</p>
			<ul>
				<li>Sunday 10.30am to 1.00pm</li>
				<li>Tuesday 7.30pm to 10.00pm</li>
				<li>Friday 8.00pm to 10pm</li>
			</ul>
			<p>
				They take place all the year round and it is rare for the weather to put everyone off!  So, please come along - whatever your standard.
			</p>
		</div>
		<p class="question">
			Do I have to wear white tennis clothing to play tennis at Hampton?
		</p>
		<p class="answer">
			No.  So long as you are wearing sports clothing and "non-marking" soled trainers or tennis shoes you will be welcome on court.
		</p>
		<p class="question">
			Can I bring a guest to play tennis?
		</p>
		<p class="answer">
			You are welcome to bring your guests into the Club although there are certain rules that you will need to abide by.  
			Principally all guests must be signed into the Visitors Book kept behind the Bar and a &pound;3 visitors fee paid to the bar staff.  
			There is a limit of four occasions per season on which the same guest can be brought into the Club.  
			If you sign in a guest you must take responsibility for the guest when he/she is on Club premises.
		</p>
		<p class="question">
			Is there any coaching available to improve my game?
		</p>
		<div class="answer">
			 <p>Tennis coaching is available on a group or an individual basis via our coach:<p>
			 <ul>
				<li>Ian Poole, 07968 451956</li>
			</ul>
		</div>
		<p class="question">
			Who are the members of the Tennis Committees and how do I contact them?
		</p>
		<div class="answer">
			<h2>Senior Committee</h2>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">Steve Ray</td>
					<td width="33%">Chair</td>
					<td>01675 442132</td>
				</tr>
				<tr>
					<td>Chris Barnes</td>
					<td>Secretary</td>
					<td>01675 443572</td>
				</tr>
				<tr>
					<td>Carol Grant</td>
					<td>Treasurer</td>
					<td>01675 443610</td>
				</tr>
				<tr>
					<td>Geoff Redfern</td>
					<td>Committee Member</td>
					<td>01675 442447</td>
				</tr>
			</table>
			<h2>Junior Committee</h2>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">Judith Williams</td>
					<td width="33%">Chair</td>
					<td>01675 443704</td>
				</tr>
				<tr>
					<td>Ian Poole</td>
					<td>Coach</td>
					<td>07968 451956</td>
				</tr>
				<tr>
					<td>Jayne Barnes</td>
					<td>Secretary</td>
					<td>01675 443572</td>
				</tr>
				<tr>
					<td>Rosalia Eccleston</td>
					<td>Committee Member</td>
					<td>01675 442913</td>
				</tr>
				<tr>
					<td>Georgina Stanley</td>
					<td>Committee Member</td>
					<td>01675 442957</td>
				</tr>
				<tr>
					<td>Mel Hiskett</td>
					<td>Committee Member</td>
					<td>01564 775557</td>
				</tr>				
			</table>
			<h5>Other Officers</h5>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">Julie Williamson</td>
					<td width="33%">Child Protection Officer</td>
					<td>01675 442758</td>
				</tr>
			</table>
		</div>
		<p class="question">
			How do I find out what is going on at the tennis club?
		</p>
		<p class="answer">
			If you have supplied your e-mail address on your application form we will be sending you regular copies of our club magazine 
			&quot;The Court Circular&quot; and other emails which we hope will keep you up to date with what is going on.  
			You should also visit our website at www.hamptontennis.org.uk, looking at the clubhouse notice board or calling one of the committee members.
		</p>
		<p class="question">
			What facilities are available at the clubhouse?
		</p>
		<div class="answer">
			<p>
			The clubhouse has changing facilities, toilets and a bar. The bar area has been refurbished recently and provides satellite television, 
			ample seating and good beer!  The normal opening hours for the bar are:
			</p>
			<table>
				<th>Day</th>
				<th>Opening Times</th>
				<tr>
					<td width="50%">Monday</td>
					<td>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Tuesday</td>
					<td>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Wednesday</td>
					<td>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Thursday</td>
					<td>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Friday</td>
					<td>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Saturday</td>
					<td>12.00 - 2.00 p.m in the Hockey Season<br>6.00 - 11.00 p.m.</td>
				</tr>
				<tr>
					<td width="50%">Sunday</td>
					<td>12.00 - 3.00 p.m<br>7.00 - 10.30 p.m.</td>
				</tr>
			</table>
			<p>
			If you find yourself leaving at a time when there is no one else in the clubhouse 
			please remember to lock all doors and windows before you leave so that the security of the club is not compromised.  
			</p>
		</div>
		<p class="question">
			How do I get into the clubhouse when no one else is around?
		</p>
		<p class="answer">
			To allow you to gain access to the clubhouse when it is locked, you can apply for a key fob to enable you to open the front door.  
			Simply email me at secretary@hamptontennis.org.uk and I will arrange for a key fob to be allocated to you. 
			Please take care of it as losing it could lead to unauthorised persons entering the clubhouse. 
		</p>
		<p class="question">
			Are any social events organised?
		</p>
		<p class="answer">
			Each of the playing sections of the Club organises its own social functions.  
			Tennis events are advertised through “The Court Circular”, on the notice boards and on the Club website.  
			All members, playing or social, are welcome to attend any of the social functions.  Any suggestions you have for future functions will be welcomed.
		</p>
		<p class="question">
			What is the clubs attitude to children?
		</p>
		<p class="answer">
			Junior Members and children of members are welcome at the Club.  Parents are asked to take responsibility for their children in the clubhouse 
			and on the sports field and ensure that children abide by the licensing laws of the land and do not congregate at the bar when adults are waiting to be served.
		</p>
		<p class="question">
			What sporting facilities are available at the club?
		</p>
		<div class="answer">
			<p>The club offers the following sports:</p>
			<table>
				<th>Sport</th>
				<th>Description</th>
				<tr>
					<td width="20%">Tennis</td>
					<td>Three floodlit outdoor tarmac tennis courts. Plans are in place to extend to 4-courts.</td>
				</tr>
				<tr>
					<td width="20%">Hockey</td>
					<td>Matches are played on the new astroturf pitch located at the bottom of the sports field</td>
				</tr>
				<tr>
					<td width="20%">Squash/Racketball</td>
					<td>Two recently re-floored indoor squash/racketball courts</td>
				</tr>
				<tr>
					<td width="20%">Football</td>
					<td>Three grass football pitches</td>
				</tr>
				<tr>
					<td width="20%">Boules</td>
					<td>A boules area which plays host to the local league which is a great way to spend an hour or two on a summer weekend or weekday evening.</td>
				</tr>
				<tr>
					<td width="20%">Pool, darts, table tennis</td>
					<td>Facilities are situated in the bar area</td>
				</tr>
			</table>
			<p>
				Of course, if you are less active you are welcome to join as a social member of the club.
			</p>
		</div>
		<p class="question">
			Who are the main contacts at the Sports Club?
		</p>
		<div class="answer">
			<p>
				If you have any questions to ask or suggestions to make, please approach the relevant Director or Committee member who will be pleased to help you.  
				The following people are the main points of contact:
			</p>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">John Eccleston</td>
					<td width="33%">Sports Club Chairman</td>
					<td>01675 442913</td>
				</tr>
				<tr>
					<td width="33%">Steve Ray</td>
					<td width="33%">Tennis Chairman</td>
					<td>01675 442132</td>
				</tr>
				<tr>
					<td>Andy Woolford</td>
					<td>Hockey Chairman</td>
					<td>01926 743136</td>
				</tr>
				<tr>
					<td>Sue Clarke</td>
					<td>Squash/Racketball Chairman</td>
					<td>0121 689 1733</td>
				</tr>
				<tr>
					<td>Bob Hunt</td>
					<td>Junior Football Chairman</td>
					<td>01675 442217</td>
				</tr>
				<tr>
					<td>?</td>
					<td>Social Membership Secretary</td>
					<td>???????</td>
				</tr>
			</table>
		</div>
		<p class="question">
			How is the club run?
		</p>
		<p class="answer">
			Hampton-in-Arden Sports Club Limited runs the Sports Club.  Sub Committees that report into the Board of Directors of the 
			Club control each playing section of the Club.  Accounts are on display in the clubhouse or in the members’ area of the web site.  
			The Sports Club AGM is normally held in March or April each year and the Tennis section AGM in November or December.
		</p>
		<p class="question">
			Can I help?
		</p>
		<p class="answer">
			Yes please!  The Club is run by volunteers and extra help is always welcome. 
		</p>
		<p>
			Finally, please take care of your belongings! - Please leave your sports bags in the changing rooms to avoid cluttering up the bar area.  
			You should note that the Club cannot accept any responsibility for members' personal effects on the premises.
		</p>
	</div>                 <!--  faq  -->
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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


