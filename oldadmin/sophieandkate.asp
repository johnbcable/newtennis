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
	<div id="leftcolumn">

<!--#include file="memb_nav.asp" -->	
	</div>
<div id="content">
	<div id="mainContent">
		<h1>Juniors:&nbsp;<b>North Warwickshire Doubles 2007</b></h1>
		<h3>Under 14 Girls Final</h3>
		<div id="finals2">
			<a href="show_jpic.asp?photo=220907playing&caption=Rosie serving to Kate">
				<img class="floatright" id="finalists2" border="0" src="Images/tn_220907playing.jpg" width="150" height="131" alt="Rosie serving to Kate">
			</a>
		</div>
		<p>
			Kate Gregory and Sophie Cable from Hampton-In-Arden Tennis Club are now North Warwickshire Under-14 Girls Doubles champions! 
			Playing on an unfamiliar, saturated astro-turf surface early on the morning of Saturday 22 September 2007, things didnt look 
			good for our pair to start with as the Edgbaston Archery girls took an early, deserved 3-0 lead in the first set. However,
			Kate and Sophie didnt let that initial disappointment get to them and quickly drew level to 3-3. The rest of the first set was 
			played out to a tie-break finish at 6-6 with the girls keeping step with each other all the way through. Kate and Sophie 
			kicked off the tie-break in great style cruising to a 4-0 lead after some uncharacteristic double faults from the 
			Edgbaston Archery girls who then rallied and drew level at 5-5. The wait was nail-biting but eventually Kate and Sophie played out 
			the first set winning 7-5 in the tie break to give them a 7-6 win for the first set.
		</p>
		<div id="finals1">
			<a href="show_jpic.asp?photo=220907finalists&caption=Tight match but we DID it in the end!">
				<img class="floatleft" id="finalists1" border="0" src="Images/tn_220907finalists.jpg" width="150" height="131" alt="Weary finalists after the match">
			</a>
		</div>
		<p>
			The second set started more evenly as a more cat-and-mouse game crept in, neither side wishing to give their opponents any 
			advantage. Some good play from Edgbaston Archery and one or two unfortunate shots from Hampton took us to 4-2 down after 
			about 30 minutes. Once again, Kate and Sophie didnt let it get them down and made sure that they re-focussed on the job  
			before it got too much out of hand! Kate and Sophie's serving didnt let them down and they eventually had two match points 
			(at 40-15 and 5-4 up). But it wasnt time to go home yet - oh no! The Edgbaston Archery pair played well over those two points, 
			enjoying some good fortune at 40-30 when Hampton missed the chance to put the ball away and hit it into the net instead and went 
			on to win that game. One game a piece thereafter and we were in our second tie-break of the match - just as exciting as the first 
			but with the added bonus that the winning final shot came from Hampton.
		</p>
		<p>
			The girls had been on court for about two hours by now and were very tired but did allow a foursome photo to be taken of them 
			in the immediate aftermath. The runners up and winners trophies were then presented and the happy but tired Hampton pair 
			were driven home ...... straight to a tennis lesson at the club!
		</p>
		<div id="northsouth">
			<h3>North vs South Warwickshire Finals</h3>
			<div id="finals3">
				<a href="show_jpic.asp?photo=081007finalists&caption=Sophie and Kate receive their runners-up trophies in the North vs South Warwickshire finals">
					<img class="floatright" id="finalists3" border="0" src="Images/tn_081007finalists.jpg" width="150" height="131" alt="Sophie and Kate receive their runners-up trophies">
				</a>
			</div>			
			<p>
				Sophie and Kate went on to represent North Warwickshire against their counterparts from South Warwickshire in the 
				North vs South finals day at Warwick Boat Club on Sunday 7 October 2007. Facing a girls doubles pair from performance
				club Esporta, things were pretty even in the first set until, at 5-4 up, Esporta just edged ahead to claim the first set 
				after some debate on what the score was at one point in the final game of that set. With their tails up, the second set 
				was more conclusive for Esporta who ran out eventual winners 6-4 6-1
			</p>
			<p>
				The result was fairly typical for the day with Esporta winning most of the titles. Lets hope Hampton can be there again 
				next year and give them a run for their money. Well done girls for getting that far.
			</p>
		</div>		
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
