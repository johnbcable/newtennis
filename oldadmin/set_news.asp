<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
var strtime, strdate, title2;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Saving News Item Amendments");
// Now for any variables local to this page
var mNewsID;
var ConnObj;
var RS;
var SQL1, SQL2;
var dbconnect=Application("hamptonsportsdb");
var onews = new Object();
var mDateObj, dummy1;
var updating = true;
var success = true;
var resultObj = new Object();
// Start page processing
if (!signedin())
	Response.Redirect("login.asp");
if (!isAdministrator())
	Response.Redirect("services.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();

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
<!--#include file="dateval.asp" -->
	<div id="content">
		<h1>Site Administration:&nbsp;<b>Amending a News Item</b></h1>
<%
// Initialise the news object
onews=getNews(Request.Form("newsid"));
if (debugging)
	 Response.Write(printNews(onews));
onews.newsid = Trim(new String(Request.Form("newsid")));;
onews.title = Trim(new String(Request.Form("newstitle")));
onews.author = Trim(new String(Request.Form("newsauthor")));
onews.webpage = Trim(new String(Request.Form("newswebpage")));
onews.visible = Trim(new String(Request.Form("visible")));
onews.newsfrom = Trim(new String(Request.Form("newsfrom")));
onews.newsuntil = Trim(new String(Request.Form("newsuntil")));
onews.newspriority = Trim(new String(Request.Form("newspriority")));
onews.category = Trim(new String(Request.Form("newscategory")));
onews.blurb = Trim(new String(Request.Form("newsblurb")));
onews.thumbnail = Trim(new String(Request.Form("newsthumbnail")));
// ... and other variables
newone=Trim(new String(Request.Form("newone")));
// End of page start up coding
// Initialise update variables
// Now extend the validation on Form fields
if (onews.blurb=="" || onews.blurb=="undefined" || onews.blurb=="null")
	onews.blurb=new String("").toString();
if (onews.author=="" || onews.author=="undefined" || onews.author=="null")
	onews.author=new String(getUserName()).toString();
if (onews.webpage=="" || onews.webpage=="undefined" || onews.webpage=="null")
	onews.webpage=new String("").toString();
if (onews.visible=="" || onews.visible=="undefined" || onews.visible=="null")
	onews.visible=new String("N").toString();
if (onews.newspriority=="" || onews.newspriority=="undefined" || onews.newspriority=="null")
	onews.newspriority=new String("99").toString();
if (onews.category=="" || onews.category=="undefined" || onews.category=="null")
	onews.category=new String("ALL").toString();
//
if (debugging)
{
 	 Response.Write("<p>After all form fields from submitting screen have been processed</p>");
	 printNews(onews);
}
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
//
// If we are doing a new insert, set the newswebpage to "FRINK",
// insert the dummy record, read it back and set newswebpage now to 
// null
//
if (newone == "Y")
{
	onews.webpage = new String("FRINK").toString();
	onews.newsid = new String("-1").toString();
	SQL2 = new String("INSERT into news(title,blurb,webpage,author) VALUES('"+onews.title+"','"+onews.blurb+"','"+onews.webpage+"','"+onews.author+"')").toString();
	RS=ConnObj.Execute(SQL2);
	SQL3 = new String("SELECT newsid from news where webpage = 'FRINK'").toString();
	RS=ConnObj.Execute(SQL3);
	if (! RS.EOF)
	{
		onews.newsid = new String(RS("newsid")).toString();
		onews.webpage = new String("").toString();
		RS.Close();
	}
	if (onews.newsid == "-1")   // problem inserting new record //
	{
		Response.Write("Problem retrieving new news item insert");
		Response.End();
	}
	// OK at this point so reset webpage back to ""
	onews.webpage = new String("").toString();
}	
if (debugging)
{
%>
		<table>
			<caption>Additional Debug information</caption>
			<thead>
				<tr>
					<th>Variable</th>
					<th>Contents</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>SQL1</td>
					<td><%= SQL1 %></td>
				</tr>
				<tr>
					<td>newone</td>
					<td><%= newone %></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>
<%
}
if (updating)
{
 	resultObj = setNews(onews);
%>
			<h3>Attempting news item update ..</h3><br />
<%
	if (resultObj.result)
	{
%>
			<div id="successfulnewsupdate">
				<p>
					Update has been successful
				</p>
			</div>
<%
	}
	else
	{
%>
			<div id="unsuccessfulnewsupdate">
				<p>
					Update has not worked
				</p>
				<p>
					 Error details:<br />
				</p>
				<p>
					 Error number:  <%= resultObj.errno %><br />
					 Description:   <%= resultObj.description %><br />
					 SQL:           <%= resultObj.sql %>
				</p> 
			</div>
<%
	}
}
%>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="eventlist.asp">Main club news and event calendar</a></li>
				<li><a href="lst_news.asp">News item list</a></li>
			</ul>
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

