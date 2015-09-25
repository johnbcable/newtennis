<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("New Tennis Court Development Project");
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
		<h1>News:&nbsp;<b>Work Starts on New Tennis Courts</b></h1>
		<h2>The Waiting Is (Nearly) Over</h2>
		<img class="floatleft" id="newcourts2" src="http://www.hamptontennis.org.uk/images/newcourtplan.gif" width="400" height="680" alt="Approved court layout for new courts" style="margin:0 10px 10px 0;"/>
		<p>
			AT LAST! After almost 5 years of fund raising, negotiation and general hard work,
			the project to build 4 new outdoor tennis courts plus a kidzone to replace our existing 
			old, crumbling 3 outdoor tennis courts got under way on site on <strong>Monday 2 February, 2009</strong>
		</p>
		<p>
			Projected to take 14 weeks with a completion target of early May, 2009, the contractors couldn't have had 
			much worse weather for their first days on this job - raging blizzards if I recall correctly on the first day! 
			Nevertheless it is very exciting watching the old courts being demolished to make way for the new ones - and 
			no-one will miss the old lighting or damaged fencing I'm sure!
		</p>
		<p>
			We intend to keep you up-to-date with progress on this contract via emails and additions to this web page 
			(so why don't you bookmark it or save it as favourite now?). We'd love it if anyone has good photos of 
			the ongoing work or even short video clips so everyone who visits this page can see how things are getting 
			on. Check out our <a href="thumbnails.asp?gallery=3">Photo Gallery</a> now!
		</p>	
		<p>
			If you have any questions at all regarding the new tennis court project, don't hesitate to get in touch with
			<a href="committees.asp">a committee member</a> or send us your question(s) via <a href="mailto:secretary@hamptontennis.org.uk">
			email</a> or by post. We will endeavour to answer your questions promptly and may update the web site with the 
			question and answer if this would be of general interest to members and residents of Hampton-In-Arden.
		</p>
		<h2 style="clear: both;">STOP PRESS we're nearly red-dy!</h2> 
		<p>
			Red Euroclay surfacing is now down on two of the courts and their surrounds - check out the <a href="thumbnails.asp?gallery=3">Photo Gallery</a> 
			to see how this looks. Surround and internal fencing is mostly up, including extra height safety net facing the cricket square. Realignment of the 
			pedestrian path from the clubhouse to the hockey pitch is under way. With more work scheduled to complete in week commencing 27 April,
			it won&apos;t be long now!
		</p>
		<h2 style="clear: both;">Things to Remember While the Work Is Under Way</h2> 
		<img class="floatleft" id="carpark" src="http://www.hamptontennis.org.uk/images/tn_newcourts005.jpg" width="150" height="150" alt="Reduced car parking at the club while the tennis court construction works are on" style="margin: 10px 10px 0 0;"/>
		<h3>Reduced Sports Club Car Park Capacity</h3> 
		<p>
			For the first few weeks of the contract at least, the Sports Club car park will operate with a much reduced 
			car parking capacity. Approximately half of the available space has been fenced off to allow for the safe 
			manoeuvring and storage of heavy construction equpiment while they work the main construction of the new 
			tennis court areas. Pedestrian access ways are available for both the clubhouse and the Scout and Guide Hut 
			while the car park is fenced off.
		</p>
		<img class="floatleft" id="menatwork" src="http://www.hamptontennis.org.uk/images/menatwork.gif" width="150" height="150" alt="Construction site - take care" style="margin:10px 10px 20px 0; clear:both;"/>
		<h3>Safety Reminder</h3> 
		<p>
			<strong>Don't forget:</strong>&nbsp;please take appropriate safety precautions when you are in the Sports 
			Club car park, attending the club for an event (sporting or social) or attending the Scout and Guide Hut. 
			There are numerous notices on the fencing itself but please do keep an eye on children in the vicinity 
			of the works - yes, the courts will all be worth it when completed but the area is a construction site 
			for the moment, not a playground. Please take particular care during February half-term week when there 
			are likely to be many more children in the area during the day than there would be during school term time.
		</p>
		<h3 style="clear: both;">Coaching and Social Tennis</h3> 
		<p>
			We do apologise for the temporary lack of tennis courts at Hampton.  Top class new courts will be available 
			sometime after Easter!
		</p>
		<p>
			In the interim, Ian is still running junior coaching sessions at alternative venues.  Any queries, please 
			give Ian a ring (on 07968 451956).
		</p>
		<p>
			Alternate arrangements for adult social tennis have been made with Billesley Tennis Centre (Tuesday and
			Friday evenings) and with Eversfield Preparatory School (Sunday mornings). The courts at Billesley are good 
			outdoor hard courts but laid on a proper more forgiving base - less hard on the joints, but the balls still bounce like 
			the old courts. Ther are no fees for Hampton Tennis Club members to pay for using these facilities at these times but 
			please introduce yourselves to the staff before you start to play - in the case of the evening sessions, you will 
			undoubtedly need them to put the floodlights on your designated courts, for instance. The locations of each venue can be found:
			<ul>
				<li><a href="http://www.birmingham.gov.uk/GenerateContent?CONTENT_ITEM_ID=357&CONTENT_ITEM_TYPE=7&MENU_ID=735">Billesley Tennis Centre</a></li>
				<li><a href="http://www.eversfield.co.uk/map_and_directions.html">Eversfield Preparatory School</a></li>
			</ul>
			For further information re social tennis, please review the email sent out to members recenlty (see below)
		</p>
		<div class="seealso" style="clear: both;">
			<h3>See Also:</h3>
			<ul>
				<li><a href="thumbnails.asp?gallery=3">Photo Gallery</a></li>
				<li><a href="showemail.asp?email=email246.htm">Social Tennis Arrangements (original email)</a></li>
			</ul>
		</div>
	</div>   <!-- end of content -->
	
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
