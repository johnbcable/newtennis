<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Home Page");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
	<link rel="stylesheet" media="screen" type="text/css" href="2col_layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
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
			19 February 2009  18:45
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Our Club:&nbsp;<b>General Information</b></h1>
		<img id="cotytrophy" src="images/trophy.jpg" alt="We did it!" title="We did it!" width="85" height="120" />
		<h2>Club of the Year!</h2>
		<p>
			We are extremely excited and proud to announce that Hampton-in-Arden Tennis Club was 
            chosen as the Club of the Year 2007 by the Warwickshire Lawn Tennis Association. 
			As there are 70 tennis clubs in Warwickshire, most of whom have more facilities than 
			us, the win was no mean feat! This was announced at an awards ceremony sponsored by 
			Jobson James which was held on Friday 18 January, 2008 at the Botanical Gardens in 
			Edgbaston. Apart from receiving a beautiful glass engraved trophy we were also 
            presented with a &pound;1,000 cheque courtesy of the Bank of Ireland.
		</p>
		<p>
			We would like to thank everyone who has been involved in making Hampton such a 
            great tennis club - juniors, adults, tennis coaches, volunteers, parents of juniors, etc etc.
			This award is a credit to all concerned.
		</p>

		<h2>What we do</h2>
		<p>
			The club is continually developing -
			we presenly have four new outdoor courts under development due to become available between Easter and
			May Day bank holidays - and <b>new members are always welcome</b>! The club welcomes players of all 
			standards, for casual or match play. Adults and juniors have access to the services of a professionally-qualified 
			coach.
		</p>
		<p>
			We offer competitive subscription rates with attractive discounts for family memberships. Members can take part in a 
			range of club competitions and social events. Our 3 mens and 3 ladies teams compete in the Coventry Lawn Tennis League.
			We are also an accredited Mini-Tennis centre and place great emphasis on encouraging young children to play tennis.
		</p>		
		
		<h2>How to find us</h2>
			Hampton-In-Arden Tennis Club is situated in pleasant green-belt countryside between Birmingham and Coventry in 
			the West Midlands. Our club is located in the recreation ground off Shadowbrook Lane, a short walk from the 
			centre of the village. 
		</p>
		<p>
			<a href="juniors/contact.html">More details .....</a>
		</p>

		<h2>Joining</h2>
		<p>
			Want to know about how join our club? here you can find details about how you can join our club, membership rates, 
			<a href="clubrule.asp">club rules</a> and so on.
		</p>
		<a href="juniors/joinus.html">More details .....</a>

		<h2>The 200 Club</h2>
		<img src="images/200_Club.gif" width="109" height="48" alt="The 200 Club" />
		<p>
			One of the ways in which the club raises money is to run a 200 Club. Here you will find more information about the 
			200 Club fund-raising prize draw system in operation at the club and how to participate in it.
		</p>
		<a href="200club.asp">More details .....</a></span>				

		<h2>Management of the club</h2>
		<p>
			Want to know how our club is managed, who the committee members currently are and how to contact them?
		</p>
		<a href="committees.asp">More details .....</a>

		<h2>Facilities</h2>
		<p>
			Like to know what facilities our club offers? This overview will give you a concise description of the facilties we 
			offer at our club including clubhouse, coaching and social facilities.
		</p>
		<a href="facilities.asp">More details .....</a>

		<p>
			We always welcome ideas for presentation and content on our web site. If you
			would like to see something on our web site that isn't there or if you would
			like to comment on its layout, please feel free to contact us at 
			<a href="mailto:support@hamptontennis.org.uk">support@hamptontennis.org.uk</a>
			&nbsp;and we will do our best to reply and take your suggestions into account.
		</p>
		<p>
			If you would like to sponsor our site, and have your organisation credited, we
			will be pleased to discuss this with you. Please contact us at 
			<a href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a>
			using the word "Sponsor" in the subject line.
		</p>	
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>
