<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<!--#include file="wordpress.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Circulating URGENT Blog Posts");
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
var previouslysent;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
displaydate = dateasstring(Date());
var debugging=current_debug_status();
// Nw tee up SQL access to quick messages
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from quickmessages where postid not like '0' order by messageid desc");
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
			<h1>Administration:<b>&nbsp;Circulating URGENT Blog Post</b></h1>
			<h2>Most Recent URGENT Hampton Tennis Post</h2>
<%
	var wpJSON = getBlogEntriesJSON("hamptontennis",3);
	Response.Write("<br /><br />Recent URGENT blog posts :-<br /><br />")

	var x=0;
	kount = 0;
	while (x < wpJSON.posts.length) {
		// First we need to only process if the blog entry is URGENT
		thetitle = new String(wpJSON.posts[x].title).toString();
		thetitle = thetitle.substring(0,6);
		if (thetitle == "URGENT") {
			previouslysent= new String("not previously circulated").toString();
			// Now we need to know if this post has already been sent out and when
			dummy = new String(wpJSON.posts[x].postid).toString();
			SQL1 = new String("SELECT * from quickmessages where postid like '"+dummy+"'");
			RS = ConnObj.Execute(SQL1);
			if (! RS.EOF) {
				dummy1 = new Number(RS("mycount"));	
			}
			
			if (dummy1 > 0) {
				previouslysent= new String("Previously circulated").toString();
			}

			strTime = timeasstring(wpJSON.posts[x].pubdate);
			OutputHTML += '<div class="wordpresspost"><p class="wptitle"><a href="' + wpJSON.posts[x].link + '">';
			OutputHTML += wpJSON.posts[x].title + '</a></p><p class="wpdesc">' + wpJSON.posts[x].description + '</p><p class="wpdate">Published on:- ' + strDate + ' at ' + strTime + '</p><p class="wppostid">Post ID: '+wpJSON.posts[x].postid+'</p></div>';
		}
	}
	x += 1;
	}

		Response.Write("<u>Object "+x+"</u><br />");
		Response.Write("Title: "+wpJSON.posts[x].title+"<br />")
		Response.Write("Link: "+wpJSON.posts[x].link+"<br />")
		Response.Write("Description: "+wpJSON.posts[x].description+"<br />")
		Response.Write("Publication date: "+wpJSON.posts[x].pubdate.toString()+"<br />")
		Response.Write("Post ID: "+wpJSON.posts[x].postid+"<br />")
		x += 1;
	}
	Response.Write("<br /><br />And now for blog entries created after 31 January 2013 ... <br /><br />")
	var startingfrom = new Date("31 Jan 2013");
	var wpHTML = getBlogEntriesAfter("hamptontennis",startingfrom);
	Response.Write(wpHTML);

	Response.Write("<br /><br />And now for URGENT blog entries created after 31 January 2013 ... <br /><br />")
	var startingfrom = new Date("31 Jan 2013");
	var wpHTML = getUrgentBlogEntries("hamptontennis",startingfrom);
	Response.Write(wpHTML);

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


