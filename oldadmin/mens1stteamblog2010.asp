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
		<h1>Captains Log  - Mens 1st Team 2010</h1>
		<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st Team captain" />
		<p>
			Welcome to the diary from the Mens 1st Team for the 2010 season. 
			Captain Mark (Joannides - see photo on left) returns to inspire his dedicated readership once again! Read, knowingly (or befuddled-ly) smile 
			(or wince - as appropriate) while Mark stirs up your supporting spirit with some stirring dialogue - the blagging in the past 
			that went on to do with after-match food and then Mark Walker's performance at golf was worthy of a Pullitzer!
			But you're not going to miss out this year - Oh no! If anyone writes about the Mens 1st Team then you can read it here.<br /><br />
			Organised with most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<h2>Esporta Health and Rackets Club 1 (Home) - Monday 26/4/2010</h2>

				<p class="result">
					<span>Result:</span>2-2 Draw
				</p>
				<p class="team">
					<span>Team:</span>Daniel Eccleston &amp; Sam Peace; Tony Eccleston &amp; Josh   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>Esporta Health and Rackets Club 2 (Away) - Tuesday 4/5/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>

				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>Knowle and Dorridge (Home) - Monday 10/5/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>

				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>David Lloyd Solihull 2 (Away) - Monday 17/5/2010</h2>
				<p class="result">

					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>

				<h2>Coventry and North Warwicks 1 (Home) - Monday 24/5/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>

			</li>

			<li>
				<h2>Berkswell 1 (Home) - Monday 7/6/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>

				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>Beechwood 3 (Away) - Thursday 17/6/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>

				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>Esporta Health and Rackets Club 1 (Away) - Monday 21/6/2010</h2>
				<p class="result">

					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>

				<h2>Esporta Health and Rackets Club 2 (Home) - Monday 28/6/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>

			</li>

			<li>
				<h2>Knowle and Dorridge (Away) - Monday 5/7/2010</h2>
				<p class="result">
					<span>Result:</span>4 - 0  Win
				</p>
				<p class="team">
					<span>Team:</span>Tony &quot;Nadal&quot; Eccleston &amp; Daniel Eccleston; Josh Crisp-Jones &amp; Matt Allen   
				</p>
				<p class="matchreport">
					Very boring evening where Nadal and I managed to lose a set and then were 5 - 8 down in the 
					3rd set tie break and managed to win 10-8. We were close to quitting tennis altogether due to 
					boredom and terrrrriiiblle tennis but luckily we managed to win against an extremely poor pair..! 
				</p>
				<p class="matchreport">
					All other matches were extremely straight forwardly ... To our delight! :)
				</p>
				<p class="articleauthor">Daniel Eccleston</p>
			</li>

			<li>
				<h2>David Lloyd Solihull 2 (Home) - Monday 12/7/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>

				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>

				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>
				<h2>Coventry and North Warwicks 1 (Away) - Wednesday 21/7/2010</h2>
				<p class="result">

					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>
			</li>

			<li>

				<h2>Berkswell 1 (Away) - Tuesday 27/7/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>
				<p class="matchreport">

					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>
				<p class="articleauthor">TBA</p>

			</li>

			<li>
				<h2>Beechwood 3 (Home) - Monday 2/8/2010</h2>
				<p class="result">
					<span>Result:</span>TBA
				</p>
				<p class="team">
					<span>Team:</span>TBA   
				</p>

				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp;
				</p>
				<p class="matchreport">
					 &nbsp; 
				</p>

				<p class="articleauthor">TBA</p>
			</li>
		</ol>
		<h2>See Also:</h2>
		<ul>
			<li><a href="mens1stteamblog2009.asp">Mens 1st Team diary from 2009</a></li>
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
