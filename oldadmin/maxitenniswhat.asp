<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis Section");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="sectionhead.asp" -->
	<div id="content">
		<div id="mainContent">
			<h3>So, what IS <span class="blueheading">MAXI-Tennis</span>?</h3>
			<p>
				MAXI-Tennis is tennis primarily for fun!
			</p>
			<p>
            It is bringing the 'fun' of mini-tennis over for older players. Its for players who know one end of a tennis racket from the other but 
            you don't have to be a league player to enjoy it.&nbsp; It's for any standard of tennis player who doesn't mind joining forces with other 
            tennis members in the same team in roustabout competitions against other similarly constituted teams - and it's a social occasion, a 
			chance to meet more club members than you might normally.
			</p>
			<p>
				MAXI-Tennis events get you playing as part of a whole team - you're not on your own, although you do get the chance to play singles games.
			</p>
			<p class="morelink"><a href="ourmaxitennis.asp">More details</a></p>
	</div>  <!-- mainContent -->	
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
	</div>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="fixturepanel.asp" -->
<!--#include file="memb_nav.asp" -->
</div>
<div id="footer">
<!--#include file="textnav.asp" -->
</div>
</div>
<!--end container-->
</body>
</html>
<%
%>
