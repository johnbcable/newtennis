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
		<h1>Diary of a Promoted Team (again) - Mens 2nd Team 2009</h1>
		<img src="images/markj.jpg" border="0" width="122" height="211" alt="Mark Joannides - Mens 1st and 2nd Team captain" />
		<p>
			Welcome to the commentary from the Mens 2nd Team for the 2009 season. Read and inwardly smile (or wince - take your pick) 
			as the minutiae of league tennis life slip in front of your eyes. Yes sirree, if any of them write anything about their 
			journey, you'll get to see it! Most recent stuff first - scroll down to see earlier reports.
		</p>
		<ol style="clear: both;">
			<li>
				<h2>Kenilworth 3 (Home) - Wednesday 24 June, 2009</h2>
				<p>
					Result:  
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Berkswell 2 (Away) - Monday 15 June, 2009</h2>
				<p>
					Result:  Hampton won 3-1
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Rugby 2 (Home) - Wednesday 10 June, 2009</h2>
				<p>
					Result:  Hampton won 3-1
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Kenilworth 2 (Away) - Wednesday 2 June, 2009</h2>
				<p>
					Result:  Hampton lost 3-1
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Warwick Health and Rackets Club 2 (Home) - Wednesday 20 May, 2009</h2>
				<p>
					Result:  Hampton lost 3-1
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Sphinx 1 (Away) - Wednesday 13 May, 2009</h2>
				<p>
					Hi,
				</p>
				<p>
					The 2nd's were away to Sphinx this week and it was not one of our better weeks as we went down 3-1.
				</p>
				<p>
					We had a slightly different team out on the night with Matt &amp; Jonny Hunt playing as a pair and then the usual pair 
					of Mark Walker and Dave Mountford, It was obviously just going to be one of those night where people didn't feel comfortable 
					or play their best tennis and the fact that their pairs played quite different styles of tennis that meant we didn't really 
					get to find any rhythmn and that only made things worse.
				</p>
				<p>
					On the high side, we got a point and we have had 2 extremely good opening weeks and with our new courts now open it's going 
					to continue to be a great season again for our 2nd's.
				</p>
				<p>
					Let's get back to our winning ways
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Leamington 5 (Home) - Wednesday 6 May, 2009</h2>
				<p>
					Hi,
				</p>
				<p>
					Hampton 2 had another great result this week on Wednesday evening, the only down side was that their win was not on 
					our own new courts but on the hard courts of Billesley - many thanks to Billesley for the use of their courts.
				</p>
				<p>
					The match was against Leamington 5 and on the blustery night at Billesley it was Hampton's class that shone through, 
					the team of 1.Graham & Ian and 2. Matt & Dave had another great result and won all 4 rubbers on the night.
				</p>
				<p>
					Ian & Graham continued their unbeaten run with another solid display in both rubbers, never really being troubled by 
					the opposition. Matt & Dave, playing together for the first time this season  started slowly being pushed into a 2nd 
					set tie break from a break up but managed to keep their heads to close out the match, going into the 2nd match they 
					also made some changes to their tactics and played a much better match to beat the 1st pair 6-3 6-1.
				</p>
				<p>
					So the 2nd team are already with 7 points out of a maximum 8 so a very confident start.
				</p>
				<p>
					Good luck guys and keep the results coming.
				</p>
				<p class="articleauthor">Mark J.</p>
			</li>
			<li>
				<h2>Kenilworth 3 (Away) - Wednesday 29 April, 2009</h2>
				<p>
					2nd team had a good start with a 3-1 win over Kenilworth 3. The team was: Graham Hollway and Ian Poole, Mark Walker 
					and Dave Nountford.
				</p>
				<p>
					The 1st pair match was a strange affair with the oppositions main aim was to hit the ball at 90 miles an hour at 
					Ian who ducked,dived or just left it as it hit the back netting without a bounce!!!!!!!! 
				</p>
				<p>
					They didn't once try and build a point so every rally was 2 or 3 hits depending on who served, and we won 6-0 6-2 
					in 30 mins, a complete waste of time!!
				</p>
				<p>
					Mark and Dave played well winning their first rubber easily.
				</p>
				<p>
					The 2nd rounds were tougher and better tennis with Ian and Graham winning 6-4 6-0 and Mark and Dave narrowly losing.
				</p>
				<p class="articleauthor">Steve Ray</p>
			</li>
		</ol>			
		<h2>See Also:</h2>
		<ul>
			<li><a href="mens2ndteamblog2008.asp">Mens 2nd Team diary from 2008</a></li>
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
