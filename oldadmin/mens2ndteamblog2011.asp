<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Mens 2nd Team Diary");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
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
		<h1>Diary of a Promoted Team (again) - Mens 2nd Team 2011</h1>
		<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st and 2nd Team captain" />
		<p>
			Welcome to the commentary from the Mens 2nd Team for the 2011 season. Read and inwardly smile (or wince - take your pick) 
			as the minutiae of league tennis life slip in front of your eyes. Yes sirree, if any of them write anything about their 
			journey, you'll get to see it! Earliest stuff first - scroll down to see later reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<a name="match1" id="match1" />

				<h2>Hampton In Arden 1 (Away) - Monday 25/4/2011</h2>
				<p class="result">
					<span>Result:</span>1 : 3  (Defeat)
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
				<a name="match2" id="match2" />
				<h2>Stratford (Home) - Wednesday 4/5/2011</h2>
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
				<a name="match3" id="match3" />
				<h2>Beechwood 3 (Away) - Tuesday 10/5/2011</h2>
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

				<a name="match4" id="match4" />
				<h2>David Lloyd Solihull 2 (Home) - Wednesday 18/5/2011</h2>
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
				<h2>Kenilworth 1 (Away) - Tuesday 24/5/2011</h2>
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
				<h2>Knowle and Dorridge (Home) - Wednesday 8/6/2011</h2>

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
				<h2>Rugby 1 (Away) - Thursday 16/6/2011</h2>
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
				<h2>Hampton In Arden 1 (Home) - Wednesday 22/6/2011</h2>
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
				<h2>Stratford (Away) - Wednesday 29/6/2011</h2>

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
				<h2>Beechwood 3 (Home) - Wednesday 6/7/2011</h2>
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
				<h2>David Lloyd Solihull 2 (Away) - Monday 11/7/2011</h2>
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
				<h2>Kenilworth 1 (Home) - Wednesday 20/7/2011</h2>

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
				<a name="match13" id="match13" />
				<h2>Knowle and Dorridge (Away) - Monday 25/7/2011</h2>
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
				<a name="match14" id="match14" />
				<h2>Rugby 1 (Home) - Wednesday 3/8/2011</h2>
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
			<li><a href="mens2ndteamblog2009.asp">Mens 2nd Team diary from 2009</a></li>
			<li><a href="mens1stteamblog.asp">Mens 1st Team diary</a></li>
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
