<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Hampton-In-Arden Sports Club - News List Administration");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var curcategory, prevcategory;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var RS, RS2, RS3;
var debugging = false;
var d, dummy, i, kount, thisyear;
var thewebpage;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("members.asp");
//
thisyear = new String("").toString();;
d = new Date();
thisyear += d.getYear();
// End of defaults - now construct SQL	
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from news order by category, newsid desc");
RS = ConnObj.Execute(SQL1);
prevcategory = new String("kshgkefshgblkesfj").toString();
curcategory = new String("dbkjfdbkjrn").toString();
displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
			<h1>Site Admin:&nbsp;<b>Maintaining news list</b></h1>
			<table>
				<caption>List of Hampton's news items</caption>
				<thead>
					<tr>
						<th>Title and Summary</th>
						<th class="centered" style="width: 10%">ACTION</th>
					</tr>
				</thead>
				<tbody>
<%
	thewebpage = new String("").toString();
	while (! RS.EOF)
	{
		curcategory = new String(RS("category")).toString();
		thewebpage = new String(RS("webpage")).toString();
		// Now, put out heading line as appropriate
		if (curcategory != prevcategory)
		{
%>
					<tr>
						<td colspan="2" style="background-color:#c0c0c0;">Category:&nbsp;<%= curcategory %>&nbsp;</td>
					</tr>
<%
			prevcategory = new String(curcategory).toString();
		}							
		theid=new String(RS("newsid"));
		visible = new String(RS("visible")).toString();
		if (visible == "Y")
		{
			hiddentext = new String("VISIBLE").toString();
			visibilitytext = new String("HIDE").toString();
			visibleaction = new String("set_visible.asp?id="+theid+"&visibility=N").toString();
		}
		else
		{
			hiddentext = new String("HIDDEN").toString();
			visibilitytext = new String("SHOW").toString();
			visibleaction = new String("set_visible.asp?id="+theid+"&visibility=Y").toString();
		}
%>
					<tr>
						<td>
							<p>
								<span style="float: left;"><a href="edit_news.asp?id=<%= theid %>"><strong><%= RS("title") %></strong></a></span>
<!--
								<span style="text-align: right; color:red; float: right; padding-right: 10px;"><%= hiddentext %></span>
-->
							</p>
							<p style="width:80%; padding:20px; wrap:on;">
								<%= RS("blurb") %>
							</p>
						</td>
						<td style="text-align: center; width: 10%">
							<a href="del_news.asp?id=<%= theid %>">DELETE</a><br />
							<a href="<%= visibleaction %>"><span style="color:red;"><%= visibilitytext %></span></a><br />
							<a href="<%= thewebpage %>">VIEW</a><br />
						</td>
					</tr>
<%
	RS.MoveNext();
	}
%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</tfoot>
			</table>	
			<p>
				<strong>N.B.</strong>&nbsp;Click on any news article title above to make changes to this news item
			</p>
<%
if ( isAdministrator() )	
{
%>
		<div id="newsadminarea" style="clear:both;">
			<h2>News List Administration:</h2>
			<ul>
				<li style="padding-left: 20px;"><a href="new_news.asp">Add a news item</a></li>
			</ul>
			</p>
		</div>		
		
<%
}
%>		
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