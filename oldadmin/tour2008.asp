<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Adult Annual Tournament 2008");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Supporting variables and lists
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>Tournament Draw - 2008</h3>
		<div id="finalsdaydraw" class="borderbottom">
			<img class="floatleft"  style="margin-right:20px;" src="images/new.jpg" width="71" height="43"  alt="New - important update">
			<p>
				IMPORTANT - <a href="tour2008finalsday.asp">Finals Day order of play</a> and <a href="tours.asp?season=2008">results</a>
			</p>
		</div>
		<p>
			Below are the rules and the final state of the draw for the 2008 annual adult tournament (as at Saturday 5 July, 2008). 
			Thank you all for arranging and playing your matches promptly.
		</p>

		<div class="borderboth">
			<h4><span class="blueheading">Rules</span></h4>
			<p>
			1) Organising responsibility.  The first named in any draw should arrange the match.  In the event of problems in agreeing a 
			date where 3 alternate dates have been offered please refer the matter to the Tournament Committee (Geoff Redfern &amp; Steve Ray) 
			for a decision.		
			</p>
			<p>
			2) Booking courts.  Matches must not be arranged during a social tennis session.  The spare court on league tennis nights may 
			be booked.  The booking forms are kept under the light key pads in the clubhouse.
			</p>
			<p>
			3) Playing the match.  If you have not played your match by the Friday following the deadline date shown, the Tournament 
			Committee reserve the right to automatically progress the first named player or pair in the draw to the next round.			
			</p>
		</div>
		<div id="2008draw" class="centered">
			<img src="images/msgldraw2008.gif" width="657" height="514" alt="Mens singles draw for the 2008 tournament">
			<br />
			<img src="images/lsqldraw2008.gif" width="657" height="402" alt="Ladies singles draw for the 2008 tournament">
			<br />
			<img src="images/mdbldraw2008.gif" width="657" height="402" alt="Mens doubles draw for the 2008 tournament">
			<br />
			<img src="images/ldbldraw2008.gif" width="657" height="458" alt="Ladies doubles draw for the 2008 tournament">
			<br />
			<img src="images/mixddraw2008.gif" width="657" height="514" alt="Mixed doubles draw for the 2008 tournament">
			<br />
			<img src="images/mixpdraw2008.gif" width="657" height="514" alt="Plate mixed doubles draw for the 2008 tournament">
			<br />
			<img src="images/mvddraw2008.gif" width="657" height="318" alt="Veteran mens doubles draw for the 2008 tournament">
			<br />
			<img src="images/lvddraw2008.gif" width="657" height="346" alt="Veteran ladies doubles draw for the 2008 tournament">
			<br />
			<img src="images/mpltdraw2008.gif" width="657" height="374" alt="Plate mens singles draw for the 2008 tournament">
			<br />
			<img src="images/lpltdraw2008.gif" width="657" height="402" alt="Ladies mens singles draw for the 2008 tournament">
			<br />
		</div>		
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="tour2008finalsday.asp">Finals day order of play</a></li>
				<li><a href="tours.asp?season=2008">Finals day results</a></li>
				<li><a href="juniors/results.html?season=2008">Junior tournament results</a></li>
				<li><a href="http://www.flickr.com/photos/103781054@N07/sets/72157636092720576/">Photo gallery from finals day</a></li>
			</ul>
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
