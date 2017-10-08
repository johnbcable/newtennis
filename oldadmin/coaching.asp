<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Hampton-In-Arden Tennis Club - Coaching";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var reslink = new String("juniors/results.html?season=2011").toString();
if (signedin())
	reslink = new String("juniors/results.html?season=2011").toString();
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="expires" content="0" />
	<title><%= pagetitle %></title>
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
<!--
#currentmembers {
				 position: relative;
				 margin: 20px auto;
}
#membersbutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#membertext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#membertext p {
			 padding-left: 30px;
}						

#membersbutton a, #membersbutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
  font-weight: bold;
	padding: 5px 10px 6px; 
	color: #fff; 
	text-decoration: none;
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer;
}

#membersbutton a:hover { 
	background-color: #111; 
	color: #fff; 
}
.coachingstaff {
	border-top: 1px solid #000;
	padding: 2em 0;
	clear: both;
}
-->
</style>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<a href="juniors/index.html"><img id="juniorlogo" src="images/Juniorlogo.gif" width="163" height="54" alt="Junior Logo" class="juniorlogo" /></a>
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
		<h1>Coaching:&nbsp;<b>Junior Coaching Provision</b></h1>
		<a href="ianpoole.asp">
			<img id="headcoach" class="floatleft" src="images/tn_ianpoole.jpg" border="0" width="100" height="100" ALT="Find out more about Ian - click this photo for more details" />
		</a>
		<p>
			Hampton-In-Arden Tennis Club offers a variety of structured coaching to Junior 
			members run in concert with the school terms, usually 
			with a break over half term weeks and other school 
			holidays. The current junior coaching schedule is 
			always made available via this site. 
			All coaching is organised by our Head Coach and Tennis Manager, 
			Ian Poole (left - <b>07968&nbsp;451956</b>).
		</p>
		<p>
			Ian is assisted by a wealth of expertise and enthusiasm in his coaching team:
		</p>
		<div id="sampeace" class="coachingstaff">
			<a href="sampeace.asp">
				<img class="floatright" src="images/tn_sampeace.jpg" width="100" ALT="Lead performance coach and competition organiser is ..... Sam Peace" />
			</a>
			<p class="caption"></p>
			<h5>
				Sam Peace<br />
				Fully qualified LTA tennis coach<br />
				Lead Performance Coach and Competition Organiser<br />
			</h5>
		</div>
		<h2 style="clear: both;">The Coaching Team</h2>
		<div id="gallery">
			<ul class="thumbnails">
				<li><a href="emmashalley.asp"><img alt="Emma Shalley" title="Emma Shalley" src="images/tn_emmashalley.jpg" /></a></li>
				<li><a href="belkacemchefri.asp"><img alt="Belkacem Chefri" title="Belkacem Chefri" src="images/tn_belkacem.jpg" /></a></li>
				<li><a href="bethstarkey.asp"><img alt="Beth Starkey" title="Beth Starkey" src="images/tn_bethstarkey.jpg" /></a></li>
				<li><a href="matttew.asp"><img alt="Matt Tew" title="Matt Tew" src="images/tn_matt_tew.jpg" /></a></li>
				<li><a href="nathanwiggin.asp"><img alt="Nate Wiggin" title="Nate Wiggin" src="images/tn_natewiggin.jpg" /></a></li>
			</ul>		
		</div>		
		<p style="clear: both;">
			From left to right Emma Shalley, Belkacem Chefri, Beth Starkey, Matt Tew and Nate Wiggin
		</p>
		<p style="border-bottom: 1px solid #000; padding-bottom: 10px;">
			Click on a photo to get more details about any of the coaching staff.
		</p>
		
		<p style="clear: both;">
			Ian Poole and his team of Sam Peace, Matt Tew, Nate Wiggin, Emma Shalley, Bel Chefri and Beth Starkey offer a full programme of high quality group and individual lessons to both adult and junior members. They also deliver tennis coaching and PE to local schools. Ian is an LTA coach tutor. The team believes that sport plays a vital role in the development of individuals and is committed to delivering programmes to meet the needs of every player. Coaching supports and encourages competitive play. At present there are over 150 children and 60 adults taking part in regular coaching sessions. The coaching programme works alongside the LTA’s coaching initiatives progressing from Mini Tennis for the very young, through to full court adult tennis as follows:
		</p>
		<h2 style="clear:both;">Junior Group Tennis Coaching</h2>
		<img id="minitennislogo" class="floatleft" src="Images/arielmt1.gif" width="142" height="120" alt="Ariel Mini-Tennis logo" />
		<h3>Tots Tennis (ages 3 - 5)</h3>
		<p>
			Coordination fun based activities introducing racket skills to develop the basic fundamentals.
		</p>
		<h3>Mini-Tennis (ages 5 to 10)</h3>
		<p>
			Mini Tennis has been developed to motivate children aged 5 - 10 years, through 3 graduating stages of tennis (red -> orange -> green) that are suitable for their age and ability.  Mini-Tennis now forms the initial part of the LTA National Competition Framework (see below for more details).
		</p>
        <a class="morelink" href="minitennis.asp">More on Mini-Tennis....</a>
		</p>
		<h3 style="clear: both;">Junior Tennis (ages 11 &amp; over)</h3>
		<p>
			This forms the final part of the LTA National Competition Framework (see below for more details). The juniors are grouped according to age and ability and work on technique and tactics for both singles and doubles play on full court with normal balls
		</p>
		<p>
			ocial events are organised for all age levels. Girls only groups are offered for primary school children.
		</p>
		<h2>Individual Development</h2>
		<p>
			Individual development plans can be designed around playing and coaching needs. Tournament schedules can be provided for performance players. Help can also be given with other areas of development, for example, Duke of Edinburgh awards and work experience. 
		</p>
		<h3>
			Private (One-to-One) Lessons
		</h3>
		<p>
			Take the opportunity to get that extra attention on your game, maybe focusing on one or two aspects.  These sessions can be booked directly with your coach with up to a maximum of 4 people per lesson. Discounts are available if you book a block of lessons. 
		</p>
       <a class="morelink" href="onetoone.asp">More on One-to_one Coaching....</a>
		<h2>Bad weather during coaching? No problem!</h2>
		<img id="badweather" class="boxright" border="0" src="Images/bad-weather.jpg">
		<p>
			We always do our best to play through all weather, but our main concern is always the safety and well-being of the children. 
			Coaching continues through all weather, and indoor activities will be organised by the coaches if the weather does not allow the 
			children to play safely outside on the courts. on these occasions the Squash Courts or Scout &amp; Guide Hut may be used or a game 
			of table tennis may be an option! However, please bring suitable waterproof clothing and a drink to all your lessons.
		</p>
		<h2 style="clear:both;">Junior Competitive Opportunities</h2>
		<p>
			All age groups from mini red through to Under 18’s are given a chance to play in regular internal leagues and friendly or competitive matches against other local clubs. 
		</p>
		<p>
			Within the club Junior Championships at all levels are held during the year and an <a href="juniors/tournaments.html">annual tournament</a> is organised for more advanced juniors. Please ask your coach to find out more about current events that may be of interest to you and your child
		</p>
		<h2>Mentoring / Coach Development</h2>
		<p>
			Ian works with Warwickshire LTA to tutor young coaches to give them the knowledge and experience needed to further their coaching careers. Obtaining a level 1 coaching certificate is great experience for anyone, especially a teenager. If you are interested please speak to Ian.
		</p>
		<h2>See Also:</h2>
		<ul>
			<li><a href="ianpoole.asp">Further info on Ian Poole, head coach</a></li>
			<li><a href="sampeace.asp">Further info on Sam Peace, performance coach</a></li>
			<li><a href="juniors/coaching_schedule.html">Current junior coaching schedule</a></li>
			<li><a href="crenewal.asp">Junior coaching booking form</a></li>
			<li><a href="adult_juniors/coaching.html">Currently available adult coaching - overview</a></li>
			<li><a href="juniors/minitennis.html">More information about the LTA National Competition Framework</a></li>
		</ul>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		
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


