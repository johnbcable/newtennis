<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="memberfuncs.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to  be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Sending Brief Messages to Members");
var refurl = Request.ServerVariables("HTTP_REFERRER");
var dbconnect=Application("hamptonsportsdb");
var defquery = new String("members").toString();
var memberid = getUserCode();
var myfullname, myemail;
var ConnObj, RS, SQL1;
var themember = new Object();
var debugging = current_debug_status();
var senders = ["secretary","chairman","coaching","tournaments","americantournaments","juniors","social","mensleague","ladiesleague","league","arden9help","support"];
var sendernames = new Array();
sendernames[0] = "Club Secretary";
sendernames[1] = "Club Chairman";
sendernames[2] = "Coaching Administration";
sendernames[3] = "Tournament Organisers";
sendernames[4] = "American Tournaments";
sendernames[5] = "Juniors";
sendernames[6] = "Social Event Organisers";
sendernames[7] = "Mens League Administration";
sendernames[8] = "Ladies League Administration";
sendernames[9] = "General League Questions";
sendernames[10] = "Arden 9 Helpers Admin";
sendernames[11] = "Web Administrator";

// Now for any variables local to this page
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// End of page start up coding

// if (!isSupport()) {
if (!isCommittee()) {
	Response.Redirect("fullindex.html")
}

// Now, pull in sent-in data from POST or GET

var mTitle = new String("").toString();
var mMessage = new String("").toString();
var mQuery = new String("").toString();
var mOnBehalfOf = new String("").toString();
var mPostId = new String("").toString();
var mLeadPara = new String("").toString();

var mTitle=Trim(new String(Request.Form("messagetitle")));
if (mTitle == "" || mTitle == "null" || mTitle == "undefined") {
	mTitle=Trim(new String(Request.QueryString("messagetitle")));
	if (mTitle == "" || mTitle == "null" || mTitle == "undefined") {
		mTitle = new String("").toString();
	}
} else {
	// We are POSTing from a form so no length issues for the message
	// so we can go and get the message text etc
	mMessage=Trim(new String(Request.Form("message")));
	if (mMessage == "" || mMessage == "null" || mMessage == "undefined") {
			mMessage = new String("").toString();
	}
	mQuery=Trim(new String(Request.Form("query")));
	if (mQuery == "" || mQuery == "null" || mQuery == "undefined") {
			mQuery = new String("").toString();
	}
	mOnBehalfOf=Trim(new String(Request.Form("onbehalfof")));
	if (mOnBehalfOf == "" || mOnBehalfOf == "null" || mOnBehalfOf == "undefined") {
			mOnBehalfOf = new String("").toString();
	}
	mPostId=Trim(new String(Request.Form("postid")));
	if (mPostId == "" || mPostId == "null" || mPostId == "undefined") {
			mPostId = new String("").toString();
	}
}

// Now set up initial display info
displaydate = dateasstring(Date());
// debugging = true;
myfullname = new String("").toString();
myemail = new String("").toString();
if (memberid > 0) {
	themember = getMember(memberid);
	myfullname = Trim(new String(themember.forename1+" "+themember.surname)).toString();
	myemail = new String(themember.email).toString();
}
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from circulation_lists order by name asc");
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - Booking the Astro Turf</title>
	<link rel="stylesheet" media="screen" type="text/css" href="layout.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="colours.css" />
	<link rel="stylesheet" media="screen" type="text/css" href="typography.css" /> 
	<link rel="stylesheet" media="print" type="text/css" href="print3col.css" /> 
	<!-- Comment out the next style sheet if running in production -->
<%
if (debugging)
{
%>
<link rel="stylesheet" media="screen" type="text/css" href="borders.css" />
<%
}
%>
<style>
<!--
#sendmessage {
	position: relative;
	margin: 20px auto;
}
#sendbutton {
	position: relative;
	float: right;
	width: 15%;
	text-align: center;
}
#messagetitle {
	margin-left: 30%;
	width: 67%;
}
#youngestlabel, #oldestlabel {
	text-align: right;
	margin-right: 10px;
}
#youngest, #oldest {
	margin-right: 50%;
	width: 4em;
}
#quickmessage textarea {
	margin-left: 30%;
	width: 67%;
	height:100px;
}

#quickmessage #message {
	height: 200px;
}
-->
</style>
<script type="text/javascript">
function validateForm()
{
var errmess = new String("").toString();
var x;
//  Check that message has a title
x=document.forms["quickmessageform"]["messagetitle"].value;
if (x==null || x=="")
	errmess += ("Your message must have a title\n");

//  Check that message has some message text
x=document.forms["quickmessageform"]["message"].value;
if (x==null || x=="")
	errmess += ("Your message must have a message - DOH!\n");

//  Check that message has chosen a circulation list to send to
x=document.forms["quickmessageform"]["query"].value;
if (x==null || x=="")
	errmess += ("You need to choose a target to send your message to\n");

//  Check that message is being sent out from a known source
x=document.forms["quickmessageform"]["onbehalfof"].value;
if (x==null || x=="")
	errmess += ("You need to choose who the message is to go out from\n");

// Process error indications
if( ! (errmess == "")) {
	alert(errmess);
	return false;
}

}
</script>
<!--#include file="dateval.asp" -->
</head>
<body>
<!--   1.  Branding   -->
<div id="branding">
	<a href="fullindex.html" id="homelink"><img id="clublogo" src="images/logo.gif" alt="Hampton-In-Arden Sports Club logo" /></a>
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
<%
if (debugging)
{
	Response.Write("<br />");
	Response.Write("Referring URL is:  ["+refurl+"]");
	Response.Write("myfullname is:     ["+myfullname+"]");
	Response.Write("myemail is:        ["+myemail+"]");
	Response.Write("<br />");
	Response.End();
}
%>	
	<h1>Admin:<b>&nbsp;Sending Quick Messages to Members</b></h1>
		<div id="quickmessage">
			<form id="quickmessageform" action="confirmquickmessage.asp" method="post" onsubmit="return validateForm()">
				<fieldset>

					<div>
						<label for="messagetitle">Heading:</label>
						<input type="text" id="messagetitle" name="messagetitle" size="30" maxlength="200" placeholder="Type a heading for your message in here" value="<%= mTitle %>" />
					</div>

					<div>
						<label for="leadparagraph">Leader:</label>
						<textarea id="leadparagraph" name="leadparagraph" placeholder="Type your first/lead text in here" style="font-size: 90%;" rows="10" cols="50"></textarea><br />
						<p style="padding-bottom: 10px; margin: 0 0 10px 30%; border-bottom: 1px solid black;">
							N.B.  The lead paragraph is optional - you do not have to fill it in. If you do fill it in, it will appear as the first pargraph in your message in slightly emboldened type. 
						</p>
					</div>

					<div>
						<label for="message">Your message:</label>
						<textarea id="message" name="message" placeholder="Type your brief message in here" style="font-size: 90%;" rows="40" cols="50" ></textarea>
					</div>

					<div>
						<label for="query">Circulation:</label>
						<select name="query" id="query">
<%
RS = ConnObj.Execute(SQL1);
while (! RS.EOF)
{
	dummy1 = new String(RS("queryname")).toString();
	if (dummy1 == mQuery)
		Response.Write('<option selected value="'+RS("queryname")+'">'+RS("name"));
	else
		Response.Write('<option value="'+RS("queryname")+'">'+RS("name"));
	RS.MoveNext();
}
RS.Close();
%>
						</select>
					</div>

					<div>
						<label for="includecoaches">Send to coaches? :</label>
						<select name="includecoaches" id="includecoaches">
							<option selected value="Y">Include coaches in circulation</option>
							<option value="N">Leave coaches out of circulation</option>
						</select>
					</div>

					<div>
						<label for="onbehalfof">Send from:</label>
						<select name="onbehalfof" id="onbehalfof">
<%
for(var x=0; x < senders.length; x++)
{
	dummy1 = new String(senders[x]).toString();
	if (dummy1 == mOnBehalfOf)
		Response.Write('<option selected value="'+dummy1+'">'+sendernames[x]);
	else
		Response.Write('<option value="'+dummy1+'">'+sendernames[x]);
}
%>
						</select>
					</div>

					<div>
						<hr />
						<h2 style="margin-left: 20px;">Optional</h2>
						<p style="margin-left: 20px;">
							Quick messages can also target different audiences as follows:
						</p> 
						<p style="font-weight: bold; text-decoration: underline; margin-left: 30px;">Target age range (in years):</p>
						<label id="youngestlabel" for="youngest">Youngest :</label>
						<input type="text" name="youngest" id="youngest" size="3" maxlength="3" value=""/>
					</div>
					<div>
						 <label id="oldestlabel" for="oldest">Oldest :</label>
						 <input type="text" name="oldest" id="oldest" size="3" maxlength="3" value=""/><br />
						 <p style="margin-left: 20px;">
							 Please fill in both youngest and oldest ages for 
							 the age range restriction to work 
						</p>
						 <hr />
					</div>


					<div id="submitblock" align="right">
						<input type="hidden" id="postid" name="postid" value = "<%= mPostId %>" />
						<p style="margin-right:50px;">
							<input align="right" type="submit" value="Submit">
						</p>
					</div>

	<!--
					<div align="right" id="sendmessage" style="clear: both; padding: 10px 0; margin-top: 10px; margin-right: 20px;">
						<div id="sendbutton" class="calltoaction">
						 	<a href="javascript: validateForm()">Send Message</a>
						</div>
					</div>
-->
					
				</fieldset>
			</form>
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
<script language="JScript" CODEPAGE="65001">
window.onload=function() {
	firstfield=document.getElementById("messagetitle");
	firstfield.focus();
}
</script>
</html>
<%
%>
