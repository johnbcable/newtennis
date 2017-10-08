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
		<h3>So, how do I get in on this MAXI-Tennis stuff?</h3>
		<p>
			Chris Barnes, our revered secretary and prime MAXI-Tennis mover, 
            spends his winter preparing for the restart of MAXI-Tennis at the 
            club as a whole during each Spring, following on from the success of 
            MAXI-tennis at the club during 2006 and 2007. As always, our main aim is to get as many 
            club members (new and old) involved as possible. To do this, Chris has split the 
            adult membership of the club up into six playing 'pools', each pool 
            having as broad a range of playing abilities as any other. 
            Consisting mostly of adult members, promising juniors (nominated by 
            our coach, Ian Poole) also feature in each of the playing pools.
		</p>
		<p>
            So, if you are an adult, paid-up member of the club - you're 
            part of this already, and your pool captain(s) will be in touch with 
            you shortly with more information about playing.
		</p>
		<p>
			For further information, click&nbsp;	<a href="maxitennis.asp">here</a>
		</p>
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
