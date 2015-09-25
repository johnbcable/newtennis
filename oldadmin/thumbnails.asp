<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="photofuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Hampton-In-Arden Tennis Club - Thumbnail Images from Gallery");
var dbconnect=Application("hamptonsportsdb");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, RS2, SQL1, SQL2, SQL3;
// Supporting variables and lists
var thegallery = new String(Request.QueryString("gallery")).toString();
var ogallery = new Object();
var ophoto = new Object();
var galleryname;
//
// Validate incoming parameters
//
if (thegallery=="null" || thegallery=="undefined" || thegallery=="")
{
	thegallery = new String(Request.Form("gallery")).toString();
	if (thegallery=="null" || thegallery=="undefined" || thegallery=="")
		Response.Redirect("galleryindex.asp");
}
//
// Set up default greeting strings
//
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
//
// Retrieve summary details of gallery
//
ogallery = getGalleryByID(thegallery);
galleryname = new String(ogallery.galleryname).toString();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis - Gallery Thumbnails Page</title>
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

	<div id="content">
		<h1><a href="galleryindex.asp">Photo Galleries</a> &raquo; <b><%= galleryname %></b></h1>
		<div id="gallery">
			<ul class="thumbnails">
<%
//
// Set up loop to get all thumbnails in this gallery
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);	
SQL1 = new String("SELECT * from gallery where galleryid = "+thegallery+" order by gallerypos asc").toString();
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	thephoto = new String(RS("photoid")).toString();
	ophoto = getPhotoByID(thephoto);
%>				
				<li><a href="showgalleryphoto.asp?gallery=<%= thegallery %>&photo=<%= thephoto %>"><img alt="<%= ophoto.altcaption %>" title="<%= ophoto.altcaption %>" src="images/<%= ophoto.thumbnail %>" /></a></li>
<%
	RS.MoveNext();
}
%>
			</ul>		
		</div>
	</div>  <!-- end content   -->
	
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
