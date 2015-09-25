<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("200 Club - Draw Results");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var theyear, thisyear, thismonth, prevmonth, prev2;
var yearlist = new Array("2001","2002","2003","2004","2005","2006","2007","2008","2009","2010");
var dummy1, dummy2;
var kount, thetext, theparas;
var title, issueno, issueseq, author, articletext;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var RS, RS2, RS3;
var SQLStmt;
var drawknt = 0;
var camefrom = new String("Form").toString();
var annualdraw = new String("ANNUAL").toString();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
thisyear = new String(currentYear()).toString();
theyear = new String(Request.Form("theyear")).toString();
if (theyear == "" || theyear == "null" || theyear == "undefined")
{
	theyear = new String(Request.QueryString("theyear")).toString();
	if (theyear == "" || theyear == "null" || theyear == "undefined")
	{
		theyear = new String(thisyear).toString();
		camefrom = new String("currentyear").toString();
	}
	else
	{
		camefrom = new String("QueryString").toString();
	}
}
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQLStmt="select * from 200clubwinners where drawyear = "+theyear+" order by monthnumber, drawtype, drawpos";
// End of page start up coding
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
<%
if (debugging)
{
	Response.Write("<br>theyear = ["+theyear+"]<br>");
	Response.Write("<br>camefrom = ["+camefrom+"]<br>");
	Response.Write("<br>SQLStmt = ["+SQLStmt+"]<br>");
	// Response.End();
}
%>
		<h1>Our Club:<b>&nbsp;200 Club Draw Results</b></h1>
		<div id="yearselection">
			<form name="200resform" method="GET" action="200res.asp">
				<fieldset>
					<legend>Select the year for the 200 Club results</legend>
					<div style="text-align: center;">
						Year:&nbsp;&nbsp;
						<select name="theyear" id="theyear">
<%
for (i=thisyear; i > 2000; i--)
{
	dummy = new String(i).toString();
	Response.Write("<option>"+dummy);
}
%>
						</select>&nbsp;&nbsp;						
						</select>&nbsp;&nbsp;
						<input type="submit" name="yearsubmit" id="yearsubmit" value="Fetch" />
					</div>
				</fieldset>
			</form>
		</div>
		<div id="200clubresultstable" style="width:60%; text-align: center;">
		<br />
		<table width="60%" align="center" class="borderless">
			<caption>Results of <%= theyear %>'s 200-Club Draws</caption>
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th style="text-align: center;">Prize</th>
					<th style="text-align: center;">Winner</th>
					<th style="text-align: center;">Winning Number</th>
				</tr>
			</thead>
			<tbody>
<%
prevmonth=parseInt("0");
prev2=(new String("ZZZZ")).toString();
RS=ConnObj.Execute(SQLStmt);
while (! RS.EOF)
{
	thismonth=parseInt(RS("monthnumber"));
	dummy1=new String(RS("drawtype")).toString();
	dummy2=new String(RS("drawmonth")).toString();
	if (dummy1==annualdraw)
		dummy2=new String("ANNUAL DRAW").toString();
	if (debugging)
	{
		Response.Write("<tr><td colspan=4>thismonth = "+thismonth+", dummy1 = "+dummy1+", dummy2 = "+dummy2+", prev2 = "+prev2+", drawknt = "+drawknt+", prevmonth = "+prevmonth+", thismonth = "+thismonth+"</td></tr>");
	}
	else
	{
		if (dummy2 != prev2)
		{
			if (debugging)
				Response.Write("thismonth != prevmonth")
			drawknt += 1;
			if (dummy1==annualdraw)
			{
				Response.Write('<tr><td style="background-color: #c0c0c0; text-align: left; padding-left: 2em;" colspan="5"><b>'+RS("drawyear")+' ANNUAL DRAW - drawn in '+RS("drawmonth")+'</b></td></tr>\n\r');
			}
			else
			{
				Response.Write('<tr><td colspan="5"><b>'+RS("drawyear")+' '+RS("drawmonth")+' draw</b></td></tr>\n\r');
			}
		}
%>
		<tr>
			<td>
				&nbsp;
			</td>
			<td  style="text-align: center;">
				&pound;<%= RS("prize") %>
			</td>
			<td  style="text-align: center;">
				<%= RS("winnersname") %>
			</td>
			<td  style="text-align: center;">
				<%= RS("drawnumber") %>
			</td>
		</tr>
<%
	}
	prevmonth=thismonth;
	prev2=new String(dummy2).toString();
	RS.MoveNext();
}
RS=null;
%>

			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
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
