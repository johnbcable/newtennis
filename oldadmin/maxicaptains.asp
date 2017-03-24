<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("MAXI-Tennis Captains Area");
// Now for any variables local to this page
var greeting;
var RS, Conn, SQL1, dbconnect, uniqref;
var myteams = new Array(5);
var teamknt;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
if (!signedin())
	Response.Redirect("login.asp");
// Get user details
greeting = "Welcome to the MAXI-Tennis Captains Area "+getUserName();
uniqref = getUserCode();
uniqref = uniqref.toString();
dbconnect=Application("hamptonsportsdb");
Conn = Server.CreateObject("ADODB.Connection");
RS = Server.CreateObject("ADODB.RecordSet");
Conn.Open(dbconnect);
SQL1 = new String("SELECT teamname from maxitennisteams where uniqueref = "+uniqref).toString();
RS = Conn.Execute(SQL1);
myteams[0] = new String("").toString();
myteams[1] = new String("").toString();
myteams[2] = new String("").toString();
myteams[3] = new String("").toString();
myteams[4] = new String("").toString();
teamknt = -1;
while (! RS.EOF)
{
	teamknt++;
	myteams[teamknt] = new String(RS("teamname")).toString();
	RS.MoveNext();
}
if (teamknt < 0)
	Response.Redirect("members.asp");
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<table  width=650 border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tdfont" valign="TOP" align="LEFT" width=650>
<table  border="0" cellspacing="2" cellpadding="5" width="650">
	<tr>
		<td>
			<font size="4" color="#000000">
				<b>
					<%= greeting %>
				</b>
			</font>
			<br>
			<br>
			<table  width=650 border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="tdfont" width="410">
						<div align=center>
							<IMG SRC="images/courts0.jpg" width="400" height="151" ALT="Our outside tennis courts in use" align="center">
						</div>
					</td>
					<td class="tdfont" width="240" align="right">
						<FONT SIZE="-1">
							<B>
								Hampton-In-Arden Tennis Club
								<br>
								Shadowbrook Lane
								<br>
								Hampton-In-Arden
								<br>
								Solihull
								<br>
								West Midlands
								<br>
								B92
								<br>
								Telephone: 01675 442284
								<br>
								<hr>
								Secretary: Chris Barnes
								<br>
								01675 443572
							</B>
						</FONT>
					</td>
				</tr>
				<tr>
					<td class="tdfont" width="450">
						<b>You currently captain the following teams:</b><br><br>
<%
for (i=0; i<(teamknt+1); i++)
	Response.Write("&nbsp;&nbsp;&nbsp<b>"+myteams[i]+"</b><br>");
%>
						<br>
						<br>
						<font face="Verdana" size="2">Here's what you can do on our web site:<br><br> 
						<ol type="disc">
						<li><a href="squads.asp?captain=<%= uniqref %>">Set up and maintain your team "squad(s)"</a></li>
						<li><a href="lstteamresults.asp">Check on Hampton's record against a particular team/club</a></li>
						<li><a href="squademail.asp?captain=<%= uniqref %>">Send an email to your squad(s)</a></li>
						<li><a href="fixtureresults.asp">Post results of fixtures</a></li>
						<li><a href="profile.asp">Check/amend your contact details</a></li>
						</ol>
					</td>
					<td class="tdfont" rowspan="2">
						<!--#include file="mscroll.htm" -->
					</td>
				</tr>
				<tr>
					<td colspan="2" class="tdfont">
						<div align=left>
							<font face="Verdana" size="2">
							<a href="http://www.coventrytennisleague.co.uk/">
								<img src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams" align="left">
							</a>
						    </font>
						</div>
						<p style="margin-left: 6">
						<font face="Verdana" size="2">When the league is in full swing, keep up-to-date with our teams'
						progress by visiting the league's web site (click on the picture to the left)
						and/or by regular checks of the club noticeboard. </font>
					</td>
				</tr>
				<tr>
					<td class="tdfont" colspan="2">
						<font face="Verdana" size="2"><br>
                        <b>Dont forget</b>: if you are playing in the internal 
                        club tournament(s) to check which match(es) you need to 
                        play, arrange them in good time,&nbsp; complete them by 
                        the due date and record the result(s) on the draw sheet 
                        in the clubhouse. Finals in 2007 are to be held over the weekend of 29th/30th September 2007, and we dont need any last minute rushes for courts thank you 
                        very much!</font></td>
				</tr>
			</table>
			<br>
			<font face="Verdana" size="2">Got any good ideas for the sorts of things you would like to see in the members-only area
			of our web site? If you would like to see something on our web site that isn't there or if you would
			like to comment on its layout, then speak to one of your
			<A HREF="committees.asp">
				committee members
			</A>
			or please feel free to contact us at
			<a href="mailto:support@hamptontennis.org.uk">
				support@hamptontennis.org.uk
			</a>
			&nbsp;and we will do our best to reply and take your suggestions into account.
			We want the Hampton-In-Arden Tennis Club web site members area to be useful,
			up-to-date and a credit to our club and of real value to our members.</font>
			<br>
		</td>
	</tr>
</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!--#include file="textnav.asp" -->
</body>
</html>
<%
%>
