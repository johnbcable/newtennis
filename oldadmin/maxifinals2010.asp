<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Maxi-Tennis Finals Day 2010");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb");
var ConnObj;
var RS, RS2, RS3;
var SQL1, SQL2, SQL3;
var myid, mymaxiteam, mymaxiteamtext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Now go and get Maxi-Tennis team memebership if the user has signed-in
myid = getUserCode();
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
mymaxiteam = new String("").toString();
mymaxiteamtext = new String("").toString();
SQL1 = new String("SELECT maxiteam from allmembers where uniqueref = "+myid).toString();
RS = ConnObj.Execute(SQL1);
if (! RS.EOF)
{
	mymaxiteam = new String(RS("maxiteam")).toString();
	if (mymaxiteam == "" || mymaxiteam == "null" || mymaxiteam == "undefined")
		mymaxiteamtext = new String("");
	else
	    mymaxiteamtext = new String("You are currently a member of "+mymaxiteam);
}
RS.Close();
//
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
		<h1>Maxi-Tennis:<b>&nbsp;Finals Day 2010</b></h1>
		<div id="maxifinals2010image">
			<img src="images/maxifinals2010intro.jpg" width="600" height="201" title="France and Ireland will battle it out in the finals of the MAXI-Tennis tournament 2010" />
		</div>
		<p style="clear: both;">
			Finals day for 2010 is Sunday April 11 and everyone is looking forward to a great contest (and good weather)!  France and Ireland 
			are the two teams battling it out, in a remarkable parallel to the sister competition that is the Six Nations Rugby. Lets review the 
			route to the final. 
		</p>
		<div id="maxiwinners">
			<div id="maxiwinners2010" style="float: left; margin: 0 20px 20px 0; clear:both;">
				<a href="show_pic.asp?photo=&The victorious French MAXI-Tennis team">
					<img class="floatleft" id="france2010" border="0" src="Images/med_maxifinals2010winners.jpg" width="200" height="182" alt="French team on their way to their first finals win">
				</a>
			</div>
			<h2>France</h2>
			<p>
				These two teams played each other at the start of the MAXI-Tennis tournament (in January 2010) and it was a great
				contest, Ireland just edging it then by 11 points. France then didnt lose another match which took them 
				to a deserved second place in the league table.
			</p>
		</div>
		<div id="maxirunnersup" style="float: left; margin: 0 20px 20px 0; clear: both;">
			<div id="maxirunnersup2010">
				<a href="show_pic.asp?photo=&The Irish MAXI-Tennis team for the finals">
					<img class="floatleft" id="ireland2010" border="0" src="Images/med_maxifinals2010runnersup.jpg" width="200" height="143" alt="Irish team before their second finals appearance">
				</a>
			</div>
			<h2>Ireland</h2>
			<p>
				The Ireland journey was a bit more up and down. After beating France in the initial match, Ireland promptly convincingly 
				lost their next match to a disciplined Italy performance before bouncing back in their third match with a convincing win over
				England, an even better win against Wales and a tighter win over Scotland to end up top of the league.
			</p>
		</div>
		<div id="firstblock" style="clear: both;">
<!--		
			<div id="maxiwinners2010">
				<a href="show_pic.asp?photo=&The victorious French MAXI-Tennis team">
					<img class="floatleft" id="france2010" border="0" src="Images/med_maxifinals2010winners.jpg" width="445" height="377" alt="French team on their way to their first finals win">
				</a>
			</div>
			<div id="maxirunnersup2010">
				<a href="show_pic.asp?photo=&The Irish MAXI-Tennis team for the finals">
					<img class="floatleft" id="ireland2010" border="0" src="Images/med_maxifinals2010runnersup.jpg" width="445" height="377" alt="Irish team before their second finals appearance">
				</a>
			</div>
			
-->
			<p>
				
				<b>In 2006</b>:&nbsp;&nbsp;England overcame Wales in the finals reflecting how the league finished,<br />
				<b>In 2007</b>:&nbsp;&nbsp;Wales were once again in the finals and were too much for Italy<br />
				<b>In 2008</b>:&nbsp;&nbsp;Scotland convincingly triumphed over Ireland, and in <br />
				<b>In 2010</b>:&nbsp;&nbsp;France have convincingly triumphed over Ireland.<br />
			</p>
		</div>
		<div id="maxitennisinventor" style="clear: both;">
			<h2>The message from our inventor remains the same ...</h2>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" style="float: left; margin: 0 20px 20px 0;"/>
			<p>
				Maxi-Tennis has been operating now since 2006 (with a one-year lay off while the new courts were being built)
				and seems to be able to attract otherwise absent members down to the club to take part in team-focussed 
				competitive tennis - at a COLD time of the year! Add it to your 
				post-Christmas exercise programme and enjoy the social side of the competition. The after-match food is always 
				worth sampling! Cheer on your team even if you are not playing - your support could be crucial for your teammates. 
				If you've enjoyed the tournament let me know and we'll try and run one again next year.<br /><br />
				Best of luck to France and Ireland for a good match on Sunday 11th April - Italy will be back!.
			</p>
			<p class="boxsignature">Chris Barnes</p>
		</div>
		<h2>Match Report</h2>
		<p>
			Well Sunday 11th April dawned with a beautiful start to the day. By 2.40pm, it had partially clouded over thus 
			allowing participants a bit of shade while they were running around.
		</p>
		<p>
			By approximately half-way through, there was still all to play for with France in the lead by 11 points. With 4 wins each, the main thing 
			between the teams was that when Ireland lost, they lost by an appreciable margin, but when France lost, in the main, they
			still managed to rack up the points. In the second half, France managed to take 7 of the remaining 10 matches, many of
			those again with large margins, so much so that Rob Yates in his match with Ian Poole didnt need to get any points at all - 
			but annoyingly (from an Ireland perspective) he still did losing 10-9 to Ian in the final match of this MAXI-Tennis finals.
		</p>
		<p>
			Full scores from the match are shown <a href="showmaxiresult.asp?thefile=maxifinals2010.htm">here</a>.
		</p>
		<p>
			There was no awards ceremony on the day - although Steve Ray did pop a cork or two! Food was brilliant as always. Thanks 
			again to everyone who has been involved in the tournament this year - well played!
		</p>
<%
if (! (mymaxiteamtext == ""))
{
%>
		<p class="borderboth">
			<span class="blueheading"><%= mymaxiteamtext %></span>
		</p>
<%
}
%>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="showmaxiresult.asp?thefile=maxifinals2010.htm">Scoresheet for the final</a>
				<li><a href="maxileague2010.asp">MAXI-Tennis league table for 2010</a></li>
				<li><a href="maxiresults2010.asp">MAXI-Tennis detailed match results for 2010</a></li>
				<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
<!--
				<li><a href="maxifinals2010gallery.asp">Photos from the final</a></li>
-->
			</ul>
		</div>
		<p>
			&nbsp;
		</p>
		<div id="maxitennisteambanner" class="centered">
			<!--#include file="maxitennisflags.htm" -->	
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

