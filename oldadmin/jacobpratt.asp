<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("New Coaching Assistant for Hampton-In-Arden Tennis Club");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
	<div id="leftcolumn">

<!--#include file="memb_nav.asp" -->	
	</div>
<div id="content">
	<div id="mainContent">
	<h1>Coaching:&nbsp;<b>Say Hi to coaching assistant - Jacob Pratt</b></h1>
	<div id="coachimage">
		<a href="show_jpic.asp?photo=jacobpratt&caption=Our new tennis coaching assistant is ..... Jacob Pratt!">
			<img class="floatleft" src="images/tn_jacobpratt.jpg" width="150" height="200" ALT="Our new tennis coaching assistant is ... Jacob Pratt" />
		</a>
		<p class="caption"></p>
		<h5>
			Jacob Pratt<br />
			Junior Club Champion 2008<br />
			Mens 3rd Team Player<br />
			Well known and popular with the juniors<br />
		</h5>
	</div>
	<p>
		The&nbsp;<a href="juniors/coaching_schedule.html">current junior coaching schedule</a> can always be found on the web site. 
	</p>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
<!--#include file="emailpanel.asp" -->
		</div>
	</div>
	<div id="footer">
<!--#include file="textnav.asp" -->
	</div>
</div>
</body>
</html>
<%
%>
