<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Loading photos in");
var debugging = false;
var curpos, kount;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj;
var SQL1, SQL2, SQL3, SQL4;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
var endpos, endpoint;
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
		<div id="mainContent">
			<h1>Photo Updates</h1>
			<div id="photostobeloaded">
				<p>
<%
// Insert photo entries onto photos table
SQLStart = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) ").toString();
SQL1 = new String("values ('finalsday2010-a.jpg','tn_finalsday2010-a.jpg','John Cable','03/07/2010','Left to right: Ray Barnett, Wayman Morris, Joe Killeen and Ian Wasse','Veterans - we who are about to play, salute you!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-b.jpg','tn_finalsday2010-b.jpg','John Cable','03/07/2010','Left to right: Katie Marsden and Jane Hodge','Ladies singles are first up on the day')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-c.jpg','tn_finalsday2010-c.jpg','John Cable','03/07/2010','Left to right: Campbell Oswald, Carol Grant, Catherine Eley and Geoff Redfern','Mixed Doubles Plate finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-d.jpg','tn_finalsday2010-d.jpg','John Cable','03/07/2010','Jane and Katie in flight (sorry for the pun, Katie)','The Ladies Singles kicks off the day')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-e.jpg','tn_finalsday2010-e.jpg','John Cable','03/07/2010','Left to right: Chester Barnes and Rob Yates','Mens Singles finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-f.jpg','tn_finalsday2010-f.jpg','John Cable','03/07/2010','Left to right: Ruth Fennell and Gill Lewis','Ladies Singles Plate finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-g.jpg','tn_finalsday2010-g.jpg','John Cable','03/07/2010','Left to right: Colette Thomson and Wendy Jones','Veteran Ladies Doubles - two of the finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-h.jpg','tn_finalsday2010-h.jpg','John Cable','03/07/2010','... and more exhausted after their 2+ hour gruelling match','Ladies Singles Plate finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-i.jpg','tn_finalsday2010-i.jpg','John Cable','03/07/2010','Left to right:  Ian Poole and Tony Eccleston','Mens Doubles - 2 of the finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-j.jpg','tn_finalsday2010-j.jpg','John Cable','03/07/2010','Left to right: Harry Goodworth and Lewis White - cracking match','U12 Boys finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-k.jpg','tn_finalsday2010-k.jpg','John Cable','03/07/2010','Left to right: Carol Grant, Jane Hodge, Katie Marsdin and Lucy Wasse','Ladies Doubles finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-m.jpg','tn_finalsday2010-m.jpg','John Cable','03/07/2010','Left to right: Charlie Rickard and Paul Thomas','Mens Singles Plate finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-n.jpg','tn_finalsday2010-n.jpg','John Cable','03/07/2010','Left to right: Sam Peace and Jonny Hunt','... and the rest of the Mens Doubles finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-o.jpg','tn_finalsday2010-o.jpg','John Cable','03/07/2010','Left to right: Mark Walker and Savio Gaspar','Veteran Mens Doubles finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-p.jpg','tn_finalsday2010-p.jpg','John Cable','03/07/2010','Nigel Jones - half of Jones and Yates','Veteran Mens Doubles finalist')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-q.jpg','tn_finalsday2010-q.jpg','John Cable','03/07/2010','Left to right: Mark Joannides, Emma Shalley and Ian Poole','Mixed Doubles Plate finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-r.jpg','tn_finalsday2010-r.jpg','John Cable','03/07/2010','Left to right: Sam Hiskett and Jamie Turpin - what an inspiring match!','U16 Boys finalists')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-s.jpg','tn_finalsday2010-s.jpg','John Cable','03/07/2010','Chester chats to new ladies singles champion, Katie Marsdin','Presentation of ladies singles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-t.jpg','tn_finalsday2010-t.jpg','John Cable','03/07/2010','Katie receiving her trophy from Chester','Presentation of ladies singles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-u.jpg','tn_finalsday2010-u.jpg','John Cable','03/07/2010','Hmm. Must get round to having a trophy of some sort some day!','Presentation of Challenge Wayman trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-v.jpg','tn_finalsday2010-v.jpg','John Cable','03/07/2010','Campbell and Carol - exhausted but triumphant','Presentation of mixed doubles plate trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-w.jpg','tn_finalsday2010-w.jpg','John Cable','03/07/2010','Katie and Lucy show off their trophy','Presentation of ladies doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-x.jpg','tn_finalsday2010-x.jpg','John Cable','03/07/2010','Chester happy with his third time singles win','Presentation of mens singles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-y.jpg','tn_finalsday2010-y.jpg','John Cable','03/07/2010','Ruth - changed and refreshed with her hard-earned trophy','Presentation of ladies singles plate trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-z.jpg','tn_finalsday2010-z.jpg','John Cable','03/07/2010','Ian receiving his trophy on behalf of him and Tony (Eccleston) - Tony had to leave early.','Presentation of mens doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-za.jpg','tn_finalsday2010-za.jpg','John Cable','03/07/2010','Terri and Carol happy with their win - 2nd of the day for Carol','Presentation of veteran ladies doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-zb.jpg','tn_finalsday2010-zb.jpg','John Cable','03/07/2010','Mark and Lucy show off the silverware','Presentation of mixed doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-zc.jpg','tn_finalsday2010-zc.jpg','John Cable','03/07/2010','Savio with his trophy - hang on, someone is missing ... (Mark Walker had to leave early)','Presentation of veteran mens doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-zd.jpg','tn_finalsday2010-zd.jpg','John Cable','03/07/2010','Thats better - Savio is now balanced (one on each side)','Presentation of veteran mens doubles trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2010-ze.jpg','tn_finalsday2010-ze.jpg','John Cable','03/07/2010','Paul Thomas shows off his trophy to the crowd ...','Presentation of mens singles plate trophy')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);


// Insert photo refs into their gallery 
// Firstly, the id of the gallery that these photos will belong to
// Gallery 8 is the Finals Day 2010 gallery
	thegallery = 8;
// First number at end of photos table that is free	
	kount = 235;     
	curpos = 1;  
//	endpos = number of images being inserted this time 
  endpos = 50;
	endpoint = curpos + endpos;
	while (curpos < endpoint)
	{
		SQL1 = new String("INSERT into gallery(galleryid,gallerypos,photoid) values ("+thegallery+","+curpos+","+kount+")").toString();
		if (! debugging)
			RstObj = ConnObj.Execute(SQL1);
		else
			Response.Write(SQL1+"<br />");
		kount += 1;
		curpos += 1;
	}
	
	// Now add the entry to the gallery list
	SQL2 = new String("DELETE from gallerylist where galleryid = "+thegallery).toString();
	if (! debugging)
		RstObj = ConnObj.Execute(SQL2);
	else
		Response.Write(SQL2+"<br />");
	SQL3 = new String("INSERT INTO gallerylist(galleryid, galleryname, gallerythumbnail) VALUES ("+thegallery+",'Finals Day 2010','tn_finalsday2010-d.jpg')").toString();
	if (! debugging)
		RstObj = ConnObj.Execute(SQL3);
	else
		Response.Write(SQL3+"<br />");
	
%>
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



