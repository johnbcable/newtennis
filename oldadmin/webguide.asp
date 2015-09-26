<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Guide to the Web Site");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>First Visit?</h3>
		<p>
			If this is your first visit to the "new-look" Hampton-In-Arden Tennis Club website, then this page is for you! Here we 
			will introduce you to its contents and help you find your way around.
		</p>
		<p>
			The website has two main purposes:<br />
			<ul>
				<li>To give prospective members information about the Tennis Club and the other sports available at Hampton-In-Arden Sports Club 
					and the social activities, the necessary contact details, membership options and how to join.</li><br />
				<li>To keep existing members up to date with all that is happening at the Club.</li><br />
			</ul>
		</p>
		<p>
			To meet these two objectives, the website is regularly updated with the latest news, email circulations and a calendar of upcoming events, 
			as well as holding a store of background information on the Club, its history, contact details, membership information, downloadable application forms etc. 
			The website also hosts a members-only area providing further up-to-date and archive information for use by Hampton-In-Arden Tennis Club members.
		</p>
		<p>
			Talk about reaching the Home Page from anywhere by clicking on the club logo - explain about the regaions on the display.
		</p>
		<p>
			The main sections of the web site can be reached from the green strip-menu towards the top of each screen. Additional menu options specific to those sections 
			then become available within the top part of the left-hand column. For example, if you clikc on Playing from the green strip-menu then the top section of the 
			left hand menu becomes a Playing menu offering options of exploring league fixtures, coaching, court booking and so on.
		</p>
		<p>
			Our latest news and email circulations will keep you up to date with what’s been going on. These can be reached via the links in the "Club News" and "Recent Emails" 
			sections of the right-hand menu sidebar. The "Club News" area may sometimes be replaced by a "Coming Soon" section which provides access to the main event calendar 
			for the tennis club. This calendar is extremely useful for keeping in touch with all upcoming events and may also be found by selecting "News" from the top green 
			strip menu.
		</p>
		<p>
			If you ever get lost while browsing, you can always return to the home page of our by clicking on the tennis club logo in the top left corner of the screen. 
		</p>
		<p>
			We hope that we have created a web site that is informative and friendly for anyone to use and we hope that all Club members will become regular visitors 
			to the website and make use of the additional facilties in the members-only area. 
		</p>
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
