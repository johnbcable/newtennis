<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Maxi-Tennis Finals Day 2008");
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
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Scotland Victors At Maxi-Tennis Final 2008</h3>
		<div id="firstblock" style="height:385px;">
			<div id="maxiwinners2008">
				<a href="show_pic.asp?photo=&The victorious Scotland Maxi-Tennis team">
					<img class="floatleft" id="scotland2008" border="0" src="Images/med_maxifinals2008winners.jpg" width="445" height="377" alt="Victorious and happy Scotland team">
				</a>
			</div>
			<p>
				2008 is the third year that Hampton-In-Arden Tennis Club has run a full Maxi-tennis tournament which this year welcomed 
				Scotland and Ireland as finalists. It was the first visit to the finals for both of these teams - a tribute to the close-season 
				team adjustments to ensure a more even set of teams in the league. Previous finalists have been:<br /><br />
				<b>In 2006</b>:&nbsp;&nbsp;England managed to overcome Wales in the finals reflecting how the league finished,<br />
				<b>In 2007</b>:&nbsp;&nbsp;Wales were once again in the finals and were too much for Italy
			</p>
		</div>
		<div id="overlayboxquote" class="boxright">
			<div class="boxheader">
				A word from our inventor ...
			</div>
			<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
			<p>
				Maxi-Tennis has been operating now for 3 years and seems to be able to attract otherwise absent members down 
				to the club to take part in team-focussed competitive tennis - at a COLD time of the year! Add it to your 
				post-Christmas exercise programme and enjoy the social side of the competition. The after-match food is always 
				worth sampling ..... and I try and sample as much as I can (<i>Ed. Only joking Chester</i>)! Cheer on your team 
				even if you are not playing - your support could be crucial for your teammates. If you've enoyed this year's 
				tournament let me know and we'll try and run one again next year.<br /><br />
				Best of luck to Scotland and Ireland for a good match on Sunday 13th April.
			</p>
			<p class="boxsignature">Chris Barnes</p>
		</div>
		<p>
			Well Sunday 13th April dawned with a mixed weather forecast for the above finals but the participants were not to be 
			put off! Despite having a delayed start due to bad weather (and another bad weather break coincidentally just in time 
			to catch the last 20 minutes of the Liverpool/Blackburn football match in the clubhouse!) play finished just over half 
			an hour late at about 5.00 pm.
		</p>
		<p>
			Scotland set out to dominate the play from the start losing only one of the first 10 matches! Ireland then rallied and 
			managed to share the honours in the second half. Nevertheless, Scotland ran out worthy winners in the end - full score 
			details available <a href="showmaxiresult.asp?thefile=maxifinals2008.htm">here</a>.
		</p>
		<p>
			Awards were presented by Chester Barnes - the originator of our Maxi-Tennis tournaments - and, at his request (<i> and ours ... Ed</i>), 
			we've kept him out of the photos shown below. Click on any photo in the strip below to see a larger view of it on 
			the screen.
		</p>
		<div id="maxifinals2008photogallery">
		
		</div>
		<p>
			Now then, anyone fancy a warmer weather version of a similar tournament? Keep your eyes on your emails and on this web site 
			for more details
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
				<li><a href="maxileague2008.asp">Current Maxi-Tennis league table</a></li>
				<li><a href="maxiresults2008.asp">Maxi-Tennis match results for current tournament</a></li>
				<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
				<li><a href="maxifinals2008gallery.asp">More photos from the final</a></li>
			</ul>
		</div>
		<p>
			&nbsp;
		</p>
		<div id="maxitennisteambanner" class="centered">
			<!--#include file="maxitennisflags.htm" -->	
		</div>
		</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
<!--#include file="home_nav.asp" -->
<!--#include file="memb_nav.asp" -->	
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
