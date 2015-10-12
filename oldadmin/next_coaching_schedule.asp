<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Junior Coaching Schedule - Spring 2014");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
//
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
td {
	border: 0;
	padding: 10px 10px 5px 10px;
	border-bottom: 1px solid black;
}
</style>
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
		<h1>Junior Coaching:&nbsp;<b>Spring 2014</b></h1>
		<p class="notprint">
			<strong>
			A booking form for junior coaching is kept <a href="CoachingBookingForm.pdf">here</a>. Please print it, complete it 
			and hand it to your coach (or send it to him at the address below) complete with your fee prior to starting your course.
			</strong>
		</p>
		<p>
			The courses start on <span style="font-weight: bold;">Monday 6<sup>th</sup> January</span> and run for <span style="font-weight: bold;">13 weeks</span> (excluding half term, <span style="font-weight: bold;">week 
			beginning 17<sup>th</sup> February</span>). 
		</p>
<!--
		<p class="notprint">
			Need to see better what is happening on each day? View our <a href="juniors/coaching_schedule_daily.html">daily coaching schedule</a>&nbsp;instead.
		</p>
-->
		<table id="coachingscheduletable">
			<caption><%= pagetitle %></caption>
			<thead>
				<th>Group</th>
				<th>Day/Time</th>
			</thead>
			<tbody>
				<tr>
					<td width="50%">
						<span class="blueheading">Tots Tennis</span>&nbsp;-&nbsp;(Ages 3-5)<br /><br />
						<p class="leftindent">
							Co-ordination fun based activities introducing skills with the racket to develop the basic fundamentals of the Game.
						</p>
					</td>
					<td>
						<ul>
							<li>Wed 1545 - 1630</li>
							<li>Thu 1345 - 1415 &nbsp;&nbsp;(incl. starter tots aged 2+)</li>
							<li>Thu 1415 - 1445</li>
							<li>Sat 0945 - 1015</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<span class="blueheading">Mini-Tennis Red</span>&nbsp;-&nbsp;(Ages 5-8)<br /><br />
						<p class="leftindent">
							Scaled down Court, rackets etc.<br />
							Sponge indoor felt outdoor.<br />
							Beginning to learn the basic technical shapes and tactics of the game.
						</p>
					</td>
					<td>
						<ul>
							<li>Mon 1600 - 1700 (Mini Tennis Red - Performance (with Mini Tennis Orange)</li>
							<li>Tue 1545 - 1630 (Mini Tennis Red 2/3) - 2 classes</li>
							<li>Wed 1545 - 1630 (Mini Tennis Red 1/2/3) - 3 classes</li>
							<li>Thu 1545 - 1630 (Mini Tennis Red 2/3)</li>
							<li>Fri 1630 - 1715 (Mini Tennis Red 3)</li>
						</ul>
						<p class="morelink">
							<br />
							(The lower the number in brackets the more advanced the group. Some mini tennis red will undertake some mini orange lessons)
						</p>
					</td>
				</tr>
				<tr>
					<td width="50%">
						<span class="blueheading">Mini-Tennis Orange</span>&nbsp;-&nbsp;(Ages 8/9)<br /><br />
						<p class="leftindent">
							Smaller than full court, transition balls allowing more time and less height off the bounce. 
							Beginning to introduce more shape and spin to technique. Bigger courts allow the introduction of a wider choice of tactics.
						</p>
					</td>
					<td>
						<ul>
							<li>Mon 1600 - 1700 - Performance (with Mini Tennis Red)</li>
							<li>Tue 1630 - 1715 (Girls development group Orange/Green)</li>
							<li>Wed 1545 - 1630 (Mini Tennis Orange/Green - age 8-10)</li>
							<li>Fri 1715 - 1800 (Mini Tennis Orange/Green - age 8-10)</li>
						</ul>
					</td>
				</tr>
<!--				
				<tr>
					<td width="50%">
						<span class="blueheading">Tennis Chicks</span>&nbsp;-&nbsp;(girls only)<br /><br />
						<p class="leftindent">
							A fun-based class - tennis to music! For children from the Mini-Red and Mini-Orange age groups.
						</p>
					</td>
					<td>
						<ul>
							<li>Wed 1700 - 1800</li>
						</ul>
					</td>
				</tr>
-->				
				<tr>
					<td width="50%">
						<span class="blueheading">Mini-Tennis Green</span>&nbsp;-&nbsp;(Age 10)<br /><br />
						<p class="leftindent">
							Full Court size, with slightly softer balls to allow slower speed and lower bounce. 
						</p>
					</td>
					<td>
						<ul class="leftindent">
							<li>Mon 1600 - 1700 - Performance (with Full Ball)</li>
							<li>Wed 1545 - 1630 (Mini Tennis Orange/Green - age 8-10)</li>
							<li>Thu 1545 - 1645 (Mini Tennis Green - age 10)</li>
							<li>Fri 1715 - 1800 (Mini Tennis Orange/Green - age 8-10)</li>
						</ul>
					</td>
				</tr>
<!--				
				<tr>
					<td width="50%">
						<span class="blueheading">Under 12 Full Ball</span><br /><br />
						<p class="leftindent">
							Full court and normal yellow tennis balls, technical and tactical appropriate to the needs of the group.
						</p>
					</td>
					<td>
						<ul class="leftindent">
							<li>Sat 0900 - 0945</li>
						</ul>
					</td>
				</tr>		
-->						
				<tr>
					<td width="50%">
						<span class="blueheading">Under 14 - Development</span><br /><br />
						<p class="leftindent">
							Full court and normal yellow tennis balls, technical and tactical appropriate to the needs of the group.
						</p>
					</td>
					<td>
						<ul class="leftindent">
							<li>Mon 1700 - 1800</li>
							<li>Fri 1715 - 1800</li>
							<li>Sat 0900 - 0945</li>
						</ul>
					</td>
				</tr>				
				<tr>
					<td width="50%">
						<span class="blueheading">Under 18 and Invite-Only Squads</span><br /><br />
					</td>
					<td>
						<ul class="leftindent">
							<li>Tue 1815 - 1915  U16 Elite (Invite only)</li>
							<li>Fri 1800 - 1900  U16 Elite (Invite only)</li>
							<li>Fri 1900 - 2000  U18 Elite</li>
							<li>Sat 1130 - 1230  Development</li>
						</ul>
					</td>
				</tr>								
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<p>N.B. All prices below are for a full term course (13 weeks):<br /></p>
						<table id="coachingfees" align="center" width="90%" class="centered" style="background-color: white; border: none; border-collapse: collapse; width: 100%;">
						    <tr>
								<td width="49%">
										1-hour lessons
								</td>
								<td width="49%">
										&pound;77.00
								</td>
							</tr>
						    <tr>
								<td width="49%">
										45-minute lessons
								</td>
								<td width="49%">
										&pound;63.00
								</td>
							</tr>
						    <tr>
								<td width="49%">
										30-minute lessons
								</td>
								<td width="49%">
										&pound;48.00
								</td>
							</tr>
							<tr>
								<td colspan="2" style="background-color: white;">
									An early payment discount of &pound;5 may be applied to the above fees if paid by 14<sup>th</sup> December. Fees that remain outstanding by the third week of term will incur a late payment penalty of &pound;5
								</td>
							</tr>
						</table>
						<p class="notprint">
						You may also view the <a href="http://hamptontennis.org.uk/prior_juniors/coaching_schedule.html">previous coaching schedule</a> (covering Summer term 2013 up to  
						start of summer state school holidays).
						</p>
						<p class="notprint" style="color: black; font-weight: bold;">
							P.S.  If you want to join the tennis club then fill in an <a href="juniors/joinus.html">application form</a>.
						</p>
<!--
						<p style="text-align: center; background-color: #fff;">
							Pay directly to Matchpoint Sportz<br /><br />
							<span style="color: green; font-weight: bold;">Sort code: 40-42-12</span><br />
							<span style="color: green; font-weight: bold;">Account number: 22195232</span><br />
							<span style="color: green; font-weight: bold;">Please use initial and surname of eldest child as your reference to enable us to allocate your payment</span><br />
						</p>
						<p style="text-align: center; background-color: #fff;">
							 Alternatively, make cheques payable to<br /><br />
							 <span style="color: blue; font-weight: bold;">Matchpoint Sportz Ltd</span><br /><br />
							 Please hand deliver payment to Ian or post to <strong>Flat 1, Bromford Mere, Warwick Road, Solihull, B92 7AN</strong>.<br />
						</p>
-->
					</td>
				</tr>
			</tfoot>
		</table>
<!--
		<p>
			The coaching schedule for Spring 2013 is not yet available. This will be available nearer Christmas 2012.
		</p>
-->
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


