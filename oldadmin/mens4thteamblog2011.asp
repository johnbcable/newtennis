<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 4th Team Diary");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Supporting variables and lists
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
		<h1>Mens 4th Team 2011 - Third season</h2>
		<img src="images/geoffr.jpg" border="0" alt="Geoff Redfern - Mens 4th Team captain" />
		<p>
			Welcome to the diary from genial Geoff and the merry men of our Mens 4th Team from their 2011 (third) season. This is the third season 
			that commentary from the 4th team has seen the light of day. Smile (or wince - as appropriate) while you warm your cockles with some stirring match reporting. 
			We hope that you're not going to miss out on 4th team match reports this year - Oh no! If anyone writes about the Mens 4th Team then read it here.<br /><br />
			Organised starting with the earliest first - scroll down to read most current reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />

				<h2>Warwick County Council (Home) - Monday 25/4/2011</h2>
				<p class="result">
					<span>Result:</span>4 : 0   (Win)
				</p>
				<p class="team">
					<span>Team:</span>Savio Gaspar &amp; Charlie Rickard; Tim Jones &amp; Xander Barnes  
				</p>
				<p class="matchreport">
					 Sorted!
				</p>
				<p class="articleauthor">Geoff Redfern</p>

			</li>

			<li>
				<a name="match2" id="match2" />
				<h2>Warwick Tennis Club 3 (Home) - Monday 9/5/2011</h2>
				<p class="result">
					<span>Result:</span>0  :  4  (Defeat)
				</p>
				<p class="team">

					<span>Team:</span>Mike Durkin &amp; Paul Thomas, Geoff Redfern &amp; Ray Barnett  
				</p>
				<p class="matchreport">
					 They were just a bit too good!
				</p>
				<p class="matchreport">
					 Paul and Ray making their league debuts, Mike in his second league match.
				</p>
				<p class="matchreport">
					 The matches were played in a pretty good atmosphere and with Ray resplendent in his 
					 Hampton branded top we were off to a slightly nervous but confident start. Ray and I played 
					 well in patches but not consistently enough, both their pairs were a good standard. We did 
					 better against their first pair for some reason. Paul &amp; Mike, after a blistering start 
					 in their first set, lost the plot for a short time to lose the first rubber. Then almost 
					 beat their second pair losing 10-8 in a championship tie break that could have gone either way. 
					 An enjoyable evening albeit a disappointing score line. Well played guys. Plus well cooked Mike, 
					 excellent fodder! 
				</p>
				<p class="articleauthor">Geoff Redfern</p>
			</li>

			<li>
				<a name="match3" id="match3" />
				<h2>Berkswell 5 (Away) - Monday 16/5/2011</h2>
				<p class="result">

					<span>Result:</span>2  -  2  (Draw)
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
				</p>
				<p class="matchreport">
					 Match report from Savio reads "2-2 draw Geoff". Concise and to the point if lacking a little excitement!
				</p>
				<p class="articleauthor">Geoff Redfern quoting Savio Gaspar</p>
			</li>

			<li>

				<a name="match4" id="match4" />
				<h2>Coventry and North Warwicks 4 (Away) - Thursday 26/5/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match5" id="match5" />
				<h2>Leamington 6 (Home) - Monday 6/6/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>

				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match6" id="match6" />
				<h2>Berkswell 4 (Away) - Monday 13/6/2011</h2>

				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match7" id="match7" />
				<h2>Warwick County Council (Away) - Monday 20/6/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match8" id="match8" />
				<h2>Warwick Tennis Club 3 (Away) - Wednesday 6/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>

				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match9" id="match9" />
				<h2>Berkswell 5 (Home) - Monday 11/7/2011</h2>

				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match10" id="match10" />
				<h2>Coventry and North Warwicks 4 (Home) - Monday 18/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match11" id="match11" />
				<h2>Leamington 6 (Away) - Tuesday 26/7/2011</h2>
				<p class="result">
					<span>Result:</span>No result available
				</p>

				<p class="team">
					<span>Team:</span>No team selection available  
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
				<a name="match12" id="match12" />
				<h2>Berkswell 4 (Home) - Monday 1/8/2011</h2>

				<p class="result">
					<span>Result:</span>No result available
				</p>
				<p class="team">
					<span>Team:</span>No team selection available  
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
			<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
			<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
			<li><a href="mens3rdteamblog.asp">Mens 3rd Team diary</a></li>
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
