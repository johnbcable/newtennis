<%@language="JScript" CODEPAGE="65001"%>
<!--#include file="functions.asp" -->
<!--#include file="strings.asp" -->
<!--#include file="emailfuncs.asp" -->
<%
// First variables that need to be set for each page
var strtime, strdate;
var clubname = new String("Hampton-In-Arden Sports Club");
var pagetitle = new String("Membership of Circulation List");
// Now for any variables local to this page
var debugging=false;
var dbconnect=Application("hamptonsportsdb"); 
var myAge, dummy1, dummy2;
var mystrdob,mydob,dobstr;
var therealname, thelist, searchtype;
var thesearchtext, thesorttext, thetypetext;
var agerange = false;
var oktoshow = true;
var agetext = new String("").toString();
var thememberquery, thesortorder;
var thelayout, thelayouttext;
var ConnObj, RS, StnObj;
var ConnObj2, RS2, StnObj2;
var SQL1, SQL2, SQLaudit;
var memberknt;
var v_memberid = new String("");
var line1, line2;
var numcol = 2;  // default number of columns in a layout
// Set up default greeting strings
strdate = datestring();
strtime = timestring();
// start of page processing
if (!signedin())
	Response.Redirect("login.asp");
v_memberid = getUserID();
memberknt=0;
toclick=0;
myaccess=0;
theiraccess=0;
callinguser=new String("NONE");
thelist = new String(Request.Form("listname"));
if (thelist == "" || thelist == "null" || thelist == "undefined")
{
	thelist = new String(Request.QueryString("listname"));
	if (thelist == "" || thelist == "null" || thelist == "undefined")
		thelist = new String("allmembers").toString();
}
thememberquery = new String(thelist).toString();
var startage = new String(Request.QueryString("youngest")).toString();
var endage = new String(Request.QueryString("oldest")).toString();
// Now check for age range
if (startage == "" || startage == "null" || startage == "undefined")
	startage=1;
if (endage == "" || endage == "null" || endage == "undefined")
		endage=100;
// Has target age range been supplied?
if (startage == 1 || endage == 100)	
{
	agerange = false;
	agetext += "No age range in force";
}
else 
{
	agerange = true;
	agetext += "Age range: from "+startage+" to "+endage;
	startage = parseInt(startage);
	endage = parseInt(endage);
}	
// 
// Now need to fetch description from circulation_lists re this value
//
ConnObj=Server.CreateObject("ADODB.Connection");
RS=Server.CreateObject("ADODB.Recordset");
ConnObj.Open(dbconnect);
SQL1 = new String("SELECT * from circulation_lists where queryname = '"+thememberquery+"'").toString();
RS = ConnObj.Execute(SQL1);
thetypetext = new String("ZZ").toString();
while (! RS.EOF && thetypetext == "ZZ")
{
  thetypetext = new String(RS("name")).toString();
  RS.MoveNext(); 
}
RS.Close();
// now the sort order
thesortorder = (new String(Request.Form("sortorder"))).toString();
if (thesortorder == "null" || thesortorder == "undefined")
{
	thesortorder = new String(Request.QueryString("sortorder"));
	if (thesortorder == "null" || thesortorder == "undefined")
		thesortorder = new String("").toString();
}
thesortorder=thesortorder.toUpperCase();
thesortorder=thesortorder.substring(0,1);
// A is the default circumstance
thesorttext=new String("surname, membergrade, forename1");
if (thesortorder=="B")
	thesorttext=new String("membergrade,surname,forename1");
if (thesortorder=="C")
	thesorttext=new String("sortabledob,surname,forename1");
SQLStmt = new String("SELECT * FROM "+thememberquery+" ORDER BY " + thesorttext);
displaydate = dateasstring(Date());
// debugging = true;
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
		<h1>Members:&nbsp;<b>Membership of Circulation List</h1>
<%
if (debugging)
{
Response.Write("    SQL statement = ["+SQL1+"]<br />\r\n");
Response.Write("    SQL statement = ["+SQLStmt+"]<br />\r\n");
Response.Write("    Start age     = ["+startage+"]<br />\r\n");
Response.Write("    End age       = ["+endage+"]<br />\r\n");
Response.Write("    Age Range?    = ["+agetext+"]<br />\r\n");
Response.End();
}
%>
		<table id="memberlist">
			<caption>Members of <%= thetypetext %> circulation list<br /><%= agetext %></caption>
			<thead>
<%
// execute the SQL statement
dummy1 = new String("").toString();
dummy2 = new String("").toString();
myAge = 0;
RS = ConnObj.Execute(SQLStmt);
// Set up table column headings
%>
				<th>
					Member Name:
				</th>
				<th>
					Email address:
				</th>
				<th>
					Member grade:
				</th>
				<th>
					Age information:
				</th>
			</thead>
			<tbody>
<%				
while (! RS.EOF)
{
	oktoshow = true;  // default
/*
 	if (agerange) {
		currentage = RS("currentage");
		currentage = parseInt(currentage);
		if (currentage > (startage-1) && (currentage < (endage+1)))
			oktoshow = true;
		else
			oktoshow = false;
	}
	else {
		currentage = "No filter";
	}
 */
 	// calculate current age
	dummy1 = new Date(RS("dob"));
	dummy2 = ddmmyyyy(dummy1);
	myAge = currentAge(dummy2);
	if (agerange)
	{
		if (myAge > (startage-1) && (myAge < (endage+1)))
			oktoshow = true;
		else
			oktoshow = false;
	}

	if (oktoshow)
	{
		memberknt=memberknt+1;
%>
				<tr>
					<td>
						<%= RS("forename1") %>&nbsp;<%= RS("surname") %>
					</td>
					<td>
						<%= RS("email") %> 
					</td>
					<td>
						<%= RS("membergrade") %> 
					</td>
					<td>
						Calculated: <%= myAge %><br />
					</td>
				</tr>
<%
	}
	RS.MoveNext();
}
%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<p class="centered">
							<%= memberknt %> members in this circulation list
							<br />
						</p>
					</td>
				</tr>

				<tr>
					<td colspan="4">
						<p class="centered">
							<a href="chk_list.asp">Check another list</a>
						</p>
					</td>

				</tr>
			</tfoot>		
		</table>
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


