<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="clubfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Useful Links");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
var dbconnect=Application("hamptonsportsdb"); 
var curseason = currentSeason();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Set up db connections for club web list
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
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
		<h1>Our Club:&nbsp;<b>Links to related web sites</b></h1>
		<div id="linksblurb" class="borderbottom">
			<p>
				No web site can satisfy all the information demands of the vast variety of people who may purposefully 
				or inadvertently stray onto it. This site is no exception. In addition, web sites can draw peoples attention to 
				other material presented elsewhere that may be of interest to the visitor without having to duplicate the 
				efforts of other web sites. This section brings together some references to other web sites that may be of interest 
				to visitors to this web site. We break these down into the following sections:<br />
			</p>
			<ul>
				<li>Links to material presented on other web sites run by other sections in the club</li>
				<li>Links to other (mainly local) tennis club web sites</li>
				<li>Links to sites dealing with tennis national (or regional) initiatives or events</li>
				<li>Other web sites relating to our locality</li>
			</ul>
			<p>
				As always, Hampton-In-Arden Sports Club is not repsonsible for the content of these web sites.
			</p>
		</div>
		<div id="overlayboxquote" class="boxright">
			<h2>Other Tennis Clubs</h2>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				The list below is based on information given to Hampton-In-Arden Tennis Club in the Coventry League fixtures 
				booklet for the most recent season (<%= curseason %>).
			</p>
			<p style="clear:both;">
<%
				clublist = getClubEmailAddressList();
				Response.Write(clublist);
%>
			</p>
			<p>
				Have we missed a club you think we should have on this list? Tell us the web site address and we'll list it here.
			</p>
			<p class="boxsignature">Senior Committee</p>
		</div>
		<div id="othersports">
			<h2>Other Sports Sections in Hampton-In-Arden Sports Club</h2>
			<p>
				The club also plays host to other sports sections e.g. the Hampton-In-Arden Sports Club squash and racketball section, the hockey club and the football section and is
				working with the Parish Council to bring back cricket into the village on the sports club grounds. During the summer, the club also plays host to a local boules league.
			</p>
			<ul>
				<li>
					<img src="images/squashlogoV1.gif" width="100" height="123" alt="Hampton Squash Club" />
					<h3>Squash and Racketball</h3>
					<p>
						The squash and racketball section has 2 recently re-floored, indoor squash and racketball courts with lighting on a pay-as-you-go basis using cards obtainable 
						from behind the bar. The section has its own web site (<a href="http://www.hamptonsquash.org.uk/">click here</a>) which contains all you could ever 
						want to know about squash and racketball at Hampton-In-Arden Sports Club
					</p>
				</li>
				<li>
					<h3 style="clear:both;">Hampton-In-Arden Hockey Club</h3>
					<img src="images/hockeyphoto.jpg" width="214" height="87" alt="Hampton Hockey Club" />
					<p>
						The Hampton-In-Arden Hockey Club has its own web site (<a href="http://www.hamptonhockey.org.uk/">click here</a>) which contains loads of good information 
						about hockey teams and fixtures. The hockey team are currently enjoying playing their home fixtures on their purpose-built astro-turf playing surface (introduced in 2006).
					</p>
				</li>
				<li>
					<h3 style="clear: both;">Hampton-In-Arden Village Cricket</h3>
					<p>
						Cricket returns in earnest to the new wicket laid on the Hampton-In-Arden Sports Club grounds last year from Monday May 4th, 2009. 
						Further information can be obtained (about fixtures, training, playing for the team or just watching) from the clubhouse.
					</p>
				</li>
				<li>
					<h3 style="clear:both;">Boules</h3>
					<p>
						In the summer months, Hampton-In-Arden Sports Club also plays host to the local Boules League.
						<br /><br />
						The clubhouse has one outdoor boules piste area for use in these competitions. It is a lovely way to spend an hour or 
						two on the weekend or a weekday evening. Anyone interested in playing boules should contact the current secretary of the 
						league (contact details available in the clubhouse bar>)&nbsp;for details of how to take part.
					</p>
				</li>
			</ul>
		</div>
		<div id="tennisnational" class="borderboth">
			<div id="ltasites">
				<h2>LTA-Related Sites</h2>
				<div id="nationallta">
					<a href="http://www.lta.org.uk/">
						<img src="images/lta.gif" width="118" height="70" alt="National LTA Home Page" />
					</a>&nbsp;&nbsp;
					<a href="http://warwickshire.totaltennis.net/">
						<img src="images/warkslta.jpg" width="180" height="55" alt="Warwickshire LTA" />
					</a>&nbsp;&nbsp;					
					<a href="http://www.lta.org.uk/PlayAndCompete/StartToPlay/Under10s/MiniTennis//">
						<img src="images/minitennis.gif" width="121" height="50" alt="Home of MiniTennis" />
					</a>&nbsp;&nbsp;	
					<a href="http://www.britishtennisparents.com/">
						<img src="images/britishtennisparents.gif" alt="Advice to parents from Judy Murray et al" />
					</a>					
					<p class="caption"></p>
				</div>
			</div>		
		</div>
		<div id="hamptonlocalsites" style="clear:both;">
			<h2>Local Sources</h2>
			<p>
			Our tennis club exists within a local community that we are all proud of. Here are just a few of the other notable 
			information sources for things going on in our local area - enjoy!
			</p>
			<ul>
<!--			
				<li>
					<div class="borderbottom">
					<a href="http://www.hampton-monthly.co.uk">
						<img src="images/hamptonmonthly.jpg" width="349" height="51" alt="Local Hampton village newsletter" class="boxleft"/>
					</a>
					<p>Hampton magazine covering local issues and providing local directory listings of events and local traders.</p>
					</div>
				</li><br />
-->
				<li>
					<div class="borderbottom">
					<a href="http://www.hamptoninarden.org.uk">
						<img src="images/hamptoninardenlogo.gif" width="257" height="43" alt="Local Hampton village newsletter" class="boxleft"/>
					</a>
					<p>The official web site of the Hampton-In-Arden Parish Council.</p>
					</div>
				</li><br />
				<li>
					<div class="borderbottom">
					<a href="http://www.beerintheevening.com/pubs/s/21/21251/White_Lion/Hampton_in_Arden">
						<<img src="images/whitelion.jpg" width="340" height="227" alt="Local Hampton village newsletter" class="boxleft"/>
					</a>
					<p>
					This charming village inn, situated at the heart of the picturesque village opposite the ancient church of St Mary &amp; 
					St Bartholomew offers a range of cask conditioned ales and traditional bar food (Faggots, Gammon Egg & Chips etc) in 
					addition to the a la carte restaurant and 8 en suite twin/double bedrooms. A return to reality - the way a pub should be. 
					</p>
					<div>
				</li><br />
<!--				
				<li>
					<div class="borderbottom">
					<a href="http://www.hamptonplayers.co.uk/">The Hampton Players</a>
					<p>
					A band of local people who get together to put on plays for everyone to enjoy. 
					</p>
					<div>
				</li><br />	
-->				
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

