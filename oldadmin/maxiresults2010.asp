<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate, displaydate;
var clubname = new String("Hampton-In-Arden Tennis Club");
var pagetitle = new String("MAXI-Tennis 2010 - League Results");
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
		<h1>MAXI-Tennis <b>Spring 2010 Summary Results<b></h1>
	<div id="2010summaryresults">
		<table>
			<caption>&nbsp;</caption>
			<thead>
				<tr>
					<th colspan="5">&nbsp;</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 24 January</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Wales</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">149</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">142</td>
					<td style="text-align: left; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td width="20%" style="border-right: none; border-left: none;"><a href="showmaxiresult.asp?thefile=walesvscotland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">France</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">144</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">155</td>
					<td style="text-align: left;" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevireland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Italy</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">165</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">127</td>
					<td style="text-align: left;" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvengland2010.htm">[DETAILS]</a></td>
				</tr>				
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 7 February</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">139</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">158</td>
					<td style="text-align: left;" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvitaly2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">England</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">106</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">174</td>
					<td style="text-align: left;" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvwales2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">126</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">157</td>
					<td style="text-align: left;" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvfrance2010.htm">[DETAILS]</a></td>
				</tr>								
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 28 February</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Wales</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">143</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">154</td>
					<td style="text-align: left;" width="20%">France</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvfrance2010.htm">[DETAILS]</a></td>
				</tr>		
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Italy</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">155</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">133</td>
					<td style="text-align: left;" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=italyvscotland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">England</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">124</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">163</td>
					<td style="text-align: left;" width="20%">Ireland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=englandvireland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 14 March</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">178</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">110</td>
					<td style="text-align: left;" width="20%">Wales</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvwales2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Scotland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">144</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">162</td>
					<td style="text-align: left;" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=scotlandvengland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">France</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">148</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">140</td>
					<td style="text-align: left;" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevitaly2010.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" class="blueheading" style="text-align: left; padding-left: 10px; background-color: #c0c0c0;">Sunday 21 March</td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Wales</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">148</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">135</td>
					<td style="text-align: left;" width="20%">Italy</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=walesvitaly2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">Ireland</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">154</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">141</td>
					<td style="text-align: left;" width="20%">Scotland</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=irelandvscotland2010.htm">[DETAILS]</a></td>
				</tr>
				<tr>
					<td style="text-align: right; margin-right: 20px; border-right: none; border-left: none;" width="20%">France</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">159</td>
					<td style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;" width="20%">136</td>
					<td style="text-align: left;" width="20%">England</td>
					<td width="20%"><a href="showmaxiresult.asp?thefile=francevengland2010.htm">[DETAILS]</a></td>
				</tr>												
				<tr>
					<td colspan="5" style="text-align: center;  margin-right: 20px; border-right: none; border-left: none;">
						<p>
							Maxi-Tennis finals day is scheduled for Sunday April 11th, between 2.40pm and 4.10pm<br />
							The results from that match will be available from <a href="maxifinals2010.asp">here</a>
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
			<li><a href="maxileague2010.asp">Current Maxi-Tennis league table</a></li>
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