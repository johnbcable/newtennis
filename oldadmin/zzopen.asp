<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
var strtime, strdate, greeting, d,usermotd;
var clubname = "Hampton-In-Arden Tennis Club";
var pagetitle = "Home Page";
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = timegreeting();
// Define alternate startup pages
setVisit();      // set permanent cookie on PC to indicate has visited before
// End of page start up coding
%>
<!--#include file="pagehead.asp" -->
<table  width=650 border="0" cellspacing="0" cellpadding="0" cols="110,*">
    <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    
    <comment>Content for each page placed into middle column</comment>
    <td class="tdfont" valign="TOP" align="LEFT" width=535>
	 <!--#include file="tickertape.asp" -->
<%
if (!hasVisited())
{
// default front page look for first-time visitors
%>
<!--#include file="firstone.asp" -->
<%
}
else
{
// change the name of the following file to change front page look
// front0.asp =
// front1.asp =
// front2.asp = Quiz Night 26 April 2002
// front3.asp = Play Tennis May 4 2002
// front4.asp = Free 3-week coaching
// front5.asp = American Tournament 18 May
// front6.asp = Richard Perkins + coaching
// front7.asp = Jubilee Celebrations
// front8.asp = 2002 Tournament Reminders
// front9.asp = Mini Tennis Tournament
// front10.asp = July 6 Open Day
// front11.asp = July 13 Finals Day
// front12.asp = July 21 American Tournament
// front13.asp = Summer Holiday Tennis
// front14.asp = Autumn Highlights
// front15.asp = Squash section trial sessions
// front16.asp = Great North Run + Mini-Tennis Match Schedule
// 191002.htm = 706 Combo Fund Raiser
// front17.asp = Thanks to 706 Combo (+ profits)
// front18.asp = Winter Tennis Coaching
// front19.asp = November 2000 AGM
// front20.asp = Annual Dinner
// front21.asp = Mini-Tennis: Red Team Triumph
// front22.htm = Christmas 2002
// front23.htm = February/March 2003
// front24.htm = Web Site Happy Birthday - 1 year old
// front25.asp = 2003 Play Tennis Day
%>
<!--#include file="front25.asp" -->
<%
}
%>
    </td>
    </tr>
</table>
<table border="0" cellspacing="2" cellpadding="2" width="658">
	<tr>
	<td width=650>
<br><br>
Thank you for showing an interest in our club. Please visit again in the near future to see how our web site is developing.
<br>
<br>
If you would like to sponsor our site, and have your organisation credited, we will be pleased to discuss this with you. Please contact us at <a href="mailto:support@hamptonsports.org.uk">support@hamptonsports.org.uk</a> using the word "Sponsor" in the subject line.
</td>
</tr>
</table>
</body>
</html>
<%
%>

































