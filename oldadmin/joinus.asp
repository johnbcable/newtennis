<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = "Hampton-In-Arden Sports Club";
var pagetitle = "How To Become A Member";
// Now for any variables local to this page
// Set up default greeting strings 
strdate = datestring();
strtime = timestring();
var debugging = false;
// End of page start up coding
displaydate = dateasstring(Date());
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
<style type="text/css">
<!--
.question { font-weight: bold; }
.answer { margin-left: 10px; }
#applicform {
				 position: relative;
				 margin: 20px auto;
}
#applybutton {
					 position: relative;
					 float: left;
					 width: 20%;
					 text-align: center;
}
#applytext {
			 position: relative;
			 float: right;
			 width: 78%;
			 text-align: left;
}
#applytext p {
			 padding-left: 30px;
}						

#applybutton a, #applybutton a:visited {
	background: #c9785a; 
	display: inline-block; 
  font-size: 140%;
  font-weight: bold;
	padding: 5px 10px 6px; 
	color: #fff; 
	text-decoration: none;
	-moz-border-radius: 5px; 
	-webkit-border-radius: 5px;
	-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
	text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
	border-bottom: 1px solid rgba(0,0,0,0.25);
	position: relative;
	cursor: pointer;
}

#applybutton a:hover { 
	background-color: #111; 
	color: #fff; 
}

-->
</style>

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
		<h1>Joining:&nbsp;<b>Membership Charges and Application Form</b></h1>
		<div id="applicform" style="clear: both; padding: 20px 0; margin-top: 20px">
			<div id="applybutton">
		 		<a href="forms.asp">Join Now<br /><br /></a>
		 	</div>
			<div id="applytext">
			<p>
				Click on the &quot;Join Now&quot; button and print the form. Send completed forms WITH YOUR CHEQUE made payable to &quot;
					Hampton-In-Arden Sports Club&quot;&nbsp;to the Secretary (Chris Barnes) at 68 Meriden Road, Hampton-In-Arden, B92 0BT.
			</p>
		</div>
	</div>
	<p style="clear: both; margin-bottom: 10px;">&nbsp;</p>
	
		<h2>Subscription Rates 1 April 2012 to 31 March 2013</h2>
		<table id="feestable" style="border: 1px solid #fff;">
			<thead>
						 <tr>
						 		 <td width="35%">&nbsp;</td>
						 		 <td colspan="3" style="text-align: center; border-left: 1px dotted black; border-right: 1px dotted black;">A&nbsp;D&nbsp;U&nbsp;L&nbsp;T</td>
						 		 <td colspan="2" style="text-align: center; padding-left: 10px;">JUNIOR</td>
						 </tr>
						 <tr>
						 		 <th width="35%">&nbsp;</th>
								 <th width="13%" style="border-left: 1px dotted black; padding-left: 10px;">65 &amp; over</th>
								 <th width="13%">26-64</th>
								 <th width="13%" style=" border-right: 1px dotted black;">19-25</th>
								 <th width="13%" style="padding-left: 10px;">7-18</th>
								 <th width="13%">3-6</th>
						 </tr>
			</thead>
			<tbody>
				<tr style="height: 40px; vertical-align: center;">
					<td width="35%"><b>Full Membership</b>:</td>
					<TD width="13%" style="border-left: 1px dotted black; padding-left: 10px;"><b>&pound;78</b></td>
					<TD width="13%"><b>&pound;175</b></td>
					<TD width="13%" style=" border-right: 1px dotted black;"><b>&pound;44 if a student<br />&pound;78 if not</b></td>
					<TD width="13%" style="padding-left: 10px;"><b>&pound;44</b></td>
					<TD width="13%"><b>free</b></td>
				</tr>
				<tr style="height: 40px; vertical-align: center;">
					<td width="50%"><b>Weekday membership (Note 1)</b>:</td>
					<TD width="13%" style="border-left: 1px dotted black; padding-left: 10px;"><b>&pound;78</b></td>
					<TD width="13%"><b>&pound;120</b></td>
					<TD width="13%" style=" border-right: 1px dotted black;"><b>&pound;44 if a student<br />&pound;78 if not</b></td>
					<TD width="13%" style="padding-left: 10px;"><b>&pound;44</b></td>
					<TD width="13%"><b>free</b></td>
				</tr>
				<tr style="margin: 10px 0; border-top: 1px solid gray;">
					<td width="35%"><b>Family Membership</b>:</td>
					<td colspan="5">
							&pound;349 for a family living at the same address including students who 
							live away from home.  Benefits families with two adults and two or more 
							children playing.  No discounts applicable.
					</td>
				</tr>
				<tr style="margin: 10px 0; border-top: 1px solid gray;">
					<td width="35%"><b>Social Membership</b>:</td>
					<td colspan="5">
							&pound;49 per person or &pound;83 for more than one social member of your 
							family living at the same address including students who live away from home.
							<br />  
							Note: parents are Sports Club Associate Members from one hour before to one 
							hour after your child is playing tennis and are welcome to use the clubhouse 
							and bar facilities during this time.
					</td>
				</tr>
				<tr style="margin: 10px 0; border-top: 1px solid gray;">
					<td colspan="6"><b>CALCULATION OF AMOUNT PAYABLE</b></td>
				</tr>
				<tr>
					<td colspan="6"><b>Membership subscription applicable</b></td>
				</tr>
				<tr>
					<td colspan="3">
						<p>
						Have you paid by April 1<sup>st</sup> or are you a new member?<br /> 
						<b>If Yes, deduct &pound;10</b>
						</p>
					</td>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<p>
						Is there at least one other Hampton tennis member in your household?<br /> 
						<b>If Yes, deduct &pound;5</b>
						</p>
					</td>				
					<td colspan="3" style="border-bottom: 1px solid black;">&nbsp;</td>
				</tr>
				<tr>
					<td wcolspan="3">Sub Total</td>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<p>
						Are you a Squash, Hockey or Cricket member of Hampton Sports Club?<br /> 
						<b>If Yes, deduct 10% of Sub Total above</b>
						</p>
					</td>
					<td colspan="3" style="border-bottom: 1px solid black;">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<b>Amount payable</b>&nbsp;to&nbsp;&quot;Hampton-In-Arden Sports Club&quot;<br />
						(See <b>Note 1</b> (below) if you join after September 1st)
					</td>
					<td colspan="3">&nbsp;</td>
				</tr>
			</tbody>
		</table>
		<h2>NOTES</h2>
			<ol id="noteslist">
				<li>
					<p class="question">Is there a discount if I join after September 1?</p>
					<p>Yes. Membership after all discounts is charged pro rata to the number of full 
                    months left in the season to March 31st. 
					</p>
				</li>
				<li>
					<p class="question">Which is the &quot;relevant date&quot; for the ages quoted above?</p>
					<p class="answer">All of the ages quoted above refer to the age on April 1st.</p>
				</li>					
				<li>
					<p class="question">How do I pay?</p>
					<p class="answer">Please complete and sign an <a href="forms.asp">application form</a> and return it WITH YOUR CHEQUE made payable to &quot;
					Hampton-In-Arden Sports Club&quot;&nbsp;to the Secretary (Chris Barnes) at 68 Meriden Road, Hampton-In-Arden, B92 0BT.</p>
				</li>					
			</ol>
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


