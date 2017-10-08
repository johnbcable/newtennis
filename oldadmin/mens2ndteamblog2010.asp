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
		<h1>Diary of a Promoted Team (again) - Mens 2nd Team 2010</h1>
		<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st and 2nd Team captain" />
		<p>
			Welcome to the commentary from the Mens 2nd Team for the 2010 season. Read and inwardly smile (or wince - take your pick) 
			as the minutiae of league tennis life slip in front of your eyes. Yes sirree, if any of them write anything about their 
			journey, you'll get to see it! Most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol id="blog" style="clear: both;">

			<li>
				<h2>Warwick Boat Club 3 (Away) - Thursday 29/4/2010</h2>

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
				<h2>Kenilworth 2 (Home) - Wednesday 5/5/2010</h2>
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
				<h2>Leamington 3 (Away) - Thursday 13/5/2010</h2>
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
				<h2>Rugby 1 (Home) - Wednesday 19/5/2010</h2>
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

				<h2>Leamington 2 (Away) - Tuesday 25/5/2010</h2>
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
				<h2>Coventry and North Warwicks 2 (Home) - Wednesday 9/6/2010</h2>
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
				<h2>Henley In Arden (Away) - Thursday 17/6/2010</h2>
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
				<h2>Warwick Boat Club 3 (Home) - Wednesday 23/6/2010</h2>
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

				<h2>Kenilworth 2 (Away) - Tuesday 29/6/2010</h2>
				<p class="result">
					<span>Result:</span>4 - 0  Win
				</p>
				<p class="team">
					<span>Team:</span>Ryan &amp; Craig, Mark Walker &amp; Graham Hollway	   
				</p>
				<p class="matchreport">
					A good evenings’ work with both teams only dropping 1 set between them ( unfortunately 
					it was me and Graham but a convincing 10-5 tiebreak was a great comeback).
				</p>
				<p class="matchreport">
					Sorry it’s not more descriptive but work has to fit in somewhere...
				</p>
				<p class="articleauthor">Mark Walker</p>

			</li>

			<li>
				<h2>Leamington 3 (Home) - Wednesday 7/7/2010</h2>
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
				<h2>Rugby 1 (Away) - Thursday 15/7/2010</h2>
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
				<h2>Leamington 2 (Home) - Wednesday 21/7/2010</h2>
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

				<h2>Coventry and North Warwicks 2 (Away) - Wednesday 28/7/2010</h2>
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
				<h2>Henley In Arden (Home) - Wednesday 4/8/2010</h2>
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
