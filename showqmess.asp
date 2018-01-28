<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Confirming Quick Messages to Members");
// Now for any functions and variables  local to this page
function GetEveryThing(thefile)
{
	var fso, f;
	var ForReading = 1, ForWriting = 2;
	var fcontents;
	fso = new ActiveXObject("Scripting.FileSystemObject");
	myfilename = Server.MapPath(thefile);
	f = fso.OpenTextFile(myfilename, ForReading);
	fcontents = new String(f.ReadAll()).toString();
	f.Close();
	return(fcontents);
}
var dbconnect=Application("hamptonsportsdb");
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var RS, RS2, RS3;
var SQL1, SQL2;

var debugging;
var thmessageid = new String(Request.QueryString("id")).toString();
var requesttemplate = new String("quickmessage.html").toString();

if (thmessageid == "null" || thmessageid == "undefined" || thmessageid == "")
{
    thmessageid = new String(Request.Form("messageid")).toString();
    if (thmessageid == "null" || thmessageid == "undefined" || thmessageid == "")
		thmessageid = new String("1").toString();
}
idnumber = new Number(thmessageid);
idnumber = idnumber.valueOf();
// Retrieve the message as an Object via its id
messageobj = getMessageByID(idnumber);
// set up local strungs from this object
var sSubject = new String(messageobj.subject).toString();
var sFrom = new String(messageobj.onbehalfof).toString();
var sCirculation = new String(messageobj.query).toString();
var sDetails = new String(messageobj.messagetext).toString();
var sPost = new String(messageobj.postid).toString();
var sLeadParagraph = new String(messageobj.leadparagraph).toString();
var sIncludeCoaches = new String(messageobj.includecoaches).toString();

var sMessage, fullmessage, messagestart, htmlindex, sender, recipient;
var coachclause = new String("").toString();
var ageclause = new String("").toString();
var agerange = false;  // default to no age range
var sortablestart, sortableend;
var updatelog = true;
var kount;
var the_email;
var strtoday;
var htmlindex, doctypeindex, fullmessage, tMessage;
var dummy;
var emaildir = new String("emails").toString();
var fullwhichfile = new String("").toString();
var memberid = getUserCode();
var myfullname, myemail;
var themember = new Object();


// Deal with nulls
if (sLeadParagraph == "null" || sLeadParagraph == "undefined" )
{
		sLeadParagraph = new String("").toString();
}


//
// Do bulk replacements in textareas (sDetails and sLeadParagraph (if present))
//
sDetails = replaceAll(sDetails,"\r\n", "<br />");
sDetails = replaceAll(sDetails,"\n\r", "<br />");
sDetails = replaceAll(sDetails,"\n", "<br />");
sDetails = replaceAll(sDetails,"\r", "<br />");
sDetails = replaceAll(sDetails,"£", "&pound;");
sDetails = replaceAll(sDetails,"\u0027", "&apos;");
sDetails = replaceAll(sDetails,"\u00e2\u20ac\u201c", "&ndash;");
sDetails = replaceAll(sDetails,'"', "&quot;");
sDetails = replaceAll(sDetails,"\u002d", "&ndash;");

if (! (sLeadParagraph == ""))
{
	sLeadParagraph = replaceAll(sLeadParagraph,"\r\n", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\n\r", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\n", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"\r", "<br />");
	sLeadParagraph = replaceAll(sLeadParagraph,"£", "&pound;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u0027", "&apos;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u00e2\u20ac\u201c", "&ndash;");
	sLeadParagraph = replaceAll(sLeadParagraph,'"', "&quot;");
	sLeadParagraph = replaceAll(sLeadParagraph,"\u002d", "&ndash;");
}
//
if (sSubject == "null" || sSubject == "undefined" || sSubject == "")
	sSubject = new String("Important Message from Hampton Tennis Club");
if (sPost == "" || sPost == "null" || sPost == "undefined")
	sPost = new String("0");
//
// Now do bulk replacements in message title area
//

sSubject = replaceAll(sSubject,"£", "&pound;");
sSubject = replaceAll(sSubject,"\u0027", "&apos;");
sSubject = replaceAll(sSubject,"\u00e2\u20ac\u201c", "&ndash;");
sSubject = replaceAll(sSubject,'"', "&quot;");
sSubject = replaceAll(sSubject,"\u002d", "&ndash;");

// Now remove any remaining non-ASCII characters from the 
// details, lead and Subject

sSubject = sSubject.replace(/[^\x00-\x7F]/g, "");
sDetails = sDetails.replace(/[^\x00-\x7F]/g, "");
sLeadParagraph = sLeadParagraph.replace(/[^\x00-\x7F]/g, "");

// debugging = true;
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- If you delete this meta tag, Half Life 3 will never be released. -->
<meta name="viewport" content="width=device-width" />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="noindex,nofollow" />
<title>Hampton in Arden Tennis Club - Quick Message </title>
	
<style>
/* ------------------------------------- 
		GLOBAL 
------------------------------------- */
* { 
	margin:0;
	padding:0;
}
* { font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif; }

img { 
	max-width: 100%; 
}
.collapse {
	margin:0;
	padding:0;
}
body {
	-webkit-font-smoothing:antialiased; 
	-webkit-text-size-adjust:none; 
	width: 100%!important; 
	height: 100%;
}


/* ------------------------------------- 
		ELEMENTS 
------------------------------------- */
a { color: #2BA6CB;}

.btn {
	text-decoration:none;
	color: #FFF;
	background-color: #666;
	padding:10px 16px;
	font-weight:bold;
	margin-right:10px;
	text-align:center;
	cursor:pointer;
	display: inline-block;
}

p.callout {
	padding:15px;
	background-color:#ECF8FF;
	margin-bottom: 15px;
}
.callout a {
	font-weight:bold;
	color: #2BA6CB;
}

table.social {
/* 	padding:15px; */
	background-color: #ebebeb;
	
}
.social .soc-btn {
	padding: 3px 7px;
	font-size:12px;
	margin-bottom:10px;
	text-decoration:none;
	color: #FFF;font-weight:bold;
	display:block;
	text-align:center;
}
a.fb { background-color: #3B5998!important; }
a.tw { background-color: #1daced!important; }
a.gp { background-color: #DB4A39!important; }
a.ms { background-color: #000!important; }

.sidebar .soc-btn { 
	display:block;
	width:100%;
}

/* ------------------------------------- 
		HEADER 
------------------------------------- */
table.head-wrap { width: 100%;}

.header.container table td.logo { padding: 15px; }
.header.container table td.label { padding: 15px; padding-left:0px;}


/* ------------------------------------- 
		BODY 
------------------------------------- */
table.body-wrap { width: 100%;}


/* ------------------------------------- 
		FOOTER 
------------------------------------- */
table.footer-wrap { width: 100%;	clear:both!important;
}
.footer-wrap .container td.content  p { border-top: 1px solid rgb(215,215,215); padding-top:15px;}
.footer-wrap .container td.content p {
	font-size:10px;
	font-weight: bold;
	
}


/* ------------------------------------- 
		TYPOGRAPHY 
------------------------------------- */
h1,h2,h3,h4,h5,h6 {
font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; line-height: 1.1; margin-bottom:15px; color:#000;
}
h1 small, h2 small, h3 small, h4 small, h5 small, h6 small { font-size: 60%; color: #6f6f6f; line-height: 0; text-transform: none; }

h1 { font-weight:200; font-size: 44px;}
h2 { font-weight:200; font-size: 37px;}
h3 { font-weight:500; font-size: 27px;}
h4 { font-weight:500; font-size: 23px;}
h5 { font-weight:900; font-size: 17px;}
h6 { font-weight:900; font-size: 14px; text-transform: uppercase; color:#444;}

.collapse { margin:0!important;}

p, ul { 
	margin-bottom: 10px; 
	font-weight: normal; 
	font-size:14px; 
	line-height:1.6;
}
p.lead { font-size:17px; }
p.last { margin-bottom:0px;}

ul li {
	margin-left:5px;
	list-style-position: inside;
}

/* ------------------------------------- 
		SIDEBAR 
------------------------------------- */
ul.sidebar {
	background:#ebebeb;
	display:block;
	list-style-type: none;
}
ul.sidebar li { display: block; margin:0;}
ul.sidebar li a {
	text-decoration:none;
	color: #666;
	padding:10px 16px;
/* 	font-weight:bold; */
	margin-right:10px;
/* 	text-align:center; */
	cursor:pointer;
	border-bottom: 1px solid #777777;
	border-top: 1px solid #FFFFFF;
	display:block;
	margin:0;
}
ul.sidebar li a.last { border-bottom-width:0px;}
ul.sidebar li a h1,ul.sidebar li a h2,ul.sidebar li a h3,ul.sidebar li a h4,ul.sidebar li a h5,ul.sidebar li a h6,ul.sidebar li a p { margin-bottom:0!important;}



/* --------------------------------------------------- 
		RESPONSIVENESS
		Nuke it from orbit. It's the only way to be sure. 
------------------------------------------------------ */

/* Set a max-width, and make it display as block so it will automatically stretch to that width, but will also shrink down on a phone or something */
.container {
	display:block!important;
	max-width:600px!important;
	margin:0 auto!important; /* makes it centered */
	clear:both!important;
}

/* This should also be a block element, so that it will fill 100% of the .container */
.content {
	padding:15px;
	max-width:600px;
	margin:0 auto;
	display:block; 
}

/* Let's make sure tables in the content area are 100% wide */
.content table { width: 100%; }


/* Odds and ends */
.column {
	width: 300px;
	float:left;
}
.column tr td { padding: 15px; }
.column-wrap { 
	padding:0!important; 
	margin:0 auto; 
	max-width:600px!important;
}
.column table { width:100%;}
.social .column {
	width: 280px;
	min-width: 279px;
	float:left;
}

/* Be sure to place a .clear element after each set of columns, just to be safe */
.clear { display: block; clear: both; }


/* ------------------------------------------- 
		PHONE
		For clients that support media queries.
		Nothing fancy. 
-------------------------------------------- */
@media only screen and (max-width: 600px) {
	
	a[class="btn"] { display:block!important; margin-bottom:10px!important; background-image:none!important; margin-right:0!important;}

	div[class="column"] { width: auto!important; float:none!important;}
	
	table.social div[class="column"] {
		width:auto!important;
	}
	table.hide-for-small {
		display: none!important;
	}

}

/*  Local Tennis Club stuff   */
.headerpanel {
	background-color: #f7f7f7;
	padding: 20px;  
}
.headerpanel img {
	display: inline;
}
.bodytext {
	color: #606060;
	line-height:1.3;
}
.topfooter {
	background-color: #CCCCCC;
	font-family:'Helvetica Neue Bold', Helvetica, Arial, sans-serif;
	font-size:18px;
	color:#000;
	font-weight:normal;
}
.bottomfooter {
	background-color: #4C4C4C;
	font-family:'Helvetica Neue Bold', Helvetica, Arial, sans-serif;
	color:#FFF;
	font-weight:normal;
}
.bottomfooter p {
	font-size:12px;
	color: #fff;	
	line-height: 14px;
}
.contacts p {
	font-size: 12px;
}
.socialicons img {
	display: inline;
	margin-right: 20px;
}
.socialicons {
	/* margin-bottom: 20px;  */
}
.socialicons img {
	padding-top: 10px;
}
.messagetitle {
	margin-top: 10px;
}
p.lead {
	line-height:1.4;
	margin-top:10px;
}
/*  end of local tennis club stuff  */

</style>

</head>
 
<body bgcolor="#FFFFFF">

<!-- HEADER -->
<table class="head-wrap" bgcolor="#FFF">
	<tr>
		<td></td>
		<td class="header container" >
				
				<div class="content">
				<table bgcolor="#999999">
					<tr>
						<td height="40" bgcolor="#666666">
							<p style="font-family:Helvetica, Arial, sans-serif;font-size:11px;color:#FFF;margin-left:10px;">
								Quick Message
							</p>
						</td>
						<td height="40" bgcolor="#4A4A4A">
							<p style="font-family:Helvetica, Arial, sans-serif;font-size:11px;color:#FFF;margin-right:10px;text-align:right;">
								Sent from Hampton in Arden Tennis Club
							</p>
						</td>
					</tr>
				</table>
				</div>
				
		</td>
		<td></td>
	</tr>
</table><!-- /HEADER -->


<!-- BODY -->
<table class="body-wrap">
	<tr>
		<td></td>
		<td class="container" bgcolor="#FFFFFF">

			<div class="content">
			<table>
				<tr>
					<td>
						<!-- Callout Panel -->
						<table class="headerpanel hide-for-small">
							<tr>
								<td width="30%">
									<a href="https://hamptontennis.org.uk/oldwayin.asp" id="homelink">
										<img id="clublogo" src="https://hamptontennis.org.uk/images/HamptonBadge.gif" alt="Hampton-In-Arden Sports Club logo" />
			            			</a>
								</td>
								<td>
									<p>
										Hampton-in-Arden Tennis Club has sent you this quick message for your attention. <br />Thank you.
									</p>
									<p 	align="left" valign="top" style="font-family:Helvetica, Arial, sans-serif;font-size:13px;color:#50b8e9;font-weight:bold;">
										Tennis Committee
									</p>
								</td>
							</tr>
						</table>
						<!-- /Callout Panel -->					
						<h3 class="messagetitle"><%= sSubject %></h3>

						<hr />

						<p class="lead">
							<%= sLeadParagraph %>
						</p>

						<p class="bodytext">
							<%= sDetails %>
						</p>
						<!-- Secondary Callout Panel -->
<!--						
						<p class="callout">
							Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra vitae. <a href="#">Click it! &raquo;</a>
						</p>
-->
						<!-- /Secondary Callout Panel -->					
												
						<!-- social & contact -->
						<table class="social topfooter" width="100%">
							<tr>
								<td>
									
									<!-- column 1 -->
									<table align="left" class="column">
										<tr>
											<td>				
												
												<h4 class="">Connect with Us</h4>
												<p class="socialicons">
													<a href="http://www.facebook.com/HamptonTennis" target="_blank">
														<img src="https://hamptontennis.org.uk/images/facebook_icon.gif" title="Hampton Tennis on FaceBook" alt="Facebook" width="24" height="24" border="0" /></a>Like us
												</p>
												<p class="socialicons">
													<a href="http://twitter.com/#!/search/users/hamptontennis" target="_blank">
														<img src="https://hamptontennis.org.uk/images/twitter.gif" alt="Hampton Tennis on Twitter" width="24" height="24" border="0" /></a>Follow us
												</p>
												<p class="socialicons">
													<a href="http://hamptontennis.wordpress.com" target="_blank"><img src="https://hamptontennis.org.uk/images/wordpress_logo.gif" alt="Club blog" width="24" height="24" border="0" /></a>Read us
												</p>
											</td>
										</tr>
									</table><!-- /column 1 -->	
									
									<!-- column 2 -->
									<table align="left" class="contacts column">
										<tr>
											<td>				
																			
												<h4 class="">Contact Us</h4>												
												<p><strong>Phone</strong>: <br />Clubhouse  - <strong>01675 442284</strong><br />Tennis Chairman (Savio Gaspar)  - <strong>07786 872011</strong><br />Head Coach (Ian Poole) - <strong>07968 451956</strong>
								                <p>
								                	<strong>Email</strong>: <strong><a href="mailto:committee@hamptontennis.org.uk">committee@hamptontennis.org.uk</a></strong>
								                </p>
											</td>
										</tr>
									</table><!-- /column 2 -->
									
									<span class="clear"></span>	
									
								</td>
							</tr>
						</table><!-- /social & contact -->

						<!--   Disclaimer -->
						<table class="disclaimer bottomfooter" width="100%">
							<tr>
								<td>
									
									<!-- column 1 -->
									<table align="left" class="column">
										<tr>
											<td>
												<p>				
												
												This email is from Hampton-in-Arden Tennis Club, part of Hampton-in-Arden Sports Club Limited, a company limited by guarantee and registered in England number 1179485 with a Registered Office at Shadowbrook Lane, Hampton-in-Arden, Solihull, B92 0DQ. It is confidential and should not be used by anyone who is not the original intended recipient. If you have received this e-mail in error please accept our apology and either delete the email or contact <a href="mailto:secretary@hamptontennis.org.uk">secretary@hamptontennis.org.uk</a> to let us know.
						
												</p>
												
											</td>
										</tr>
									</table><!-- /column 1 -->	
									
									<span class="clear"></span>	
									
								</td>
							</tr>
						</table><!-- /Disclaimer -->
						
					</td>
				</tr>
			</table>

			<div id="closewindow" style="clear: both; padding: 20px 0; margin-top: 20px">
				 <div id="closebutton">
				 			<a href="javascript:window.close();">Close Window</a>
				 </div>
			</div>
			
			</div><!-- /content -->
									
		</td>
		<td></td>
	</tr>
</table><!-- /BODY -->

<!-- FOOTER 

<table class="footer-wrap">
	<tr>
		<td></td>
		<td class="container">
			
			<div class="content">
				<table>
					<tr>
						<td align="center">
							<p>
								<a href="#">Terms</a> |
								<a href="#">Privacy</a> |
								<a href="#"><unsubscribe>Unsubscribe</unsubscribe></a>
							</p>
						</td>
					</tr>
				</table>
			</div>
				
		</td>
		<td></td>
	</tr>
</table> 

-->

</body>
</html>
<%
%>
