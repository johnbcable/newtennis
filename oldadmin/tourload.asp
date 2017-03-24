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
var kount;
// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RstObj;
ConnObj=Server.CreateObject("ADODB.Connection");
RstObj=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
displaydate = dateasstring(Date());
var debugging = current_debug_status();
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
		<div id="mainContent">
			<h1>Photo Updates</h1>
			<div id="photostobeloaded">
				<p>
<%
// Insert photo entries onto photos table
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('finalsday2009-001.jpg','tn_finalsday2009-001.jpg','John Cable','04/07/2009','Early birds on the courts as soon as they became available!','4 children on the new courts - ahem!.')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('finalsday2009-002.jpg','tn_finalsday2009-002.jpg','John Cable','04/07/2009','... on the new courts','Sisterly rivalry in progress ...')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('finalsday2009-003.jpg','tn_finalsday2009_003.jpg','John Cable','04/07/2009','Now how do I do that with one hand?','Great double-handed backhand.')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('msgl2009w.jpg','tn_msgl2009w.jpg','John Cable','04/07/2009','Convincing singles champion for 2009','Mens Singles Champion - Mark Joannides')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('msgl2009ru.jpg','tn_msgl2009ru.jpg','John Cable','04/07/2009','Runner-up for 2009 on the new courts','Mens Singles Runner-Up - Rob Yates')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lsgl2009w.jpg','tn_lsgl2009w.jpg','John Cable','04/07/2009','Singles champion yet again for 2009!','Ladies Singles Champion 2009 - Jane Hodge')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lsgl2009ru.jpg','tn_lsgl2009ru.jpg','John Cable','04/07/2009','Singles runner-up ... and a close one at that.','Ladies Singles Runner-Up 2009 - Charlotte Ray')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mdbl2009w.jpg','tn_mdbl2009w.jpg','John Cable','04/07/2009','Mens doubles champs - nobody does it better. Consummate performance.','Mens Doubles Champions 2009 - Tony Eccleston and Ian Poole')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mdbl2009ru.jpg','tn_mdbl2009ru.jpg','John Cable','04/07/2009','Mens doubles runners up.','Mens Doubles Runners-Up 2009 - Mark Joannides and Matthew Hunt')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('ldbl2009w.jpg','tn_ldbl2009w.jpg','John Cable','04/07/2009','Ladies doubles champs - a repeat performance.','Ladies Doubles Champions 2009 - Carol Grant and Jane Hodge')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('ldbl2009ru.jpg','tn_ldbl2009ru.jpg','John Cable','04/07/2009','Ladies doubles runners up.','Ladies Doubles Runners-Up 2009 - Lucy Wasse and Sandy Wasse')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mixd2009w.jpg','tn_mixd2009w.jpg','John Cable','04/07/2009','Mixed doubles champs - a blistering display.','Mixed Doubles Champions 2009 - Lucy Wasse and Mark Joannides')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mixd2009ru.jpg','tn_mixd2009ru.jpg','John Cable','04/07/2009','Mixed doubles runners up.','Mixed Doubles Runners-Up 2009 - Kathy Hunt and Matthew Hunt')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mvd2009w.jpg','tn_mvd2009w.jpg','John Cable','04/07/2009','Veterans Doubles (Mens) champs - close fought contest.','Veterans Doubles (Mens) Champions 2009 - Savio Gaspar and Mark Walker')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mvd2009ru.jpg','tn_mvd2009ru.jpg','John Cable','04/07/2009','Veterans Doubles (Mens) runners up.','Veterans Doubles (Mens) Runners-Up 2009 - Nigel Jones and Rob Yates')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lvd2009w.jpg','tn_lvd2009w.jpg','John Cable','04/07/2009','Veterans Doubles (Ladies) champs','Veterans Doubles (Ladies) Champions 2009 - Carol Grant and Terri Mason')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lvd2009ru.jpg','tn_lvd2009ru.jpg','John Cable','04/07/2009','Veterans Doubles (Ladies) runners up.','Veterans Doubles (Ladies) Runners-Up 2009 - Chris Durbin and Kathy Hunt')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mplt2009w.jpg','tn_mplt2009w.jpg','John Cable','04/07/2009','Singles Plate (Mens) champ - cracking 3-set match','Singles Plate (Mens) Champion 2009 - Nigel Jones')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mplt2009ru.jpg','tn_mplt2009ru.jpg','John Cable','04/07/2009','Singles Plate (Mens) runner-up.','Singles Plate (Mens) Runner-Up 2009 - Phil Turpin')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lplt2009w.jpg','tn_lplt2009w.jpg','John Cable','04/07/2009','Singles Plate (Ladies) champ - exhausting final','Singles Plate (Ladies) Champion 2009 - Chris Durbin')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('lplt2009ru.jpg','tn_lplt2009ru.jpg','John Cable','04/07/2009','Singles Plate (Ladies) runner-up.','Singles Plate (Ladies) Runner-Up 2009 - Wendy Jones')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mixp2009w.jpg','tn_mixp2009w.jpg','John Cable','04/07/2009','Mixed Doubles Plate champs - get that Roper man next year, ladies','Mixed Doubles Plate Champions 2009 - Wendy Jones and Paul Roper')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mixp2009ru.jpg','tn_mixp2009ru.jpg','John Cable','04/07/2009','Mixed Doubles Plate runners-up.','Mixed Doubles Plate Runners-Up 2009 - Julie Williamson and Nigel Jones')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mo552009w.jpg','tn_mo552009w.jpg','John Cable','04/07/2009','Mens Over 55 champ - in the medals at last, Joe','Mens Over 55 Champion 2009 - Joe Killeen')").toString();
RstObj = ConnObj.Execute(SQL1);
SQL1 = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,bottomcaption,topcaption) values ('mo552009ru.jpg','tn_mo552009ru.jpg','John Cable','04/07/2009','Mens Over 55 runner-up - in the Challenge Wayman event.','Mens Over 55 Runner-Up 2009 - Wayman Morris')").toString();
RstObj = ConnObj.Execute(SQL1);

// Insert photo refs
	thegallery = 4;
	kount = 135;
	curpos = 1;   
// Firstly insert ref to new gallery
	SQL1 = new String("INSERT into gallerylist(galleryname, gallerythumbnail) values('Finals Day 2009','tn_finalsday2009-003.jpg')").toString();
	if (! debugging)
		RstObj = ConnObj.Execute(SQL1);
	else
		Response.Write(SQL1+"<br />");
	
	while (curpos < 26)
	{
		SQL1 = new String("INSERT into gallery(galleryid,gallerypos,photoid) values ("+thegallery+","+curpos+","+kount+")").toString();
		if (! debugging)
			RstObj = ConnObj.Execute(SQL1);
		else
			Response.Write(SQL1+"<br />");
		kount += 1;
		curpos += 1;
	}
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



