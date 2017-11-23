<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
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
	<h3>Junior Tournaments</h3>
	<p>
		Hi <%= myname %>
	</p>
	
			<table align="left" width=567 border="1" cellspacing="2" cellpadding="5">
				<tr>
					<td class="tdfont" colspan=2 width="549">
						<font face="Verdana" size="2">Hampton-In-Arden Tennis Club runs 
                        several internal tournaments for all levels of junior
						members during the season. Our head coach (Alan Cutts) 
                        is trying to encourage more children to take part in 
                        competitions during each term<br>
						<br>
						In 2007, the following junior tournaments are (provisionally) scheduled:
                        </font>
						<br>
						<br>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width=226>
						<font face="Verdana" size="2" color="#0000FF"><b>April 
                        22nd</b><br>
                        (5.30 and 6.30 pm)</font></td>
					<td class="tdfont" width="309">
						<b><font face="Verdana" size="2">Slam</font></b><p>
                        <font face="Verdana" size="2">This will be the first 
                        Junior Club night of the new tennis season. 5.30 to 6.30 
                        pm for Under 12&#39;s and 6.30 pm onwards for over 12&#39;s.</font></td>
				</tr>
				<tr>
					<td class="tdfont" width=226>
						<font face="Verdana" size="2">
						<FONT COLOR=#0000ff><B>Saturday May 12th</B></FONT> <br>
                        <font color="#0000FF">(from 2.00 pm)</font></font></td>
					<td class="tdfont" width="309">
						<font face="Verdana" size="2">
						<B>Road to Wimbledon - Under 14&#39;s Event</B>
						<br>
						<br>
						This is for both boys and girls. The winners of each 
                        event will be invited to a county final. From there, 
                        they could go on to a national event and get the chance 
                        to play at Wimbledon</font></td>
				</tr>
                <tr>
					<td class="tdfont" width=226>
						<font face="Verdana" size="2">
						<FONT COLOR=#0000ff><B>Saturday June 23rd<br>
                        </B>(2.00 pm)</FONT><font color="#0000FF"> </font>
                        </font>
					</td>
					<td class="tdfont" width="309">
						<font face="Verdana" size="2">
						<b><a href="<%= reslink %>">Juniors: Annual Club Tournament</a></b>
						<br>
						<br>
						A chance to be Junior Club champion in your age group. 
                        Under 12&#39;s, 14&#39;s and 16&#39;2 for boys and girls.</font></td>
				</tr>
				<tr>
					<td class="tdfont" colspan=2 width="549">
						<font face="Verdana" size="2">
						<BR>
						<b><font color="#FF0000">Don&#39;t forget</font></b>:&nbsp;
                        <b><a href="pt2007.asp">Saturday May 5th - Play Tennis 
                        Day</a></b>. Bring all your friends along to the club to 
                        try out tennis - for free! Don&#39;t forget your chance to 
                        beat the coach while he plays with a frying pan!</font><p>
                        <font face="Verdana" size="2">Alan is also preparing to 
                        run <b>Junior Leagues</b> this tennis season. A chance 
                        to play regular matches against players of your own 
                        standard. Children will be expected to arrange their own 
                        matches within their area of the leagues. These are 
                        great experience but please don&#39;t enter unless you 
                        really want to play!!</font></p>
                        <p>
						<font face="Verdana" size="2">
						All events are hosted at the tennis club. For more details,  contact Alan Cutts, our coach, the
						<a href="committees.asp#junior">
							Junior Committee.
						</a>
						or check the club noticeboard nearer the date(s)
						<br>
					    </font>
					</td>
				</tr>
			</table>	
	
	
	<p>
		Hampton-In-Arden Tennis Club runs several internal tournaments for all levels of junior
		members during the season. Our new head coach (Ian ???) is trying to encourage more children 
		to take part in competitions during each term. In 2007, the following junior tournaments 
		were scheduled:
	</p>
	<p>
		Don't forget: the autumn coaching season started at the beginning of the autumn school term.
		Although our current coach, Alan Cutts, is due to leave us for the wilds of Yorkshire
		(Ilkley Moor!) in the near future, please contact him while he is still here to confirm
		what coaching he is carrying out in the meantime. Alan will be actively helping us find a
		replacement for him (but we all know that that will be hard to do - just ask the Mens 1st Team!)
		and I am sure we will take on a brilliant replacement in the near future.
	</p>
	<div id="overlayboxquote">
		<img src="images/3balls.gif" alt="Grouped tennis balls" width="64" height="64" />
		<p>
			I would just like to take this opportunity to extend my appreciation to the many junior members 
			of our club for taking
			part in the various North Warwickshire Doubles competitions which have run during the
			summer and are now approaching their finals stages. Thanks must also go to the parents, guardians and
			helpers of these children to spend the time so that their charges can take part in this
			friendly, competitive competition. It is vital that our young talent take part in these types
			of events if the Hampton league teams are to maintain and improve their league positions in
			the years to come.
		</p>
		<p>Steve Ray</p>
	</div>
	<p>
		In case you didnt know, our league tennis teams had mixed fortunes in 2007. On the bright
		side, the Mens 1st and 2nd teams were both promoted - well done to both of them! For the
		remainder of the teams, 2007 was a difficult year culminating in the Ladies 1st team being
		relegated down a division, the Ladies and Mens 3rd teams both finishing bottom of their 
		respective divisions and the Ladies 2nd team completed the season near mid-table in 
		their division. The final league positions can be checked out via the Fixtures link on the
		left.
	</p>
</div>  <!-- content -->
<div id="leftcolumn">
<!--#include file="home_nav.asp" -->

</div>
<!--#include file="textnav.asp" -->
<div id="rightcolumn">
<!--#include file="addresspanel.asp" -->
<!--#include file="jnewspanel.asp" -->
</div>
</div>
</body>
</html>
<%
%>
