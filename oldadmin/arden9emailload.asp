<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Loading Arden 9 Email Addresses in");
var debugging = false;
var curpos, kount;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj;
var SQL1, SQL2, SQL3, SQL4;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
var endpos, endpoint;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club Home Page</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
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
		<div id="mainContent">
			<h1>ASrden 9 Email Addresses Update</h1>
			<div id="addressestobeloaded">
				<p>
<%
// Insert photo entries onto photos table
SQL1 = new String("update arden9runners set email = 'alison.taylor@live.co.uk' where raceyear = 2012 and raceno = 387").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'janeking0612@yahoo.co.uk' where raceyear = 2012 and raceno = 388").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'trampolinedevelopmentteam@hotmail.co.uk' where raceyear = 2012 and raceno = 389").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'thelindsays1@hotmail.com' where raceyear = 2012 and raceno =390").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'm.kirkham@talk21.com' where raceyear = 2012 and raceno = 391").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'susieclarke@hotmail.co.uk' where raceyear = 2012 and raceno = 392").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'paulcaruana@tiscali.co.uk' where raceyear = 2012 and raceno = 227").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'stud@hotmail.co.uk' where raceyear = 2012 and raceno = 228").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'ajmo2@hotmail.co.uk' where raceyear = 2012 and raceno = 229").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'g.b.fitzgerald@gmail.com' where raceyear = 2012 and raceno = 230").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'tony.jeff@02.co.uk' where raceyear = 2012 and raceno = 232").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'wbroadbent080906@btinternet.com' where raceyear = 2012 and raceno = 233").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'mmwhh@yahoo.co.uk' where raceyear = 2012 and raceno = 234").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'acarroll62@talktalk.net' where raceyear = 2012 and raceno = 235").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'lindablaise@googlemail.com' where raceyear = 2012 and raceno = 236").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'bill_andrews@btopenworld.com' where raceyear = 2012 and raceno = 237").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'frankwalsh@fsmail.nut' where raceyear = 2012 and raceno = 238").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'nadams@dsc.net' where raceyear = 2012 and raceno = 239").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'odwyerbuilder@hotmail.co.uk' where raceyear = 2012 and raceno = 240").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'chris@mums.me.uk' where raceyear = 2012 and raceno = 241").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'seth.atkin@gmail.com' where raceyear = 2012 and raceno = 242").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'faye.lid@hotmail.co.uk' where raceyear = 2012 and raceno = 243").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'richardminton@me.com' where raceyear = 2012 and raceno = 244").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'na.ford@btinternet.com' where raceyear = 2012 and raceno = 246").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'bobby-fran@yahoo.com' where raceyear = 2012 and raceno = 249").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'terry.olds@googlemail.com' where raceyear = 2012 and raceno = 250").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'chris@afwaiteltd.co.uk' where raceyear = 2012 and raceno = 251").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'jeff.mathieson@btinternet.com' where raceyear = 2012 and raceno = 252").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'g.morgan12@ntlworld.com' where raceyear = 2012 and raceno = 253").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'a.smith800@yahoo.co.uk' where raceyear = 2012 and raceno = 254").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'clivegr@sky.com' where raceyear = 2012 and raceno = 255").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'richardsimkiss@gmail.com' where raceyear = 2012 and raceno = 256").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'matthewmander@btinternet.com' where raceyear = 2012 and raceno = 257").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'm.barron@castlevale.bham.sch.uk' where raceyear = 2012 and raceno = 258").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'gdandje@yahoo.co.uk' where raceyear = 2012 and raceno = 259").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'jim.duncan@hroc.co.uk' where raceyear = 2012 and raceno = 260").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'paul@lloyd02.wanadoo.co.uk' where raceyear = 2012 and raceno = 261").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'skywalker1512@yahoo.co.uk' where raceyear = 2012 and raceno = 262").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'nickbaker32@googlemail.com' where raceyear = 2012 and raceno = 263").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'paul.baker@uk.pwc.com' where raceyear = 2012 and raceno = 264").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'neiljones83@hotmail.com' where raceyear = 2012 and raceno = 265").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("update arden9runners set email = 'midpost@f25.com' where raceyear = 2012 and raceno = 266").toString();
RstObj = ConnObj.Execute(SQL1);

%>
				</p>
			</div>
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



