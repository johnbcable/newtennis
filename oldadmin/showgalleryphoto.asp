<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="photofuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Viewing Gallery Photos");
var debugging=false;
var photoparts = new Array();
var ophoto = new Object();
var thephoto, theid, thetopcaption, thebottomcaption, thealtcaption;
var thesubmitter, thedatetaken;
var theid=new String(Request.Querystring("photo")).toString();
var thegallery = new String(Request.QueryString("gallery")).toString();
var galleryname = new String("").toString();
if (theid=="undefined")
	Response.Redirect("nophoto.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// Fetch photo details using the photoid (thephoto)
ophoto = getPhotoByID(theid);
//  If image supplied with no file extension, assume JPEG
thephoto = new String(ophoto.mainphoto).toString();
photoparts=thephoto.split(".");
parts = photoparts.length;
if (parts < 2)
	thephoto += ".jpg"
// Now other info from the photo object
thetopcaption = new String(ophoto.topcaption).toString();	
thebottomcaption = new String(ophoto.bottomcaption).toString();	
thealtcaption = new String(ophoto.altcaption).toString();	
thesubmitter = new String(ophoto.submittedby).toString();	
thedatetaken = new String(ophoto.takenon).toString();	
// Retrieve summary details of gallery
ogallery = getGalleryByID(thegallery);
galleryname = new String(ogallery.galleryname).toString();
displaydate = dateasstring(Date());
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Showing Gallery Photos</title>
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
		<h1><a href="galleryoldwayin.asp">Photo Galleries</a> &raquo; <b><a href="thumbnails.asp?gallery=<%= thegallery %>"><%= galleryname %></a></b></h1>
		<h2><%= thetopcaption %></h2>
		<div id="displayedphoto">
			<img src="images/<%= thephoto %>" alt="<%= thealtcaption %>" title="<%= thealtcaption %>" />
			<p style="clear:both;"><%= thebottomcaption %></p><br />
			<p>Submitted by:&nbsp;<%= thesubmitter %>&nbsp;-&nbsp;photo taken on <%= thedatetaken %></p>
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
