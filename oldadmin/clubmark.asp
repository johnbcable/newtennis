<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Tennis Clubmark Accreditation");
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
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Clubmark Page</title>
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
.tablesubhead {
	font-size: 110%;
	font-weight: bold;
	background-color:#fff0aa;
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
			<h1>Our Club:&nbsp;<b>Tennis Clubmark Information</b></h1>
			<img src="images/tennisclubmark.jpg" width="217" height="115" alt="LTA Tennis Clubmark Award" />
			<p>
				Hampton-In-Arden Tennis Club received official Tennis Clubmark accreditation on 29 September, 2008. This national award recognizes years of hard work that has been put into developing best practice policies in running our club.
			</p>
			<p>
				Tennis Clubmark recognises excellent standards. Achieving Tennis Clubmark means the LTA endorses and supports our tennis programme delivered on court and the policies and procedures we have in place off court.  Tennis Clubmark provides the framework and policies to ensure that the 
				Club is managed effectively and provides a safe environment for junior members to enjoy and play tennis.
			</p>
			<p>
				Our Club Chairman at the time of the accreditation, Stephen Ray, had this to say about the achievement, &quot;As a club we have always strived to adopt best practice but this is 
				formal recognition of the standards that we have been achieving in the management of the club. It is also great for the hard work of the Junior and Senior Committee members to be publicly acknowledged and rewarded in this way, particularly following on from being voted 
				<a href="aboutus.asp">Warwickshire LTA's Club of the Year</a> at the beginning of 2008. Our main focus at the moment is on raising funds to provide new courts so that there are improved playing facilities that are comparable with the quality of the coaching and administration 
				at the Club.&quot;
			</p>
			<p style="border-top: 1px solid #C60; padding-top: 10px;">
				All our documents that relate to Clubmark are shown below. All have been made available in PDF format - just click on any document title to view it. 
			</p>
			<h2>Policies and Procedures</h2>			
			<table id="policies">
				<thead>
					<tr>
						<th>Document Title</th>
						<th>Last<br />Updated</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.1.pdf">Equality and Diversity Policy</a></td>
						<td>26/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.2.pdf">Child Protection Policy</a></td>
						<td>26/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.3.pdf">Code of practice for working with young people</a></td>
						<td>02/10/2014</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.4.pdf">Photographing and filming of children policy</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.5.pdf">Code of Practice for Members</a></td>
						<td>02/10/2014</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.6.pdf">Accident and Emergency Information</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.7.pdf">Accident Report Forms</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.8.pdf">Risk Assessment Policy</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.9.pdf">Complaints Policy</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.10.pdf">Feedback Policy</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.11.pdf">Policy and Procedures Commitment Form</a></td>
						<td>27/01/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/pp2.12.pdf">Volunteer Recruitment and Retention Policy</a></td>
						<td>27/01/2013</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>			
			<h2>Job Descriptions</h2>			
			<table id="jobdescriptions">
				<thead>
					<tr>
						<th>Document Title</th>
						<th>Last<br />Updated</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd1.pdf">Chairperson Role Description</a></td>
						<td>08/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd2.pdf">Child Protection Officer Role Description</a></td>
						<td>08/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd3.pdf">Head Coach Role Description</a></td>
						<td>19/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd4.pdf">Secretary Role Description</a></td>
						<td>08/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd5.pdf">Social Coordinator Role Description</a></td>
						<td>19/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd6.pdf">Treasurer Role Description</a></td>
						<td>19/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jd7.pdf">Team Captain Role Description</a></td>
						<td>05/04/2013</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>			
			<h2>Other Clubmark Information</h2>
			<table id="miscellaneous">
				<thead>
					<tr>
						<th>Document Title</th>
						<th>Last<br />Updated</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/cm1.1.pdf">Business plan</a></td>
						<td>15/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/cm1.2.pdf">All year round competition programme</a></td>
						<td>17/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/cm2.4.pdf">Talent id programme</a></td>
						<td>14/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/cm2.5.pdf">Links with schools checklist</a></td>
						<td>14/02/2013</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/cm2.7.pdf">Appropriate facilities</a></td>
						<td>19/02/2013</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>			
			<h2>Certificates</h2>			
			<table id="certificates">
				<thead>
					<tr>
						<th>Document Title</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/lc1.pdf">LTA Licence Insurance Certificate</a></td>
						<td>08/02/2013</td>
					</tr>
<!--
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/rallyaward.pdf">Blank Mini-Tennis Rally Award Certificate</a></td>
						<td>14/01/2013</td>
					</tr>
-->
					<tr>
						<td colspan="2" class="tablesubhead">Jo Oswald</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/jo1.pdf">Safeguarding Children in tennis Workshop Attendance</a></td>
						<td>29/08/2003</td>
					</tr>
					<tr>
						<td colspan="2" class="tablesubhead"><a href="juniors/ianpoole.html">Ian Poole</a></td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/ip1.pdf">Performance Club Coach Award 2003</a></td>
						<td>Qualified on: 29/08/2003</td>
					</tr>
<!--					
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/ip2.pdf">Performance Club Coach Award 2013</a></td>
						<td>Expires On: 22/07/2013</td>
					</tr>
-->
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/ip4.pdf">Coaching Licence</a></td>
						<td>Expires On: 22/07/2014</td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/ip3.pdf">Performance Club Coach Award 2014</a></td>
						<td>Expires On: 22/07/2014</td>
					</tr>
					<tr>
						<td colspan="2" class="tablesubhead"><a href="juniors/sampeace.html">Sam Peace</a></td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/sp2.pdf">Development Coach Award</a></td>
						<td>Expiry date: 24/09/2014</td>
					</tr>
					<tr>
						<td colspan="2" class="tablesubhead"><a href="juniors/belkacemchefri.html">Belkacem Chefri</a></td>
					</tr>
					<tr>
						<td><a href="https://hamptontennis.org.uk/clubmark/bc1.pdf">Level 2 Certificate in Coaching Tennis</a></td>
						<td>Issued: 07/08/2012</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>			
			<div class="seealso">
				<h3>See Also:</h3>
				<ul>
					<li><a href="http://www.lta.org.uk/Articles/Clubs1/TennisClubmark/">Further information about Tennis Clubmark</a></li>
					<li><a href=" http://www.clubmark.org.uk/">Further general information about the Clubmark initiative</a></li>
				</ul>
			</div>				
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
