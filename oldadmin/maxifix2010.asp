<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Maxi-Tennis Fixtures");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var kount, dummy1;
var teams = new Array(10);
var team_ids = new Array(10);
var teamlinks = new Array(10);
var curteam, thisteam, newteam;
var venuetext;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
thisyear = "";
d = new Date();
thisyear += d.getYear();
d = null;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if runniung in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="index.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
	<h1>Hampton-In-Arden Sports Club</h1>
	<h2>Tennis Section</h2>

<!--   2.  Navigation   -->
	<div id="nav_main">
		<ul id="topmenu">
			<li id="nav_ourclub"><a href="aboutus.asp">Our Club</a></li>
			<li id="nav_coaching"><a href="juniors/coaching.html">Coaching</a></li>
			<li id="nav_playing"><a href="playing.asp">Playing</a></li>
			<li id="nav_links"><a href="juniors/index.html">Juniors</a></li>
			<li id="nav_contact"><a href="juniors/contact.html">Contact</a></li>
			<li id="nav_members"><a href="members.asp">Members</a></li>
		</ul>
		<p id="today">
			<%= displaydate %>&nbsp;<%= strtime %>
		</p>
	</div>
	
</div>

<div id="wrapper">

<!--   3. Content    -->
	<div id="content">
		<h1>Maxi-Tennis <b>Fixtures<b></h1>
<div align="center">
	<table align=left width=650 border="0" cellspacing="0" cellpadding="0" cols="100,*,120">
		<tr>
			<td width=50>
				<font face="Verdana" size="2">&nbsp; </font>
			</td>
			<td>
				<font face="Verdana" size="2">
				<br>
				</font>
				<table align=left width=567 border="1" cellspacing="2" cellpadding="5">
					<tr>
						<td class="tdfont" >
							<font face="Verdana" size="2">The spring of 2010 
                            sees the return to Hampton-In-Arden Tennis Club of an 
                            internal MAXI-Tennis league after a break in 2009 
							while our new courts were being built. The main aim of
							the competition is to encourage all 
                            standards of player to participate in friendly 
                            competitive tennis within a team environment. Six 
                            MAXI-Tennis 'teams' have been set up, each one 
                            matching one of the 6-Nations rugby teams. They are:<br>&nbsp;
							</font>
							<table border="1" cellpadding="0" cellspacing="0" bordercolor="#111111" width="100%">
                              <tr>
                                <td width="28%" bgcolor="#C0C0C0">
                                <blockquote>
                                  <p><b><font face="Verdana" size="2">Team</font></b></p>
                                </blockquote>
                                </td>
                                <td width="44%" bgcolor="#C0C0C0">
                                <blockquote>
                                  <p><b><font face="Verdana" size="2">Captains</font></b></p>
                                </blockquote>
                                </td>
                                <td width="28%" bgcolor="#C0C0C0">
                                <blockquote>
                                  <p><b><font face="Verdana" size="2">Fixture<br>List</font></b></p>
                                </blockquote>
                                </td>
                              </tr>
<%
SQLStmt = new String("SELECT * from tennisteams where teamcategory like 'MAXITENNIS' order by teamid");
RstObj = ConnObj.Execute(SQLStmt);
while (! RstObj.EOF)
{
	thefixtureline = new String(RstObj("fixtureline")).toString();
	thecaptain = new String(RstObj("teamcaptain")).toString();
	theteam = new String(RstObj("teamname")).toString();
	theteam = theteam.substr(13);
%>

                              <tr>
                                <td width="28%">
                                <blockquote>
                                  <p><b><font face="Verdana" size="2"><%= theteam %></font></b></p>
                                </blockquote>
                                </td>
                                <td width="72%">
                                <blockquote>
                                  <p><font face="Verdana" size="2"><%= thecaptain %></font></p>
                                </blockquote>
                                </td>
								<td class="tdfont" align="center">
									<font face="Verdana" size="2">
									<a href="<%= thefixtureline	%>								">
										[View]
									</a>
									</font>
								</td>
                              </tr>
<%
	RstObj.MoveNext();
}
RstObj=null;
%>
                            </table>
                            <p><font face="Verdana" size="2">&nbsp;If you are a 
                            full adult member of the club, you will have been 
                            'allocated' to one of these teams and your captain(s) 
                            will be in touch with you about what matches they 
                            would like you to play. The 2010 fixture list is 
                            given <a href="maxirules.asp">here</a> in the 
                            current rule set for Maxi Tennis.<br>
						    </font>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width=50>
				<font face="Verdana" size="2">&nbsp; </font>
			</td>
			<td>
				<table align=left border=1 cellspacing=3 cols=2 width=567>
					<tr>
						<td class=tdfont align=center colspan=2>
							<font face="Verdana" size="2">
							<br>
							The web site will also keep an up-to-date league 
                            table of results for the current season so you can see how you are all 
                            doing and you will be able to see this
                            <a href="maxiresults2008.asp">here </a>.
							<br>
						    <br>
                            Good luck to everyone in this tournament in 2010!
						    </font>
						    </td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td width=50>
				<font face="Verdana" size="2">&nbsp; </font>
			</td>
			<td>
				<!--#include file="textnav.asp" -->
			</td>
		</tr>
	</table>
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="home_nav.asp" -->
		<!--#include file="memb_nav.asp" -->
	</div>

<!--    5.   Supplementary content     -->	
	<div id="rightcolumn">
		<!--#include file="searchpanel.asp" -->
		<!--#include file="addresspanel.asp" -->
		<!--#include file="newspanel.asp" -->
		<!--#include file="emailpanel.asp" -->
	</div>
</div>

<!--     6.    Site info     -->
<!--#include file="footer.asp" -->

</body>
</html>
<%
%>
