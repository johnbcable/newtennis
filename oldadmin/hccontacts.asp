<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Ladies Winter League");
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
		<h1>Playing:&nbsp;<b>Winter Competitions</b></h1>
		<p>
		&nbsp;
		</p>
		<h2>Helen Cole ladies doubles winter league 2009/2010</h2>
		<div id="helencolecontacts">
			<table>
				<caption>Club contact sheet</caption>
				<thead>
					<tr>
						<th>Club</th>
						<th>Contact</th>
						<th>Telephone Number</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Beechcroft</td>
						<td>Amy Parsonage</td>
						<td>0121 350 2547</td>
					</tr>
					<tr>
						<td>Blossomfield</td>
						<td>Jane Dawes</td>
						<td>07879 406379</td>
					</tr>
					<tr>
						<td>Coleshill</td>
						<td>Jane Breeden</td>
						<td>01827 872153/07989 253372</td>
					</tr>
					<tr>
						<td>David Lloyd (Great Barr)</td>
						<td>Joyce Terry</td>
						<td>0121 624 3306/07977 594030</td>
					</tr>
					<tr>
						<td>David Lloyd (Solihull)</td>
						<td>Kathy Griffiths</td>
						<td>0121 705 1065</td>
					</tr>
					<tr>
						<td>Edgbaston Archery</td>
						<td>Chrissie Hiltscher</td>
						<td>07810 432865</td>
					</tr>
					<tr>
						<td>Edgbaston Priory</td>
						<td>Amy Procter</td>
						<td>07736 049019</td>
					</tr>
					<tr>
						<td>Four Oaks</td>
						<td>Megan Wood</td>
						<td>0121 472 4015/07813 357804</td>
					</tr>
					<tr>
						<td>Hall Green</td>
						<td>Lynn Catton</td>
						<td>0121 744 1579</td>
					</tr>
					<tr style="background-color: #c0c0c0;">
						<td>Hampton-in-Arden</td>
						<td>Carol Grant</td>
						<td>01675 443610/07736 601295</td>
					</tr>
					<tr>
						<td>Kings Heath</td>
						<td>Polly Priestley</td>
						<td>0121 444 1362</td>
					</tr>
					<tr>
						<td>Knowle &amp; Dorridge</td>
						<td>Joyce Dale</td>
						<td>01564 771099</td>
					</tr>
					<tr>
						<td>Moseley</td>
						<td>Sarah Coverdale</td>
						<td>0121 449 4896/078378 71994</td>
					</tr>
					<tr>
						<td>Solihull Arden</td>
						<td>Kath Brown</td>
						<td>0121 745 2776</td>
					</tr>
					<tr>
						<td>Solihull Tennis</td>
						<td>Gail Burrows</td>
						<td>01564 783901</td>
					</tr>
					<tr>
						<td>Streetly</td>
						<td>Zoe Edwards</td>
						<td>01543 410566/07971 898645</td>
					</tr>
					<tr>
						<td>Sutton Hard</td>
						<td>Novlette Rennie</td>
						<td>07920 110118</td>
					</tr>
					<tr>
						<td>University of Birmingham<br />Medical Students</td>
						<td>Sam Mazumdar</td>
						<td>07800 948110</td>
					</tr>
					<tr>
						<td>West Warwickshire</td>
						<td>Jan Moore</td>
						<td>0121 704 3619</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3">
							&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>				
		</div>
		<div class="seealso">
			<h3>Note:</h3>
			<p>
				University of Birmingham Medical Students will play all their matches AWAY but it remains the 
				responsibility of the first named team to initiate contact with the opposition.
			</p>
			<h3>See Also:</h3>
			<ul>
				<li><a href="hcdoublesinfo.asp">Generalk information about the league</a></li>
				<li><a href="hcrules.asp">Rules of the Helen Cole Ladies Winter Doubles League</a></li>
				<li><a href="fixturelist.asp?team=Ladies Winter League 1">Fixture timetable for this season</a></li>
				<li><a href="wintercompetitions.asp">Winter competitive play at Hampton</a></li>
			</ul>
		</div>	
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

