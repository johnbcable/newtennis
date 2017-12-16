<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<%
var strtime, strdate, greeting, d,usermotd;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "Home Page";
var d, theday;
var pages=new Array(7);
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
greeting = timegreeting();
// Define alternate startup pages
setVisit();      // set permanent cookie on PC to indicate has visited before
// End of page start up coding
%>
<!--#include file="pagehead2.asp" -->
<table  width="100%" border="0" cellspacing="2" cellpadding="5" cols="100,*">
    <tr>
    <comment>Column 1 reserved for navigation menu</comment>
    <!--#include file="navbar2.asp" -->
    <comment>Content for each page placed into middle column</comment>
    <td class="tdfont" valign="TOP" align="LEFT">
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
%>
<!--#include file="front23.htm" -->
<%
}
%>
    </td>
    </tr>
</table>
<div align="CENTER">
<br><br>
Thank you for showing an interest in our club. Please visit again in the near future to see how our web site is developing.
<br>
<br>
If you would like to sponsor our site, and have your organisation credited, we will be pleased to discuss this with you. Please contact us at <a href="mailto:support@hamptontennis.org.uk">support@hamptontennis.org.uk</a> using the word "Sponsor" in the subject line.
</div>
<br>
</body>
</html>
<%
%>























