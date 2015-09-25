<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Junior Coaching: Daily Schedule - Autumn 2013");
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
#coachingdailyscheduletable tbody td li span {
	width: 50%;
	color: blue;
	text-align: left;
	padding-left: 10px;
}
td {
	border: 0;
	padding: 10px 10px 10px 10px;
	border-bottom: 1px solid black;
}
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
		<h1>Junior Coaching:&nbsp;<b>Daily Schedule - Autumn 2013</b></h1>
		<p class="notprint">
			<strong>
			A booking form for junior coaching is kept <a href="crenewal.asp">here</a>. Please print it, complete it 
			and hand it to your coach (or send it to him at the address below) complete with your fee prior to starting your course.
			</strong>
		</p>
		<p>
			The courses start on <span style="font-weight: bold;">Tuesday 3<sup>rd</sup> September</span> and run 
			for <span style="font-weight: bold;">14 weeks</span> (excluding half term, <span style="font-weight: bold;">week 
			beginning 28<sup>th</sup> October</span>). 
		</p>
		<p class="notprint">
			Need to see better what coaching is provided for each group? View our <a href="juniors/coaching_schedule.html">main coaching schedule</a>&nbsp;instead.
		</p>
		<table id="coachingdailyscheduletable">
<!--
			<caption><%= pagetitle %></caption>
-->
			<thead>
				<th width="20%">Day</th>
				<th>Group and Time(s)</th>
			</thead>
			<tbody>
				<tr>
					<td width="20%">
						<span class="blueheading">MONDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Mini-Tennis Red/Orange&nbsp;-&nbsp;(Ages 5-9)</span>1600 - 1700 (Performance Squad (Invite Only))</li>
							<li><span>Mini-Tennis Green/Full Ball&nbsp;-&nbsp;(Ages 9+)</span>1700 - 1800 - Performance</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="blueheading">TUESDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Mini-Tennis Red 2/3&nbsp;-&nbsp;(Ages 5-8)</span>1545 - 1630 (2 classes)</li>
							<li><span>Mini-Tennis Red 2&nbsp;-&nbsp;(Ages 5-8)</span>1630 - 1715</li>
							<li><span>Mini-Tennis Orange&nbsp;-&nbsp;(Ages 8-9)</span>1630 - 1715</li>
							<li><span>Under 18 and Invite-Only squads&nbsp;-&nbsp;U16 Elite (Invite only)</span>1815 - 1915</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="blueheading">WEDNESDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Tots Tennis (ages 3-5)</span>&nbsp;1545 - 1630</li>
							<li><span>Mini-Tennis Red 1/2/3&nbsp;-&nbsp;(Ages 5-8)</span>&nbsp;1545 - 1630 (2 classes)</li>
							<li><span>Mini-Tennis Orange/Green&nbsp;-&nbsp;(Ages 8/10)</span>&nbsp;1545 - 1630</li>
							<li><span>Mini-Tennis Green / Full Ball&nbsp;-&nbsp;(Age 10)</span>&nbsp;1630 - 1715</li>
							<li><span>Tennis Chicks! (girls only)</span>&nbsp;-&nbsp;1700 - 1800</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="blueheading">THURSDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Tots Tennis (ages 3-5)</span>&nbsp;1415 - 1445</li>
							<li><span>Mini-Tennis Red 2/3&nbsp;-&nbsp;</span>&nbsp;1545 - 1630</li>
							<li><span>Mini-Tennis Green &nbsp;-&nbsp;(Age 10)</span>&nbsp;1545 - 1630</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="blueheading">FRIDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Mini-Tennis Red 3&nbsp;-&nbsp;</span>1630 - 1715</li>
							<li><span>Mini-Tennis Orange 2&nbsp;-&nbsp;</span>1715 - 1800</li>
							<li><span>Mini-Tennis Orange/Green (Ages 8-10)&nbsp;-&nbsp;</span>1715 - 1800</li>
							<li><span>Under 14&nbsp;-&nbsp;(Ages 11-13)</span>1715 - 1800</li>
							<li><span>Under 18 (various)&nbsp;-&nbsp;U16 Elite (Invite only)</span>1800 - 1900</li>
							<li><span>Under 18 (various)&nbsp;-&nbsp;U18 Elite</span>1900 - 2000</li>
						</ul>
					</td>
				</tr>
				<tr>
					<td width="20%">
						<span class="blueheading">SATURDAY</span><br /><br />
					</td>
					<td>
						<ul>
							<li><span>Under 12 Full Ball&nbsp;-&nbsp;</span>0900 - 0945</li>
							<li><span>Tots Tennis&nbsp;-&nbsp;(Ages 3-5)</span>0945 - 1015</li>
							<li><span>Under 14&nbsp;-&nbsp;(Ages 11-13)</span>1130 - 1230</li>
						</ul>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<p>N.B. All prices below are for a full (13 week) term course:<br /></p>
							<table id="coachingfees" align="center" width="90%" class="centered" style="background-color: white; border: none; border-collapse: collapse; width: 100%;">
							    <tr>
									<td width="49%">
											1-hour lessons
									</td>
									<td width="49%">
											&pound;82.00
									</td>
								</tr>
							    <tr>
									<td width="49%">
											45-minute lessons
									</td>
									<td width="49%">
											&pound;67.00
									</td>
								</tr>
							    <tr>
									<td width="49%">
											30-minute lessons
									</td>
									<td width="49%">
											&pound;52.00
									</td>
								</tr>
								<tr>
									<td colspan="2" style="background-color: white;">
										An early payment discount of &pound;5 may be applied to the above fees if paid by 23rd March. Fees that remain outstanding by the third week of term will incur a late payment penalty of &pound;5
									</td>
								</tr>
							</table>
					<p class="notprint">
						You may also view the <a href="http://hamptontennis.org.uk/prior_juniors/coaching_schedule.html">previous coaching schedule</a> (covering Summer term 2013 up to  
						start of summer state school holidays).
						</p>
						<p class="notprint" style="color: black; font-weight: bold;">
							P.S.  If you want to join then fill in an <a href="juniors/joinus.html">application form</a>.
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
			The coaching schedule for Autumn 2012 is not yet available. This will be available during the summer holidays.
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
