<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Junior Coaching Discounts");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
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
<style type="text/css">
td {
	border: 0;
	padding: 10px 10px 10px 0;
	border-bottom: 1px solid black;
}
</style>
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
		<h1>Junior Coaching:&nbsp;<b>Available Discounts for Autumn 2011</b></h1>
			<p style="margin: 20px;">
				In order to encourage prompt payment for our junior coaching course, which makes administration 
				much easier, we are continuing with <strong>discounts</strong> as shown below for those who pay their 
				termly fee <strong>on or before the first lesson of the autumn term.</strong>
			</p>
			<p style="margin: 20px;">
				Chasing payment is time consuming and tedious. There will be a <strong>surcharge</strong> for late <strong>payments 
				not received by the 3<sup>rd</sup> lesson of term</strong>.
			</p>
			<table width="80%" align="center">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th style="text-align: center;">Prompt Payment<br />(If you pay <strong> on or before</strong> the first lesson)</th>
						<th style="text-align: center;">Late Payment<br />(If you pay after third lesson)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: right; margin-right: 10px;">1 hour lessons</td>
						<td style="text-align: center;">&pound;70</td>
						<td style="text-align: center;">&pound;77</td>
					</tr>
					<tr>
						<td style="text-align: right; margin-right: 10px;">45 minute lessons</td>
						<td style="text-align: center;">&pound;56</td>
						<td style="text-align: center;">&pound;61</td>
					</tr>
					<tr>
						<td style="text-align: right; margin-right: 10px;">30 minutes</td>
						<td style="text-align: center;">&pound;42</td>
						<td style="text-align: center;">&pound;47</td>
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
			<p style="margin: 20px;">
				To assist our planning, if you will not be returning to the courses as advertised in the <a href="juniors/coaching_schedule.html">
				current coaching schedule</a>, we would be grateful if you could let Ian know on: <strong>07968 451956</strong>
			</p>

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

