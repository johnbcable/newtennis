<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis 2011 - League Results");
// Now for any variables local to this page
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
		<h1>MAXI-Tennis <b>Spring 2011 Summary Results<b></h1>
	<div id="2010summaryresults">
		<table>
			<thead>
				<tr>
					<th colspan="5">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 6 February</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Wales</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">142</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">119</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">England</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=walesvengland2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Italy</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">152</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">134</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=italyvireland2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">France</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">151</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">133</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=francevscotland2011.htm">[DETAILS]</a></td>
				</tr>				
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 13 February</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">England</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">119</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">143</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Italy</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=englandvitaly2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">173</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">107</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Wales</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=scotlandvwales2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">144</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">145</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">France</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=irelandvfrance2011.htm">[DETAILS]</a></td>
				</tr>								
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 6 March</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Italy</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">148</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">150</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Wales</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=italyvwales2011.htm">[DETAILS]</a></td>
				</tr>		
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">England</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">142</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">130</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">France</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=englandvfrance2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">175</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">109</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=scotlandvireland2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 13 March</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Italy</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">169</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">95</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">France</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=italyvfrance2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Wales</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">145</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">122</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=walesvireland2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">England</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">93</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">167</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=englandvscotland2011.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 20 March</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">151</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">147</td>
					<td style="text-align: left;border-right: none; border-left: none;" width="20%">Italy</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=scotlandvitaly2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">157</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">125</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">England</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=irelandvengland2011.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">France</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">122</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">170</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Wales</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=francevwales2011.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;">
						<p>
							Maxi-Tennis finals day is scheduled for Sunday April 10<sup>th</sup>, between 2.40pm and 4.10pm<br />
							The results from that match will be available from <a href="maxifinals2011.asp">here</a>
						</p>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						&nbsp;
					</td>
				</tr>
			</tfoot>
		</table>	
 	</div>
	<div class="seealso">
		<h3>See Also:</h3>
		<ul>
			<li><a href="maxirules.asp">Maxi-Tennis rules</a></li>
			<li><a href="maxileague2011.asp">Current Maxi-Tennis league table</a></li>
			<li><a href="maxiscores.xls">Download blank score sheet</a></li>
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