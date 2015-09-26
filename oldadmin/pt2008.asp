<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
var strtime, strdate;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Hampton-In-Arden Tennis Club - Sports Club Open Afternoon";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var reslink = new String("jtour2008.asp").toString();
if (signedin())
	reslink = new String("juniors/results.html?season=2008").toString();
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">	
	<h1>From 1.00 pm, Saturday May 16, 2008 at our club</h1>
	<h2>Tennis, Cricket and Mini-Squash Open Afternoon</h2>
		<div id="ptadvert">
			<img alt="Play Tennis promotional image" class="floatleft" src="Images/pt140x140.jpg" width="140" height="140">
		</div>
		<p>
			Play Tennis For Free (and Hockey too!) here at Hampton In Arden Sports Club on Saturday May 3, 2008.
		</p>
		<div>
			<p>
				You are warmly invited to help us celebrate winning the Warwickshire LTA award, Club of the Year!
				There will be TENNIS for adults and juniors of all abilities with our coaches, Ian Poole and Dave Mountford. 
				Also, if you are a junior aged over 7, but under 16, come and try your hand at HOCKEY on the fantastic new 
				astroturf pitch.<br /><br >
			</p>
			<p style="clear:both;">
				The outline timetable for the day is currently as follows:
			<p>
			<h4><u>Tennis</u></h4>
			<p>
				<span class="bluetext" style="width: 60px; text-align: right; margin-right: 5px;">2.00 pm</span>
				Mini-Tennis (ages 3 to 10) including a demonstration of mini-tennis skills
			</p>
			<p>
				<span class="bluetext" style="width: 60px; text-align: right; margin-right: 5px;">3.00 pm</span>
				Tennis fun-zone for adults and experienced juniors including our now famous coaches' frying pan challenge
			</p>
			<p>
				<span class="bluetext" style="width: 60px; text-align: right; margin-right: 5px;">3.45 to 5.30 pm</span>
				Drills and skills plus social mix-in tennis for all adults
			</p>
			<h4><u>Hockey</u></h4>
			<p>
				<span class="bluetext" style="width: 60px; text-align: right; margin-right: 5px;">2.00 to 5.00 pm</span>
				Hockey for girls and boys of all abilities
			</p>
			<p class="blueheading">
				Tea and cakes will be served all afternoon
			</p>
			<p>
				For more information please contact Ian Poole 07968 451956 (TENNIS), or Andy Woolford 07966 277012 (HOCKEY)
			</p>
		</div>
		<div id="otherdocs" style="width:50%; text-align:center;">
			Get a copy of the original flyer <a href="pt2008.pdf">here</a>&nbsp;(in PDF format).
		</div>
	</div>
	<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="jnewspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="leftcolumn">
	
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

	</div>
</div>
</body>
</html>
<%
%>

