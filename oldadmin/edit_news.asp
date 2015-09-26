<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Editing an Existing News Item");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
var newscategorylist = new Array("ALL","ADULT","JUNIOR");
var defCategory = new String("ALL").toString();            // default news category
var onews = new Object();
var theid = new String("-1").toString();
var newone = new String("N").toString();
if (!signedin())
	Response.Redirect("login.asp");
if (! isAdministrator())
	Response.Redirect("members.asp");
//
theid = new String(Request.Querystring("id"));
if (theid=="null" || theid=="undefined" || theid=="")
	Response.Redirect("services.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
//
onews = getNews(theid);
if (onews.newsid == "-1")
	newone = new String("Y").toString();
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
<!--#include file="dateval.asp" -->
	<div id="content">
		<h1>Site Administration:&nbsp;<b>Amending a News Item</b></h1>
		<p>
			Fill in the form below with any changes to the news item. All boxes must be completed with the exception of the news Starts At box (which may be left blank). Click on Submit when the news item details are ready 
			for submission.
		</p>
		<form method="post" action="set_news.asp">
			<fieldset>
				<legend>Details</legend>
				<div>
					<label for="newstitle">Name/Title for Item</label>
					<input type="text" name="newstitle" id="newstitle" size="60" maxlength="150" tabindex="1" value="<%= onews.title %>" />
				</div>
				<div>
					<label for="newsfrom">News displayed from:</label>
					<input type="text" name="newsfrom" id="newsfrom" size="10" maxlength="10" tabindex="2" onBlur="javascript:checkdate(this)" value=<%= onews.newsfrom %> />
					<a href="javascript:NewCal('newsfrom','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" /></a>&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="newsuntil">News displayed until:</label>
					<input type="text" name="newsuntil" id="newsuntil" size="10" maxlength="10" tabindex="3" />
					<a href="javascript:NewCal('newsuntil','ddmmyyyy');"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date" value=<%= onews.newsuntil %> /></a>&nbsp;(dd/mm/yyyy) e.g. 09/02/2008 = 9 February 2008
				</div>
				<div>
					<label for="newscategory">News category</label>
					<select name="newscategory" id="newscategory" tabindex="4">
<%
for (i=0; i<3; i++)
{
	if (newscategorylist[i]==onews.category)
		Response.Write("<option selected>"+newscategorylist[i]);
	else
		Response.Write("<option>"+newscategorylist[i]);
}
%>
					</select>	
				</div>		
				<div>
					<label for="newspriority">Priority for Item</label>
					<input type="text" name="newspriority" id="newspriority" size="2" maxlength="2" tabindex="5" value=<%= onews.newspriority %> />&nbsp;(N.B. low values are higher priority)
				</div>
				<div>
					<label for="visible">Visible?</label>
					<input type="text" name="visible" id="visible" size="1" maxlength="1" tabindex="6" value=<%= onews.visible %> />
				</div>								
				<div class="borderboth" style="height:50px; margin-bottom: 20px;">
					<label for="newsblurb">News item summary:</label>
					<textarea name="newsblurb" rows="4" cols="50" tabindex="7" style="font-face: Verdana; font-size: 12px; text-align:left;"><%= onews.blurb %></textarea><br /><br />
				</div>
				<div>
					<label for="newswebpage">Linked web page</label>
					<input type="text" name="newswebpage" id="newswebpage" size="60" maxlength="150" tabindex="8" value="<%= onews.webpage %>" />
				</div>
				<div>
					<label for="newsthumbnail">Thumbnail image</label>
					<input type="text" name="newsthumbnail" id="newsthumbnail" size="60" maxlength="150" tabindex="9" value="<%= onews.thumbnail %>" />
				</div>
				<div>
					<label for="newsauthor">Author</label>
					<input type="text" name="newsauthor" id="newsauthor" size="52" maxlength="50" tabindex="10" value="<%= onews.author %>" />
				</div>
				<div id="submitblock" align="right" style="clear: both;">
					<input type="hidden" name="newsid" value="<%= theid %>">
					<input type="hidden" name="newone" value="<%= newone %>">
					<p style="margin: 20px 50px; clear: both;">
						<input align="right" type="submit" value="Update">
					</p>
				</div>
			</fieldset>
		</form>
		
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
