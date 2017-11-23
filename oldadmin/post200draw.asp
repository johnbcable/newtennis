<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="newsfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Posting 200 Club Draw Results");
// Now for any variables local to this page
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Now for any variables local to this page
var debugging = false;
var updating = true;
var ConnObj;
var RS,RS2,RS3;
var SQL1, SQL2, SQL3, SQL4, SQL4A, SQL4B;
var SQL5, SQL5A, SQL6, SQL7, SQL8, SQL9;
var SQL10, SQL11;
var dbconnect=Application("hamptonsportsdb");
var owner1, owner2, owner3, owner4, owner5, owner6;
var prize1, prize2, prize3, prize4, prize5, prize6;
var winner1, winner2, winner3, winner4, winner5, winner6;
var drawyear, drawmonth, monthnumber, drawtype;
var updatetext;
//
// Check if an administrator
//
if (! is200ClubEditor() )	
	Response.Redirect("200club.asp");
//
drawyear = new String(Request.Form("drawyear")).toString();
drawmonth = new String(Request.Form("drawmonth")).toString();
drawtype = new String(Request.Form("drawtype")).toString();
prize1=new String(Request.Form("firstprize")).toString();
prize2=new String(Request.Form("secondprize")).toString();
prize3=new String(Request.Form("thirdprize")).toString();
prize4=new String(Request.Form("fourthprize")).toString();
prize5=new String(Request.Form("fifthprize")).toString();
prize6=new String(Request.Form("sixthprize")).toString();
// now winners
winner1=new String(Request.Form("firstwinner")).toString();
winner2=new String(Request.Form("secondwinner")).toString();
winner3=new String(Request.Form("thirdwinner")).toString();
winner4=new String(Request.Form("fourthwinner")).toString();
winner5=new String(Request.Form("fifthwinner")).toString();
winner6=new String(Request.Form("sixthwinner")).toString();
// Set up DB connection and do enquiries for owners (if not filled in)
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
// now owners
owner1 = Trim(new String(Request.Form("firstowner")).toString());
if (owner1=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("firstwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner1 = new String(RS("ownersname")).toString();
	RS.Close();
}	
owner2 = Trim(new String(Request.Form("secondowner")).toString());
if (owner2=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("secondwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner2 = new String(RS("ownersname")).toString();
	RS.Close();
}	
owner3 = Trim(new String(Request.Form("thirdowner")).toString());
if (owner3=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("thirdwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner3 = new String(RS("ownersname")).toString();
	RS.Close();
}	
owner4 = Trim(new String(Request.Form("fourthowner")).toString());
if (owner4=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("fourthwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner4 = new String(RS("ownersname")).toString();
	RS.Close();
}	
owner5 = Trim(new String(Request.Form("fifthowner")).toString());
if (owner5=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("fifthwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner5 = new String(RS("ownersname")).toString();
	RS.Close();
}	
owner6 = Trim(new String(Request.Form("sixthowner")).toString());
if (owner6=="")
{
	SQL = new String("select ownersname from 200club where drawnumber = " + Request.Form("sixthwinner")).toString();
	RS = ConnObj.Execute(SQL);
	if (! RS.EOF)
		owner6 = new String(RS("ownersname")).toString();
	RS.Close();
}	
SQL1 = new String("update 200club set ownersname='" + owner1+"' where drawnumber = " + winner1).toString();
SQL2 = new String("update 200club set ownersname='" + owner2+"' where drawnumber = " + Request.Form("secondwinner")).toString();
SQL3 = new String("update 200club set ownersname='" + owner3+"' where drawnumber = " + Request.Form("thirdwinner")).toString();
SQL4 = new String("update 200club set ownersname='" + owner4+"' where drawnumber = " + Request.Form("fourthwinner")).toString();
SQL4A = new String("update 200club set ownersname='" + owner5+"' where drawnumber = " + Request.Form("fifthwinner")).toString();
SQL4B = new String("update 200club set ownersname='" + owner6+"' where drawnumber = " + Request.Form("sixthwinner")).toString();
SQL5 = new String("delete from 200clubwinners where drawmonth = '"+drawmonth+"' and drawyear = "+drawyear+" and drawtype = '"+drawtype+"'").toString();
monthnumber = new String(getMonthNumber(drawmonth)).toString();
// Now delete previous results if they are there
if (updating)
{
	RS = ConnObj.Execute("select 'Y' from 200clubwinners where drawmonth = '"+drawmonth+"' and drawyear = "+drawyear+" and drawtype = '"+drawtype+"'");
	if (! RS.EOF)
		RS = ConnObj.Execute(SQL5);
}
// ConnObj.Close();
// Now do inserts of new/updated draw results
//
SQL6 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner1+","+drawyear+",'"+drawmonth+"','"+drawtype+"',1,"+Request.Form("firstprize")+",'"+owner1+"',"+monthnumber+")").toString();
SQL7 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner2+","+drawyear+",'"+drawmonth+"','"+drawtype+"',2,"+Request.Form("secondprize")+",'"+owner2+"',"+monthnumber+")").toString();
SQL8 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner3+","+drawyear+",'"+drawmonth+"','"+drawtype+"',3,"+Request.Form("thirdprize")+",'"+owner3+"',"+monthnumber+")").toString();
SQL9 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner4+","+drawyear+",'"+drawmonth+"','"+drawtype+"',4,"+Request.Form("fourthprize")+",'"+owner4+"',"+monthnumber+")").toString();
SQL10 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner5+","+drawyear+",'"+drawmonth+"','"+drawtype+"',5,"+Request.Form("fifthprize")+",'"+owner5+"',"+monthnumber+")").toString();
SQL11 = new String("insert into 200clubwinners(drawnumber,drawyear,drawmonth,drawtype,drawpos,prize,winnersname,monthnumber) values("+winner6+","+drawyear+",'"+drawmonth+"','"+drawtype+"',6,"+Request.Form("sixthprize")+",'"+owner6+"',"+monthnumber+")").toString();
if (debugging)
{
	Response.Write("<b>SQL1</b> - "+SQL1);
	Response.Write("<br>");
	Response.Write("<b>SQL2</b> - "+SQL2);
	Response.Write("<br>");
	Response.Write("<b>SQL3</b> - "+SQL3);
	Response.Write("<br>");
	Response.Write("<b>SQL4</b> - "+SQL4);
	Response.Write("<br>");
	Response.Write("<b>SQL4A</b> - "+SQL4A);
	Response.Write("<br>");
	Response.Write("<b>SQL4B</b> - "+SQL4B);
	Response.Write("<br>");
	Response.Write("<b>SQL5</b> - "+SQL5);
	Response.Write("<br>");
	Response.Write("<b>SQL6</b> - "+SQL6);
	Response.Write("<br>");
	Response.Write("<b>SQL7</b> - "+SQL7);
	Response.Write("<br>");
	Response.Write("<b>SQL8</b> - "+SQL8);
	Response.Write("<br>");
	Response.Write("<b>SQL9</b> - "+SQL9);
	Response.Write("<br>");
	Response.Write("<b>SQL10</b> - "+SQL10);
	Response.Write("<br>");
	Response.Write("<b>SQL11</b> - "+SQL11);
	Response.Write("<br>");
	Response.Write("<table width=70% align=center><tr><td><b>The above results would be recorded on the 200 Club database.</b></td></tr></table>");
}
updatetext = new String("The above data is what would have been applied to the database if we were updating - the above changes have not actually happened yet.").toString();
if (updating)
{
	updatetext = new String("The above data HAS been successfully applied to the database.").toString();
	ConnObj.Execute(SQL1);
	ConnObj.Execute(SQL2);
	ConnObj.Execute(SQL3);
	ConnObj.Execute(SQL4);
	ConnObj.Execute(SQL4A);
	ConnObj.Execute(SQL4B);
	ConnObj.Execute(SQL5);
	ConnObj.Execute(SQL6);
	ConnObj.Execute(SQL7);
	ConnObj.Execute(SQL8);
	ConnObj.Execute(SQL9);
	ConnObj.Execute(SQL10);
	ConnObj.Execute(SQL11);
}
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
	<a href="oldwayin.asp" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
		<h1>Our Club:<b>&nbsp;200 Club Draw Results</b></h1>
		<table>
			<caption>Updating 200 Club draw results for the <%= drawtype %> draw for <%= drawmonth %>&nbsp;<%= drawyear %>:</caption>
			<thead>
				<th width="30%">&nbsp;</th>
				<th width="20%">Prize Value (&pound;)</th>
				<th width="20%">Winning Number</th>
				<th width="30%">Winning Owner</th>
			</thead>
			<tbody>
				<tr>
					<td class="centered">1st Prize</td>
					<td class="centered"><%= prize1 %></td>
					<td class="centered"><%= winner1 %></td>
					<td class="centered"><%= owner1 %></td>
				</tr>
				<tr>
					<td class="centered">2nd Prize</td>
					<td class="centered"><%= prize2 %></td>
					<td class="centered"><%= winner2 %></td>
					<td class="centered"><%= owner2 %></td>
				</tr>
				<tr>
					<td class="centered">3rd Prize</td>
					<td class="centered"><%= prize3 %></td>
					<td class="centered"><%= winner3 %></td>
					<td class="centered"><%= owner3 %></td>
				</tr>
				<tr>
					<td class="centered">4th Prize</td>
					<td class="centered"><%= prize4 %></td>
					<td class="centered"><%= winner4 %></td>
					<td class="centered"><%= owner4 %></td>
				</tr>
				<tr>
					<td class="centered">5th Prize</td>
					<td class="centered"><%= prize5 %></td>
					<td class="centered"><%= winner5 %></td>
					<td class="centered"><%= owner5 %></td>
				</tr>				
				<tr>
					<td class="centered">6th Prize</td>
					<td class="centered"><%= prize6 %></td>
					<td class="centered"><%= winner6 %></td>
					<td class="centered"><%= owner6 %></td>
				</tr>				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
		<div class="borderboth">
			<p class="centered"><%= updatetext %></p>
		</div>
		<div id="whatnext" class="borderbottom">
			<p>
				What would you like to do now?
			</p>
			<p>
			<ul>
				<li class="leftindent"><a href="get200draw.asp?drawyear=<%= drawyear %>&drawmonth=<%= drawmonth %>&drawtype=<%= drawtype %>">Amend draw results for the <%= drawtype %> draw for <%= drawmonth %>&nbsp;<%= drawyear %></a></li>
				<li class="leftindent"><a href="which200draw.asp">Record another draw result</a></li>
			</ul>
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

