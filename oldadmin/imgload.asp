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
/*
SQLStart = new String("INSERT into photos(mainphoto,thumbnail,submittedby,takenon,topcaption,bottomcaption) ").toString();
SQL1 = new String("values ('finalsday-2012-a.jpg','tn_finalsday-2012-a.jpg','Sophie Cable','07/07/2012','Well, if it doesnt put me off walking my dog','... then get on those courts and play!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-b.jpg','tn_finalsday-2012-b.jpg','Sophie Cable','07/07/2012','My son is here somewhere, maybe behind the hedge?','Gary Lawrence in reflective mood watching his son in his final.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-c.jpg','tn_finalsday-2012-c.jpg','Sophie Cable','07/07/2012','Take the picture now, before I have to run around','Ladies 3rd team captain Emma Shalley in relaxed mood before her final')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-d.jpg','tn_finalsday-2012-d.jpg','Sophie Cable','07/07/2012','Here''s the deal - No score, no medal.','Words of encouragement for one of our junior winners from Mens 3rd Team Captain, Steve Ray')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-e.jpg','tn_finalsday-2012-e.jpg','Sophie Cable','07/07/2012','Emma and Gabor - in rare dry weather!','Confident before their mixed doubles plate final')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-f.jpg','tn_finalsday-2012-f.jpg','Sophie Cable','07/07/2012','The Boys Under 16 final produced some cracking rallies','... must have taken lessons from MJ (halfway down the court)')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday2012.jpg','tn_finalsday2012.jpg','Sophie Cable','07/07/2012','It''s still raining ...','... and players are still waiting.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-g.jpg','tn_finalsday-2012-g.jpg','Sophie Cable','07/07/2012','When the downpour starts, it''s too much for Andy and Mark','Just time to start the ribs, then, Andy?')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-h.jpg','tn_finalsday-2012-h.jpg','Sophie Cable','07/07/2012','Tim, Ian and Under boys under 12 finalists','It was the only photo where all of them had their eyes open!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-i.jpg','tn_finalsday-2012-i.jpg','Sophie Cable','07/07/2012','Ian and boys under 16 finalists','... after they have been presented with their medals')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-j.jpg','tn_finalsday-2012-j.jpg','Sophie Cable','07/07/2012','Steve and Chester in happy mood ...','... cos'' they weren''t playing AND the weather had perked up!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-k.jpg','tn_finalsday-2012-k.jpg','Sophie Cable','07/07/2012','Malcolm trots away in disgust .. ','... as John looks bemusedly at one of many of his shots to hit the net')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-l.jpg','tn_finalsday-2012-l.jpg','Sophie Cable','07/07/2012','I''ve told you once .. I won''t fetch the ball again!','C''mon Malcolm, promise me you''ll buck up!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-m.jpg','tn_finalsday-2012-m.jpg','Sophie Cable','07/07/2012','Tennis isn''t the only game to play on Finals Day','Juniors bring out the trikes and soap-on-a-rope skipping when the weather has improved')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-n.jpg','tn_finalsday-2012-n.jpg','Sophie Cable','07/07/2012','Someone thinks Finals Day is going well','All that fun and enthusiasm - if only you could bottle it!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-o.jpg','tn_finalsday-2012-o.jpg','Sophie Cable','07/07/2012','On your marks, get set ...','GO! This is every bit as serious as the finals going on in the background')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-p.jpg','tn_finalsday-2012-p.jpg','Sophie Cable','07/07/2012','Classic Mens Super Veterans final in the foreground .. ','... while the crowd sensibly watch the real tennis on the other courts')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-q.jpg','tn_finalsday-2012-q.jpg','Sophie Cable','07/07/2012','... and they''ll need to put that back afterwards!','The Mens Singles Plate final is family viewing')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-r.jpg','tn_finalsday-2012-r.jpg','Sophie Cable','07/07/2012','Ouch! This looks painful.','Andy Frith is our first server-on-parade with a contortion special')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-s.jpg','tn_finalsday-2012-s.jpg','Sophie Cable','07/07/2012','He''s been there before (in 2009) and he''s there again in 2012','Mark Walker (foreground, green shorts) is our second server-on-parade this year')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-t.jpg','tn_finalsday-2012-t.jpg','Sophie Cable','07/07/2012','The Jones boys relaxing in the crowd','Nigel will be particularly pleased with this one')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-u.jpg','tn_finalsday-2012-u.jpg','Sophie Cable','07/07/2012','Now that''s more like it!','Cakes are always great on Finals Day.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-v.jpg','tn_finalsday-2012-v.jpg','Sophie Cable','07/07/2012','Another ace please Karen','Paul passes the ball back to partner Karen to serve in the Mixed Doubles Plate final')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-w.jpg','tn_finalsday-2012-w.jpg','Sophie Cable','07/07/2012','The end of the Mixed Doubles Plate final','Smiling Emma and Gabor shake hands with gallant runners-up Paul and Karen')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-x.jpg','tn_finalsday-2012-x.jpg','Sophie Cable','07/07/2012','The crowd are looking concerned ...','... if they don''t finish soon, the salad will burn!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-y.jpg','tn_finalsday-2012-y.jpg','Sophie Cable','07/07/2012','Whew! Sandy''s not concerned any more ...','... and Chester is just hungry!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-z.jpg','tn_finalsday-2012-z.jpg','Sophie Cable','07/07/2012','The mighty Mens Singles final gets under way at last ','Daniel (right) serves to Josh.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-za.jpg','tn_finalsday-2012-za.jpg','Sophie Cable','07/07/2012','... and the serve on its way','Josh prepares to return ..')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zb.jpg','tn_finalsday-2012-zb.jpg','Sophie Cable','07/07/2012','The only final to be played all in tennis whites - apart from Malcolm''s shorts!','Ray and Malcolm enter into the spirit by turning up with (off) white hair as well!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zc.jpg','tn_finalsday-2012-zc.jpg','Sophie Cable','07/07/2012','Dynamic action shot from the Mens Singles Final','... or the photographer slipped and was falling over: you decide.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zd.jpg','tn_finalsday-2012-zd.jpg','Sophie Cable','07/07/2012','Mens super veterans tussle concludes in the baking heat','... time for a drink!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-ze.jpg','tn_finalsday-2012-ze.jpg','Sophie Cable','07/07/2012','Ray and Wayman are first off the court in a sprint for the clubhouse','')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zf.jpg','tn_finalsday-2012-zf.jpg','Sophie Cable','07/07/2012','Concerned Malcolm and less-than-energetic (does that mean lazy? Ed.) John follow Ray and Wayman to the bar','I bet he makes me buy the first round - and it''s my birthday says Malcolm')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zg.jpg','tn_finalsday-2012-zg.jpg','Sophie Cable','07/07/2012','A happy crowd relax watching the super tennis in the Mens Singles final','... while Andy Frith''s kipper-smoking goes unnoticed in the background')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zh.jpg','tn_finalsday-2012-zh.jpg','Sophie Cable','07/07/2012','Last server-on-parade for 2012 is Josh Crisp-Jones','From the Mens Singles final against Daniel Eccleston')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zi.jpg','tn_finalsday-2012-zi.jpg','Sophie Cable','07/07/2012','... and Daniel prepares to return to Josh','Great tennis all round - thanks guys')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zj.jpg','tn_finalsday-2012-zj.jpg','Sophie Cable','07/07/2012','Mens Doubles final in full flight','... incl. change of attire for Josh after Mens Singles final')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zk.jpg','tn_finalsday-2012-zk.jpg','Sophie Cable','07/07/2012','A fine running double-backhand return from Ollie','in the midst of the Mens Doubles final')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zl.jpg','tn_finalsday-2012-zl.jpg','Sophie Cable','07/07/2012','A big hand for our club chairman, John Eccleston','Never happier than when pootling around at the club')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zm.jpg','tn_finalsday-2012-zm.jpg','Sophie Cable','07/07/2012','Chairman Geoff presents the Ladies Singles trophy to Jane Hodge (with runner-up Carol Grant)','Shameless publicity hunting from Charlie in the background through')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zn.jpg','tn_finalsday-2012-zn.jpg','Sophie Cable','07/07/2012','Geoff presents the Ladies Singles plate trophy to Sally Leach (with runner-up Jo Oswald)','')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zo.jpg','tn_finalsday-2012-zo.jpg','Sophie Cable','07/07/2012','Andy (Frith) gainfully accepts the Mens Singles Plate ward on behalf of (an absent) Mark Walker','Never mind all that tennis malarkey - please don''t burn the ribs on the BBQ!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zp.jpg','tn_finalsday-2012-zp.jpg','Sophie Cable','07/07/2012','Ladies Doubles champions (Terri Mason and Wendy Jones) with runners-up Carol Grant and Jane Hodge','')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zq.jpg','tn_finalsday-2012-zq.jpg','Sophie Cable','07/07/2012','One of our most popular titles, Mixed Doubles Plate, goes to Gabor and Emma','... with an equally smiley set of runners-up: Paul and Karen')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zr.jpg','tn_finalsday-2012-zr.jpg','Sophie Cable','07/07/2012','All hail the new Mens Singles champion - Josh Crisp-Jones','... and Geoff plays caddy to bring his trophy along!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zs.jpg','tn_finalsday-2012-zs.jpg','Sophie Cable','07/07/2012','Malcolm and John are very happy to lift the Mens Super Veterans trophy','Wayman, on the other hand, is still distressed at being bested by a combined age of over 125!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zt.jpg','tn_finalsday-2012-zt.jpg','Sophie Cable','07/07/2012','Terri and Savio are the new Mixed Doubles champions','definitely the Terri show this year!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zu.jpg','tn_finalsday-2012-zu.jpg','Sophie Cable','07/07/2012','The new Mens Doubles champions!','It''s that JCJ again with Ollie Plaskett and runners-up Rich Allen and Rich Westman')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zv.jpg','tn_finalsday-2012-zv.jpg','Sophie Cable','07/07/2012','Ladies Veterans Doubles champions win for 5th year in a row','Carol and Terri with runners-up Kathy and Wendy. Yoo hoo, Wendy - over here!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zw.jpg','tn_finalsday-2012-zw.jpg','Sophie Cable','07/07/2012','Paul Thomas collecting the Mens Veterans Doubles trophy for him and Graham Hollway','Savio (and daughter) represents himself and Mark Walker as runners-up this year')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zx.jpg','tn_finalsday-2012-zx.jpg','Sophie Cable','07/07/2012','What we were all playing for ... ','No - NOT the drink!')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zy.jpg','tn_finalsday-2012-zy.jpg','Sophie Cable','07/07/2012','Wayman puts a brave face on it - despite wearing that stripey T-shirt','Chester absorbed in the intricacies of his mobile phone')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);
SQL1 = new String("values ('finalsday-2012-zz.jpg','tn_finalsday-2012-zz.jpg','Sophie Cable','07/07/2012','New mixed doubles plate champ Gabor still can''t quite believe it','Finals Day 2012 draws to a relaxed pleasant close on a high - see you next year.')").toString();
RstObj = ConnObj.Execute(SQLStart+SQL1);

*/

// Insert photo refs into their gallery 
// Firstly, the id of the gallery that these photos will belong to
// Gallery 11 is Finals Day 2012 gallery
	thegallery = 11;
// First number at end of photos table that is free	
	kount = 426;     
	curpos = 1;  
//	endpos = number of images being inserted this time 
  endpos = 53;
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
	SQL3 = new String("INSERT INTO gallerylist(galleryid, galleryname, gallerythumbnail) VALUES ("+thegallery+",'Finals Day - 7 July, 2012','tn_finalsday-2012.jpg')").toString();
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



