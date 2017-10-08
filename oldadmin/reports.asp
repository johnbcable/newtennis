<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Tennis Club Reports");
// Now for any variables local to this page
if (!signedin())
	Response.Redirect("login.asp");
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
displaydate = dateasstring(Date());
var debugging=current_debug_status();
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
		<h1>Members:&nbsp;<b>Tennis Club Reports</b></h1>
		<p>
			In the table below, if the name of the report appears underlined you may click
			on the name of the report and go to a web-site version of this report to view
			on-screen. 
		</p>
		<p>
			If an entry appears in the MS-Word or Acrobat columns alongside a report name, you may right-click on this link to save a
			copy of that report on your own computer in that format. 
            Alternatively, if your computer has MS-Word and/or Adobe Acrobat, 
            you may left click these links to have the report download to your 
            computer and open within that application.
		</p>
		<p>
			Some reports may offer one, two or all of these ways for you to see them. If a
			report offers neither, it is not currently available via this web site.
		</p>
		<table>
			<tr>
				<th>Report</th>
				<th>MS-Word</th>
				<th>Acrobat</th>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 19 November 
                    2012
				</td>
				<td><a href="agm2012minutes.doc">125Kb</a></td>
				<td><a href="agm2012minutes.pdf">128Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 21 November 
                    2011
				</td>
				<td><a href="agm2011minutes.doc">163Kb</a></td>
				<td><a href="agm2011minutes.pdf">134Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 8 November 
                    2010
				</td>
				<td><a href="agm2010minutes.doc">144Kb</a></td>
				<td><a href="agm2010minutes.pdf">86Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 9 November 
                    2009
				</td>
				<td><a href="agm2009minutes.doc">153Kb</a></td>
				<td><a href="agm2009minutes.pdf">84Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 13 November 
                    2008
				</td>
				<td><a href="agm2008minutes.doc">140Kb</a></td>
				<td><a href="agm2008minutes.pdf">86Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 8 November 
                    2007
				</td>
				<td><a href="agm2007minutes.doc">140Kb</a></td>
				<td><a href="agm2007minutes.pdf">86Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 8 November 
                    2006
				</td>
				<td><a href="agm2006minutes.doc">65Kb</a></td>
				<td><a href="agm2006minutes.pdf">85Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 9 November 
                    2005
				</td>
				<td><a href="agm2005minutes.doc">65Kb</a></td>
				<td><a href="agm2005minutes.pdf">88Kb</a></td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 10 November 
                    2004
				</td>
				<td><a href="agm2004minutes.doc">54Kb</a></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 12 November 
                    2003
				</td>
				<td><a href="agm2003minutes.doc">20Kb</a></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 6 November 
                    2002
				</td>
				<td><a href="agm2002minutes.doc">34Kb</a></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					Hampton-In-Arden Sports Club (Tennis Section) 
                    Minutes of the Annual General Meeting held on 7 November 
                    2001
				</td>
				<td><a href="agm2001minutes.doc">34Kb</a></td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</div>
		<div class="seealso">
		<h3>See Also:</h3>
		<ul>
			<li><a href="cchist.asp">Court Circular - magazines</a></li>
		</ul>
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