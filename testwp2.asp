<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="wpdebug.asp" -->
<!--#include file="qmfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Wordpress Testing Page");
// Now for any variables local to this page
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj, StnObj;
var ConnObj2, RstObj2, StnObj2;
var RS, RS2, RS3;
var d, thisyear;
var i, kount, dummy, dummy1;
var teamids = new Array (1,2,3);
var curteam, curseason;
var teamcaptain, teamname;
var venuetext, teamnote;
var thefixturedate, strfixturedate;
var isOdd = true;
var stripeText = new String("").toString();
var teamObj = new Object();
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging=current_debug_status();
debugging = true;
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
	<div id="content">
			<h1>Administration:<b>&nbsp;Getting Wordpress Posts</b></h1>
			<h2>Recent Hampton Tennis Posts</h2>
<%
/*
	var wpHTML = getBlogEntries("hamptontennis");
	Response.Write(wpHTML);
*/
	var wpJSON = getBlogEntriesJSON("hamptontennis",3);
	Response.Write("<br /><br />And now for the contents of the returned Javascript object<br /><br />")
	Response.Write("Message =      "+wpJSON.message+"<br />");
	Response.Write("Kount =        "+wpJSON.kount+"<br />");
	Response.Write("No. of posts = "+wpJSON.posts.length+"<br /><hr><br />");
	var x=0;
	while (x < wpJSON.posts.length) {
		Response.Write("<u>Object "+x+"</u><br />");
		Response.Write("Title: "+wpJSON.posts[x].title+"<br />")
		Response.Write("Link: "+wpJSON.posts[x].link+"<br />")
		Response.Write("Description: "+wpJSON.posts[x].description+"<br />")
		Response.Write("Publication date: "+wpJSON.posts[x].pubdate.toString()+"<br />")
		Response.Write("Post ID: "+wpJSON.posts[x].postid+"<br />")
		x += 1;
	}
	// Response.Write("<br /><br />And now for blog entries created after 31 January 2013 ... <br /><br />")
	// var startingfrom = new Date("31 Jan 2013");
	// var wpHTML = getBlogEntriesAfter("hamptontennis",startingfrom);
	// Response.Write(wpHTML);

	// Response.Write("<br /><br />And now for URGENT blog entries created after 31 January 2013 ... <br /><br />")
	// var startingfrom = new Date("31 Jan 2013");
	// var wpHTML = getUrgentBlogEntries("hamptontennis",startingfrom);
	// Response.Write(wpHTML);

	// Response.Write("<br /><br />And now for Quick Messages sent as a result of a WP post (29)<br /><br />")
	// var qmObj = new Object();
	// qmObj = getQuickMessageByPost(29);
	// if (qmObj.messageid > 0) {
	//	Response.Write(printQuickMessage(qmObj));
	// } else
	// {
	//	Response.Write("No Quick Messages sent out as a result of post 29")
	// }

	Response.Write("<br /><br />===============  End of the tests =====================<br /><br />")

%>		
	</div>
	
<!--     4.      Supplementary navigation    -->
	<div id="leftcolumn">
		<!--#include file="fixturepanel.asp" -->
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


