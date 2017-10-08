<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("Adult Coaching");
// Now for any variables local to this page
var debugging=false;
var ConnObj, RS, SQL1, SQL2, SQL3;
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
var displaydate = dateasstring(Date());
var debugging=current_debug_status();
// End of page start up coding
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hampton-In-Arden Tennis Club - <%= pagetitle %></title>
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
		<h1>Coaching:&nbsp;<b>Adult Coaching</b></h1>
		<div id="headcoachimage" style="height:250;">
			<a href="ianpoole.asp">
				<img id="headcoach" class="floatleft" src="images/tn_ian2.jpg" border="0" width="100" height="100" ALT="Find out more about Ian - click this photo for more details" />
			</a>
			<p class="caption">Ian Poole -Head Coach</p>
		</div>	
		<p>
			Coaching provision for adults ranges from group programmes through the ability spectrum up from adult beginners and improvers through intermediate game improvement sessions and tactics and cardio workouts to individual sessions which may be organised directly with Ian on an ad-hoc basis.
		</p>
		<p>
			Coaching sessions for all abilities are held during school terms on Monday, Thursday and Friday morning and from March to September on Saturday morning and Thursday evening. Cardio tennis sessions are held on Tuesday evening.
		</p>
		<table style="clear:both;">
			<thead>
				<tr>
					<th width="33%" class="centered">Monday</th>
					<th width="33%" class="centered">Thursday</th>
					<th width="33%" class="centered">Friday</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="33%" style="text-align:center;">9.00 am - 10.00 am</td>
					<td width="33%" style="text-align:center;">9.00 am - 10.00 am</td>
					<td width="33%" style="text-align:center;">9.00 am - 10.00 am</td>
				</tr>
				<tr>
					<td style="text-align:center;">Ideal for adult beginners and improvers</td>
					<td style="text-align:center;">Adult improvers and intermediate players</td>
					<td style="text-align:center;">Beginners and intermediates</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:center;">The above sessions run during school term only</td>
				</tr>
				<tr>
					<td style="text-align:center;" colspan="3">Members &pound;5.00 per session;&nbsp;&nbsp;<br />For non-member rates please speak to Ian</td>
				</tr>
				<tr>
					<td colspan="3" style="text-align:center;">
						Additional Saturday Morning 10:30 - 11:30 pay and play adult coaching - Intermediate (Members only: &pound;6 per session)
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3" style="text-align:center;">
						N.B.  All sessions are open to ladies and men.
					</td>
				</tr>
			</tfoot>
		</table>
		<div id="faq">
			<h2>Adult Coaching - Frequently Asked Questions</h2>
			<h5>How do I organise coaching?</h5>
			<p>
				Please contact Ian Poole our Head Coach to organise the best coaching programme and time to suit you on 07968 451956. 
			</p>
			<h5>Are there group coaching sessions available?</h5>
			<p>
				Yes, the current adult group coaching sessions are listed above.
			</p>
			<h5>How do I join the tennis club?</h5>
			<p>
				You can view and print information about joining our club <a href="juniors/joinus.html">here</a> on this web site. You can also view and print current membership rates.
			</p>
			<h5>How do I know what standard I am?</h5>
			<p>
				Here is a basic guide, but Ian will be happy to help assess you.<br /><br />
				<ul>
					<li>Beginners - You require basic coaching to help you play the game.<br /></li>
					<li>Improver - You are fairly consistent and can sustain a short rally.  You are looking to improve shot control and stroke variations i.e. spin.  You are able to play a singles or doubles match in a full court.<br /><li>
					<li>Intermediate - You have played for some time and can rally, but would like to improve the quality of your game technically. You are developing your own game style, and play a range of strokes from all parts of the court.  You may be competing regularly.<br /></li>
				</ul>
			</p>
		</div>
		<div class="seealso">
			<h3>See Also:</h3>
			<ul>
				<li><a href="juniors/coaching.html">Current junior coaching overview</a></li>
				<li><a href="juniors/coaching_schedule.html">Current junior coaching schedule</a></li>
				<li><a href="crenewal.asp">Junior coaching booking form</a></li>
				<li><a href="onetoone.asp">One-to-one coaching</a></li>
			</ul>
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


