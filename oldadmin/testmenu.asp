<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("League Fixtures");
%>
<!doctype html public "-//w3c//dtd html 3.2//en">
<html>
	<head>
		<title>
			Hampton-In-Arden Sports Club - Home Page
		</title>
		<meta name="GENERATOR" content="Arachnophilia 4.0">
		<meta name="FORMATTER" content="Arachnophilia 4.0">
		<link rel=STYLESHEET type="text/css" href="tennis.css">
	</head>
	<body bgcolor="#ffffff" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000">
		<div align="center">
			<table width="100%" border="0" bgcolor="#aed2ac" cellspacing="0" cellpadding="0" cols="142,*,142">
				<tr>
					<!--#include file="leftpic.asp" -->
					<td class="tdfont" align="CENTER" valign="CENTER">
						<h2>
							Hampton-In-Arden Sports Club
							<BR>
							(Tennis Section)
							<BR>
							Home Page
						</h2>
						<h3>
							17:16:48 - Sunday 15/9/2002
						</h3>
					</td>
					<!--#include file="rightpic.asp" -->
				</tr>
			</table>
		</div>
		
		<table width="100%" border="1" cellspacing="2" cellpadding="0">
			<tr align="center" valign="center">
				<td width="20" nowrap>
					&nbsp;
				</td>
				<td nowrap>
					<a id="home" href="index.asp">
						Home
					</a>
				</td>
				<td nowrap>
					<a id="aboutus" href="aboutus.asp">
						About Us
					</a>
				</td>
				<td nowrap>
					<a id="news" href="news.asp">
						News
					</a>
				</td>
				<td nowrap>
					<a id="fixtures" href="fixtures.asp">
						Fixtures
					</a>
				</td>
				<td nowrap>
					<a id="juniors" href="juniors/index.html">
						Juniors
					</a>
				</td>
				<td nowrap>
					<a id="links" href="links.asp">
						Links
					</a>
				</td>
<%
if (!signedin())
{
%>
				<td nowrap>
					<a id="links" href="login.asp">
						Members
					</a>
				</td>
<%
}
else
{
%>
<!-- 				<td bgcolor="#aed2ac" nowrap>
 -->				
				<td nowrap>
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table  width=650 border=0 cellspacing=0 cellpadding=0 cols="100,*,120">
			  
			<tr>
				    
				<comment>
					Column 1 reserved for navigation menu
				</comment>
				            
				<td class="tdfont" width="130" nowrap valign="TOP" align="LEFT">
					            
					<a href="index.asp" onMouseOver="document.home.src='images/home2.jpg'" onMouseOut="document.home.src='images/home.jpg'">
						<img name="home" src="images/home.jpg" width="126" height="35" alt="Our Home Page" border="0">
					</a>
					<br>
					            
					<hr width="130" align=left>
					            
					<a href="aboutus.asp" onMouseOver="document.aboutus.src='images/aboutus2.jpg'" onMouseOut="document.aboutus.src='images/aboutus.jpg'">
						<img name="aboutus" src="images/aboutus.jpg" width="126" height="35" alt="More general information about the club incl. facilities, where we are etc" border="0">
					</a>
					<br>
					            
					<a href="news.asp" onMouseOver="document.news.src='images/news2.jpg'" onMouseOut="document.news.src='images/news.jpg'">
						<img name="news" src="images/news.jpg" width="126" height="35" alt="All the very latest club news" border="0">
					</a>
					<br>
					            
					<a href="fixtures.asp" onMouseOver="document.fixtures.src='images/fixtures2.jpg'" onMouseOut="document.fixtures.src='images/fixtures.jpg'">
						<img name="fixtures" src="images/fixtures.jpg" width="126" height="35" alt="League and friendly fixtures, tournament days etc" border="0">
					</a>
					<br>
<!--
            <a href="juniors/joinus.html" onMouseOver="document.joinus.src='images/joinus2.jpg'" onMouseOut="document.joinus.src='images/joinus.jpg'"><img name="joinus" src="images/joinus.jpg" width="126" height="35" alt="How to join the club, membership fees etc" border="0"></a><br>
            <a href="juniors/coaching.html" onMouseOver="document.coaching.src='images/coaching2.jpg'" onMouseOut="document.coaching.src='images/coaching.jpg'"><img name="coaching" src="images/coaching.jpg" width="126" height="35" alt="Coaching activities at the club" border="0"></a><br>
            <a href="clubshop.asp" onMouseOver="document.clubshop.src='images/clubshop2.jpg'" onMouseOut="document.clubshop.src='images/clubshop.jpg'"><img name="clubshop" src="images/clubshop.jpg" width="126" height="35" alt="Our club shop" border="0"></a><br>
            <a href="social.asp" onMouseOver="document.social.src='images/social2.jpg'" onMouseOut="document.social.src='images/social.jpg'"><img name="social" src="images/social.jpg" width="126" height="35" alt="The social scene at the club" border="0"></a><br>
-->
					            
					<a href="juniors/index.html" onMouseOver="document.juniors.src='images/juniors2.jpg'" onMouseOut="document.juniors.src='images/juniors.jpg'">
						<img name="juniors" src="images/juniors.jpg" width="126" height="35" alt="Section dedicated to younger members" border="0">
					</a>
					<br>
					            
					<a href="links.asp" onMouseOver="document.links.src='images/links2.jpg'" onMouseOut="document.links.src='images/links.jpg'">
						<img name="links" src="images/links.jpg" width="126" height="35" alt="Links to other useful tennis web sites" border="0">
					</a>
					<br>
					            
					<hr width="130" align=left>
					
					            
					<a href="login.asp" onMouseOver="document.members.src='images/members2.jpg'" onMouseOut="document.members.src='images/members.jpg'">
						<img name="members" src="images/members.jpg" width="126" height="35" alt="Members area - sign-in required" border="0">
					</a>
					<br>
					
					    
					<td>
						    
						<comment>
							Content for each page placed into middle column
						</comment>
						
						
						
						    
					</td>
					    
					<comment>
						Column 3 reserved for internal and external advertising
					</comment>
					            
					<td class="tdfont" width="120" nowrap valign="TOP" align="CENTER">
						            
						<br>
						            
						<comment>
							Any advertising is inserted below
							            
							<a href="http://www.sportcom.co.uk">
								<img src="images/sportcom.gif" width="102" height="72" alt="SportCom web site">
							</a>
							&nbsp;
							<br>
							<br>
							            
							<a href="http://www.geocities.com/coventrytennis">
								<img src="images/covleague.gif" width="102" height="77" alt="League tables for Hampton's league teams">
							</a>
							&nbsp;
							<br>
							<br>
						</comment>
						        
					</td>
					
					
					  
				</tr>
			</table>
			<br>
			<DIV align=center valign=top>
				<FONT size=2>
					<a href="javascript:window.print();">
						<img src="images/printer.gif" width="20" height="14" alt="Print this page" border="0">
						Print
					</a>
					<br>
					<br>
					
					<A href="index.asp">
						[Home]
					</A>
					&nbsp;
					<A href="aboutus.asp">
						[About Us]
					</A>
					&nbsp;
					<A href="news.asp">
						[News]
					</A>
					&nbsp;
					<A href="fixtures.asp">
						[Fixtures]
					</A>
					&nbsp;
					<A href="juniors/index.html">
						[Juniors]
					</A>
					&nbsp;
					<A href="links.asp">
						[Links]
					</A>
					&nbsp;
					
				</FONT>
			</DIV>
			
		</body>
	</html>
<%
%>
