<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Juniors Area");
// Now for any variables local to this page
var greeting;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
myname = new String("").toString();
if (signedin())
	myname = getUserName();
// End of page start up coding
%>
<!--#include file="junsectionhead.asp" -->
<div id="content">
	<div id="mainContent">
		<h3>North Warwickshire Doubles - U14 Mixed Doubles</h3>
		<p>
			Sophie Cable and Jacob Pratt from Hampton-In-Arden Tennis Club are now North Warwickshire Under-14 Mixed Doubles champions! 
			Playing on their familiar, hard-court surface at Hampton on the afternoon of Saturday 13 October 2007, the home pair looked 
			comfortable winners of the first set (6-3). Playing against a brother and sister combination from Edgbaston Archery (Gabrielle
			and Sean Kettle), Egbaston Archery took hold of themselves at the start of the second set decisively winning the first game of that 
			set - and the first service game for Sean in the match. That was enough to wake up the home pair who then took charge of the second 
			set to fully deserve a 4-2 lead.
		</p>
		<div id="finals1">
			<a href="show_jpic.asp?photo=131007finalists&caption=Sophie and Shakey line up with Gabby and Sean for a finalists photo - ">
				<img class="floatleft" id="finalists1" border="0" src="Images/tn_131007finalists.jpg" width="150" height="133" alt="Triumphant finalists after the match">
			</a>
		</div>
		<p>
			However, it was not to be plain sailing and a relaxing afternoon for the home supporters. England may have comfortably seen off 
			Estonia but Hampton should not have expected the same from Edgbaston Archery. Keen students of the web site will notice that Gabrielle (Gabby) here 
			had already been one-half of the Edgbaston Archery U14 Girls Doubles pair who had played against Sophie and Kate (Gregory) recently and 
			been runners-up on that occasion. She didn't want a repeat performance.
		</p>
		<p>
			The Edgbaston pair settled down to it and took the next 3 games from Hampton making it 5-4 to Edgbaston Archery and Hampton staring 
			down the mouth of the tunnel leading to the third set and possible defeat. But they are made of stern enough stuff not to be phased by 
			circumstances such as this. Sophie and Shakey regrouped and pushed forward eventually taking the set 7-5 (the final point being an ace!).
		</p>
		<p>
			Well done this time round Sophie and Shakey (Jacob) - next year you move up an age group and can expect to be some of the youngest instead of 
			being in the older bracket: life just got harder! Thanks to Edgbaston Archery for being able to play this fixture - we know fixing these 
			matches up is not easy but playing is what these North Warwickshire Doubles participants want to do. Special thanks to Sean Kettle for 
			standing in at the last moment for Gabby's usual partner.
		</p>
	</div>
		<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="newspanel.asp" -->
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
