<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Questions and Answers");
// Now for any variables local to this page
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
	<h1><%= pagetitle %></h1>
		<p>
			We are sure that you will have many questions to ask about the club so here are some answers to the more frequently asked questions.
		</p>
		<p class="question">
			What organised tennis is there?
		</p>
		<p class="answer">
			<ol>
				<li> 
					<p>
						We have four mens and three ladies teams that take part in the Coventry league during May, June and July.If you want 
						to play please call Mark Joannides (07909 697718) or Carol Grant (01675 443610).
					</p>
				</li>
				<li> 
					<p>
						Annual Club Tournaments take place in May and June with finals day in early July.
					</p>
				</li>
				<li> 
					<p>
						There is a &quot;MAXI-Tennis&quot; social tournament for teams of 6 that takes place in February and March.
					</p>
				</li>
				<li> 
					<p>
						Social tennis sessions (mixed) take place all year round.It is rare for weather interruptions, so please come along! 
						All standards welcome.  Up to three (coach approved) juniors can play. Times as follows:
					</p>
					<p>
						<ul>
							<li>Sunday 10.30am to 12.30pm;</li>
							<li>Tuesday 7.30pm to 10pm and </li>
							<li>Friday 8pm to 10pm.</li>
						</ul>
					</p>
				</li>
			</ol>
		</p>
		<p class="question">
			Is coaching available?
		</p>
		<p class="answer">
			We have both junior and adult coaching programmes in operation. 
			Further details of the programmes are shown elsewhere on this web site at 
			<a href="juniors/coaching.html">www.hamptontennis.org.uk/juniors/coaching.html</a>.  
			Ian Poole, our head coach would be pleased to hear from you on 07968 451956.
		</p>
		<p class="question">
			When can I play?
		</p>
		<p class="answer">
			You may book a court for a maximum period of two hours for which no fee is payable. 
			Just write your name for the hours you want on the court bookings sheet on the 
			tennis notice board in the clubhouse.  
		</p>
		<p class="question">
			How do the floodlights work?
		</p>
		<p class="answer">
			The floodlights work from tokens that you can purchase at the clubhouse bar. Each token 
			costs &pound;2 and will provide 30 minutes of lighting on one court. To turn on the lights 
			feed a token into the token machine for your court in the clubhouse (by the main clubhouse window).
			The first 3 courts are numbered, left to right as you view them from the clubhouse, as 
			courts 1,2 and 3; court 4 is the court furthest away from the clubhouse (past courts 1 and 2) 
			and is at right angles to the other 3 courts. You will get 5 minutes warning from the coloured 
			lights on the floodlight posts before theturn off. Once the lights have gone out they cannot be 
			switched back on for around 10 minutes. Please note that all of the tennis court floodlights 
			automatically turn off at 10pm.
		</p>
		<p class="question">
			How do I find out what is going on?
		</p>
		<p class="answer">
			If you have supplied your e-mail address on your application form we will send you 
			regular e-mails to keep you up to date.  You can also visit  this web site (www.hamptontennis.org.uk), 
			look at the clubhouse notice boards or speak to one of the <a href="committees.asp">committee members</a>.
		</p>
		<p class="question">
			Where can I buy tennis equipment?
		</p>
		<p class="answer">
			Rackets, balls, sports shoes/trainers and some sportswear can be obtained from Widney 
			Sports (on Widney Road, Bentley Heath) with a discount of 10% off normal prices to 
			Hampton Tennis Club members.
		</p>
		<p class="question">
			Can I bring a guest to play?
		</p>
		<p class="answer">
			You are welcome to bring guests three times each season per guest.
		</p>
		<p class="question">
			Where do I find the telephone numbers of other members?
		</p>
		<p class="answer">
			A list of current adult members is kept up to date in the password-protected section of 
			this web site (www.hamptontennis.org.uk).  A password can be obtained by emailing 
			support@hamptontennis.org.uk.  The list is also displayed on the tennis notice board 
			in the clubhouse. 
		</p>
		<p class="question">
			What facilities are available at the clubhouse?
		</p>
		<p class="answer">
			The clubhouse has changing facilities, toilets and a bar. The bar area provides 
			satellite television, ample seating, wireless internet access and good beer!  
			The bar is normally open from 6pm until 11pm during the week and from 12.30pm to 11pm 
			at the weekend.
		</p>
		<p class="question">
			How do I get into the clubhouse?
		</p>
		<p class="answer">
			All members may purchase a key fob to allow access to the clubhouse through the outer 
			front door at any time of the day.  After 9:30pm the inner door will be locked and 
			you will need to ring the bell to gain entry.  The bar staff will release the lock 
			after checking on the video monitor behind the bar that it is safe to do so.  If you 
			find yourself leaving at a time when there is no one else in the clubhouse please 
			remember to lock all doors and windows before you leave so that security is not 
			compromised.  If you are 14 or over you may purchase a key fob from the bar on 
			Tuesday evenings between 6pm and 9pm at a cost of £5 or alternatively have the key 
			fob replaced free of charge if you return a faulty key fob.  If you lose your key 
			fob please report its loss to the bar on a Tuesday evening so that access to the 
			clubhouse on that fob can be disabled to avoid compromising security.  
		</p>
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
			When do junior members need to be supervised in the Clubhouse?
		</p>
		<p class="answer">
			Parents are asked to take responsibility for their children in the clubhouse and 
			on the sports field and ensure that children abide by the licensing laws.  Please 
			be aware that the car park can be a dangerous place, especially for young children.   
			The club’s policy on use of the clubhouse by children is:<br />
			<ol>
				<li>
					Children of 14 or over can use the clubhouse without supervision provided that 
					they are well behaved.  They may also apply for a key fob to allow them access to 
					the clubhouse provided that their parent or guardian signs for and takes responsibility 
					for the key fob. 
				</li>
				<li>
					Children under 14 can use the clubhouse under the supervision of their parents or 
					carers provided that they are well behaved.  Supervision requires the responsible 
					person to be in the clubhouse with their child or if the child is old enough they 
					do not have to be with their child provided that they are accessible on the Recreation 
					Ground.  Parents who are not members may apply for a key fob to allow their children 
					access to the clubhouse if there is a need to use the toilets or first aid facilities.
				</li>
			</ol>
		</p>
		<p class="question">
			When do junior members need to be supervised on the courts?
		</p>
		<p class="answer">
			The club’s policy on use of the courts by children is:<br />
			<ol>
				<li>
					Children at Senior School may use the courts without a requirement for adult supervision.
				</li>
				<li>
					Children of Primary School age may only play tennis if they are under the supervision 
					of an adult.  Children aged 7 or under must not be left unattended at the Club during 
					coaching sessions unless there has been specific agreement with the coach.  It should be 
					noted that whilst children of 8 or more do not need to be accompanied by parents during 
					coaching sessions, parents are responsible for their children before and after these 
					sessions.  All parents and carers who are not members are welcome to use the clubhouse 
					and bar facilities when their children are playing tennis from one hour before their 
					child starts to play tennis to one hour after. 
				</li>
			</ol>
		</p>
		<p class="question">
			How do I book a court?
		</p>
		<p class="answer">
			Attached to your welcome letter was a schedule of typical court usage.  
			Further details about court availability and how to book courts are shown in the 
			court booking sheets folder attached to the Tennis notice board in the clubhouse.
		</p>
		<p class="question">
			Do I have to wear white tennis clothing to play tennis at Hampton?
		</p>
		<p class="answer">
			No.  Tennis shoes must be worn - running shoes, studs, blades, grooves or heels may 
			damage the courts. Otherwise, so long as you are wearing thennis shoes and sports clothing 
			you will be welcome on court.
		</p>
		<p class="question">
			How is the Sports Club run?
		</p>
		<div class="answer">
			<p>
				Hampton-in-Arden Sports Club Limited runs the Club as a non-profit making body.  
				The club rules, which members are required to abide by, are set out at 
				http://www.hamptontennis.org.uk/reports.asp The Sports Club AGM is held in February 
				each year and the accounts are on display in the clubhouse or in the members’ area 
				of the web site.  Each section of the Sports Club, including the tennis section, is 
				run by a sub Committee that reports to the Board of Directors of the Club.  The rules, 
				which the tennis members are required to abide by, are also set out at 
				http://www.hamptontennis.org.uk/reports.asp  The Tennis Club AGM is held in November 
				each year and the accounts can be viewed in the members’ area of the web site. 
			</p>
			<p>
				The current membership of the Tennis Committees is:
			</p>
			<h5>Senior Committee</h5>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">Geoff Redfern</td>
					<td width="33%">Chairman</td>
					<td>01675 442447</td>
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
					<td>Steve Ray</td>
					<td>Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Wayman Morris</td>
					<td>Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Ian Poole</td>
					<td>Head Coach</td>
					<td>07968 451956</td>
				</tr>
			</table>
			<h5>Junior Committee</h5>
			<table>
				<th>Name</th>
				<th>Role</th>
				<th>Phone Number</th>
				<tr>
					<td width="33%">Carl Ball</td>
					<td width="33%">Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Jayne Barnes</td>
					<td>Secretary</td>
					<td>01675 443572</td>
				</tr>
				<tr>
					<td>Di Copland</td>
					<td>Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Rosalia Eccleston</td>
					<td>Committee Member</td>
					<td>01675 442913</td>
				</tr>
				<tr>
					<td>Mel Hiskett</td>
					<td>Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Jo Oswald</td>
					<td>Committee Member</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>Ian Poole</td>
					<td>Head Coach</td>
					<td>07968 451956</td>
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
			Are any social events organised?
		</p>
		<p class="answer">
			Each of the playing sections of the Club organises its own social functions.  
			Tennis events are advertised through “The Court Circular”, on the notice boards and on the Club website.  
			All members, playing or social, are welcome to attend any of the social functions.  Any suggestions you have for future functions will be welcomed.
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
					<td>Four floodlit outdoor Euro-clay tennis courts. </td>
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
					<td width="20%">Cricket</td>
					<td>Match ready cricket field</td>
				</tr>
				<tr>
					<td width="20%">Football</td>
					<td>Three grass football pitches</td>
				</tr>
				<tr>
					<td width="20%">Boules</td>
					<td>
					A boules area with two pistes which plays host to the local league which is a great way to 
					spend an hour or two on a summer weekend or weekday evening.
					</td>
				</tr>
				<tr>
					<td width="20%">Pool and darts</td>
					<td>Facilities are situated in the bar area</td>
				</tr>
			</table>
			<p>
				Of course, if you are less active you are welcome to join as a social member of the club.
			</p>
		</div>
		<p class="question">
			Can I help?
		</p>
		<p class="answer">
			Yes please!  The Club is run by volunteers and extra help is always welcome. 
		</p>
		<p>
			Please note that the Club cannot accept any responsibility for members' personal effects on the premises.  
			Please do not leave valuable items on show in vehicles.
		</p>
		<p class="question">
			What are the objectives of Hampton Tennis Club?
		</p>
		<p class="answer">
			<ul>
			<li>To secure appropriate sporting and social facilities for all members.</li>
			<li>To provide opportunities for members of all sporting abilities including disabled members to play and enjoy tennis in a friendly and sociable environment.</li>
			<li>To encourage all members to play tennis and to develop their game.</li>
			<li>To identify tennis potential in members and guide them appropriately, liaising with the LTA and other interested parties when and where necessary.</li>
			<li>To provide a link with schools and other organisations regarding tennis.</li>
			<li>To identify, invite, prepare and encourage suitable juniors to play with adult members and to integrate them into the senior section of the Club. Such individuals to be selected and nominated by the Coach for approval by the main Tennis Committee.</li> 
			<li>To secure a stream of new adult members via “maturing” junior members.</li> 
			<li>To encourage the families of members to become social or tennis members of the Club.</li>
			<li>To provide opportunities for all members to play competitive tennis.</li>
			<li>To provide both sporting and social events for junior members during school holidays.</li>
			<li>To provide social facilities for members and foster a sense of being part of a friendly club.</li>
			<li>To identify, encourage and support suitable individuals who wish to train and develop tennis coaching skills. For example, those who wish to train as tennis coaches or assist on court.</li>
			</ul>
		</p>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
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

