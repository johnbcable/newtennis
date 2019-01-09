<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Play Tennis Day, 4 May, 2002");
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
	<tr>
		<!-- 	Column 1 reserved for navigation menu -->
		
		<td class="tdfont" width="440" align="left">
			<!-- Content for each page placed into middle column -->
			<br>
			<div name="playtennislogo" valign="center">
				<img src="images/playtennis190.gif" width="188" height="44" alt="">&nbsp;&nbsp;<b><i>Don't just sit and watch!</i></b>
			</div>
			<p>
			If you live in Hampton-in-Arden, Meriden, Balsall Common, Barston, Knowle or
			anywhere else near by, this is your chance to take advantage of the country's
			biggest and best annual sporting offer - to play tennis for free!
			<br>
			<br>
			Play Tennis 2002 is run by the Lawn Tennis Association and the campaign offers
			everyone, especially beginners, the opportunity to pick up a racket and play.
			As part of the campaign, Hampton-in-Arden Tennis Club is throwing open its
			doors on Saturday 4th May for free.
			<br>
			<br>
			It's open to players of all ages and abilities and youngsters are particularly
			welcome to come and try the greatest game in the world. So why not give it a
			try?
			<br>
			<br>
			Hundreds of venues around the country are expected to take part and the LTA
			anticipate that more than 85,000 will have a hit, making it the UK's biggest
			participation event.
			<br>
			<br>
			Sarah Wells, our Chairman, said: "The campaign has been designed to encourage
			people of all ages to go to their local tennis venue and pick up a racket. We
			want to show people that their local tennis club can be welcoming and friendly.
			We particularly hope that the campaign attracts children and adults to try
			their hand at tennis and become long-term members of our club."
			<br>
			<br>
			The national Play Tennis 2002 campaign begins on 
			<b>
				April 13, 2002
			</b>
			 and runs for three months until 
			<b>
				July 13
			</b>
			<br>
			<br>
			Hampton-in-Arden Tennis Club will be taking part on 
			<font color=#0000ff>
				<b>
					Saturday 4th May 2002
				</b>
			</font>
			<br>
			<br>
			<h3>
				'Play Tennis' Day - May 4, 2002 at our club
			</h3>
			The club hosts a variety of events during the day available to members and
			non-members alike - bring family and friends for a good day out!
			<br>
			<br>
			Face painting and refreshments are available throughout the day and a barbecue
			runs from 11:00 a.m. .... till we run out of food! A program of free tennis
			activities involving our coaches (Jane Hodge and Richard Perkins) 
			runs throughout the day as follows:
			<br>
			<br>
			<table  width="440" border="1" cellspacing="2" cellpadding="5" cols="200,40,*">
				<tr>
					<td class="tdfont" align="center" width="200">
						9.30 a.m. ->
						 10.00 a.m.
					</td>
					<td class="tdfont" align="center" width="40" bgcolor="ff0000">
						RED
					</td>
					<td class="tdfont" align="center">
						Mini Tennis Tiny Tots
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						10.00 a.m. ->
						 11.00 a.m.
					</td>
					<td class="tdfont" align="center" width="40" bgcolor="#ff8000">
						ORANGE
					</td>
					<td class="tdfont" align="center">
						Mini Tennis Ages 5-6
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						11.15 a.m. ->
						 12.15 p.m.
					</td>
					<td class="tdfont" align="center" width="40" bgcolor="#008000">
						GREEN
					</td>
					<td class="tdfont" align="center">
						Mini Tennis Ages 7-8
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						12.30 p.m. ->
						 1.30 p.m.
					</td>
					<td width="40">
						&nbsp;
					</td>
					<td class="tdfont" align="center">
						Beginners Ages 9-11
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						1.30 p.m. ->
						 2.30 p.m.
					</td>
					<td width="40">
						&nbsp;
					</td>
					<td class="tdfont" align="center">
						Demonstration Match
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						2.30 p.m. ->
						 3.30 p.m.
					</td>
					<td width="40">
						&nbsp;
					</td>
					<td class="tdfont" align="center">
						Advanced Ages 12+
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						3.45 p.m. ->
						 4.45 p.m.
					</td>
					<td width="40">
						&nbsp;
					</td>
					<td class="tdfont" align="center">
						Adult Beginners
					</td>
				</tr>
				<tr>
					<td class="tdfont" align="center" width="200">
						4.45 p.m. ->
						 6.00 p.m.
					</td>
					<td width="40">
						&nbsp;
					</td>
					<td class="tdfont" align="center">
						Adult Advanced
					</td>
				</tr>
			</table>
		</td>
		<!-- Column 3 reserved for internal and external advertising -->
		<!--#include file="adverts.asp" -->
	</tr>
</table>
<br>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
